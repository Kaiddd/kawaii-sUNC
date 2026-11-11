--[[
	sUNC test runner.

	runtime.lua calls this chunk with a fixed positional context (below) and then calls the
	function it returns. The runner
	  1. checks the place and the buffer library, opens the encrypted channel to the server
	     (RemoteFunctions in ReplicatedStorage; the session keys arrive through
	     itsjustgettingstarted.OnClientInvoke) and authenticates through "Let em in",
	  2. loads the `api-probe` dependency and folds its results into the bookkeeping tables,
	  3. runs every test module (`metadata.__testFactories[name](...)`) and the inline tests
	     (filesystem, hidden properties, decompile, loadstring, Drawing, ...),
	  4. prints the summary, sends the encrypted result packet, waits for the server's verdict
	     ("melon") and shows the result screen.

	Recovered from a virtualized build: lifted to Luau bytecode, decompiled with Sabre and
	cleaned by hand. Quirks of the original are kept on purpose; the decompiler bugs that were
	fixed (checked against the lifted bytecode) are marked "Fixed:".
]]

-- Context passed by runtime.lua (keep the order). Besides the obvious ones:
--   integrityMarkers  the runtime's default sUNCDebug options table; some tests store markers in it
--   protectedCall     the runtime's pcall
--   _branchState      unused (the original kept interpreter branch state in it)
--   packResults, unpackResults, metadata, hostFactories  handed on to the tests
local warningLogger, checkpointLogger, options, integrityMarkers, protectedCall, _branchState, packResults, unpackResults, metadata, hostFactories, environment, selectArguments =
	...

------------------------------------------------------------------------------------------------
-- Bit helpers (arithmetic implementations kept from the original)
------------------------------------------------------------------------------------------------

-- 32-bit XOR.
local function xor32(left, right, _)
	local result = 0
	local bitValue = 1
	for _ = 0, 31 do
		local leftBit = left % 2
		local rightBit = right % 2
		if leftBit ~= rightBit then
			result += bitValue
		end
		left = (left - leftBit) / 2
		right = (right - rightBit) / 2
		bitValue *= 2
	end
	return result
end

local function rshift(value, shift, _)
	return (value - value % 2 ^ shift) / 2 ^ shift
end

-- 8-bit XOR.
local function byteXor(left, right, _)
	local result = 0
	for bit = 0, 7 do
		result += (left % 2 + right % 2) % 2 * 2 ^ bit
		left = environment.math.floor(left / 2)
		right = environment.math.floor(right / 2)
	end
	return result
end

------------------------------------------------------------------------------------------------
-- String obfuscation helpers
------------------------------------------------------------------------------------------------

local BASE64_ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

-- Base64 decoder; characters outside the alphabet are skipped.
local function base64Decode(encoded, _)
	local sextets = {}
	local paddingCount = 0
	for position = 1, #encoded do
		if encoded:sub(position, position) == "=" then
			paddingCount += 1
		else
			for value = 1, 64 do
				if encoded:sub(position, position) == BASE64_ALPHABET:sub(value, value) then
					environment.table.insert(sextets, value - 1)
					break
				end
			end
		end
	end

	local bytes = {}
	for index = 1, #sextets, 4 do
		local group = sextets[index] * 262144
		group += (sextets[index + 1] or 0) * 4096
		group += (sextets[index + 2] or 0) * 64
		group += sextets[index + 3] or 0
		environment.table.insert(bytes, environment.string.char(group / 65536))
		environment.table.insert(bytes, environment.string.char(group % 65536 / 256))
		environment.table.insert(bytes, environment.string.char(group % 256))
	end
	for _ = 1, paddingCount do
		environment.table.remove(bytes)
	end
	return environment.table.concat(bytes)
end

-- XORs `data` with the repeating `key`.
local function xorStrings(data, key, _)
	local output = {}
	for index = 1, #data do
		local dataByte = environment.string.byte(data, index)
		local keyByte = environment.string.byte(key, (index - 1) % #key + 1)
		environment.table.insert(output, environment.string.char(byteXor(dataByte, keyByte)))
	end
	return environment.table.concat(output)
end

-- Decodes an obfuscated string literal: base64(text) XOR base64(key).
local function decodeString(encodedText, encodedKey, _)
	local text = base64Decode(encodedText)
	local key = base64Decode(encodedKey)
	return xorStrings(text, key)
end

-- Subtracts `shift` from every byte (decodes the result link carried in a CollisionGroup).
local function shiftDecode(text, shift, _)
	local decoded = ""
	for index = 1, #text do
		decoded ..= environment.string.char(text:byte(index) - shift)
	end
	return decoded
end

-- Adds 13 to every byte (used for the version tag).
local function shiftEncode(text, _, _)
	local encoded = ""
	for index = 1, #text do
		encoded ..= environment.string.char(text:sub(index, index):byte() + 1 + 12)
	end
	return encoded
end

local function bytesToBuffer(bytes, _)
	local output = environment.buffer.create(#bytes)
	for index, byte in environment.pairs(bytes) do
		environment.buffer.writeu8(output, index - 1, byte)
	end
	return output
end

------------------------------------------------------------------------------------------------
-- ChaCha20 (32-bit words are stored in 4-byte buffers)
------------------------------------------------------------------------------------------------

local ChaCha = {}

function ChaCha.uint32(value, _)
	local word = environment.buffer.create(4)
	environment.buffer.writeu32(word, 0, value)
	return word
end

function ChaCha.uint32_add(target, addend, _)
	local sum = environment.buffer.readu32(target, 0)
	sum += environment.buffer.readu32(addend, 0)
	environment.buffer.writeu32(target, 0, sum)
end

function ChaCha.rotl32_temp(word, shift, _)
	local result = ChaCha.uint32(0)
	environment.buffer.writeu32(result, 0, environment.bit32.lrotate(environment.buffer.readu32(word, 0), shift))
	return result
end

function ChaCha.xor32_temp(left, right, _)
	local result = ChaCha.uint32(0)
	local rightValue = environment.buffer.readu32(right, 0)
	environment.buffer.writeu32(result, 0, environment.bit32.bxor(environment.buffer.readu32(left, 0), rightValue))
	return result
end

-- Little-endian 32-bit word at `offset` of `bytes`.
function ChaCha.pack4(bytes, offset, _)
	local byte0 = environment.bit32.lshift(environment.buffer.readu8(bytes, offset), 0)
	local byte1 = environment.bit32.lshift(environment.buffer.readu8(bytes, offset + 1), 8)
	local byte2 = environment.bit32.lshift(environment.buffer.readu8(bytes, offset + 2), 16)
	local byte3 = environment.bit32.lshift(environment.buffer.readu8(bytes, offset + 3), 24)
	return ChaCha.uint32(environment.bit32.bor(byte0, byte1, byte2, byte3))
end

function ChaCha.init_block(block, key, nonce, _)
	block.key = key
	block.nonce = nonce
	local constants = environment.buffer.fromstring("expand 32-byte k")
	for index = 0, 3 do
		block.state[1 + index] = ChaCha.pack4(constants, index * 4)
	end
	for index = 0, 7 do
		block.state[5 + index] = ChaCha.pack4(key, index * 4)
	end
	block.state[13] = ChaCha.uint32(0)
	for index = 0, 2 do
		block.state[14 + index] = ChaCha.pack4(nonce, index * 4)
	end
end

function ChaCha.block_set_counter(block, counter, _)
	block.state[13] = ChaCha.uint32(counter)
	local high = environment.buffer.readu32(ChaCha.pack4(block.nonce, 0), 0)
	high += environment.bit32.rshift(counter, 32)
	block.state[14] = ChaCha.uint32(high)
end

-- Quarter round on the 0-based word indices a, b, c, d.
local function chachaQuarterRound(words, a, b, c, d, _)
	a += 1
	b += 1
	c += 1
	d += 1
	ChaCha.uint32_add(words[a], words[b])
	words[d] = ChaCha.rotl32_temp(ChaCha.xor32_temp(words[d], words[a]), 16)
	ChaCha.uint32_add(words[c], words[d])
	words[b] = ChaCha.rotl32_temp(ChaCha.xor32_temp(words[b], words[c]), 12)
	ChaCha.uint32_add(words[a], words[b])
	words[d] = ChaCha.rotl32_temp(ChaCha.xor32_temp(words[d], words[a]), 8)
	ChaCha.uint32_add(words[c], words[d])
	words[b] = ChaCha.rotl32_temp(ChaCha.xor32_temp(words[b], words[c]), 7)
end

function ChaCha.block_next(block, _)
	for index = 1, 16 do
		block.keystream32[index] = block.state[index]
	end
	for _ = 1, 10 do
		chachaQuarterRound(block.keystream32, 0, 4, 8, 12)
		chachaQuarterRound(block.keystream32, 1, 5, 9, 13)
		chachaQuarterRound(block.keystream32, 2, 6, 10, 14)
		chachaQuarterRound(block.keystream32, 3, 7, 11, 15)
		chachaQuarterRound(block.keystream32, 0, 5, 10, 15)
		chachaQuarterRound(block.keystream32, 1, 6, 11, 12)
		chachaQuarterRound(block.keystream32, 2, 7, 8, 13)
		chachaQuarterRound(block.keystream32, 3, 4, 9, 14)
	end
	for index = 1, 16 do
		ChaCha.uint32_add(block.keystream32[index], block.state[index])
	end
	local counter = block.state[13]
	ChaCha.uint32_add(counter, ChaCha.uint32(1))
	if environment.buffer.readu32(counter, 0) ~= 0 then
		return
	end
	ChaCha.uint32_add(block.state[14], ChaCha.uint32(1))
end

function ChaCha.init_context(key, nonce, counter, _)
	local context = { keystream32 = {}, state = {}, counter = 0, position = 0 }
	ChaCha.init_block(context, key, nonce)
	ChaCha.block_set_counter(context, counter)
	context.counter = counter
	context.position = 64
	return context
end

-- XORs bytes startIndex .. length - 1 of `data` with the keystream.
function ChaCha.xor(context, data, length, startIndex, _)
	for index = startIndex, length - 1 do
		if context.position >= 64 then
			ChaCha.block_next(context)
			context.position = 0
		end
		local keystreamBytes = {}
		local byteIndex = 1
		for wordIndex = 1, #context.keystream32 do
			for byteOffset = 0, 3 do
				keystreamBytes[byteIndex] = environment.buffer.readu8(context.keystream32[wordIndex], byteOffset)
				byteIndex += 1
			end
		end
		environment.buffer.writeu8(
			data,
			index,
			environment.bit32.bxor(environment.buffer.readu8(data, index), keystreamBytes[context.position + 1])
		)
		context.position += 1
	end
end

-- Encrypts `data` in place once per (key, nonce) pair.
function ChaCha.chacha20_xor(data, keys, nonces, _)
	for index = 1, #keys do
		local context = ChaCha.init_context(keys[index], nonces[index], 0)
		ChaCha.xor(context, data, environment.buffer.len(data), 0)
	end
end

------------------------------------------------------------------------------------------------
-- Table serializer (installed as the globals serialize_table / deserialize_table)
------------------------------------------------------------------------------------------------

local function countEntries(container, _)
	local count = 0
	for _ in environment.pairs(container) do
		count += 1
	end
	return count
end

local function serializeValue(value, _)
	if environment.type(value) == "number" then
		return environment.tostring(value)
	end
	if environment.type(value) == "string" then
		return environment.string.format("%q", value)
	end
	if environment.type(value) == "boolean" then
		return environment.tostring(value)
	end
	if environment.type(value) ~= "table" then
		environment.error("Unsupported value type: " .. environment.type(value))
		return
	end
	return environment.serialize_table(value)
end

local function serializeKey(key, _)
	if environment.type(key) == "string" then
		return environment.string.format("[%q]", key)
	end
	if environment.type(key) ~= "number" then
		environment.error("Only string or number keys supported")
		return
	end
	return "[" .. environment.tostring(key) .. "]"
end

local function serializeTable(container, _)
	local parts = {}
	environment.table.insert(parts, "{\n")
	for key, value in environment.pairs(container) do
		local keyText = serializeKey(key)
		local valueText = serializeValue(value)
		environment.table.insert(parts, keyText .. " = " .. valueText .. ",\n")
	end
	environment.table.insert(parts, "}")
	return environment.table.concat(parts)
end

local function copyTable(container, _)
	local copy = {}
	for key, value in environment.pairs(container) do
		if environment.type(value) == "table" then
			value = copyTable(value)
		end
		copy[key] = value
	end
	return copy
end

local function deserializeTable(text, _)
	local chunk, compileError = environment.loadstring("return " .. text)
	if not chunk then
		environment.error(compileError)
	end
	local value = chunk()
	return copyTable(value)
end

------------------------------------------------------------------------------------------------
-- Small helpers used by the runner
------------------------------------------------------------------------------------------------

-- getscripthash test: a valid hash is 64, 96 or 128 hex digits.
local function validateHash(hash, _)
	local length = #hash
	if length ~= 96 and length ~= 64 and length ~= 128 then
		return false
	end
	return hash:match("^[0-9a-fA-F]+$") ~= nil
end

local function getDataPing(_)
	return environment.game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() / 1000
end

local function floorToHundredths(value, _)
	local floored = environment.math.floor(value * 100)
	floored /= 100
	return floored
end

local function compareTestNames(left, right, _)
	return left.test < right.test
end

-- Buffer support probes (run with pcall).
local function probeBufferTostring(_)
	local probe = environment.buffer.create(400)
	environment.buffer.writestring(probe, 0, "idk")
	environment.buffer.writei32(probe, 66, -9)
	environment.tostring(probe)
end

local function createBuffer(_)
	return environment.buffer.create(400)
end

-- Sent with the handshake (pcall results only; the decoded JSON is discarded).
local function fetchPublicIp(_)
	local httpService = environment.game:GetService("HttpService")
	httpService:JSONDecode(environment.game:HttpGet("https://api.ipify.org/?format=json"))
end

-- Must fail with "attempt to index nil with number"; its error message is printed.
local function indexNilGlobal(_)
	return environment._[0]
end

-- Used after a detected tamper: rewrites the "success rate" line of the developer console.
local function spawnFakeConsoleSuccess(_)
	environment.task.spawn(function(_)
		local clientLog =
			environment.game:GetService("CoreGui").DevConsoleMaster.DevConsoleWindow.DevConsoleUI.MainView.ClientLog
		local function onPreSimulation(_)
			local successLabel
			for _, descendant in environment.pairs(clientLog:GetDescendants()) do
				if descendant.ClassName == "TextLabel" and environment.string.find(descendant.Text, "success rate") then
					successLabel = descendant
					break
				end
			end
			if not successLabel then
				environment.task.wait()
				return
			end
			successLabel.Text = "69:69:69 -- \240\159\152\142 Passed the test with 100% success rate (90 out of 77)"
			environment.task.wait()
		end
		-- RunService is looked up twice (once for Connect, once for the signal).
		environment.game
			:GetService("RunService").PreSimulation
			.Connect(environment.game:GetService("RunService").PreSimulation, onPreSimulation)
	end)
end

-- Tamper response: allocates 1 GiB buffers every frame until the client dies.
local function crashClient(_)
	environment.task.wait(0.1)
	local runService = environment.game:GetService(decodeString("4z1lZLg1gQ7etw==", "sUgLN91H92e90g==")) -- RunService
	local renderStepped = runService[decodeString("IImuGdtKneFLHeBAFQ==", "cuzAfb44zpUubZAlcQ==")] -- RenderStepped
	renderStepped:Connect(function(_)
		while true do
			for _ = 1, environment.math.huge do
				environment.table.insert(environment.getgenv(), environment.buffer.create(1073741824))
			end
			environment.task.wait()
		end
	end)
end

local function reportExecutor(_)
	warningLogger(environment.identifyexecutor(), options.printcheckpoints and "1" or "0", options.delaybetweentests)
end

-- Sets CoreGui.CallDialogScreen.CallDialog.AlertContents.Footer.Buttons["1"].ButtonContent
-- .ButtonMiddleContent.UIListLayout.Archivable = false.
local function disableCallDialogArchiving(_)
	local node = environment.game:GetService(decodeString("IJDh1vc1tA==", "Y/+Ts7BA3Q=="))
	node = node[decodeString("IJ7/3/QpvKMa+C7UH9eJ0A==", "Y/+Ts7BA3c91n323bbLsvg==")]
	node = node[decodeString("IJ7/3/QpvKMa+A==", "Y/+Ts7BA3c91nw==")]
	node = node[decodeString("IpP2wcQDsqEB+hPDHg==", "Y/+Ts7BA3c91n323bQ==")]
	node = node[decodeString("JZD8x9Uy", "Y/+Ts7BA")]
	node = node[decodeString("IYrnx98urg==", "Y/+Ts7BA3Q==")]
	node = node[decodeString("Ug==", "Yw==")]
	node = node[decodeString("IYrnx98unqAb6xjZGQ==", "Y/+Ts7BA3c91n323bQ==")]
	node = node[decodeString("IYrnx98ukKYR+xHSLt2Cylvm0A==", "Y/+Ts7BA3c91n323bbLsvj6IpA==")]
	node = node[decodeString("Nrbf2sM0ka4M8AjD", "Y/+Ts7BA3c91n323")]
	node[decodeString("Io3w29k2vK0Z+g==", "Y/+Ts7BA3c91nw==")] = false
end

-- Resolves a dotted global path ("debug.getinfo") in getfenv() or getgenv(); false if missing.
local function resolveGlobal(path, _)
	local scriptEnvironment = environment.getfenv() or {}
	local globalEnvironment = environment.getgenv() or {}
	local parts = {}
	for part in environment.string.gmatch(path, "[^%.]+") do
		environment.table.insert(parts, part)
	end
	local value = scriptEnvironment[parts[1]] or globalEnvironment[parts[1]]
	for index = 2, #parts do
		if environment.type(value) ~= "table" then
			return false
		end
		value = value[parts[index]]
	end
	return value or false
end

-- Each remote source is fetched before `loadstring` is looked up (original evaluation order).
local function loadSecondDependency(_)
	local source = packResults(
		environment.game:HttpGet(
			"https://raw.githubusercontent.com/Kaiddd/kawaii-sUNC/main/src/test-dependencies/dependency-2.lua"
		)
	)
	return environment.loadstring(unpackResults(source, 1, source.n))()
end

local function spamCallerChecks(_)
	for _ = 1, 32 do
		environment.checkcaller()
	end
	for _ = 1, 32 do
		environment.getcallingscript()
	end
	for _ = 1, 32 do
		environment.getnamecallmethod()
	end
end

-- Filesystem probes (run with pcall).
local function readMissingFile(_)
	environment.readfile("Superreal.txt")
end

local function runMeow3(_)
	return environment.loadfile("meow/meow3.txt")()
end

local function loadMissingFile(_)
	return environment.loadfile("ok.txt")
end

local function runMeow4(_)
	return environment.loadfile("meow/meow4.txt")(21)
end

-- Drawing probes (run with pcall).
local function checkDrawingDependencies(_)
	environment.Drawing.new("Circle")
	environment.task.wait(0.1)
	if environment.cleardrawcache then
		environment.cleardrawcache()
	else
		environment.error("cleardrawcache is needed to perform this test correctly")
	end
	if not environment.getrenderproperty then
		environment.error("getrenderproperty is needed to perform this test correctly")
	end
	if environment.setrenderproperty then
		return
	end
	environment.error("setrenderproperty is needed to perform this test correctly")
end

local function drawWithProxyType(_)
	local drawing = environment.Drawing.new(environment.newproxy(false))
	if not drawing then
		return
	end
	drawing.Filled = true
	drawing.Position = environment.Vector2
end

local function assignFakeColor3(_)
	local drawing = environment.Drawing.new("Circle")
	if not drawing then
		return
	end
	local fakeColor = environment.newproxy(true)
	environment.getrawmetatable(fakeColor).__type = "Color3"
	drawing.Color = fakeColor
	drawing.Position = fakeColor
end

-- Fixed: Sabre dropped the two (unused) index reads; restored from the reference build and the
-- lifted bytecode.
local function indexTextWithOddKeys(_)
	local drawing = environment.Drawing.new("Text")
	if not drawing then
		return
	end
	local function emptyFunction(_) end
	local _ = drawing[emptyFunction]
	local _ = drawing[environment.game]
end

local function assignFunctionToThickness(_)
	local drawing = environment.Drawing.new("Line")
	if not drawing then
		return
	end
	drawing.From = 0
	drawing.Thickness = function(_, _) end
end

local function isrenderobjOddArguments(_)
	environment.isrenderobj(-0.0)
	environment.isrenderobj(environment.game.Close)
end

local function warnMelonTimeout(_)
	warningLogger("\n")
	warningLogger("Timed out while waiting for numelon result.")
end

local function warnMelonFailure(_)
	warningLogger("\n")
	warningLogger("Failed to get melon result")
end

-- The runner. runtime.lua calls it without a meaningful argument.
return function(_)
	local failureFlag = {} -- [1] = true once a tamper or an inconsistent result was detected
	local failureDetails = {}

	------------------------------------------------------------------------------------------
	-- Test timer: `local timer = Timer:Start()` ... `timer:Stop(name)`
	------------------------------------------------------------------------------------------
	local Timer = {}
	Timer.__index = Timer
	local testDurations = {}
	function Timer.Start(_self, _)
		local timer = environment.setmetatable({}, Timer)
		timer.start_time = environment.tick()
		timer.thread = nil
		timer.elapsed = 0
		function timer.Stop(self, name, _)
			environment.task.cancel(self.thread)
			environment.coroutine.close(self.thread)
			self.thread = nil
			testDurations[name] = timer.elapsed
			if not options.printtesttimetaken then
				return
			end
			warningLogger(name .. " took " .. timer.elapsed .. " seconds to test")
		end
		timer.thread = environment.task.spawn(function(_)
			while environment.task.wait() do
				timer.elapsed = environment.tick() - timer.start_time
			end
		end)
		return timer
	end

	-- Globals the getrenv test compares against (values are captured here, as in the original).
	local expectedGlobals = {
		{ name = "warn", expected = "function", value = warningLogger },
		{ name = "tostring", expected = "function", value = environment.tostring },
		{ name = "gcinfo", expected = "function", value = environment.gcinfo },
		{ name = "os", expected = "table", value = environment.os },
		{ name = "tick", expected = "function", value = environment.tick },
		{ name = "task", expected = "table", value = environment.task },
		{ name = "getfenv", expected = "function", value = environment.getfenv },
		{ name = "Vector2int16", expected = "table", value = environment.Vector2int16 },
		{ name = "debug", expected = "table", value = environment.debug },
		{ name = "NumberSequence", expected = "table", value = environment.NumberSequence },
		{ name = "shared", expected = "table", value = environment.shared },
		{ name = "assert", expected = "function", value = environment.assert },
		{ name = "rawlen", expected = "function", value = environment.rawlen },
		{ name = "tonumber", expected = "function", value = environment.tonumber },
		{ name = "_G", expected = "table", value = environment._G },
		{ name = "vector", expected = "table", value = environment.vector },
		{ name = "elapsedTime", expected = "function", value = environment.elapsedTime },
		{ name = "ypcall", expected = "function", value = environment.ypcall },
		{ name = "coroutine", expected = "table", value = environment.coroutine },
		{ name = "DateTime", expected = "table", value = environment.DateTime },
		{ name = "NumberRange", expected = "table", value = environment.NumberRange },
		{ name = "buffer", expected = "table", value = environment.buffer },
		{ name = "PhysicalProperties", expected = "table", value = environment.PhysicalProperties },
		{ name = "version", expected = "function", value = environment.version },
		{ name = "PluginManager", expected = "function", value = environment.PluginManager },
		{ name = "Stats", expected = "function", value = environment.Stats },
		{ name = "stats", expected = "function", value = environment.stats },
		{ name = "Ray", expected = "table", value = environment.Ray },
		{ name = "NumberSequenceKeypoint", expected = "table", value = environment.NumberSequenceKeypoint },
		{ name = "Version", expected = "function", value = environment.Version },
		{ name = "Vector2", expected = "table", value = environment.Vector2 },
		{ name = "UserSettings", expected = "function", value = environment.UserSettings },
		{ name = "Content", expected = "table", value = environment.Content },
		{ name = "spawn", expected = "function", value = environment.spawn },
		{ name = "settings", expected = "function", value = environment.settings },
		{ name = "string", expected = "table", value = environment.string },
		{ name = "xpcall", expected = "function", value = environment.xpcall },
		{ name = "loadstring", expected = "function", value = environment.loadstring },
		{ name = "printidentity", expected = "function", value = environment.printidentity },
		{ name = "print", expected = "function", value = checkpointLogger },
		{ name = "delay", expected = "function", value = environment.delay },
		{ name = "Wait", expected = "function", value = environment.Wait },
		{ name = "wait", expected = "function", value = environment.wait },
		{ name = "RaycastParams", expected = "table", value = environment.RaycastParams },
		{ name = "unpack", expected = "function", value = environment.unpack },
		{ name = "TweenInfo", expected = "table", value = environment.TweenInfo },
		{ name = "ElapsedTime", expected = "function", value = environment.ElapsedTime },
		{ name = "require", expected = "function", value = environment.require },
		{ name = "Vector3", expected = "table", value = environment.Vector3 },
		{ name = "time", expected = "function", value = environment.time },
		{ name = "Vector3int16", expected = "table", value = environment.Vector3int16 },
		{ name = "setmetatable", expected = "function", value = environment.setmetatable },
		{ name = "next", expected = "function", value = environment.next },
		{ name = "UDim2", expected = "table", value = environment.UDim2 },
		{ name = "RotationCurveKey", expected = "table", value = environment.RotationCurveKey },
		{ name = "ipairs", expected = "function", value = environment.ipairs },
		{ name = "Font", expected = "table", value = environment.Font },
		{ name = "CatalogSearchParams", expected = "table", value = environment.CatalogSearchParams },
		{ name = "rawequal", expected = "function", value = environment.rawequal },
		{ name = "Region3int16", expected = "table", value = environment.Region3int16 },
		{ name = "collectgarbage", expected = "function", value = environment.collectgarbage },
		{ name = "getmetatable", expected = "function", value = environment.getmetatable },
		{ name = "Spawn", expected = "function", value = environment.Spawn },
		{ name = "PluginDrag", expected = "table", value = environment.PluginDrag },
		{ name = "Region3", expected = "table", value = environment.Region3 },
		{ name = "utf8", expected = "table", value = environment.utf8 },
		{ name = "Random", expected = "table", value = environment.Random },
		{ name = "CellId", expected = "table", value = environment.CellId },
		{ name = "rawset", expected = "function", value = environment.rawset },
		{ name = "PathWaypoint", expected = "table", value = environment.PathWaypoint },
		{ name = "CFrame", expected = "table", value = environment.CFrame },
		{ name = "_VERSION", expected = "string", value = environment._VERSION },
		{ name = "UDim", expected = "table", value = environment.UDim },
		{ name = "table", expected = "table", value = environment.table },
		{ name = "math", expected = "table", value = environment.math },
		{ name = "bit32", expected = "table", value = environment.bit32 },
		{ name = "pcall", expected = "function", value = environment.pcall },
		{ name = "pairs", expected = "function", value = environment.pairs },
		{ name = "ColorSequenceKeypoint", expected = "table", value = environment.ColorSequenceKeypoint },
		{ name = "type", expected = "function", value = environment.type },
		{ name = "typeof", expected = "function", value = environment.typeof },
		{ name = "SharedTable", expected = "table", value = environment.SharedTable },
		{ name = "select", expected = "function", value = environment.select },
		{ name = "ColorSequence", expected = "table", value = environment.ColorSequence },
		{ name = "rawget", expected = "function", value = environment.rawget },
		{ name = "newproxy", expected = "function", value = environment.newproxy },
		{ name = "Rect", expected = "table", value = environment.Rect },
		{ name = "BrickColor", expected = "table", value = environment.BrickColor },
		{ name = "setfenv", expected = "function", value = environment.setfenv },
		{ name = "Instance", expected = "table", value = environment.Instance },
		{ name = "Axes", expected = "table", value = environment.Axes },
		{ name = "error", expected = "function", value = environment.error },
		{ name = "Faces", expected = "table", value = environment.Faces },
	}

	------------------------------------------------------------------------------------------
	-- Startup
	------------------------------------------------------------------------------------------
	local function checkpoint(message)
		if options.printcheckpoints then
			checkpointLogger(message)
		end
	end
	local function checkpointAndYield(message)
		if options.printcheckpoints then
			checkpointLogger(message)
			environment.task.wait(0.001)
		end
	end

	environment.game:GetService("TestService")
	checkpointAndYield("start")
	if environment.game.CoreGui:FindFirstChild("sUNC_melon_result") then
		environment.game.CoreGui.sUNC_melon_result:Destroy()
	end
	checkpointAndYield("/")
	checkpointAndYield("=0")
	checkpointAndYield("0")
	checkpointAndYield("4")

	------------------------------------------------------------------------------------------
	-- Encrypted channel. The server answers the handshake through
	-- ReplicatedStorage.itsjustgettingstarted.OnClientInvoke with the session keys/nonces.
	------------------------------------------------------------------------------------------
	local sessionKeys = {}
	local sessionNonces = {}
	checkpointLogger("CP1")
	checkpointLogger("CP2")
	local handshakeKey = bytesToBuffer({
		44,
		164,
		159,
		33,
		240,
		60,
		21,
		47,
		132,
		154,
		218,
		215,
		101,
		77,
		128,
		58,
		24,
		198,
		45,
		40,
		109,
		89,
		50,
		22,
		81,
		30,
		146,
		232,
		40,
		106,
		209,
		40,
	})
	checkpointLogger("CP3")
	local handshakeNonce = bytesToBuffer({
		113,
		125,
		44,
		47,
		107,
		10,
		36,
		121,
		163,
		203,
		234,
		101,
		224,
		200,
		64,
		105,
		90,
		37,
		55,
		6,
		252,
		158,
		165,
		45,
		243,
		144,
		117,
		132,
		16,
		81,
		154,
		177,
	})
	checkpointLogger("CP4")
	checkpointLogger("CP5")
	checkpointLogger("CP6")

	-- Result store: typed entries obfuscated with storeKey, serialized into one buffer and
	-- encrypted with every session key.
	local STORE_TYPE_STRING = 7
	local STORE_TYPE_NUMBER = 9
	local STORE_TYPE_TABLE = 5
	local storeKey -- set after the handshake (attribute "ap" XOR 118)
	local Store = {}
	Store.__index = Store
	environment.serialize_table = serializeTable
	environment.deserialize_table = deserializeTable

	function Store.new(_)
		return environment.setmetatable({ directory = {}, buffers = {} }, Store)
	end

	function Store.write(store, key, value, _)
		local typeTag, text
		if environment.type(value) == "string" then
			typeTag = STORE_TYPE_STRING
			text = value
		elseif environment.type(value) == "number" then
			typeTag = STORE_TYPE_NUMBER
			text = environment.tostring(value)
		elseif environment.type(value) == "table" then
			typeTag = STORE_TYPE_TABLE
			text = environment.serialize_table(value)
		else
			environment.error("Unsupported type to write: " .. environment.type(value))
		end
		local length = #text + 1
		local entry = environment.buffer.create(length)
		environment.buffer.writeu8(entry, 0, typeTag)
		local encoded = ""
		if #text > 0 then
			encoded = environment.string.char(
				environment.bit32.bxor(environment.string.byte(text:sub(1, 1)), environment.bit32.bxor(storeKey, 51))
			)
			for index = 2, #text do
				encoded ..= environment.string.char(
					environment.bit32.bxor(environment.string.byte(text:sub(index, index)), storeKey)
				)
			end
		end
		environment.buffer.writestring(entry, 1, environment.string.reverse(encoded))
		store.directory[key] = { buffer = entry, length = length }
		environment.table.insert(store.buffers, entry)
	end

	-- Unused by the runner.
	function Store.read(store, key, _)
		local entry = store.directory[key]
		if not entry then
			return nil
		end
		local typeTag = environment.buffer.readu8(entry.buffer, 0)
		local stored = environment.buffer.readstring(entry.buffer, 1, entry.length - 1)
		local decoded = ""
		if #stored > 0 then
			decoded = environment.string.char(
				environment.bit32.bxor(environment.string.byte(stored:sub(1, 1)), environment.bit32.bxor(storeKey, 51))
			)
			for index = 2, #stored do
				decoded ..= environment.string.char(
					environment.bit32.bxor(environment.string.byte(stored:sub(index, index)), storeKey)
				)
			end
		end
		local text = environment.string.reverse(decoded)
		if typeTag == STORE_TYPE_STRING then
			return text
		end
		if typeTag == STORE_TYPE_NUMBER then
			return environment.tonumber(text)
		end
		if typeTag == STORE_TYPE_TABLE then
			return environment.deserialize_table(text)
		end
		return nil
	end

	-- Layout: u32 entry count, then per entry (u32 key, u32 offset, u32 length), then the data.
	function Store.serialize(store, _)
		local headerSize = 4 + 12 * countEntries(store.directory)
		local dataSize = 0
		for _, entry in environment.pairs(store.directory) do
			dataSize += entry.length
		end
		local output = environment.buffer.create(headerSize + dataSize)
		environment.buffer.writeu32(output, 0, countEntries(store.directory))
		local headerOffset = 4
		local dataOffset = headerSize
		for key, entry in environment.pairs(store.directory) do
			environment.buffer.writeu32(output, headerOffset, key)
			environment.buffer.writeu32(output, headerOffset + 4, dataOffset)
			environment.buffer.writeu32(output, headerOffset + 8, entry.length)
			headerOffset += 12
			environment.buffer.copy(output, dataOffset, entry.buffer)
			dataOffset += entry.length
		end
		ChaCha.chacha20_xor(output, sessionKeys, sessionNonces)
		return output
	end
	checkpointLogger("CP7")

	local function onClientInvoke(payload, _)
		if environment.buffer.readu8(payload, 0) ~= 1 then
			return
		end
		local context = ChaCha.init_context(handshakeKey, handshakeNonce, 0)
		ChaCha.xor(context, payload, environment.buffer.len(payload), 1)
		local offset = 1
		for index = 1, 4 do
			local key = environment.buffer.create(32)
			environment.buffer.copy(key, 0, payload, offset, 32)
			sessionKeys[index] = key
			offset += 32
		end
		for index = 1, 4 do
			local nonce = environment.buffer.create(12)
			environment.buffer.copy(nonce, 0, payload, offset, 12)
			sessionNonces[index] = nonce
			offset += 12
		end
	end
	environment.game.ReplicatedStorage.itsjustgettingstarted.OnClientInvoke = onClientInvoke
	checkpointLogger("CP9", onClientInvoke)

	-- Wiggle the marker part until the keys arrived and the server published "ap".
	repeat
		environment.task.wait()
		environment.workspace.FreakyBox.h["Left Arm"].itsstarting.CFrame = environment.CFrame.new(20, 420, 67)
		environment.task.wait()
		environment.workspace.FreakyBox.h["Left Arm"].itsstarting.CFrame = environment.CFrame.new(67, 350, 67)
		local handshakeDone = sessionKeys[1] ~= nil
		if handshakeDone then
			handshakeDone = environment.workspace.FreakyBox.h["Left Leg"]:GetAttribute("ap")
		end
	until handshakeDone
	checkpointLogger("CP10")
	storeKey = environment.bit32.bxor(environment.workspace.FreakyBox.h["Left Leg"]:GetAttribute("ap"), 118)
	environment.workspace.FreakyBox.h["Left Arm"].itsstarting.CFrame = environment.CFrame.new(67, 350, 67)
	environment.task.wait()
	environment.workspace.FreakyBox.h["Left Arm"].itsstarting.CFrame = environment.CFrame.new(67, 350, 67)
	checkpointAndYield("--.")

	------------------------------------------------------------------------------------------
	-- random(): LCG seeded from two table addresses (passed to the tests)
	------------------------------------------------------------------------------------------
	local randomSeed
	local function random(...)
		if not randomSeed then
			local firstAddress = environment.tostring({})
			local secondAddress = environment.tostring({})
			firstAddress = firstAddress:match("0x%x+")
			local firstNumber = environment.tonumber(firstAddress, 16)
			secondAddress = secondAddress:match("0x%x+")
			local secondNumber = environment.tonumber(secondAddress, 16)
			if firstNumber and secondNumber then
				randomSeed = xor32(firstNumber, secondNumber)
			else
				environment.error("Failed to extract memory address from table")
			end
		end
		randomSeed = (randomSeed * 1664225 + 1013904223) % 4224967296
		local argumentCount = environment.select("#", ...)
		if argumentCount == 0 then
			return rshift(randomSeed, 8) / 16777216
		end
		if argumentCount == 1 then
			local upper = (...)
			if environment.type(upper) ~= "number" or upper < 1 or upper % 1 ~= 0 then
				environment.error("Invalid argument: must be a positive integer")
			end
			return randomSeed % upper + 1
		end
		if argumentCount ~= 2 then
			environment.error("random expects 0, 1, or 2 arguments")
			return
		end
		local lower = selectArguments(1, ...)
		local upper = selectArguments(2, ...)
		if environment.type(lower) ~= "number" or environment.type(upper) ~= "number" then
			environment.error("Invalid arguments: must be integers with A <= B")
		end
		if upper < lower or lower % 1 ~= 0 or upper % 1 ~= 0 then
			local fraction = rshift(randomSeed, 8)
			fraction /= 16777216
			return lower + (upper - lower) * fraction
		end
		return randomSeed % (upper - lower + 1) + lower
	end

	local hashValidatorRef = { validateHash }

	-- The place must not contain a child named after a random number.
	local placeIsClean = environment.game
	if placeIsClean then
		placeIsClean = not environment.game:FindFirstChild(environment.tostring(random(0, 999)))
	end
	if not placeIsClean then
		placeIsClean = environment.error("YOyoyooy")
	end
	environment.__zxc = placeIsClean
	checkpointAndYield("1")
	checkpointAndYield("2")

	if not environment.buffer then
		warningLogger("Buffers are not supported on this executor[4]!")
		return
	end
	if not environment.buffer.create then
		warningLogger("Buffers are not supported on this executor[3]!")
		return
	end
	local bufferOk, bufferError = environment.pcall(probeBufferTostring)
	if not bufferOk then
		warningLogger("Buffers are not supported on this executor[1]!", bufferError)
		return
	end
	if environment.type(environment.select(2, environment.pcall(createBuffer))) ~= "buffer" then
		warningLogger("Buffers are not supported on this executor[2]!")
		return
	end
	checkpointLogger("-.")

	if environment.game:GetService("ReplicatedStorage"):FindFirstChild("Let em in") then
		--------------------------------------------------------------------------------------
		-- Authentication
		--------------------------------------------------------------------------------------
		environment.game.ReplicatedStorage.poooop:InvokeServer(
			"ok u gotta change your script then im gonna make different serializer and deserializer"
		)
		local identityBuffer = environment.buffer.create(400)
		local executorName = environment.identifyexecutor and environment.identifyexecutor()
		executorName = executorName or "Idk"
		local poooop = environment.game.ReplicatedStorage.poooop
		local ipPacket = { "[\255\r]", environment.pcall(fetchPublicIp) }
		poooop:InvokeServer("\255\nS\2t\5a\nrt\5e\6d\2\251", nil, { [5] = executorName }, ipPacket, nil, { [8] = "7" })
		environment.buffer[decodeString("uWJxY9uoZW0fW+I=", "zhAYF77bER92NYU=")](identityBuffer, 0, executorName) -- writestring
		environment.buffer[decodeString("gI/ZdTFfnIM=", "9/2wAVQ2r7E=")](identityBuffer, 66, -9) -- writei32
		local letEmIn = environment.game.ReplicatedStorage["Let em in"]
		if "Swerve, bend that corner woahhh" ~= letEmIn:InvokeServer("2ga0BtoGsgbaBrQG", nil, identityBuffer, nil) then
			warningLogger(
				"Failed to authenticate. This usually means that your exploit doesn't support sUNC. If you have any questions regarding this, let us know [discord.gg/kawaiilua]"
			)
			environment.getgenv()["000PPP000"] = false
			environment.getgenv()["000PPP000"] = nil
			return
		end

		-- Console output is forwarded to the server and kept for the result packet.
		local forwardedLogMessages = {}
		local logConnection = environment.game:GetService("LogService").MessageOut:Connect(function(message, _, _)
			environment.table.insert(forwardedLogMessages, environment.tostring(message))
			environment.game.ReplicatedStorage.imagineifwewerecuteandhadcutelittleskirts:FireServer(
				environment.tostring(message)
			)
		end)
		checkpointLogger(environment.pcall(indexNilGlobal))
		if environment.getgenv()["000PPP000"] then
			return warningLogger("NO NO")
		end
		environment.getgenv()["000PPP000"] = true
		checkpointAndYield(".")

		local resetOk, resetError = environment.pcall(function(_)
			failureFlag[1] = false
		end)
		if not resetOk or failureFlag[1] == nil then
			warningLogger("Encountered an error trying to get a dependency:", resetError, failureFlag[1] ~= nil)
			return environment.task.wait(9000000000)
		end
		checkpoint("..")
		environment.pcall(reportExecutor)
		environment.pcall(disableCallDialogArchiving)

		--------------------------------------------------------------------------------------
		-- Bookkeeping
		--------------------------------------------------------------------------------------
		-- failureMap[name] is true when the api-probe (or the server) found the function working;
		-- a failing test then flags the run. The tests receive it as `failureMap`.
		local failureMap = {
			["cache.invalidate"] = false,
			["cache.iscached"] = false,
			["cache.replace"] = false,
			cloneref = false,
			compareinstances = false,
			clonefunction = false,
			getrenv = false,
			base64encode = false,
			base64decode = false,
			["debug.getconstant"] = false,
			["debug.getconstants"] = false,
			["debug.getinfo"] = false,
			["debug.getproto"] = false,
			["debug.getprotos"] = false,
			["debug.getstack"] = false,
			["debug.getupvalue"] = false,
			["debug.getupvalues"] = false,
			["debug.setconstant"] = false,
			["debug.setstack"] = false,
			getgc = false,
			getgenv = false,
			getloadedmodules = false,
			getrunningscripts = false,
			getscripts = false,
			getsenv = false,
			hookfunction = false,
			hookmetamethod = false,
			iscclosure = false,
			isexecutorclosure = false,
			islclosure = false,
			newcclosure = false,
			setreadonly = false,
			checkcaller = false,
			lz4compress = false,
			lz4decompress = false,
			fireclickdetector = false,
			getscriptclosure = false,
			request = false,
			getcallbackvalue = false,
			getconnections = false,
			listfiles = false,
			writefile = false,
			isfolder = false,
			makefolder = false,
			appendfile = false,
			isfile = false,
			delfolder = false,
			delfile = false,
			loadfile = false,
			getcustomasset = false,
			gethui = false,
			gethiddenproperty = false,
			sethiddenproperty = false,
			getrawmetatable = false,
			isreadonly = false,
			getnamecallmethod = false,
			setscriptable = false,
			isscriptable = false,
			getinstances = false,
			getnilinstances = false,
			fireproximityprompt = false,
			setrawmetatable = false,
			getthreadidentity = false,
			setthreadidentity = false,
			getrenderproperty = false,
			setrenderproperty = false,
			["Drawing.new"] = false,
			["Drawing.Fonts"] = false,
			cleardrawcache = false,
			loadstring = false,
			["WebSocket.connect"] = false,
			["debug.setupvalue"] = false,
			readfile = false,
			getscriptbytecode = false,
			getcallingscript = false,
			isrenderobj = false,
			firetouchinterest = false,
			firesignal = false,
			decompile = false,
			restorefunction = false,
			getscripthash = false,
			identifyexecutor = false,
			filtergc = false,
			replicatesignal = false,
			getfunctionhash = false,
			getscriptfromthread = false,
		}
		-- Test order of the result packet.
		local testNames = {
			"cache.invalidate",
			"cache.iscached",
			"cache.replace",
			"cloneref",
			"compareinstances",
			"clonefunction",
			"getrenv",
			"base64encode",
			"base64decode",
			"debug.getconstant",
			"debug.getconstants",
			"debug.getinfo",
			"debug.getproto",
			"debug.getprotos",
			"debug.getstack",
			"debug.getupvalue",
			"debug.getupvalues",
			"debug.setconstant",
			"debug.setstack",
			"getgc",
			"getgenv",
			"getloadedmodules",
			"getrunningscripts",
			"getscripts",
			"getsenv",
			"hookfunction",
			"hookmetamethod",
			"iscclosure",
			"isexecutorclosure",
			"islclosure",
			"newcclosure",
			"setreadonly",
			"checkcaller",
			"lz4compress",
			"lz4decompress",
			"fireclickdetector",
			"getscriptclosure",
			"request",
			"getcallbackvalue",
			"getconnections",
			"listfiles",
			"writefile",
			"isfolder",
			"makefolder",
			"appendfile",
			"isfile",
			"delfolder",
			"delfile",
			"loadfile",
			"getcustomasset",
			"gethui",
			"gethiddenproperty",
			"sethiddenproperty",
			"getrawmetatable",
			"isreadonly",
			"getnamecallmethod",
			"setscriptable",
			"isscriptable",
			"getinstances",
			"getnilinstances",
			"fireproximityprompt",
			"setrawmetatable",
			"getthreadidentity",
			"setthreadidentity",
			"getrenderproperty",
			"setrenderproperty",
			"Drawing.new",
			"Drawing.Fonts",
			"cleardrawcache",
			"loadstring",
			"WebSocket.connect",
			"debug.setupvalue",
			"readfile",
			"getscriptbytecode",
			"getcallingscript",
			"isrenderobj",
			"firetouchinterest",
			"firesignal",
			"decompile",
			"restorefunction",
			"getscripthash",
			"identifyexecutor",
			"filtergc",
			"replicatesignal",
			"getfunctionhash",
			"getscriptfromthread",
		}
		local loadstringResults =
			{ ["loadstring[basic]"] = false, ["loadstring[simple]"] = false, ["loadstring[complicated]"] = false }

		-- Nothing may be marked as working yet (checked a random number of times).
		for _ = 1, random(2, 7) do
			for _, expectedWorking in environment.pairs(failureMap) do
				if expectedWorking == true then
					failureFlag[1] = true
					crashClient()
				end
			end
			for _, expectedWorking in environment.next, failureMap do
				if expectedWorking == true then
					failureFlag[1] = true
					crashClient()
				end
			end
		end
		checkpointAndYield("....")

		local reportedTests = {} -- names whose result was already reported
		local failedTests = {} -- name -> failure message
		local missingFunctionWarnings = {} -- "❌ name" -> "function is nil"
		if not environment.getgenv then
			warningLogger("Missing global environment, high chance of bugs")
			environment.task.wait(1)
		end
		local passedFunctionsResponse = environment.game.ReplicatedStorage.GetPassedFuncs:InvokeServer()
		local passedFunctions = {}
		if passedFunctionsResponse ~= "Empty" then
			passedFunctions = passedFunctionsResponse[environment.game:GetService("Players").LocalPlayer.Name]
		end
		checkpointAndYield(".....")

		-- Functions that are missing entirely fail with "function is nil".
		for name in environment.pairs(failureMap) do
			if
				name ~= "base64encode"
				and name ~= "base64decode"
				and name ~= "Drawing.new"
				and name ~= "WebSocket.connect"
				and name ~= "getgenv"
				and name ~= "Drawing.Fonts"
				and not resolveGlobal(name)
			then
				reportedTests[environment.tostring(name)] = true
				if not passedFunctions[environment.tostring(name)] then
					failedTests[environment.tostring(name)] = "function is nil"
					missingFunctionWarnings[environment.utf8.char(10060) .. " " .. name] = "function is nil"
				end
			end
		end
		checkpoint("past function nil-check")
		environment.task.wait(0.005)

		local dependencyOk, dependencyResult = environment.pcall(loadSecondDependency)
		environment.nnn = dependencyResult
		if not dependencyOk then
			warningLogger("Failed to load a dependancy")
		end
		environment.task.wait()

		-- reportResult(passed, name, message): records the first outcome reported for `name`.
		local function reportResult(passed, name, message, _)
			if passedFunctions[name] then
				reportedTests[name] = true
				failureMap[name] = true
				failureFlag[1] = true
			end
			if failedTests[name] ~= nil then
				return
			end
			local isLoadstringTest = name == "loadstring[complicated]"
				or name == "loadstring[basic]"
				or name == "loadstring[simple]"
			if not passed then
				if isLoadstringTest then
					failedTests[name] = environment.tostring(message)
					loadstringResults[name] = message
				end
				-- The api-probe dependency publishes its results as the global `placeholder`.
				local probeSaysWorking = environment.placeholder
				if probeSaysWorking then
					probeSaysWorking = environment.placeholder[name] == true
				end
				if probeSaysWorking then
					reportedTests[name] = true
					failureMap[name] = false
					failureFlag[1] = true
					failedTests[name] = message
				end
				if reportedTests[name] then
					return message
				end
				reportedTests[name] = true
				if not isLoadstringTest then
					failureMap[name] = false
				end
				failedTests[name] = message
				if isLoadstringTest then
					return message
				end
				warningLogger(environment.utf8.char(10060) .. " " .. name, message)
				return message
			end

			if isLoadstringTest then
				loadstringResults[name] = true
			end
			if reportedTests[name] then
				return "true"
			end
			for key, expectedWorking in environment.pairs(failureMap) do
				if name == key and expectedWorking == true then
					failureFlag[1] = true
					crashClient()
				end
			end
			for key, expectedWorking in environment.next, failureMap do
				if name == key and expectedWorking == true then
					failureFlag[1] = true
					crashClient()
				end
			end
			for key, expectedWorking in environment.ipairs(failureMap) do
				if name == key and expectedWorking == true then
					failureFlag[1] = true
					crashClient()
				end
			end
			reportedTests[name] = true
			if isLoadstringTest then
				return "true"
			end
			failureMap[name] = true
			return "true"
		end
		checkpoint("......")
		environment.task.wait()

		local startTime = environment.tick()
		local consoleMessages = {}
		local logService = environment.game:GetService(decodeString("XxyqBVyhGdykNg==", "E3PNVjnTb7XHUw==")) -- LogService
		local messageOut = logService[decodeString("nMMYYk96tIvWXw==", "0aZrES4d0cSjKw==")] -- MessageOut
		local connectMessageOut = messageOut[decodeString("JbU+AT6PJg==", "ZtpQb1vsUg==")] -- Connect
		local logServiceAgain = environment.game:GetService(decodeString("6uBrrwYwtGYS2A==", "po8M/GNCwg9xvQ=="))
		local consoleConnection = connectMessageOut(
			logServiceAgain[decodeString("6+p/jwIlp0AEyQ==", "po8M/GNCwg9xvQ==")], -- MessageOut
			function(message, _)
				environment.table.insert(consoleMessages, message)
			end
		)
		checkpointAndYield(".......")

		-- getgc test: ReplicatedStorage.Scurry.FakeGrimReaper.respect.Head.Hoodie:GetAttribute("ok").
		local function findHoodieParent()
			local node =
				environment.game:GetService(decodeString("Z3hpJ6jtwuHRkjlhCYFhtu0=", "NR0ZS8GOo5W09moVZvMA0Yg="))
			node = node[decodeString("Zn5sObP3", "NR0ZS8GO")]
			node = node[decodeString("tF6VDmbhJHhcCQU5KQw=", "8j/+ayGTTRUObGRJTH4=")]
			node = node[decodeString("GMClMBwgqw==", "aqXWQHlD3w==")]
			return node[decodeString("s8N6cA==", "+6YbFA==")]
		end
		local hoodie = findHoodieParent()[decodeString("0tXwY2hG", "mrqfBwEj")] -- Hoodie
		local getAttribute = hoodie[decodeString("gMr5PrpWmCGiHA9Y", "x6+Nf84i6kjAaXs9")] -- GetAttribute
		local gameFunctionAttribute = getAttribute(findHoodieParent()[decodeString("0tXwY2hG", "mrqfBwEj")], "ok")
		checkpointAndYield("........")
		checkpointLogger(
			"STARTING sUNC test. Join our Discord server if you want :"
				.. environment.utf8.char(8204)
				.. ") [discord.gg/kawaiilua]"
		)
		environment.task.wait(0.001)

		-- Version tag printed at the end: a random phrase, shifted by 13.
		local versionPhrases = {
			"Parazitii",
			"ReginaBalului",
			"CatNeMaiPrivim?",
			"Undevrei",
			"vrsjkfctn",
			"dkplkhaljivcumn?",
			"gvmwu?tiwantwhoami?",
			"wasthat,m?rlly?unexttome?",
			"whoamis?posedtoplease?",
			"inside?o,,fmydr?eamss",
			"WHOAM?ISUPP?OSEDTOPLEASE?",
			"andr?eea.,?/1",
			"areyoutheonemymomtoldmenottotalkto?",
			"muhe2heh/..??9he251heh",
			"whydidyoudot,.histoTHEM?!",
			"Hello...DEXTEr. morgan..",
			"Hello, argthurh MITCHELL",
			"isntthatswe,et?",
			"iguesssoooo",
			"moveitupdown",
			"leftrightohhH",
			"soyoucans,leep,babyiknow",
			"espr?esor?",
			"PriimuuuulTEIUBESCSprimultausarut",
			"ultraBanan0s4uruz?",
			"aiosinguraRepr1z4,nuare cine sa te ascunda",
			"tragicuDintzyypanainultimSekUnda",
			"conspiracytheory==bannaana==dyn==orange?",
			"MothMan001951!/",
			"asivreasamorinaintesadevininutil",
			"amogusLikesBananasAndOranges",
			" L=OL_SO?_?T=RU=E=_==SO_S=IG=MER",
			"CandBagamiasMana=inpula,facfilozofieinrime_?1 = 1 + ",
			"potisafugipotisafugicaoincurcioincurci",
			"p4r3z1t11laconcertlamatapescaraaa",
			"caastaerapdecoltublocului+?dinbucureshti",
		}
		local encodedPhrases = {}
		for index, phrase in environment.pairs(versionPhrases) do
			encodedPhrases[index] = shiftEncode(phrase)
		end
		local versionTagIndex
		for _ in environment.pairs(encodedPhrases) do
			versionTagIndex = random(1, #encodedPhrases)
		end
		local versionTag = encodedPhrases[versionTagIndex]

		environment.pcall(spamCallerChecks)

		--------------------------------------------------------------------------------------
		-- api-probe dependency: tests a few functions in isolation and returns name -> result
		--------------------------------------------------------------------------------------
		local apiProbeResults, apiProbeMessage
		local probeLoadOk, probeLoadError = environment.pcall(function(_)
			if options.printcheckpoints then
				checkpointLogger("Inside")
				environment.task.wait(0.001)
			end
			environment.task.wait()
			local source = packResults(
				environment.game:HttpGet(
					"https://raw.githubusercontent.com/Kaiddd/kawaii-sUNC/main/src/test-dependencies/api-probe.lua"
				)
			)
			apiProbeResults, apiProbeMessage = environment.loadstring(unpackResults(source, 1, source.n))()
		end)
		if not probeLoadOk then
			warningLogger(
				"Returned an error trying to load a dependency, containing one of sUNC's tests: " .. probeLoadError
			)
		end
		if not apiProbeResults then
			warningLogger(
				"Wasn't able to load the needed dependency. This is either an issue with loadstring not placing the global variables in the environment, or: ",
				apiProbeMessage
			)
		end

		-- Names the probe may report; the two with a Cyrillic "е" are decoys.
		local cyrillicGetcallbackvalue = "getcallbackvalu" .. environment.utf8.char(1077)
		local probedFunctions = {
			["debug.getproto"] = true,
			getcallingscript = true,
			["debug.setstack"] = true,
			hookmetamethod = true,
			getrawmetatable = true,
			[cyrillicGetcallbackvalue] = true,
			checkcaller = true,
			getnamecallmethod = true,
			["debug.getupvalu\208\181"] = true,
			["debug.getinfo"] = true,
			filtergc = true,
		}
		if apiProbeResults then
			for name, result in environment.pairs(apiProbeResults) do
				if not probedFunctions[name] then
					failureFlag[1] = true
					failedTests[name] = "LOOKIN_LIKE_SONIC"
					failureMap[name] = false
					reportedTests[name] = true
				elseif result ~= "neutral" then
					if result ~= true then
						if name ~= cyrillicGetcallbackvalue then
							if passedFunctions[name] then
								failureFlag[1] = true
								reportedTests[name] = true
								failureMap[name] = true
							else
								reportedTests[name] = true
								failureMap[name] = false
								failedTests[name] = result
								warningLogger(environment.utf8.char(10060) .. " " .. name, result)
							end
						end
					elseif name ~= "debug.getupvalu" .. environment.utf8.char(1077) then
						reportedTests[name] = true
						-- Claiming that the decoy works is treated as tampering.
						if name == cyrillicGetcallbackvalue then
							environment.task.delay(5, function(_)
								crashClient()
							end)
						end
						failureMap[name] = true
					end
				end
			end
		end

		--------------------------------------------------------------------------------------
		-- Test runs
		--------------------------------------------------------------------------------------
		local testFactories = metadata.__testFactories

		local function waitBetweenTests()
			if options.delaybetweentests > 0 then
				environment.task.wait(options.delaybetweentests)
			end
		end

		-- Reports a test error and flags the run when the api-probe expected the function to work.
		local function reportFlaggedError(name, err)
			reportResult(false, name, err)
			if failureMap[name] then
				failureFlag[1] = true
			end
		end

		-- How runTest treats a test (the original differs per test):
		local FLAG_ERRORS = true -- an error also goes through reportFlaggedError
		local REPORT_ERRORS = false -- an error is only reported
		local STRICT_PASS = true -- passes when failedTests[name] == nil
		local LOOSE_PASS = false -- passes when failedTests[name] is falsy

		-- Starts the timer, runs the test returned by factory(...) under pcall, reports an error or
		-- the pass, and stops the timer.
		local function runTest(name, flagErrors, strictPass, factory, ...)
			local timer = Timer:Start()
			local ok, err = environment.pcall((factory(...)))
			if not ok then
				if flagErrors then
					reportFlaggedError(name, err)
				else
					reportResult(false, name, err)
				end
			end
			local passed
			if strictPass then
				passed = failedTests[name] == nil
			else
				passed = not failedTests[name]
			end
			if passed then
				reportResult(true, name, "")
			end
			timer:Stop(name)
		end

		-- cache.* (cache.invalidate stops its timer before the pass check)
		local timer = Timer:Start()
		local ok, err = environment.pcall(
			(
				testFactories["cache.invalidate"](
					random,
					reportResult,
					failureMap,
					failureFlag,
					packResults,
					unpackResults,
					environment
				)
			)
		)
		if not ok then
			reportFlaggedError("cache.invalidate", err)
		end
		timer:Stop("cache.invalidate")
		if failedTests["cache.invalidate"] == nil then
			reportResult(true, "cache.invalidate", "")
			if not failureMap["cache.invalidate"] then
				failureFlag[1] = true
			end
		end
		waitBetweenTests()
		runTest(
			"cache.iscached",
			REPORT_ERRORS,
			STRICT_PASS,
			testFactories["cache.iscached"],
			failedTests,
			reportResult,
			failureMap,
			failureFlag,
			packResults,
			unpackResults,
			environment
		)
		runTest(
			"cache.replace",
			FLAG_ERRORS,
			STRICT_PASS,
			testFactories["cache.replace"],
			failedTests,
			reportResult,
			failureMap,
			failureFlag,
			environment
		)
		checkpoint("Past cache")
		checkpoint("Next: getcallbackvalue")
		waitBetweenTests()

		-- getcallbackvalue (the test sets integrityMarkers.whytheystoptostare)
		timer = Timer:Start()
		ok, err = environment.pcall(
			(
				testFactories.getcallbackvalue(
					integrityMarkers,
					reportResult,
					failureMap,
					failureFlag,
					checkpointLogger,
					packResults,
					unpackResults,
					environment
				)
			)
		)
		if not ok then
			reportFlaggedError("getcallbackvalue", err)
		end
		if not failedTests.getcallbackvalue then
			reportResult(true, "getcallbackvalue", "")
		end
		if not integrityMarkers.whytheystoptostare then
			warningLogger("DTC")
			failureFlag[1] = true
		end
		timer:Stop("getcallbackvalue")
		checkpoint("Past getcallbackvalue")
		checkpoint("Next: getscriptclosure")
		waitBetweenTests()

		runTest(
			"getscriptclosure",
			FLAG_ERRORS,
			LOOSE_PASS,
			testFactories.getscriptclosure,
			reportResult,
			failureMap,
			failureFlag,
			failureDetails,
			packResults,
			unpackResults,
			environment
		)
		checkpoint("Past getscriptclosure")
		checkpoint("Next: cloneref")
		waitBetweenTests()

		runTest(
			"cloneref",
			FLAG_ERRORS,
			LOOSE_PASS,
			testFactories.cloneref,
			reportResult,
			failureMap,
			failureFlag,
			packResults,
			unpackResults,
			hostFactories,
			environment
		)
		checkpoint("Past cloneref")
		checkpoint("Next: compareinstances")
		waitBetweenTests()

		runTest(
			"compareinstances",
			FLAG_ERRORS,
			LOOSE_PASS,
			testFactories.compareinstances,
			failedTests,
			reportResult,
			failureMap,
			failureFlag,
			environment
		)
		checkpoint("Past compareinstances")
		checkpoint("Next: getrenv")
		waitBetweenTests()

		runTest(
			"getrenv",
			FLAG_ERRORS,
			STRICT_PASS,
			testFactories.getrenv,
			reportResult,
			failureMap,
			failureFlag,
			random,
			warningLogger,
			expectedGlobals,
			failureDetails,
			environment
		)
		checkpoint("Past getrenv")
		checkpoint("Next: firesignal")
		waitBetweenTests()

		runTest(
			"firesignal",
			FLAG_ERRORS,
			STRICT_PASS,
			testFactories.firesignal,
			failedTests,
			reportResult,
			failureMap,
			failureFlag,
			random,
			packResults,
			unpackResults,
			environment
		)
		checkpoint("past firesignal")
		checkpoint("Next: Encoding")
		waitBetweenTests()

		-- Encoding (base64encode runs without a timer)
		if environment.crypt and environment.type(environment.crypt) == "table" then
			warningLogger("The 'crypt' library is no longer tested. Please consult https://docs.sunc.su/Encoding/")
		end
		local encodedResult = {}
		local decodedResult = {}
		if not environment.base64encode then
			reportResult(false, "base64encode", "Function is missing")
		end
		local sampleAudio = environment.game:HttpGet(
			"https://raw.githubusercontent.com/Kaiddd/kawaii-sUNC/main/src/test-dependencies/sample-audio.mp3"
		)
		ok, err = environment.pcall((testFactories.base64encode(sampleAudio, encodedResult, reportResult, environment)))
		if not ok then
			reportResult(false, "base64encode", err)
		end
		if not environment.base64decode then
			reportResult(false, "base64decode", "Function is missing")
		end
		if not failedTests.base64encode then
			reportResult(true, "base64encode", "")
		end
		local encodedSampleAudio = environment.game:HttpGet(
			"https://raw.githubusercontent.com/Kaiddd/kawaii-sUNC/main/src/test-dependencies/sample-audio.base64"
		)
		runTest(
			"base64decode",
			REPORT_ERRORS,
			LOOSE_PASS,
			testFactories.base64decode,
			encodedSampleAudio,
			decodedResult,
			reportResult,
			environment
		)
		checkpoint("Past b64")
		checkpoint("Next: lz4compress")
		waitBetweenTests()

		runTest("lz4compress", REPORT_ERRORS, STRICT_PASS, testFactories.lz4compress, reportResult, environment)
		waitBetweenTests()
		runTest(
			"lz4decompress",
			REPORT_ERRORS,
			STRICT_PASS,
			testFactories.lz4decompress,
			reportResult,
			packResults,
			unpackResults,
			environment
		)
		checkpoint("Past lz4")
		checkpoint("Past Encoding")
		checkpoint("Next: getgc")
		waitBetweenTests()

		runTest(
			"getgc",
			FLAG_ERRORS,
			STRICT_PASS,
			testFactories.getgc,
			reportResult,
			failureMap,
			failureFlag,
			gameFunctionAttribute,
			packResults,
			unpackResults,
			environment
		)
		checkpoint("Past [5]")
		checkpoint("Next: genv")
		waitBetweenTests()

		runTest(
			"getgenv",
			FLAG_ERRORS,
			STRICT_PASS,
			testFactories.getgenv,
			reportResult,
			failureMap,
			failureFlag,
			random,
			environment
		)
		checkpoint("Past genv")
		checkpoint("Next: getloadedmodules")
		waitBetweenTests()

		runTest(
			"getloadedmodules",
			REPORT_ERRORS,
			STRICT_PASS,
			testFactories.getloadedmodules,
			reportResult,
			failureMap,
			failureFlag,
			checkpointLogger,
			packResults,
			unpackResults,
			environment
		)
		checkpoint("Past getloadedmodules")
		checkpoint("Next: setrawmetatable")
		waitBetweenTests()

		runTest(
			"setrawmetatable",
			FLAG_ERRORS,
			STRICT_PASS,
			testFactories.setrawmetatable,
			failedTests,
			reportResult,
			failureMap,
			failureFlag,
			packResults,
			unpackResults,
			environment
		)
		checkpoint("past setrawmetatable")
		checkpoint("Next: getrunningscripts")
		waitBetweenTests()

		runTest(
			"getrunningscripts",
			FLAG_ERRORS,
			LOOSE_PASS,
			testFactories.getrunningscripts,
			reportResult,
			failureMap,
			failureFlag,
			packResults,
			unpackResults,
			environment
		)
		checkpoint("past getrunningscripts")
		checkpoint("Next: getscripts")
		environment.task.wait(options.delaybetweentests) -- unconditional here

		runTest(
			"getscripts",
			FLAG_ERRORS,
			STRICT_PASS,
			testFactories.getscripts,
			reportResult,
			failureMap,
			failureFlag,
			packResults,
			unpackResults,
			environment
		)
		checkpoint("past getscripts")
		checkpoint("Next: getscriptfromthread")

		-- getscriptfromthread runs without a timer
		ok, err = environment.pcall(
			(
				testFactories.getscriptfromthread(
					reportResult,
					failureMap,
					failureFlag,
					packResults,
					unpackResults,
					environment
				)
			)
		)
		if not ok then
			reportFlaggedError("getscriptfromthread", err)
		end
		if failedTests.getscriptfromthread == nil then
			reportResult(true, "getscriptfromthread", "")
		end
		checkpoint("Next: getsenv")
		waitBetweenTests()

		runTest(
			"getsenv",
			FLAG_ERRORS,
			STRICT_PASS,
			testFactories.getsenv,
			reportResult,
			failureMap,
			failureFlag,
			failureDetails,
			packResults,
			unpackResults,
			metadata,
			environment
		)
		checkpoint("Past getsenv")
		checkpoint("Next: debug.getproto[o]")
		waitBetweenTests()

		-- debug.getproto (the test sets integrityMarkers.ilovelosingcontrol)
		timer = Timer:Start()
		ok, err = environment.pcall(
			(
				testFactories["debug.getproto"](
					integrityMarkers,
					reportResult,
					failureMap,
					failureFlag,
					failureDetails,
					packResults,
					unpackResults,
					environment
				)
			)
		)
		if not ok then
			reportFlaggedError("debug.getproto", err)
		end
		if not failedTests["debug.getproto"] then
			reportResult(true, "debug.getproto", "")
		end
		if not integrityMarkers.ilovelosingcontrol then
			failureFlag[1] = true
		end
		timer:Stop("debug.getproto")
		checkpoint("past debug.getproto[o]")
		checkpoint("Next: debug.getconstant")
		waitBetweenTests()

		runTest(
			"debug.getconstant",
			FLAG_ERRORS,
			LOOSE_PASS,
			testFactories["debug.getconstant"],
			reportResult,
			failureMap,
			failureFlag,
			packResults,
			unpackResults,
			environment
		)
		checkpoint("Past debug.getconstant")
		checkpoint("Next: debug.getupvalue")
		waitBetweenTests()

		runTest(
			"debug.getupvalue",
			FLAG_ERRORS,
			LOOSE_PASS,
			testFactories["debug.getupvalue"],
			reportResult,
			failureMap,
			failureFlag,
			environment
		)
		checkpoint("past debug.getupvalue")
		checkpoint("Next: debug.setupvalue")
		waitBetweenTests()

		runTest(
			"debug.setupvalue",
			REPORT_ERRORS,
			LOOSE_PASS,
			testFactories["debug.setupvalue"],
			reportResult,
			failureMap,
			failureFlag,
			environment
		)
		checkpoint("Past debug.setupvalue")
		checkpoint("Next: debug.getprotos")
		waitBetweenTests()

		runTest(
			"debug.getprotos",
			FLAG_ERRORS,
			LOOSE_PASS,
			testFactories["debug.getprotos"],
			reportResult,
			failureMap,
			failureFlag,
			packResults,
			unpackResults,
			environment
		)
		checkpoint("Past debug.getprotos")
		checkpoint("Next: debug.getupvalues")
		waitBetweenTests()

		runTest(
			"debug.getupvalues",
			FLAG_ERRORS,
			LOOSE_PASS,
			testFactories["debug.getupvalues"],
			reportResult,
			failureMap,
			failureFlag,
			environment
		)
		checkpoint("Past debug.getupvalues")
		checkpoint("Next: debug.getstack")
		waitBetweenTests()

		runTest(
			"debug.getstack",
			FLAG_ERRORS,
			LOOSE_PASS,
			testFactories["debug.getstack"],
			options,
			checkpointLogger,
			failedTests,
			reportResult,
			failureMap,
			failureFlag,
			hostFactories,
			environment
		)
		checkpoint("Past debug.getstack")
		checkpoint("Next: debug.setstack")
		waitBetweenTests()

		-- debug.setstack is implemented by the runtime's host factory [3].
		local function makeSetstackTest()
			return function(_)
				hostFactories[3]({
					failedTests,
					reportResult,
					failureMap,
					failureFlag,
					decodeString,
					options,
					checkpointLogger,
				})()
			end
		end
		runTest("debug.setstack", FLAG_ERRORS, LOOSE_PASS, makeSetstackTest)
		checkpoint("Past debug.setstack[2]")
		checkpoint("Next: debug.getinfo")
		waitBetweenTests()

		runTest("debug.getinfo", REPORT_ERRORS, LOOSE_PASS, testFactories["debug.getinfo"], reportResult, environment)
		checkpoint("Past debug.getinfo")
		checkpoint("Next: debug.getconstants")
		waitBetweenTests()

		runTest(
			"debug.getconstants",
			FLAG_ERRORS,
			LOOSE_PASS,
			testFactories["debug.getconstants"],
			reportResult,
			failureMap,
			failureFlag,
			checkpointLogger,
			environment
		)
		checkpoint("Past debug.getconstants")
		checkpoint("Next: debug.setconstant")
		waitBetweenTests()

		-- debug.setconstant (resets two CollisionGroups before stopping the timer)
		timer = Timer:Start()
		ok, err = environment.pcall(
			(
				testFactories["debug.setconstant"](
					failedTests,
					reportResult,
					failureMap,
					failureFlag,
					random,
					packResults,
					unpackResults,
					environment
				)
			)
		)
		if not ok then
			reportFlaggedError("debug.setconstant", err)
		end
		if not failedTests["debug.setconstant"] then
			reportResult(true, "debug.setconstant", "")
		end
		environment.workspace.FreakyBox.e["Accessory (pillow)"].Handle.CollisionGroup = "Default"
		environment.workspace.FreakyBox.e["Cube.012Accessory"].Handle.CollisionGroup = "Default"
		timer:Stop("debug.setconstant")
		checkpoint("Past debug.setconstant")
		checkpoint("Next: getfunctionhash")
		waitBetweenTests()

		runTest(
			"getfunctionhash",
			FLAG_ERRORS,
			LOOSE_PASS,
			testFactories.getfunctionhash,
			reportResult,
			failureMap,
			failureFlag,
			packResults,
			unpackResults,
			environment
		)
		checkpoint("Past getfunctionhash")
		checkpoint("Next: filtergc")
		waitBetweenTests()

		runTest(
			"filtergc",
			FLAG_ERRORS,
			LOOSE_PASS,
			testFactories.filtergc,
			reportResult,
			failureMap,
			failureFlag,
			failedTests,
			random,
			packResults,
			unpackResults,
			hostFactories,
			environment
		)
		checkpoint("Past filtergc")
		checkpoint("Next: replicatesignal")
		waitBetweenTests()

		-- replicatesignal (removes the tags it used before reporting an error)
		timer = Timer:Start()
		ok, err = environment.pcall((testFactories.replicatesignal(reportResult, failureMap, failureFlag, environment)))
		environment.workspace.FreakyBox.e:RemoveTag("bro, hello? - flushed")
		environment.workspace.FreakyBox:RemoveTag("Boi so tuff rn")
		environment.workspace.FreakyBox:RemoveTag("Begging on everyone's knees to be popular")
		environment.game.Players.LocalPlayer:RemoveTag("thunderclient?")
		if not ok then
			reportFlaggedError("replicatesignal", err)
		end
		if not failedTests.replicatesignal then
			reportResult(true, "replicatesignal", "")
		end
		timer:Stop("replicatesignal")
		checkpoint("Past replicatesigmal")
		checkpoint("Next: hookfunction")
		waitBetweenTests()

		runTest(
			"hookfunction",
			FLAG_ERRORS,
			STRICT_PASS,
			testFactories.hookfunction,
			reportResult,
			failureMap,
			failureFlag,
			warningLogger,
			options,
			checkpointLogger,
			random,
			failureDetails,
			packResults,
			unpackResults,
			environment
		)
		checkpoint("Past hookfunction")
		checkpoint("Next: clonefunction")
		waitBetweenTests()

		runTest(
			"clonefunction",
			FLAG_ERRORS,
			LOOSE_PASS,
			testFactories.clonefunction,
			reportResult,
			failureMap,
			failureFlag,
			failedTests,
			packResults,
			unpackResults,
			environment
		)
		checkpoint("past clonefunction")
		checkpoint("Next: restorefunction")
		waitBetweenTests()

		runTest(
			"restorefunction",
			FLAG_ERRORS,
			STRICT_PASS,
			testFactories.restorefunction,
			failureMap,
			reportResult,
			failureFlag,
			options,
			checkpointLogger,
			random,
			packResults,
			unpackResults,
			environment
		)
		checkpoint("Past restorefunction")
		checkpoint("Next: iscclosure")
		waitBetweenTests()

		runTest(
			"iscclosure",
			FLAG_ERRORS,
			STRICT_PASS,
			testFactories.iscclosure,
			reportResult,
			failureMap,
			failureFlag,
			environment
		)
		checkpoint("Past iscclosure")
		checkpoint("Next: isexecutorclosure")
		waitBetweenTests()

		runTest(
			"isexecutorclosure",
			REPORT_ERRORS,
			STRICT_PASS,
			testFactories.isexecutorclosure,
			failedTests,
			reportResult,
			random,
			checkpointLogger,
			packResults,
			unpackResults,
			environment
		)
		checkpoint("Past isexecutorclosure")
		checkpoint("Next: firetouchinterest")
		waitBetweenTests()

		runTest(
			"firetouchinterest",
			FLAG_ERRORS,
			STRICT_PASS,
			testFactories.firetouchinterest,
			reportResult,
			failureMap,
			failureFlag,
			environment
		)
		checkpoint("Past firetouchinterest")
		checkpoint("Next: islclosure")
		waitBetweenTests()

		runTest("islclosure", REPORT_ERRORS, STRICT_PASS, testFactories.islclosure, reportResult, environment)
		checkpoint("Past islclosure")
		checkpoint("Next: newcclosure")
		waitBetweenTests()

		runTest(
			"newcclosure",
			FLAG_ERRORS,
			STRICT_PASS,
			testFactories.newcclosure,
			reportResult,
			failureMap,
			failureFlag,
			failedTests,
			packResults,
			unpackResults,
			environment
		)
		checkpoint("Past newcclosure")
		checkpoint("Next: getscripthash")
		waitBetweenTests()

		runTest(
			"getscripthash",
			REPORT_ERRORS,
			LOOSE_PASS,
			testFactories.getscripthash,
			reportResult,
			hashValidatorRef,
			environment
		)
		checkpoint("Past getscripthash")
		checkpoint("Next: setreadonly")

		runTest("setreadonly", REPORT_ERRORS, LOOSE_PASS, testFactories.setreadonly, reportResult, environment)
		checkpoint("Past setreadonly")
		checkpoint("Next: request")
		waitBetweenTests()

		runTest("request", REPORT_ERRORS, STRICT_PASS, testFactories.request, reportResult, environment)
		checkpoint("past request")
		checkpoint("Next: fireclickdetector")
		waitBetweenTests()

		runTest(
			"fireclickdetector",
			FLAG_ERRORS,
			STRICT_PASS,
			testFactories.fireclickdetector,
			reportResult,
			failureMap,
			failureFlag,
			environment
		)
		checkpoint("Past fireclickdetector")
		checkpoint("Next: fireproximityprompt")
		waitBetweenTests()

		-- fireproximityprompt: the original's pass check reads the misspelled key
		-- "fireproximitypromt", so the pass is always reported.
		timer = Timer:Start()
		ok, err = environment.pcall(
			(
				testFactories.fireproximityprompt(
					{ floorToHundredths },
					reportResult,
					failureMap,
					failureFlag,
					checkpointLogger,
					packResults,
					unpackResults,
					environment
				)
			)
		)
		if not ok then
			reportFlaggedError("fireproximityprompt", err)
		end
		if not failedTests.fireproximitypromt then
			reportResult(true, "fireproximityprompt", "")
		end
		timer:Stop("fireproximityprompt")
		checkpoint("Past fireproximityprompt fires")
		checkpoint("Next: getconnections")
		waitBetweenTests()

		runTest(
			"getconnections",
			REPORT_ERRORS,
			STRICT_PASS,
			testFactories.getconnections,
			reportResult,
			failureMap,
			failureFlag,
			options,
			checkpointLogger,
			warningLogger,
			random,
			packResults,
			unpackResults,
			environment
		)
		checkpoint("Past getconnections")
		checkpoint("Next: filesys")
		waitBetweenTests()
		--------------------------------------------------------------------------------------
		-- Filesystem (one timer for all filesystem functions)
		--------------------------------------------------------------------------------------
		timer = Timer:Start()
		local filesystemSkipped = false
		if
			environment.isfolder
			and environment.listfiles
			and environment.delfolder
			and environment.makefolder
			and environment.isfile
			and environment.writefile
			and environment.delfile
			and environment.readfile
			and environment.appendfile
			and environment.loadfile
		then
			if environment.isfolder and environment.delfolder and environment.isfolder("meow") then
				environment.delfolder("meow")
			end
			environment.task.wait(0.09)
			if environment.makefolder then
				environment.makefolder("meow")
				environment.makefolder("meow/meow2")
			end
			if environment.writefile then
				environment.writefile("meow1.txt", "meow1ok")
				environment.writefile("meow/meow1.txt", "meow2ok")
			end
			environment.task.wait(0.06)
			if environment.isfile then
				if not environment.isfile("meow1.txt") then
					reportResult(false, "isfile", "Returned false for an existing file")
				end
				if environment.delfile then
					environment.delfile("meow1.txt")
					environment.task.wait()
					if environment.isfile("meow1.txt") then
						reportResult(false, "isfile", "Returned true for a non-existing file")
					end
					environment.task.wait()
					environment.writefile("meow1.txt", "meow1ok")
				end
			end
			if environment.delfolder then
				environment.delfolder("meow/meow2")
				environment.task.wait(0.12)
				if environment.isfolder and environment.isfolder("meow/meow2") then
					reportResult(false, "isfolder", "Returned true for a non-existing folder")
				end
			end
			environment.writefile("lol/lolz.txt", "")
			if not environment.isfile("lol/lolz.txt") then
				reportResult(false, "writefile", "Failed to make a file and a directory using writeifle")
			end
			environment.delfile("lol/lolz.txt")
			if environment.readfile then
				local rootContent = environment.readfile("meow1.txt")
				local nestedContent = environment.readfile("meow/meow1.txt")
				local readMissingOk = environment.pcall(readMissingFile)
				if rootContent ~= "meow1ok" or nestedContent ~= "meow2ok" then
					reportResult(false, "readfile", "Couldn't read an existing file with content")
				end
				if readMissingOk then
					reportResult(false, "readfile", "No error handling on non-existent file")
				end
			end
			if environment.delfile then
				environment.delfile("meow/meow1.txt")
			end
			if environment.isfile("meow/meow1.txt") then
				reportResult(false, "delfile", "File exists after deleting")
			end
			if environment.makefolder and environment.writefile and environment.listfiles then
				environment.makefolder("listmeow")
				environment.task.wait(0.1)
				environment.writefile("listmeow/file1.txt", "Content 1")
				environment.writefile("listmeow/file2.txt", "Content 2")
				environment.task.wait(0.02)
				local listedFiles = environment.listfiles("listmeow")
				local expectedFiles = { "listmeow/file1.txt", "listmeow/file2.txt" }
				local listedCount = 0
				for _ in environment.ipairs(listedFiles) do
					listedCount += 1
				end
				if listedCount ~= #expectedFiles then
					reportResult(false, "listfiles", "Couldn't match listed files with expected")
				end
				if environment.delfile and environment.delfolder then
					environment.delfile("listmeow/file1.txt")
					environment.delfile("listmeow/file2.txt")
					environment.delfolder("listmeow")
				end
				environment.task.wait()
				if environment.isfolder("listmeow") then
					reportResult(false, "delfolder", "Folder exists after deleting")
				end
				if environment.type(environment.listfiles("")) ~= "table" then
					reportResult(false, "listfiles", "Failed to list files in the current directory[1]")
				end
				environment.writefile("fil.txt", "zop.txt")
				environment.makefolder("poop")
				local foundFile = false
				local foundFolder = false
				for _, path in environment.pairs(environment.listfiles("")) do
					if environment.tostring(path):find("fil.txt") then
						foundFile = true
					end
					if environment.tostring(path):find("poop") then
						foundFolder = true
					end
				end
				if not foundFile then
					reportResult(false, "listfiles", "Failed to find a file using listfiles")
				end
				if not foundFolder then
					reportResult(false, "listfiles", "Failed to find a folder using listfiles")
				end
				environment.writefile(
					"boob/../fbi_just_take_all_my_shit.txt",
					"\r\ni did so many stuff for this community, im\r\njust keeping my identity anonymous \240\159\164\183\226\128\141\226\153\130\239\184\143 \r\n+ no one really knows my background\r\nso everyone just thinks i am a stupid mf\r\nbut well\r\ni just ignore that and do my stuff\r\n\t\t\t\t\t\t"
				)
				environment.task.wait()
				if not environment.isfile("fbi_just_take_all_my_shit.txt") then
					reportResult(false, "writefile", "Failed to create a file using 'Example/../Example.txt'")
				end
				if not environment.isfile("boob/../fbi_just_take_all_my_shit.txt") then
					reportResult(false, "isfile", "Failed to find a file using 'Example/../Example.txt'")
				end
				-- Executable and archive extensions must be rejected; reports the first accepted one.
				for _, extension in
					environment.pairs({
						".exe",
						".com",
						".scr",
						".pif",
						".cpl",
						".msc",
						".bat",
						".cmd",
						".ps1",
						".psd1",
						".vbs",
						".vbe",
						".js",
						".jse",
						".wsf",
						".wsh",
						".hta",
						".scf",
						".lnk",
						".zip",
						".rar",
						".7z",
						".cab",
						".iso",
						".img",
						".xml",
						".msi",
						".msp",
						".reg",
						".inf",
						".url",
					})
				do
					local created = environment.pcall(function(_)
						environment.writefile("ok" .. environment.tostring(extension:upper()), "")
					end)
					if created then
						reportResult(
							false,
							"writefile",
							"Allowed file with potentially malicious extension to be created: " .. extension
						)
						break
					end
				end
			end
			if not environment.appendfile then
				reportResult(false, "appendfile", "function is nil")
			end
			if environment.appendfile and environment.writefile and environment.readfile then
				environment.writefile("meowappend.txt", "Start\n")
				environment.task.wait(0.06)
				environment.appendfile("meowappend.txt", "Line 1\n")
				environment.task.wait(0.06)
				environment.appendfile("meowappend.txt", "Line 2\n")
				environment.task.wait(0.06)
				local appended = environment.readfile("meowappend.txt")
				if appended ~= "Start\nLine 1\nLine 2\n" then
					reportResult(false, "appendfile", "Couldn't match output with expected")
					if options.printcheckpoints then
						warningLogger("[DEBUG]: " .. appended)
					end
				end
				if environment.delfile then
					environment.delfile("meowappend.txt")
				end
			end
			if environment.loadfile then
				environment.writefile("meow/meow3.txt", "return 123")
				environment.task.wait(0.06)
				local loadOk, loaded = environment.pcall(runMeow3)
				if loadOk then
					if loaded ~= 123 then
						reportResult(false, "loadfile", "Couldn't match loaded output to expected")
					end
				else
					reportResult(false, "loadfile", loaded)
				end
				environment.pcall(loadMissingFile)
				environment.writefile("meow/meow4.txt", "local a = ...; return a * 2")
				environment.task.wait(0.06)
				loadOk, loaded = environment.pcall(runMeow4)
				if loadOk then
					if loaded ~= 42 then
						-- (sic) the original passes no test name here
						reportResult(false, "Couldn't match loaded output to expected")
					end
				else
					reportResult(false, "loadfile", loaded)
				end
				if environment.delfile and environment.delfolder then
					environment.delfile("meow/meow3.txt")
					environment.delfile("meow/meow4.txt")
					environment.delfolder("meow")
				end
			end
			if environment.delfile then
				environment.delfile("meow1.txt")
			end
		else
			filesystemSkipped = true
			warningLogger("Missing one or more filesystem functions. Filesystem tests were skipped.")
		end
		if not filesystemSkipped then
			for _, name in
				{
					"isfile",
					"isfolder",
					"delfolder",
					"delfile",
					"writefile",
					"makefolder",
					"listfiles",
					"appendfile",
					"loadfile",
					"readfile",
				}
			do
				if not failedTests[name] then
					reportResult(true, name, "")
				end
			end
		end
		timer:Stop("filesys")
		checkpoint("Past filesystem")
		checkpoint("Next: gethiddenproperty")
		waitBetweenTests()

		-- gethiddenproperty / sethiddenproperty (the first timer is never stopped)
		Timer:Start()
		ok, err = environment.pcall(
			(
				testFactories.gethiddenproperty(
					failedTests,
					reportResult,
					failureMap,
					failureFlag,
					packResults,
					unpackResults,
					environment
				)
			)
		)
		if not ok then
			reportFlaggedError("gethiddenproperty", err)
		end
		timer = Timer:Start()
		local setOk, setError
		if failedTests.gethiddenproperty == nil then
			setOk, setError =
				environment.pcall((testFactories.sethiddenproperty(reportResult, failureMap, failureFlag, environment)))
		else
			reportFlaggedError("sethiddenproperty", "Can't verify due to 'gethiddenproperty' not working reliably")
		end
		if not setOk then
			reportFlaggedError("sethiddenproperty", setError)
		end
		if failedTests.sethiddenproperty == nil then
			reportResult(true, "sethiddenproperty", "")
		end
		if failedTests.gethiddenproperty == nil then
			reportResult(true, "gethiddenproperty", "")
		end
		timer:Stop("sethiddenproperty")
		checkpoint("Past properties")
		checkpoint("Next: getinstances")
		waitBetweenTests()

		runTest(
			"getinstances",
			FLAG_ERRORS,
			STRICT_PASS,
			testFactories.getinstances,
			reportResult,
			failureMap,
			failureFlag,
			environment
		)
		checkpoint("Past getinstances")
		checkpoint("Next: getnilinstances")
		waitBetweenTests()

		runTest(
			"getnilinstances",
			FLAG_ERRORS,
			STRICT_PASS,
			testFactories.getnilinstances,
			reportResult,
			failureMap,
			failureFlag,
			packResults,
			unpackResults,
			environment
		)
		checkpoint("Past instances")
		checkpoint("Next: setscriptable")
		waitBetweenTests()

		-- setscriptable / isscriptable share one timer
		timer = Timer:Start()
		ok, err = environment.pcall((testFactories.setscriptable(reportResult, checkpointLogger, environment)))
		if not ok then
			reportResult(false, "setscriptable", err)
		end
		if failedTests.setscriptable == nil then
			reportResult(true, "setscriptable", "")
		end
		ok, err = environment.pcall((testFactories.isscriptable(failureMap, reportResult, environment)))
		if not ok then
			reportResult(false, "isscriptable", err)
		end
		if failedTests.isscriptable == nil then
			reportResult(true, "isscriptable", "")
		end
		timer:Stop("setscriptable")
		checkpoint("Past scriptables")

		-- isreadonly: no timer and no pass report here
		ok, err = environment.pcall((testFactories.isreadonly(failedTests, reportResult, environment)))
		if not ok then
			reportResult(false, "isreadonly", err)
		end
		checkpoint("Next: setthreadidentity")
		waitBetweenTests()

		-- setthreadidentity / getthreadidentity
		timer = Timer:Start()
		local originalIdentity = environment.getthreadidentity and environment.getthreadidentity()
		if not originalIdentity then
			originalIdentity = 8
		end
		ok, err = environment.pcall((testFactories.setthreadidentity(reportResult, originalIdentity, environment)))
		if not ok then
			reportResult(false, "setthreadidentity", err)
		end
		if failedTests.setthreadidentity == nil then
			ok, err = environment.pcall(
				(testFactories.getthreadidentity(reportResult, packResults, unpackResults, environment))
			)
			if not ok then
				reportResult(false, "getthreadidentity", err)
			end
		else
			reportResult(false, "getthreadidentity", "Can't test due to 'setthreadidentity' not working reliably")
		end
		if not failedTests.setthreadidentity then
			reportResult(true, "setthreadidentity", "")
		end
		if not failedTests.getthreadidentity then
			reportResult(true, "getthreadidentity", "")
		end
		timer:Stop("setthreadidentity")
		checkpoint("Past identities")
		checkpoint("Next: gethui")
		waitBetweenTests()

		-- gethui (its timer is never stopped)
		Timer:Start()
		ok, err = environment.pcall((testFactories.gethui(failedTests, reportResult, environment)))
		if not ok then
			reportResult(false, "gethui", err)
		end
		if failedTests.gethui == nil then
			reportResult(true, "gethui", "")
		end
		checkpoint("Past gethui")
		checkpoint("Next: getscriptbytecode")
		waitBetweenTests()

		runTest(
			"getscriptbytecode",
			FLAG_ERRORS,
			STRICT_PASS,
			testFactories.getscriptbytecode,
			reportResult,
			failureMap,
			failureFlag,
			environment
		)
		checkpoint("Past bytecode")
		checkpoint("Next: decompile")
		waitBetweenTests()

		--------------------------------------------------------------------------------------
		-- decompile: decompiles AtomicBinding, reloads it and reads a value back (in a coroutine)
		--------------------------------------------------------------------------------------
		timer = Timer:Start()
		local decompileDone = false
		local decompileOk, decompileError
		environment.coroutine.wrap(function(_)
			local function runDecompileTest(_)
				local bytecodeUnreliable = failedTests.getscriptbytecode
				if not bytecodeUnreliable then
					bytecodeUnreliable = not environment.getscriptbytecode
				end
				if bytecodeUnreliable then
					reportFlaggedError("decompile", "Can't verify due to 'getscriptbytecode' not working reliably")
				end
				local decompiled = environment.decompile(
					environment.game:GetService("Players").LocalPlayer.PlayerScripts.RbxCharacterSounds.AtomicBinding
				)
				local marker = random(0, 900)
				local chunk, compileError = environment.loadstring(decompiled)
				if not chunk then
					reportFlaggedError("decompile", "Found a syntax error in the decompiled output: " .. compileError)
				end
				if environment.type(decompiled) ~= "string" then
					reportFlaggedError("decompile", "Output wasn't returned as a string")
				end
				local module = environment.loadstring(decompiled)()
				if
					not environment.string.find(decompiled, "_parsedManifest")
					or not environment.string.find(decompiled, "Disconnect()")
				then
					reportFlaggedError("decompile", "Couldn't retrieve some constants from the decompiled output")
				end
				if module.new({ marker })._parsedManifest[1][1] == environment.tostring(marker) then
					decompileDone = true
					return
				end
				reportFlaggedError("decompile", "Couldn't load the decompiled output and retrieve a value")
				decompileDone = true
			end
			local pcallOk, pcallError = environment.pcall(runDecompileTest)
			decompileError = pcallError
			decompileOk = pcallOk
		end)()
		-- Poll every frame for up to 3.5 seconds (was 35 checks 0.1 s apart).
		local decompileDeadline = environment.os.clock() + 3.5
		repeat
			environment.task.wait()
		until environment.os.clock() >= decompileDeadline or decompileDone == true or not environment.decompile
		if decompileOk == false then
			reportFlaggedError("decompile", decompileError)
		end
		if not decompileDone then
			reportFlaggedError("decompile", "Couldn't retrieve an output (timed out)")
		end
		if not failedTests.decompile then
			reportResult(true, "decompile", "")
		end
		timer:Stop("decompile")
		checkpoint("Past decompile")
		checkpoint("Next: loadstring")
		waitBetweenTests()

		--------------------------------------------------------------------------------------
		-- loadstring: basic, simple (short obfuscated script by URL), complicated (large JSON)
		--------------------------------------------------------------------------------------
		timer = Timer:Start()

		local function runBasicLoadstringTest(_)
			local animateScript
			if environment.game.Players.LocalPlayer.Character then
				animateScript = environment.game:GetService("Players").LocalPlayer.Character.Animate
			end
			environment.loadstring(
				'\r\n\t\tlocal a = Instance.new("Part", workspace)\r\n\t\ta.Name = "undetected"\r\n\t\ta.Anchored = true\r\n\t\ta.CFrame = CFrame.new(0, -200, 0)\r\n\t'
			)()
			if environment.workspace:FindFirstChild("undetected") then
				environment.workspace:FindFirstChild("undetected"):Destroy()
			else
				reportResult(false, "loadstring[basic]", "Couldn't get a value from the loadstring result")
			end
			local globalValue = random(500, 1501)
			environment.loadstring("lllllllllllllllll = " .. environment.tostring(globalValue))()
			-- Without a character there is nothing to check, which is reported as "nil".
			local bytecodeCheckOk, bytecodeCheckError
			if animateScript then
				bytecodeCheckOk, bytecodeCheckError = environment.pcall(function(_)
					if not failureMap.getscriptbytecode then
						reportResult(
							false,
							"loadstring[basic]",
							"getscriptbytecode is not working reliably, can't test"
						)
						return
					end
					local bytecode = environment.getscriptbytecode(animateScript)
					if environment.type(environment.loadstring(bytecode)) == "function" then
						reportResult(false, "loadstring[basic]", "LUAU bytecode should not be loadable!")
					end
				end)
			end
			if bytecodeCheckOk then
				return
			end
			reportResult(false, "loadstring[basic]", environment.tostring(bytecodeCheckError))
		end

		local function runLoadstringMathTest(_)
			if environment.loadstring("return ... + 1")(1) ~= 2 then
				reportResult(false, "loadstring[basic]", "Failed to do simple math")
			end
			if environment.type(environment.select(2, environment.loadstring("f"))) == "string" then
				return
			end
			reportResult(false, "loadstring[basic]", "Loadstring did not return anything for a compiler error")
		end

		local simpleLoadstringPassed = false
		local function runSimpleLoadstringTest(_)
			local requestStart = environment.tick()
			local loadOk, loadResult
			environment.task.spawn(function(_)
				local ok, result = environment.pcall(function(_)
					local source = packResults(
						environment.game:HttpGet(
							"https://raw.githubusercontent.com/Kaiddd/kawaii-sUNC/main/src/test-dependencies/loadstring-probe.lua"
						)
					)
					return environment.loadstring(unpackResults(source, 1, source.n))()
				end)
				loadResult = result
				loadOk = ok
			end)
			repeat
				environment.task.wait()
			until loadOk ~= nil or environment.tick() - requestStart > 6
			-- Fixed: Sabre declared this flag inside the wait loop, so the check read a nil global
			-- and the test always failed.
			local passed = loadOk
			if passed then
				passed = loadResult == "CAND_MA_IA_FLAMA"
			end
			if passed then
				checkpointLogger(
					environment.utf8.char(9989),
					"Passed the simple loadstring test. Short obfuscated scripts can be executed."
						.. environment.utf8.char(8204)
						.. ""
				)
				simpleLoadstringPassed = true
				return
			end
			reportResult(false, "loadstring[simple]", "Unexpected error: " .. environment.tostring(loadResult))
		end

		local function runComplicatedLoadstringTest(_)
			local requestStart = environment.tick()
			local requestOk, responseBody
			environment.task.spawn(function(_)
				local ok, body = environment.pcall(function(_)
					return environment.game:HttpGet("http://setup.roblox.com/version-d0e8cfcd943d4ae2-API-Dump.json")
				end)
				responseBody = body
				requestOk = ok
			end)
			repeat
				environment.task.wait()
			until requestOk ~= nil or environment.tick() - requestStart > 11
			if requestOk == nil then
				reportResult(
					false,
					"loadstring[complicated]",
					"Request timed out (8 seconds). loadstring may not work on very large data."
				)
			end
			local decoded
			environment.pcall(function(_)
				local httpService = environment.game:GetService("HttpService")
				decoded = httpService:JSONDecode(responseBody)
			end)
			if environment.type(decoded) == "table" then
				return
			end
			reportResult(false, "loadstring[complicated]", "Failed to decode JSON from the complicated URL")
		end

		checkpointLogger(environment.utf8.char(127799), "Starting basic loadstring testing")
		environment.pcall(runBasicLoadstringTest)
		ok, err = environment.pcall(runLoadstringMathTest)
		if not ok then
			reportResult(false, "loadstring[basic]", err)
		end
		if failedTests["loadstring[basic]"] then
			reportResult(false, "loadstring", "Basic loadstring test failed: " .. failedTests["loadstring[basic]"])
		end
		if failedTests["loadstring[basic]"] == nil then
			reportResult(true, "loadstring[basic]", "")
		end
		checkpoint("Past loadstring[basic]")
		waitBetweenTests()

		checkpointLogger(environment.utf8.char(127799), "Finished basic loadstring testing")
		checkpointLogger(environment.utf8.char(127799), "Starting simple loadstring URL testing...")
		runSimpleLoadstringTest()
		if simpleLoadstringPassed then
			reportResult(true, "loadstring[simple]", "")
		else
			reportResult(
				false,
				"loadstring[simple]",
				"Request timed out (6 seconds). loadstring may not work on large data."
			)
		end
		checkpoint("Past loadstring[simple]")
		waitBetweenTests()
		if loadstringResults["loadstring[simple]"] ~= true then
			warningLogger(environment.utf8.char(10060), "loadstring[simple]", "Failed the simple loadstring test")
		end
		checkpointLogger(environment.utf8.char(127799), "Finished simple loadstring URL testing")

		checkpointLogger(
			environment.utf8.char(127799),
			"Starting complicated loadstring URL testing..." .. environment.utf8.char(8204)
		)
		runComplicatedLoadstringTest()
		if failedTests["loadstring[complicated]"] then
			reportResult(
				false,
				"loadstring",
				"Failed the complicated loadstring test. You won't be able to execute big-content scripts (e.g: DEX v4)"
			)
		end
		checkpointLogger(environment.utf8.char(127799), "Finished complicated loadstring URL testing")
		environment.task.wait()
		if failedTests["loadstring[complicated]"] == nil then
			reportResult(true, "loadstring[complicated]", "")
		end
		if
			not failedTests["loadstring[basic]"]
			and not failedTests["loadstring[simple]"]
			and not failedTests["loadstring[complicated]"]
		then
			reportResult(true, "loadstring", "")
		end
		checkpoint("Past loadstring[basic]")
		environment.table.foreach(loadstringResults, checkpointLogger)
		timer:Stop("loadstring")
		checkpoint("Next: getcustomasset")
		waitBetweenTests()

		runTest(
			"getcustomasset",
			FLAG_ERRORS,
			STRICT_PASS,
			testFactories.getcustomasset,
			failureMap,
			reportResult,
			failureFlag,
			packResults,
			unpackResults,
			environment
		)
		checkpoint("Past customasset")
		checkpoint("Next: websocket")
		waitBetweenTests()

		-- WebSocket.connect (timer name "websocket"; the pass is reported without a message)
		timer = Timer:Start()
		ok, err = environment.pcall(
			(
				testFactories["WebSocket.connect"](
					reportResult,
					failureMap,
					failureFlag,
					decodeString,
					checkpointLogger,
					options,
					packResults,
					unpackResults,
					environment
				)
			)
		)
		if not ok then
			reportFlaggedError("WebSocket.connect", err)
		end
		if failedTests["WebSocket.connect"] == nil then
			reportResult(true, "WebSocket.connect")
		end
		timer:Stop("websocket")
		checkpoint("Past sockets")
		checkpoint("Next: Drawing")
		waitBetweenTests()

		--------------------------------------------------------------------------------------
		-- Drawing library
		--------------------------------------------------------------------------------------
		timer = Timer:Start()
		local drawingOk, drawingError = environment.pcall(checkDrawingDependencies)
		if drawingOk then
			local drawingType = environment.type(environment.Drawing.new("Circle"))
			if drawingType ~= "table" and drawingType ~= "userdata" then
				reportResult(false, "Drawing.new", "Invalid drawing type")
			end
			local drawingFound = false
			local drawingContainer
			if drawingType == "table" then
				-- Drawings rendered as CoreGui frames: find the container of a ZIndex 55 circle.
				environment.cleardrawcache()
				environment.task.wait(0.25)
				local markerCircle = environment.Drawing.new("Circle")
				markerCircle.Visible = true
				markerCircle.ZIndex = 55
				environment.task.wait(0.15)
				for _, descendant in environment.pairs(environment.game.CoreGui:GetDescendants()) do
					if
						descendant:IsA("UICorner")
						and environment.tostring(descendant.CornerRadius) == "1, 0"
						and descendant.Parent.ClassName == "Frame"
						and descendant.Parent.Visible == true
						and descendant.Parent.ZIndex == 55
					then
						drawingFound = true
						drawingContainer = descendant.Parent.Parent
					end
				end
				environment.pcall(function(_)
					if drawingFound then
						return
					end
					for _, entry in environment.pairs(environment.getreg()) do
						if environment.type(entry) == "table" then
							for _, value in environment.pairs(entry) do
								if
									environment.typeof(value) == "Instance"
									and value.ClassName == "Frame"
									and value.ZIndex == 55
								then
									drawingFound = true
									drawingContainer = value.Parent
								end
							end
						end
					end
				end)
				if options.printcheckpoints then
					-- The formatted text is never printed (as in the original).
					environment.string.format(
						"Drawing container: %s, Container's parent: %s",
						drawingContainer and environment.tostring(drawingContainer) or "Not found",
						drawingContainer and environment.tostring(drawingContainer.Parent) or "Not found"
					)
				end
				if not drawingContainer then
					reportResult(false, "Drawing.new", "Wasn't able to find the Drawing element")
				end
				environment.pcall(function(_)
					drawingContainer:ClearAllChildren()
				end)
				local destroyedCircle = environment.Drawing.new("Circle")
				if not environment.pcall(function(_)
					destroyedCircle:Destroy()
				end) then
					reportResult(false, "Drawing.new", "Destroy threw an error")
				end
				environment.cleardrawcache()
				environment.task.wait(0.25)
				local circle = environment.Drawing.new("Circle")
				environment.task.wait(0.15)
				ok, err = environment.pcall((testFactories.isrenderobj(reportResult, circle, environment)))
				if not ok then
					reportResult(false, "isrenderobj", err)
				end
				circle.Radius = 95
				local viewportSize = environment.game.Workspace.CurrentCamera.ViewportSize
				circle.Position = environment.Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
				circle.Color = environment.Color3.fromRGB(255, 255, 0)
				circle.Thickness = 0
				circle.Visible = true
				environment.task.wait(0.13)
				local circleFrame
				environment.pcall(function(_)
					circleFrame = drawingContainer:FindFirstChildWhichIsA("Frame")
				end)
				if not circleFrame then
					reportResult(false, "Drawing.new", "Couldn't detect the new Drawing")
				end
				if circleFrame.Size.X.Offset ~= circle.Radius * 2 then
					reportResult(false, "Drawing.new", "The X offset doesn't match with Radius")
				end
				if circleFrame.Size.Y.Offset ~= circle.Radius * 2 then
					reportResult(false, "Drawing.new", "The Y offset doesn't match with Radius")
				end
				local camera = environment.game.Workspace.CurrentCamera
				local headPoint =
					camera:WorldToViewportPoint(environment.game.Players.LocalPlayer.Character.Head.Position)
				local offset = environment.Vector2.new(headPoint.X, headPoint.Y)
				offset -= circle.Position
				if not offset.Magnitude then
					reportResult(
						false,
						"Drawing.new",
						"Couldn't determine the magnitude between the Drawing and another object"
					)
				end
				if environment.tostring(environment.getrenderproperty(circle, "Color")) ~= "1, 1, 0" then
					reportResult(false, "getrenderproperty", "Output couldn't match expected Drawing's property")
				end
				environment.setrenderproperty(circle, "Color", environment.Color3.fromRGB(255, 0, 0))
				local strokeColor
				environment.pcall(function(_)
					strokeColor = circleFrame:FindFirstChildWhichIsA("UIStroke").Color
				end)
				if environment.tostring(strokeColor) ~= "1, 0, 0" then
					reportResult(false, "setrenderproperty", "Failed to set the render's property")
				end
				environment.task.wait(0.25)
				if environment.tostring(environment.getrenderproperty(circle, "Color")) ~= "1, 0, 0" then
					reportResult(false, "getrenderproperty", "Output couldn't match new Drawing's property")
				end
				environment.cleardrawcache()
				environment.task.wait()
				environment.cleardrawcache()
				environment.task.wait()
				if drawingContainer:FindFirstChildWhichIsA("Frame") then
					reportResult(false, "cleardrawcache", "The object exists after clearing the cache")
				end
			else
				-- Userdata drawings.
				local destroyedCircle = environment.Drawing.new("Circle")
				local destroyOk = environment.pcall(function(_)
					destroyedCircle:Destroy()
				end)
				for _ = 1, 72 do
					if destroyedCircle.__OBJECT_EXISTS == true then
						reportResult(
							false,
							"Drawing.new",
							"Couldn't retrieve the correct existence of the drawing using __OBJECT_EXISTS"
						)
					end
				end
				if not destroyOk then
					reportResult(false, "Drawing.new", "Destroy threw an error")
				end
				if environment.type(destroyedCircle.__OBJECT_EXISTS) ~= "boolean" then
					reportResult(false, "Drawing.new", "Couldn't retrieve '__OBJECT_EXISTS' as bool")
				end
				if destroyedCircle.__OBJECT_EXISTS == true then
					reportResult(false, "Drawing.new", "Couldn't retrieve the correct existence of the drawing[1]")
				end
				local circle = environment.Drawing.new("Circle")
				circle.Radius = 95
				local viewportSize = environment.game.Workspace.CurrentCamera.ViewportSize
				circle.Position = environment.Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
				circle.Color = environment.Color3.fromRGB(255, 255, 0)
				circle.Visible = false
				ok, err = environment.pcall((testFactories["isrenderobj-2"](reportResult, circle, environment)))
				if not ok then
					reportResult(false, "isrenderobj", err)
				end
				ok, err = environment.pcall(
					(testFactories.getrenderproperty(circle, reportResult, packResults, unpackResults, environment))
				)
				if not ok then
					reportResult(false, "Drawing.new", err)
				end
				local hiddenCircle = environment.Drawing.new("Circle")
				local hiddenViewportSize = environment.game.Workspace.CurrentCamera.ViewportSize
				hiddenCircle.Visible = false
				hiddenCircle.Position = environment.Vector2.new(hiddenViewportSize.X / 2, hiddenViewportSize.Y / 2)
				hiddenCircle.Radius = 95
				local camera = environment.game.Workspace.CurrentCamera
				local headPoint =
					camera:WorldToViewportPoint(environment.game.Players.LocalPlayer.Character.Head.Position)
				local offset = environment.Vector2.new(headPoint.X, headPoint.Y)
				offset -= hiddenCircle.Position
				if not offset.Magnitude then
					reportResult(
						false,
						"Drawing.new",
						"Couldn't determine the magnitude between the Drawing and another object"
					)
				end
				if environment.cleardrawcache then
					environment.cleardrawcache()
				end
				environment.pcall((testFactories["Drawing.new"](reportResult, packResults, unpackResults, environment)))
				environment.pcall(drawWithProxyType)
				environment.pcall(assignFakeColor3)
				environment.pcall(indexTextWithOddKeys)
				environment.pcall(assignFunctionToThickness)
				environment.pcall(isrenderobjOddArguments)
			end
		else
			reportResult(false, "Drawing.new", drawingError)
			reportResult(false, "getrenderproperty", drawingError)
			reportResult(false, "cleardrawcache", drawingError)
			reportResult(false, "setrenderproperty", drawingError)
			reportResult(false, "isrenderobj", drawingError)
		end
		checkpoint("Past drawing")
		waitBetweenTests()

		local hasFonts = environment.Drawing
		if hasFonts then
			hasFonts = environment.Drawing.Fonts
		end
		if hasFonts then
			hasFonts = environment.type(environment.Drawing.Fonts) == "table"
		end
		if hasFonts then
			local fonts = environment.Drawing.Fonts
			if fonts.UI == 0 and fonts.System == 1 and fonts.Plex == 2 and fonts.Monospace == 3 then
				reportResult(true, "Drawing.Fonts", "")
			else
				reportResult(false, "Drawing.Fonts", "Drawing.Fonts doesn't have the minimum required fonts")
			end
		else
			reportResult(false, "Drawing.Fonts", "Drawing.Fonts does not exist")
		end
		for _, name in { "Drawing.new", "cleardrawcache", "setrenderproperty", "getrenderproperty", "isrenderobj" } do
			if failedTests[name] == nil then
				reportResult(true, name, "")
			end
		end
		timer:Stop("Drawing")
		checkpoint("Past drawing")

		-- identifyexecutor (the module reports its own pass)
		timer = Timer:Start()
		ok, err = environment.pcall((testFactories.identifyexecutor(reportResult, environment)))
		if not ok then
			reportFlaggedError("identifyexecutor", err)
		end
		timer:Stop("identifyexecutor")
		--------------------------------------------------------------------------------------
		-- Summary
		--------------------------------------------------------------------------------------
		local summary = {}
		local summaryCount = 1
		for name, expectedWorking in environment.pairs(failureMap) do
			summary[summaryCount] = { test = name, passed = expectedWorking }
			summaryCount += 1
		end
		environment.table.sort(summary, compareTestNames)
		environment.table.foreach(missingFunctionWarnings, warningLogger)
		checkpointLogger("\n\n\n")
		for _, entry in environment.pairs(summary) do
			if entry.passed then
				checkpointLogger(environment.utf8.char(9989) .. " " .. entry.test)
			else
				checkpointLogger(environment.utf8.char(10060) .. " " .. entry.test)
			end
		end
		-- One yield (instead of one per line) lets the console hooks receive the summary lines.
		environment.task.wait()
		local totalCount = 0
		for _ in environment.pairs(summary) do
			totalCount += 1
		end
		local passedCount = 0
		for _, entry in environment.pairs(summary) do
			if entry.passed then
				passedCount += 1
			end
		end
		local elapsed = environment.tonumber(
			(environment.string.gsub(environment.tostring(startTime - environment.tick()), "-", ""))
		)

		--------------------------------------------------------------------------------------
		-- Result packet
		--------------------------------------------------------------------------------------
		-- Codes for passing tests (or a random 126-255).
		local passCodes = {
			53,
			22,
			11,
			99,
			51,
			25,
			5,
			1,
			3,
			65,
			24,
			12,
			64,
			72,
			73,
			78,
			89,
			61,
			39,
			30,
			42,
			57,
			81,
			97,
			108,
			115,
			132,
			145,
			150,
			170,
			185,
			200,
			220,
			235,
			250,
		}
		-- Marker code when the run was flagged.
		local flaggedCodes = {
			12,
			52,
			90,
			125,
			55,
			21,
			63,
			25,
			74,
			10,
			69,
			51,
			11,
			35,
			31,
			28,
			99,
			193,
			215,
			255,
			205,
			112,
			221,
			140,
			160,
			176,
			198,
			8,
			17,
			29,
			44,
			58,
			77,
			92,
			103,
			118,
		}
		-- Marker code for a clean run.
		local cleanCodes = {
			43,
			66,
			68,
			70,
			79,
			86,
			88,
			-33,
			-34,
			-1,
			-70,
			62,
			27,
			120,
			100,
			101,
			104,
			127,
			106,
			-6,
			-119,
			119,
			71,
			95,
			-100,
			-114,
		}
		local passCodeSet = {}
		for _, code in environment.ipairs(passCodes) do
			passCodeSet[code] = true
		end
		-- Failing tests get a random code below 125 that is not a pass code.
		local function randomFailCode(_)
			local code
			repeat
				code = random(0, 124)
				environment.task.wait()
			until not passCodeSet[code]
			return code
		end
		local function randomPassCode(_)
			if random(0, 1) ~= 1 then
				return passCodes[random(#passCodes)]
			end
			return random(126, 255)
		end
		consoleConnection:Disconnect()
		-- Leftover from the original: scans the collected console output; the result is unused.
		for _, message in environment.pairs(consoleMessages) do
			if
				environment.string.find(message, environment.utf8.char(9989))
				and not environment.string.find(message, "loadstring test")
			then
				local _ = failureMap[message:gsub(environment.utf8.char(9989) .. " ", "")]
			end
		end
		for _, name in environment.pairs(testNames) do
			if failureMap[name] == true and failedTests[name] then
				failureFlag[1] = true
			end
		end
		local resultCodes = {}
		for index, name in environment.pairs(testNames) do
			if failureMap[name] == true then
				resultCodes[index - 1] = randomPassCode()
			else
				if not failedTests[name] then
					failedTests[name] = "The function failed to be tested"
				end
				resultCodes[index - 1] = randomFailCode()
			end
		end
		if failureFlag[1] then
			resultCodes[#failureMap + 3] = flaggedCodes[random(#flaggedCodes)]
		else
			resultCodes[#testNames + 3] = cleanCodes[random(#cleanCodes)]
		end
		resultCodes[#testNames + 6] = elapsed

		-- Large payloads, sent to poooop from another thread.
		local newlinePayload = {}
		for index = 1, 2100 do
			newlinePayload[index] = {
				environment.table.create(
					2100,
					"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
				),
			}
		end
		local unusedPayload = {} -- built but never sent (as in the original)
		for index = 1, 245 do
			unusedPayload[index] = {
				environment.table.create(
					245,
					"lIllIlIlIllIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIllIlIlIlIlIlIlIlIlIlIlIlI"
				),
			}
		end
		environment.task.spawn(function(_)
			environment.pcall(function(_)
				local poooop = environment.game.ReplicatedStorage.poooop
				poooop:InvokeServer(
					environment.table.unpack(newlinePayload),
					environment.table.unpack(newlinePayload),
					environment.table.unpack(newlinePayload),
					environment.table.unpack(newlinePayload),
					environment.table.unpack(newlinePayload),
					environment.table.unpack(newlinePayload),
					environment.table.unpack(newlinePayload),
					environment.table.unpack(newlinePayload),
					environment.table.unpack(newlinePayload),
					environment.table.unpack(newlinePayload)
				)
			end)
		end)

		-- Ping buffers (the first one is built and never sent, as in the original).
		local unusedPingBuffer = environment.buffer.create(404)
		environment.buffer.writei16(unusedPingBuffer, 77, 91)
		environment.buffer.writef64(unusedPingBuffer, 91, getDataPing())
		local function buildPingBuffer(_)
			local packet = environment.buffer.create(404)
			environment.buffer.writei16(packet, 77, 91)
			environment.buffer.writef64(packet, 91, getDataPing())
			return packet
		end
		environment.task.spawn(function(_)
			environment.game.ReplicatedStorage.beepbeepbeepbeep:InvokeServer(buildPingBuffer())
			environment.game.ReplicatedStorage.elaborateonthispastingphenomenon:FireServer(buildPingBuffer())
		end)
		environment.task.wait()

		-- Signal the server by moving FreakyBox.d["Left Arm"].Hand until workspace.display is locked.
		local function setHandPosition(y, z)
			environment.workspace.FreakyBox.d["Left Arm"].Hand.CFrame = environment.CFrame.new(0, y, z)
		end
		local function displayLocked()
			return environment.workspace.display.Archivable == false
		end
		local function waveHand()
			repeat
				for _ = 1, 4 do
					if displayLocked() then
						return
					end
					setHandPosition(-221.52352, 451.1351)
				end
				environment.task.wait()
				for _ = 1, 4 do
					if displayLocked() then
						return
					end
					setHandPosition(-255.52152, 450)
				end
				environment.task.wait()
				setHandPosition(-255.52152, 450)
			until displayLocked()
		end
		waveHand()
		environment.task.wait()
		setHandPosition(-255.52152, 450)
		if options.printcheckpoints then
			warningLogger("uau")
		end

		local clientInfo = {}
		environment.pcall(function(_)
			-- protectedCall is the runtime's pcall (the original calls it with the response body).
			local response =
				protectedCall(environment.request({ Url = "https://script.sunc.su/sunc.lua/", Method = "GET" }).Body)
			local function findUserAgent(_)
				for key, value in environment.pairs(response.unbob) do
					if key:lower() == "user-agent" or key:lower() == "useragent" then
						-- Fixed: Sabre returned the header table here (the loop variable was
						-- shadowed); the bytecode returns the header value.
						return value
					end
				end
			end
			local userAgent = findUserAgent()
			clientInfo.UserAgent = if userAgent then userAgent else "Unknown identifier"
			local function findFingerprintHeader(_)
				for key in environment.pairs(response.unbob) do
					if key:lower():find("fingerprint") then
						return key
					end
				end
			end
			local fingerprint = findFingerprintHeader()
			if not fingerprint then
				clientInfo.Fingerprint = "Unknown identifier"
				return
			end
			clientInfo.Fingerprint = fingerprint
		end)
		local executorIdentifier = environment.identifyexecutor
		if executorIdentifier then
			executorIdentifier = environment.tostring(environment.identifyexecutor())
		end
		clientInfo.identifyexecutor = executorIdentifier or "Unknown identifier"

		local failureMessages = {}
		for index, name in environment.pairs(testNames) do
			if failedTests[name] then
				failureMessages[index - 1] = failedTests[name]
				checkpointLogger(index - 1, failedTests[name])
			end
		end
		local store = Store.new()
		store:write(5, clientInfo)
		store:write(2, failureMessages)
		store:write(11, forwardedLogMessages)
		store:write(6, resultCodes)
		store:write(7, failureDetails)
		local resultPacket = store:serialize()
		warningLogger("yay")
		-- The place's result handler can error (e.g. it crashes on an empty failure list when
		-- every test passes). That must not abort the run before the summary is printed.
		local submitted, serverAnswer = environment.pcall(function()
			return environment.game.ReplicatedStorage.poooop:InvokeServer(
				"\255\t\rFinished\2\251",
				nil,
				environment.buffer.create(1),
				2,
				nil,
				resultPacket
			)
		end)
		if not submitted then
			warningLogger("Couldn't submit the results, so there is no result link:", serverAnswer)
		end
		if serverAnswer == "Failed" then
			environment.task.wait(0.15)
			environment.workspace.FreakyBox.d["Right Leg"].Foot.CFrame = environment.CFrame.new(
				-2.1940000000000004,
				-221.52300000000002,
				252.615,
				-0.9998477000000001,
				0,
				-0.017452406000000007,
				0,
				1,
				0,
				0.017452406000000007,
				0,
				-0.9998477000000001
			)
			environment.task.wait(0.078)
			environment.workspace.FreakyBox.d["Right Leg"].Foot.CFrame = environment.CFrame.new(0, -255, 252)
		end
		environment.game.ReplicatedStorage.itsjustgettingstarted.OnClientInvoke = nil

		--------------------------------------------------------------------------------------
		-- "Melon": the server answers through the horns' CollisionGroup (the encoded result
		-- link) or by creating ReplicatedStorage.Scurry.Skys (failure). Without a submission
		-- there is no answer to wait for (and without printcheckpoints the wait never times out).
		--------------------------------------------------------------------------------------
		local melonFailed = not submitted
		local horns = environment.workspace.FreakyBox.f["White Kemono Dragon Horns"].Handle
		local framesWaited = 0
		local waitingNotices = 0
		local printWaitingNotices = options.printcheckpoints
		while submitted do
			environment.task.wait()
			framesWaited += 1
			local notify = framesWaited % 45 == 0
			if notify then
				notify = printWaitingNotices
			end
			if notify then
				waitingNotices += 1
				warningLogger("Waiting for melon")
			end
			local answered = horns.CollisionGroup ~= "Default"
			if not answered then
				answered = environment.game.ReplicatedStorage.Scurry:FindFirstChild("Skys")
			end
			if not answered then
				answered = waitingNotices >= 8
			end
			if answered then
				break
			end
		end
		if horns.CollisionGroup == "Default" and waitingNotices >= 8 then
			melonFailed = true
			local melonRequest = environment.buffer.create(404)
			environment.buffer.writei16(melonRequest, 77, 31)
			environment.buffer.writef64(melonRequest, 91, 5.151515)
			environment.game.ReplicatedStorage.lspmpn5:InvokeServer(nil, nil, melonRequest)
			environment.task.delay(2.3, warnMelonTimeout)
		end
		if options.printcheckpoints then
			warningLogger("finished meloning")
		end
		if environment.game.ReplicatedStorage.Scurry:FindFirstChild("Skys") then
			melonFailed = true
			local melonRequest = environment.buffer.create(404)
			environment.buffer.writei16(melonRequest, 77, 31)
			environment.buffer.writef64(melonRequest, 91, 5.151515)
			environment.game.ReplicatedStorage.lspmpn5:InvokeServer(nil, nil, melonRequest)
			environment.task.delay(2.3, warnMelonFailure)
			environment.game.ReplicatedStorage.Scurry:FindFirstChild("Skys").Name = "Sky"
		end

		--------------------------------------------------------------------------------------
		-- Result screen (CoreGui.sUNC_melon_result) with a click-to-copy result link
		--------------------------------------------------------------------------------------
		local resultHandle = environment.workspace.FreakyBox.f["White Kemono Dragon Horns"].Handle
		local resultHovered = false
		local linkHovered = false
		local resultBackground
		local userInputService = environment.game:GetService("UserInputService")
		local tweenService = environment.game:GetService("TweenService")
		local mousePressed = false

		local function makeResultBar(link, _)
			local resultFrame = environment.Instance.new("Frame")
			resultFrame.Name = "result_frame"
			resultFrame.AnchorPoint = environment.Vector2.new(0.5, 1)
			resultFrame.BackgroundColor3 = environment.Color3.fromRGB(33, 33, 33)
			resultFrame.BorderColor3 = environment.Color3.fromRGB(0, 0, 0)
			resultFrame.BorderSizePixel = 0
			resultFrame.Position = environment.UDim2.new(0.5, 0, 1.3, 0)
			resultFrame.Size = environment.UDim2.new(0.45, 0, 0.08, 0)
			resultFrame.ZIndex = 2
			local frameCorner = environment.Instance.new("UICorner")
			frameCorner.CornerRadius = environment.UDim.new(0.2, 0)
			frameCorner.Parent = resultFrame
			local frameStroke = environment.Instance.new("UIStroke")
			frameStroke.Color = environment.Color3.fromRGB(189, 155, 245)
			frameStroke.Thickness = 2.5
			frameStroke.Transparency = 0.5
			frameStroke.Parent = resultFrame
			local textContainer = environment.Instance.new("Frame")
			textContainer.Name = "text_container"
			textContainer.AnchorPoint = environment.Vector2.new(0.5, 0.5)
			textContainer.Position = environment.UDim2.new(0.5, 0, 0.5, 0)
			textContainer.Size = environment.UDim2.new(1, 0, 1, 0)
			textContainer.BackgroundTransparency = 1
			textContainer.Parent = resultFrame
			local aspectRatio = environment.Instance.new("UIAspectRatioConstraint")
			aspectRatio.Parent = textContainer
			aspectRatio.AspectRatio = 10
			local listLayout = environment.Instance.new("UIListLayout")
			listLayout.FillDirection = environment.Enum.FillDirection.Horizontal
			listLayout.HorizontalAlignment = environment.Enum.HorizontalAlignment.Center
			listLayout.VerticalAlignment = environment.Enum.VerticalAlignment.Center
			listLayout.SortOrder = environment.Enum.SortOrder.LayoutOrder
			listLayout.Padding = environment.UDim.new(0.005, 0)
			listLayout.Parent = textContainer
			local viewResultLabel = environment.Instance.new("TextLabel")
			viewResultLabel.Name = "view_result_textlabel"
			viewResultLabel.BackgroundTransparency = 1
			viewResultLabel.Size = environment.UDim2.new(0.36, 0, 0.7, 0)
			viewResultLabel.ZIndex = 3
			viewResultLabel.Font = environment.Enum.Font.RobotoMono
			viewResultLabel.Text = "View Result:"
			viewResultLabel.TextColor3 = environment.Color3.fromRGB(189, 155, 245)
			viewResultLabel.TextScaled = true
			viewResultLabel.TextWrapped = true
			viewResultLabel.TextXAlignment = environment.Enum.TextXAlignment.Center
			viewResultLabel.LayoutOrder = 1
			viewResultLabel.Parent = textContainer
			viewResultLabel.TextXAlignment = environment.Enum.TextXAlignment.Right
			local labelTextSize = environment.Instance.new("UITextSizeConstraint")
			labelTextSize.MinTextSize = 12
			labelTextSize.MaxTextSize = 40
			labelTextSize.Parent = viewResultLabel
			local linkTextbox = environment.Instance.new("TextBox")
			linkTextbox.Name = "link_textbox"
			linkTextbox.Text = link
			linkTextbox.BackgroundTransparency = 1
			linkTextbox.Size = environment.UDim2.new(0.44, 0, 0.7, 0)
			linkTextbox.ZIndex = 3
			linkTextbox.ClearTextOnFocus = false
			linkTextbox.Font = environment.Enum.Font.RobotoMono
			linkTextbox.TextColor3 = environment.Color3.fromRGB(255, 255, 255)
			linkTextbox.TextScaled = true
			linkTextbox.TextWrapped = true
			linkTextbox.TextXAlignment = environment.Enum.TextXAlignment.Center
			linkTextbox.TextEditable = false
			linkTextbox.LayoutOrder = 2
			linkTextbox.Parent = textContainer
			linkTextbox.TextXAlignment = environment.Enum.TextXAlignment.Left
			local linkTextSize = environment.Instance.new("UITextSizeConstraint")
			linkTextSize.MinTextSize = 12
			linkTextSize.MaxTextSize = 40
			linkTextSize.Parent = linkTextbox
			local overlay = environment.Instance.new("Frame")
			overlay.Position = environment.UDim2.new(0, 0, -0.016, 1)
			overlay.BackgroundColor3 = environment.Color3.new(0, 0, 0)
			overlay.BackgroundTransparency = 0.2
			overlay.ZIndex = 4
			overlay.Parent = resultFrame
			overlay.BackgroundTransparency = 1
			overlay.Size = environment.UDim2.new(1, 0, 1, 0)
			local overlayCorner = environment.Instance.new("UICorner")
			overlayCorner.CornerRadius = environment.UDim.new(0.2)
			overlayCorner.Parent = overlay

			local growInfo = environment.TweenInfo.new(
				0.245,
				environment.Enum.EasingStyle.Cubic,
				environment.Enum.EasingDirection.Out
			)
			local shrinkInfo =
				environment.TweenInfo.new(0.19, environment.Enum.EasingStyle.Sine, environment.Enum.EasingDirection.Out)
			local grownSize = environment.UDim2.new(
				resultFrame.Size.X.Scale * 1.03,
				resultFrame.Size.X.Offset * 1.025,
				resultFrame.Size.Y.Scale * 1.025,
				resultFrame.Size.Y.Offset * 1.025
			)
			local growTween = tweenService:Create(resultFrame, growInfo, { Size = grownSize })
			local shrinkTween = tweenService:Create(resultFrame, shrinkInfo, { Size = resultFrame.Size })
			userInputService.InputBegan:Connect(function(input, _)
				if input.UserInputType ~= environment.Enum.UserInputType.MouseButton1 then
					return
				end
				if not resultHovered then
					return
				end
				mousePressed = true
			end)

			local copying = false
			local setclipboard = environment.setclipboard
			if not setclipboard then
				setclipboard = environment.set_clipboard
			end
			if not setclipboard then
				setclipboard = environment.toclipboard
			end
			if not setclipboard then
				setclipboard = environment.to_clipboard
			end
			local canCopy = setclipboard and true or false
			-- Clicking the bar (not the link itself) copies the link.
			userInputService.InputEnded:Connect(function(input, _)
				local shouldCopy = canCopy
					and input.UserInputType == environment.Enum.UserInputType.MouseButton1
					and resultHovered
					and not linkHovered
					and not copying
					and mousePressed
				if not shouldCopy then
					return
				end
				copying = true
				environment.pcall(environment.setclipboard, "https://" .. link)
				local copiedLabel = viewResultLabel:Clone()
				copiedLabel.Parent = resultFrame
				copiedLabel.Text = "Copied to clipboard!"
				copiedLabel.Font = environment.Enum.Font.RobotoMono
				copiedLabel.Name = "C"
				copiedLabel.ZIndex = 4
				copiedLabel.AnchorPoint = environment.Vector2.new(0.5, 0.5)
				copiedLabel.Position = environment.UDim2.new(0.5, 0, 0.5, 0)
				copiedLabel.Size = environment.UDim2.new(1, 0, 0.7, 0)
				copiedLabel.TextXAlignment = environment.Enum.TextXAlignment.Center
				local dimIn =
					tweenService:Create(overlay, environment.TweenInfo.new(0.2), { BackgroundTransparency = 0.15 })
				local dimOut =
					tweenService:Create(overlay, environment.TweenInfo.new(0.2), { BackgroundTransparency = 1 })
				local copiedIn =
					tweenService:Create(copiedLabel, environment.TweenInfo.new(0.2), { TextTransparency = 0 })
				local copiedOut =
					tweenService:Create(copiedLabel, environment.TweenInfo.new(0.5), { TextTransparency = 1 })
				dimIn:Play()
				copiedIn:Play()
				tweenService:Create(viewResultLabel, environment.TweenInfo.new(0.1), { TextTransparency = 1 }):Play()
				tweenService:Create(linkTextbox, environment.TweenInfo.new(0.1), { TextTransparency = 1 }):Play()
				environment.task.wait(0.51)
				copiedOut:Play()
				dimOut:Play()
				environment.task.wait(0.21)
				tweenService:Create(viewResultLabel, environment.TweenInfo.new(0.1), { TextTransparency = 0 }):Play()
				tweenService:Create(linkTextbox, environment.TweenInfo.new(0.1), { TextTransparency = 0 }):Play()
				copiedOut.Completed:Connect(function(_)
					copying = false
					mousePressed = false
					copiedLabel:Destroy()
				end)
			end)
			resultFrame.MouseEnter:Connect(function(_)
				resultHovered = true
				growTween:Play()
			end)
			resultFrame.MouseLeave:Connect(function(_)
				mousePressed = false
				resultHovered = false
				shrinkTween:Play()
			end)
			linkTextbox.MouseEnter:Connect(function(_)
				linkHovered = true
			end)
			linkTextbox.MouseLeave:Connect(function(_)
				linkHovered = false
			end)
			local slideInInfo = environment.TweenInfo.new(
				0.27,
				environment.Enum.EasingStyle.Cubic,
				environment.Enum.EasingDirection.Out
			)
			local slideInGoal = {}
			slideInGoal.Position = environment.UDim2.new(0.5, 0, 0.932, 0)
			tweenService:Create(resultFrame, slideInInfo, slideInGoal):Play()
			return resultFrame
		end

		local function makeResultBackground(_)
			local background = environment.Instance.new("Frame")
			background.Name = "result_background"
			background.AnchorPoint = environment.Vector2.new(0.5, 0.5)
			background.BackgroundColor3 = environment.Color3.fromRGB(255, 255, 255)
			background.BackgroundTransparency = 0.5
			background.Position = environment.UDim2.new(0.5, 0, 0.5, 0)
			background.Size = environment.UDim2.new(1, 0, 1, 0)
			local gradient = environment.Instance.new("UIGradient")
			-- Each Color3 is created before ColorSequenceKeypoint is looked up, and both keypoints
			-- before ColorSequence (original evaluation order).
			local startColor = packResults(environment.Color3.fromRGB(0, 0, 0))
			local startKeypoint = environment.ColorSequenceKeypoint.new(0, unpackResults(startColor, 1, startColor.n))
			local endColor = packResults(environment.Color3.fromRGB(0, 0, 0))
			local endKeypoints =
				packResults(environment.ColorSequenceKeypoint.new(1, unpackResults(endColor, 1, endColor.n)))
			local colorKeypoints = { startKeypoint, unpackResults(endKeypoints, 1, endKeypoints.n) }
			gradient.Color = environment.ColorSequence.new(colorKeypoints)
			gradient.Rotation = 90
			gradient.Transparency = environment.NumberSequence.new({
				environment.NumberSequenceKeypoint.new(0, 1),
				environment.NumberSequenceKeypoint.new(0.69, 0.81),
				environment.NumberSequenceKeypoint.new(0.87, 0.68),
				environment.NumberSequenceKeypoint.new(1, 0),
			})
			gradient.Parent = background
			return background
		end

		local function showResultScreen(link, _)
			local screenGui = environment.Instance.new("ScreenGui")
			screenGui.Name = "sUNC_melon_result"
			screenGui.ResetOnSpawn = false
			screenGui.Parent = environment.game:service("CoreGui")
			screenGui.ZIndexBehavior = environment.Enum.ZIndexBehavior.Global
			resultBackground = makeResultBackground()
			resultBackground.Parent = screenGui
			makeResultBar(link).Parent = resultBackground
			return screenGui
		end

		if not melonFailed then
			showResultScreen("r.sunc.su/" .. shiftDecode(resultHandle.CollisionGroup, 5))
		end
		resultHandle.CollisionGroup = "Default"

		--------------------------------------------------------------------------------------
		-- Final printout (literals are split as in the original)
		--------------------------------------------------------------------------------------
		local successRate = environment.math.floor(passedCount / totalCount * 100)
		environment.task.wait(0.05)
		checkpointLogger("\n")
		if failureFlag[1] then
			checkpointLogger(
				"\240\159\152\142 Passed the test with "
					.. environment.tostring(successRate)
					.. "%"
					.. environment.utf8.char(8204)
					.. " succ"
					.. "e"
					.. "ss rate"
					.. " "
					.. environment.utf8.char(8204)
					.. "("
					.. passedCount
					.. " "
					.. environment.utf8.char(8204)
					.. "out "
					.. environment.utf8.char(8204)
					.. "of "
					.. environment.utf8.char(8204)
					.. totalCount
					.. decodeString("wg==", "6w==")
			)
			spawnFakeConsoleSuccess()
		else
			checkpointLogger(
				"\240\159\152\142 Passed the test with "
					.. environment.tostring(successRate)
					.. "%"
					.. environment.utf8.char(8204)
					.. " succ"
					.. "e"
					.. decodeString("zG991J6qJErf", "vxxdpv/eQWr3")
					.. passedCount
					.. " "
					.. environment.utf8.char(8204)
					.. "out "
					.. environment.utf8.char(8204)
					.. "of "
					.. environment.utf8.char(8204)
					.. totalCount
					.. decodeString("wg==", "6w==")
			)
		end
		checkpointLogger(
			environment.utf8.char(10060),
			"Total tests failed: " .. environment.utf8.char(8204) .. totalCount - passedCount
		)
		checkpointLogger("\240\159\152\143 This test was made by senS")
		checkpointLogger(
			"\240\159\141\137 corporate sponsorship \208\187\208\190\208\187 \240\159\152\130\240\159\152\130\n"
		)
		local elapsedText = environment.tostring(elapsed)
		if elapsedText:sub(1, 1) == "-" then
			elapsedText = elapsedText:sub(2)
		end
		local elapsedSeconds = environment.tonumber(elapsedText)
		environment.truncateToOneDecimal = floorToHundredths
		checkpointLogger("Finished the test in " .. environment.truncateToOneDecimal(elapsedSeconds) .. " seconds")
		checkpointLogger("\n")
		checkpointLogger("Kawaii-sUNC, VERSION 2.1.5 " .. versionTag)
		if environment.game:GetService("RunService"):IsStudio() then
			checkpointLogger("Contributors: Kaede, vvultt, GRH, 0_void, Dottik, citam.")
			environment.getgenv()["000PPP000"] = false
			environment.getgenv()["000PPP000"] = nil
			environment.getgenv()["000PPP000"] = false
			environment.getgenv()["000PPP000"] = nil
			return
		end
		checkpointLogger(
			"Contribu"
				.. environment.utf8.char(8204)
				.. "tors: Kaede, Richy, Lovre, vvultt, GRH,"
				.. environment.utf8.char(8204)
				.. " 0_void, Dottik, Pixeluted, citam."
		)
		logConnection:Disconnect()
		environment.getgenv()["000PPP000"] = false
		environment.getgenv()["000PPP000"] = nil
		environment.getgenv()["000PPP000"] = false
		environment.getgenv()["000PPP000"] = nil
		return
	end
	-- Not in the dedicated place: teleport there.
	warningLogger(
		"[1] - Please execute sUNC in the dedicated place. You can find it on our Discord server [discord.gg/kawaiilua]"
	)
	if options.printcheckpoints then
		warningLogger('just make it warn("diofdjaosijdsfajia"). Credits: ETq')
	end
	environment.task.wait(0.3)
	local teleportService = environment.game:GetService("TeleportService")
	teleportService:Teleport(133609342474444, environment.game.Players.LocalPlayer)
end
