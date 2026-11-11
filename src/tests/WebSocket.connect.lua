local reportResult, failureMap, failureFlag, decodeSecret, checkpointLogger, options, _packResults, _unpackResults, environment =
	...

local function fail(message)
	reportResult(false, "WebSocket.connect", message)
	if failureMap["WebSocket.connect"] then
		failureFlag[1] = true
	end
end

return function()
	if not environment.WebSocket then
		fail("WebSocket is nil")
	end

	-- Connecting to an invalid server must fail
	local invalidServerChecked = false
	environment.task.spawn(function()
		local connected = environment.pcall(function()
			environment.WebSocket.connect("ws://")
		end)
		if not connected then
			connected = environment.pcall(function()
				environment.WebSocket.connect("wss://")
			end)
		end
		if connected then
			fail("Allowed connection to an invalid server - 'ws://' ")
		end
		invalidServerChecked = true
	end)
	repeat
		environment.task.wait()
	until invalidServerChecked

	local webSocket
	local connected, connectError = environment.pcall(function()
		webSocket = environment.WebSocket.connect(
			decodeSecret("yF9CD19jyvNLSh+MqO/jIUI6Vmt0huQW", "vywxNXBMuYYlKWj/hoGWTCdWOQVa5Yt7")
		)
	end)
	if not connected then
		fail(
			"Encountered an error while trying to connect to the websocket: "
				.. connectError
				.. " "
				.. environment.tostring(webSocket)
		)
	end

	local connectTicks = 275
	repeat
		environment.task.wait()
		connectTicks -= 1
	until connectTicks <= 0 or webSocket ~= nil
	if connectTicks <= 0 and webSocket == nil then
		fail("Timed out while trying to connect to the websocket")
	end

	if environment.type(webSocket) ~= "table" and environment.type(webSocket) ~= "userdata" then
		fail("Didn't return a valid field value[1]")
	end
	environment.type(webSocket) -- result unused, as in the original test
	if environment.type(webSocket.Send) ~= "function" then
		fail("Didn't return the needed value[1]")
	end
	if environment.type(webSocket.Close) ~= "function" then
		fail("Didn't return the needed value[2]")
	end
	if environment.type(webSocket.OnMessage) ~= "table" and environment.type(webSocket.OnMessage) ~= "userdata" then
		fail("Didn't return a valid field value[2]")
	end
	if environment.type(webSocket.OnClose) ~= "table" and environment.type(webSocket.OnClose) ~= "userdata" then
		fail("Didn't return a valid field value[3]")
	end

	-- Handshake with the test server: it greets us (stage 0), asks for one of `phrases` by index
	-- (stage 1) and finally confirms (stage 2), after which the socket is closed.
	local CONFIRMATION = "\208\158\208\186\208\181\208\185 \209\133\208\190\209\128\208\190\209\136\208\190"
	local stage = 0
	local receivedConfirmation = false
	local messageTicks = 85
	local phrases = {
		"\226\152\132\239\184\143\240\157\148\163\240\157\150\145\240\157\147\178\240\157\147\171\240\157\146\131\240\144\141\136\206\181\207\129\225\184\159l\240\157\148\158B\201\131\240\157\148\162r\226\157\164\239\184\143w\240\144\141\135\240\159\144\184\219\158\206\191\206\178\206\178l\206\158~g\224\175\144o\240\157\147\171ble",
		"\226\152\128\239\184\143\194\167n\196\177\195\167K\240\159\140\128e\240\157\144\145\196\145\206\180\240\159\146\161o\224\185\145\225\146\170\240\157\144\158#f\240\159\164\170\225\143\158u\239\191\165\226\131\157f\240\159\140\128F\240\159\142\135\226\147\148r\226\130\166u\240\157\147\137t\226\149\160\226\130\172r",
		"\201\139\240\157\147\1381\240\159\141\132x\226\159\176\226\132\180\226\134\175ic\226\157\134q\226\153\154uan\226\137\136\240\159\141\163d\226\148\151a\194\174yque\226\168\143\226\167\178agm\240\159\128\132ire",
		"Blath\206\181r\200\191\226\153\146\240\157\147\128i\207\132e\195\180\240\159\156\142wh\206\177\198\172c\194\165\201\166@#\226\130\165a\225\136\173al\226\132\184l\225\187\139\240\157\148\177\226\156\136\239\184\143",
		"\227\130\180\227\131\131\240\157\148\185bl\240\157\147\174\226\138\157g1\240\159\146\148\200\179\226\167\184gou\240\159\145\129k\226\128\176f\196\188\194\1612b\226\130\180\240\157\155\155\226\155\167\226\138\157\226\149\172i\209\152\209\134\240\157\144\160\206\178et",
		"\202\156u1l0@\206\178a\226\132\147oo\226\136\172hoos+\226\130\164\195\139\226\167\153n\226\132\162y\234\156\157she\240\157\148\145an~\196\177\226\155\167g\226\147\144ns",
		"bA\226\157\141mB\240\159\156\181o\226\167\141zle==\198\146an\206\148an\202\155le<\226\131\160wHi\226\156\176r\226\136\143i\226\135\148gig",
		"\225\131\154o\226\177\163\240\159\154\128l0#g@9gin\240\157\149\178\240\157\150\140$in\240\157\146\169|c\240\157\150\148mP\240\159\150\164oo\240\159\167\160\226\132\156y",
		"\236\188\144rf\240\159\146\165uf\226\130\186le\226\129\147flum@x\226\138\1573d$\206\187abo\195\182z\226\155\180led",
		"\226\140\155\225\155\151\240\157\148\176\240\159\143\180d@ddle\240\159\142\137f\226\132\181i\226\158\148bb\194\174\226\128\160\240\159\142\161fl\226\155\169a$\240\159\167\161bber",
	}
	webSocket.OnMessage:Connect(function(message)
		if
			stage == 0
			and environment.string.find(
				message,
				"\224\164\168\240\159\151\191\224\164\174\224\164\184\224\165\141\224\164\164\224\165\135 \224\164\164\224\165\169\224\164\176\224\165\128 \224\164\166\194\161h\240\159\152\130\240\159\152\130\240\159\152\130"
			)
			and environment.string.find(
				message,
				"y0u w4nt t0 3xpr3ss s0m3th\194\161ng s\194\161m\194\161l4r \194\161n H\194\161nd\194\161"
			)
		then
			stage = 1
			return
		end

		if stage == 1 then
			local index = environment.tonumber(message)
			if not (index and index >= 1 and index <= #phrases and phrases[index]) then
				return
			end
			webSocket:Send(phrases[index])
			stage = 2
			return
		end

		if stage ~= 2 then
			return
		end
		if message == CONFIRMATION then
			receivedConfirmation = true
			webSocket:Close()
			return
		end
		checkpointLogger("ok so then wtf did I get? idk probably", message)
		if message ~= CONFIRMATION then
			if not options.printcheckpoints then
				return
			end
			checkpointLogger("uh what:", message)
			return
		end
		-- Unreachable (both outcomes of the comparison above return); kept from the original test.
		if
			message == "\228\189\160\230\152\175\228\184\170\231\172\168\232\155\139"
			or message
				== "\227\129\149\227\130\136\227\129\134\227\129\170\227\130\137\227\128\129\227\129\138\227\129\170\227\130\137\233\173\148\230\179\149\228\189\191\227\129\132"
		then
			webSocket:Close()
		end
	end)

	local closeTicks = 55
	local closed = false
	webSocket.OnClose:Connect(function()
		closed = true
	end)
	webSocket:Send("Helloush \208\191\209\128\208\184\208\178\208\181\209\130")

	repeat
		environment.task.wait(0.012)
		messageTicks -= 1
	until receivedConfirmation or messageTicks <= 0
	if not receivedConfirmation then
		fail("Failed to receive a wanted message from the server")
	end

	repeat
		environment.task.wait(0.1)
		closeTicks -= 1
	until closed or closeTicks <= 0
	if not closed then
		fail("Failed to retrieve a closed signal")
	end
end
