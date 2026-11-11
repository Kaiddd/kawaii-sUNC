--[[
	sUNC runtime: start-up integrity checks, debug options and the program launch.

	main.lua calls this chunk with the shared `metadata` object (which carries
	`__programFactory` and `__testFactories`). The runtime

	  1. traps `print`/`warn` while the integrity checks run,
	  2. plants decoy metatables whose metamethods would hang an environment logger,
	  3. checks that a probe function's reported line matches the line in its error
	     message (detects re-hosted or hooked code), then locks down stand-ins for the
	     original interpreter's tables, freezing forever if anything looks tampered,
	  4. restores `print`/`warn`, loads `getgenv().sUNCDebug` options, and
	  5. runs the program inside `pcall`, warning if it throws.
]]

local branchState = {}
local selectArguments = select

-- Pack a call's results, preserving nils and the result count (passed to program and tests).
local function packResults(...)
	return { n = selectArguments("#", ...), ... }
end

local unpackResults = unpack or table.unpack

local metadata = ...

-- Helpers from the original (non-virtualized) loader; program.lua and the tests call them as
-- `hostFactories[i](context)()`. Keep their closure nesting (debug.getstack/setstack use fixed
-- stack levels) and the constants of [4]/[5] (filtergc searches the GC for those constants).
local hostFactories = {
	-- [1] cloneref: stores a clone of workspace.Somethingiok in context[1][1].
	function(context)
		return function()
			context[1][1] = cloneref(workspace:FindFirstChild("Somethingiok"))
		end
	end,

	-- [2] debug.getstack: hooks `boyyywhattheflop` and reads stack slot 22 of its caller.
	-- context = { result, options, checkpointLogger }
	function(context)
		return function()
			local target
			for _, value in pairs(getgc()) do
				if type(value) == "function" and debug.info(value, "n") == "boyyywhattheflop" then
					target = value
				end
			end
			local readOk
			local readError
			local original
			original = hookfunction(target, function()
				local ok, err = pcall(function()
					return debug.getstack(4)[22]
				end)
				readOk = ok
				readError = err
				if readOk then
					local value = debug.getstack(2)[22]
					if value ~= nil then
						value = debug.getstack(2)[22]
						if value == "floops the flip out on floopy doopy" then
							context[1][1] = true
						else
							if context[2].printcheckpoints then
								context[3]("[GETSTACK] Index not in stack[2]", debug.getstack(2)[22])
							end
							context[3]("Failed. Attempting to unhook")
							hookfunction(target, original)
						end
					else
						if context[2].printcheckpoints then
							context[3]("[GETSTACK] Index not in stack[3]")
						end
						context[3]("Failed. Attempting to unhook")
						hookfunction(target, original)
					end
				else
					if context[2].printcheckpoints then
						context[3]("[GETSTACK] Index errored:", readError)
					end
					context[3]("Attempting to unhook")
					hookfunction(target, original)
				end
			end)
			task.delay(5, function()
				hookfunction(target, original)
			end)
		end
	end,

	-- [3] debug.setstack: hooks `beeeb`, writes stack slot 22 of its caller and waits for the
	-- foreign thread to apply it to a CollisionGroup.
	-- context = { brokenApis, reportResult, failureMap, failureFlag, decodeString, options, checkpointLogger }
	function(context)
		return function()
			if context[1].getgc or not getgc then
				context[2](false, "debug.setstack", "Can't test due to 'getgc' not working reliably")
				if context[3]["debug.setstack"] then
					context[4][1] = true
				end
			end
			if context[1].hookfunction or not hookfunction then
				context[2](false, "debug.setstack", "Can't test due to 'hookfunction' not working reliably")
				if context[3]["debug.setstack"] then
					context[4][1] = true
				end
			end
			if context[1].getstack or not debug.getstack then
				context[2](false, "debug.setstack", "Can't test due to 'debug.getstack' not working reliably")
				if context[3]["debug.setstack"] then
					context[4][1] = true
				end
			end
			local decode = context[5]
			local foreignPart =
				game[decode("To1gJcwqqySd", "OeISTr9aykf4")][decode("Yr4QuqSwlGJg", "JMx128/J1g0Y")][decode(
					"Rg==",
					"Jw=="
				)][decode(
					"5SVE9mt/SC+16KbiEzyP+xOiJRUZSzs9LSHBX3ddMNWRyVvIEt89M6KWcmwV",
					"plAwk0s9JE7Wg4ahek7sl3aCYnl4OEhYXgHpGR4pQ/XarDanfLAde8f3Fh88"
				)][decode("1ONUKwRb", "nII6T2g+")]
			local target = ""
			for _, value in pairs(getgc()) do
				if type(value) == "function" and debug.info(value, "n") == "beeeb" then
					target = value
				end
			end
			local handle = workspace.FreakyBox.a["Cute Black Circle Glasses (Fits Kemono Heads)"].Handle
			local original
			original = hookfunction(target, function()
				if not pcall(function()
					debug.setstack(4, 22, "Fully loaded jag")
				end) then
					if context[6].printcheckpoints then
						context[7]("[SETSTACK] Failed to set to 4, 22")
					end
					context[7]("Attempting to unhook")
					hookfunction(target, original)
				end
			end)
			local remaining = 150
			repeat
				task.wait()
				remaining -= 1
			until handle.CollisionGroup == utf8.char(5) .. "BOY_DONT_PLAY_WITH_ME" or remaining <= 0
			hookfunction(target, original)
			if foreignPart.CollisionGroup ~= utf8.char(5) .. "BOY_DONT_PLAY_WITH_ME" then
				context[2](false, "debug.setstack", "Was not able to set a stack value in a foreign thread")
				if context[3]["debug.setstack"] then
					context[4][1] = true
				end
			end
			foreignPart.CollisionGroup = "Default"
		end
	end,

	-- [4] filtergc: finds the function holding the constants -0 and "3".
	-- context = { reportResult, failureMap, failureFlag }
	function(context)
		return function()
			local found = filtergc("function", { Constants = { -0.0, "3" } })
			if #found == 0 or #found > 1 then
				context[1](false, "filtergc", "[FUNC] Failed to retrieve a function with the constant -0")
				if context[2]["filtergc"] then
					context[3][1] = true
				end
			end
			if select(2, found[1]()) ~= "3" then
				context[1](false, "filtergc", "[FUNC] Failed to retrieve a function with the constant -0.")
				if context[2]["filtergc"] then
					context[3][1] = true
				end
			end
		end
	end,

	-- [5] filtergc: looks up functions holding a NaN constant.
	function(context)
		return function()
			context[1][1] = filtergc("function", { Constants = { 0 / 0 } })
		end
	end,
}

local environment = getfenv()

-- Last index for the unpack probe (2^31 - 1).
local UNPACK_LAST_INDEX = 2147483647

--[[
	The probe run by every decoy: `pcall(unpack, {}, firstIndex, 2^31 - 1)`. Genuine unpack
	fails at once ("too many results to unpack"); a Lua re-implementation inside a sandbox or
	environment logger spins for 2^31 iterations. Globals are looked up by name on every call
	because some decoys switch to a random name after their first use.
]]
local function runUnpackProbe(pcallName, tableLibraryName, firstIndex)
	local pcallFn = environment[pcallName]
	local unpackFn = environment.unpack
	if unpackFn then
		pcallFn(unpackFn, {}, firstIndex, UNPACK_LAST_INDEX)
	else
		pcallFn(environment[tableLibraryName].unpack, {}, firstIndex, UNPACK_LAST_INDEX)
	end
end

-- A decoy metamethod that only runs the unpack probe (a new closure on every call).
local function newPlainDecoy()
	return function(_self)
		runUnpackProbe("pcall", "table", 0)
	end
end

local function newDecoyMetatable(lockName, tostringDecoy, concatDecoy, iterDecoy)
	local metatable = {}
	metatable.__metatable = lockName
	metatable.__tostring = tostringDecoy
	metatable.__concat = concatDecoy
	metatable.__iter = iterDecoy
	return metatable
end

local function main()
	local tampered = false

	------------------------------------------------------------------------------------------
	-- 1. Trap print/warn: any call before they are restored marks the run as tampered.
	------------------------------------------------------------------------------------------
	local scriptEnvironment = environment.getfenv
	if scriptEnvironment then
		scriptEnvironment = environment.getfenv()
	end
	if not scriptEnvironment then
		scriptEnvironment = environment._ENV
	end
	local originalPrint = environment.print
	local originalWarn = environment.warn
	local printHooked = false
	local warnHooked = false

	-- After its first call the trap looks unpack up under a random name (so later calls end
	-- up in pcall(nil, ...)). It always finishes by raising "attempt to index nil with number".
	local trapUnpackName = "unpack"
	local function printWarnTrap()
		tampered = true
		local pcallFn = environment.pcall
		local unpackFn = environment[trapUnpackName]
		if not unpackFn then
			unpackFn = environment.table[trapUnpackName]
		end
		pcallFn(unpackFn, {}, 0, UNPACK_LAST_INDEX)
		trapUnpackName = "fdbc2464737b416fad095f65c427cc24"
		return (nil)[1]
	end

	if environment.type(scriptEnvironment) == "table" then
		if environment.type(originalPrint) == "function" then
			printHooked = true
			scriptEnvironment.print = function(_message)
				printWarnTrap()
			end
		end
		if environment.type(originalWarn) == "function" then
			warnHooked = true
			scriptEnvironment.warn = function(_message)
				printWarnTrap()
			end
		end
	end

	-- The original VM restores both functions; an earlier lift wrongly stored a holder table
	-- in `warn` (verified against the original: `warn` must be a function afterwards).
	local function restorePrintAndWarn()
		if environment.type(scriptEnvironment) ~= "table" then
			return
		end
		if printHooked then
			scriptEnvironment.print = originalPrint
		end
		if warnHooked then
			scriptEnvironment.warn = originalWarn
		end
	end

	local warningLogger = originalWarn
	local checkpointLogger = originalPrint

	------------------------------------------------------------------------------------------
	-- 2. Decoy userdata whose metamethods only run the unpack probe.
	------------------------------------------------------------------------------------------
	if environment.newproxy then
		local proxy = environment.newproxy(true)
		local proxyMetatable = environment.getmetatable(proxy)
		proxyMetatable.__tostring = newPlainDecoy()
		local concatTableName = "table"
		proxyMetatable.__concat = function(_self)
			runUnpackProbe("pcall", concatTableName, 0)
			concatTableName = "8ac30bb314e24b9fb5b37a85b4cbe575"
		end
		proxyMetatable.__call = newPlainDecoy()
	end

	------------------------------------------------------------------------------------------
	-- 3. Integrity checks.
	------------------------------------------------------------------------------------------
	-- Line probe: debug.info(probe, "l") must equal the line number in the probe's own error
	-- message, so the definition and the failing index MUST stay on one source line.
	-- stylua: ignore
	local probe = function(_) return (nil)[1] end

	-- `debug` is read again before taking `.info`, as in the original.
	local function debugInfoAvailable()
		local available = environment.debug
		if available then
			available = environment.debug.info
		end
		return available
	end

	local function queryProbe(what, expectedType)
		if not debugInfoAvailable() then
			return nil
		end
		local ok, value = environment.pcall(environment.debug.info, probe, what)
		if ok and environment.type(value) == expectedType then
			return value
		end
		return nil
	end

	local function checkProbe()
		local definedLine = queryProbe("l", "number")
		local definedSource = queryProbe("s", "string")

		local errorLine
		local probeSucceeded = environment.xpcall(probe, function(message, _)
			errorLine = environment.tonumber(environment.string.match(environment.tostring(message), ":(%d+):"))
			return message
		end)
		if probeSucceeded then
			tampered = true
		end
		if definedSource == "[C]" then
			tampered = true
		end
		if definedLine ~= nil and errorLine ~= nil and errorLine ~= definedLine then
			tampered = true
		end
	end

	-- The virtualized original also locked its own register file, the 399 instruction rows of
	-- its entry prototype and that prototype's constant pool behind decoy metatables. Those
	-- tables no longer exist; these stand-ins keep the same checks and setmetatable calls.
	local interpreterRegisters = {}
	local interpreterInstructions = {}
	for index = 1, 399 do
		interpreterInstructions[index] = {}
	end
	local interpreterConstants = {}

	-- Decoy state (the original kept it in its constant pools). After a pass of the freeze loop
	-- below, `tableTypeName` no longer matches type(), which disables the setmetatable calls.
	local tableTypeName = "table"
	local registersTostringFirst = 0
	local instructionsConcatPcall = "pcall"
	local instructionsIterFirst = 0

	local function lockInterpreterTables()
		local registersMetatable = newDecoyMetatable("unozbpxbhy", function(_self)
			runUnpackProbe("pcall", "table", registersTostringFirst)
			registersTostringFirst = "171860953e304d2f9fb9808fc8205582"
		end, newPlainDecoy(), newPlainDecoy())
		local instructionMetatable = newDecoyMetatable("eilewdwfcx", newPlainDecoy(), function(_self)
			runUnpackProbe(instructionsConcatPcall, "table", 0)
			instructionsConcatPcall = "db3ad5e33ef84f32ae12ae0a966675f7"
		end, function(_self)
			runUnpackProbe("pcall", "table", instructionsIterFirst)
			instructionsIterFirst = "41e8595cd7674b3b87197d390136dc5c"
		end)
		local constantsMetatable = newDecoyMetatable("lwhfoefeyl", newPlainDecoy(), newPlainDecoy(), newPlainDecoy())

		if environment.type(interpreterRegisters) == tableTypeName then
			environment.pcall(environment.setmetatable, interpreterRegisters, registersMetatable)
		end
		if environment.type(interpreterInstructions) == tableTypeName then
			local ok = environment.pcall(function(_)
				for index = 1, #interpreterInstructions do
					local row = interpreterInstructions[index]
					if environment.type(row) ~= "table" then
						tampered = true
						return
					end
					environment.setmetatable(row, instructionMetatable)
				end
			end)
			if not ok then
				tampered = true
			end
		end
		if environment.type(interpreterConstants) == tableTypeName then
			environment.pcall(environment.setmetatable, interpreterConstants, constantsMetatable)
		end
	end

	-- Once tampering is detected this loop never exits: each pass runs the unpack probe (which
	-- errors out of the runtime when `unpack` is missing) and re-creates the decoys. The probe
	-- function is only checked on the first pass.
	local checkProbeThisPass = environment.type(probe) == "function"
	while true do
		if checkProbeThisPass then
			checkProbe()
		end
		lockInterpreterTables()
		if not tampered then
			break
		end
		runUnpackProbe("pcall", tableTypeName, 0)
		tableTypeName = "5bb2f74240724d6c987e99d288d0cb52"
		checkProbeThisPass = false
	end

	------------------------------------------------------------------------------------------
	-- 4. Restore print/warn and load the debug options.
	------------------------------------------------------------------------------------------
	restorePrintAndWarn()

	local defaultOptions = {}
	defaultOptions.printcheckpoints = false
	defaultOptions.delaybetweentests = 0
	defaultOptions.printtesttimetaken = false
	defaultOptions.extradebugprints = false

	-- Copy of `userOptions` in which every entry whose typeof differs from the default is reset.
	local function mergeDefaults(userOptions, defaults, _)
		local merged = environment.table.clone(userOptions)
		for key, value in environment.pairs(defaults) do
			if environment.typeof(merged[key]) ~= environment.typeof(value) then
				merged[key] = value
			end
		end
		return merged
	end

	local function loadOptions(_)
		if environment.getgenv().sUNCDebug then
			local merged = mergeDefaults(environment.getgenv().sUNCDebug, defaultOptions)
			return environment.table.freeze(merged)
		end
		warningLogger(
			"Couldn't find the debug table, so it was set to default. To get the full script, join our Discord server: [discord.gg/yGNzDrvbF5] :)"
		)
		local genv = environment.getgenv()
		genv.sUNCDebug = environment.table.clone(defaultOptions)
		return environment.table.clone(defaultOptions)
	end

	local options = loadOptions()

	------------------------------------------------------------------------------------------
	-- 5. Run the program with its fixed positional context.
	------------------------------------------------------------------------------------------
	local protectedCall = environment.pcall
	local function runProgram(...)
		return metadata.__programFactory(
			warningLogger,
			checkpointLogger,
			options,
			defaultOptions,
			protectedCall,
			branchState,
			packResults,
			unpackResults,
			metadata,
			hostFactories,
			environment,
			selectArguments
		)(...)
	end
	local ok, programError = protectedCall(runProgram)
	if not ok then
		warningLogger("sUNC threw an error. Please rejoin the place and execute again, Error:")
		warningLogger(programError)
		return
	end
end

return main()
