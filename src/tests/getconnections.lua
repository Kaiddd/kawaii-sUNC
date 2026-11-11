local reportResult, failureMap, failureFlag, options, checkpointLogger, warningLogger, random, _packResults, _unpackResults, environment =
	...

local function fail(message)
	reportResult(false, "getconnections", message)
	if failureMap.getconnections then
		failureFlag[1] = true
	end
end

local function checkpoint(name)
	if options.printcheckpoints then
		checkpointLogger(name)
	end
end

return function()
	if not environment.hookmetamethod then
		fail("hookmetamethod is needed in order to test")
		return
	end

	-- Connection object shape
	local bindable = environment.Instance.new("BindableEvent")
	bindable.Event:Connect(function(_) end)
	local bindableConnection = environment.getconnections(bindable.Event)[1]
	for fieldName, expectedType in
		environment.pairs({
			Enabled = "boolean",
			ForeignState = "boolean",
			LuaConnection = "boolean",
			Function = "function",
			Thread = "thread",
			Fire = "function",
			Defer = "function",
			Disconnect = "function",
			Disable = "function",
			Enable = "function",
		})
	do
		if bindableConnection[fieldName] == nil then
			reportResult(false, "getconnections", "Did not return a table with a '" .. fieldName .. "' field")
		end
		if environment.type(bindableConnection[fieldName]) ~= expectedType then
			reportResult(
				false,
				"getconnections",
				"Did not return a table with "
					.. fieldName
					.. " as a "
					.. expectedType
					.. " (got "
					.. environment.type(bindableConnection[fieldName])
					.. ")"
			)
		end
	end

	local childAddedFired = false

	environment.pcall(function()
		if #environment.getconnections(environment.Instance.new("Folder")) > 0 then
			fail("REAL connections \240\159\164\175\240\159\152\178[1]")
		end
	end)

	local folder = environment.Instance.new("Folder")
	local function connectChildAdded()
		folder.ChildAdded:Connect(function(_)
			childAddedFired = true
		end)
	end
	connectChildAdded()

	local connections = environment.getconnections(folder.ChildAdded)
	-- Repeated field reads on the returned list (no effect on a plain table).
	for _ = 1, 56 do
		local _ = connections.ForeignState
		_ = connections.Enabled
		_ = connections.LuaConnection
		_ = connections.ForeignState
	end
	if #connections ~= 1 then
		fail("REAL connections \240\159\164\175\240\159\152\178[2]")
	end
	if connections.ForeignState == true then
		fail("Those who return true: \240\159\146\128")
	end

	-- Fire / Disable / Enable
	connections[1]:Fire()
	if not childAddedFired then
		fail("Failed to trigger the :Fire signal")
	end
	checkpoint("getconnections-1")
	environment.task.wait()
	childAddedFired = false
	if not connections[1].Enabled then
		fail("Returned false for an enabled connection on 'Enabled' field")
	end
	connections[1]:Disable()
	environment.Instance.new("Folder", folder)
	if childAddedFired then
		fail("Triggered the connection after disabling")
	end
	if connections[1].Enabled then
		fail("Returned true for a disabled connection on 'Enabled' field")
	end
	childAddedFired = false
	checkpoint("getconnections-2")
	environment.task.wait()
	connections[1]:Enable()
	environment.Instance.new("Folder", folder)
	environment.task.wait()
	if not childAddedFired then
		fail("Failed to trigger the connection after re-enabling the connection")
	end
	childAddedFired = false
	connectChildAdded()
	checkpoint("getconnections-3")
	environment.task.wait()

	-- Foreign thread: connect from inside a __namecall hook, which runs on another thread.
	local remainingTicks = 25
	local originalNamecall
	local foreignThread
	originalNamecall = environment.hookmetamethod(environment.game, "__namecall", function(...)
		foreignThread = environment.coroutine.running()
		-- Plain index + call here, not a namecall, inside the __namecall hook.
		local childAdded = folder.ChildAdded
		childAdded.Connect(childAdded, function(_)
			childAddedFired = true
		end)
		return originalNamecall(...)
	end)
	repeat
		environment.task.wait()
		remainingTicks -= 1
	until remainingTicks <= 0 or foreignThread ~= nil
	environment.hookmetamethod(environment.game, "__namecall", originalNamecall)
	if foreignThread == nil then
		fail("Failed to get a foreign thread")
	end
	if options.printcheckpoints then
		local foreignThreadText =
			environment.string.gsub("thread:" .. environment.tostring(foreignThread), "thread:", "")
		local mainThreadText =
			environment.string.gsub("thread:" .. environment.tostring(environment.coroutine.running()), "thread:", "")
		checkpointLogger(
			environment.string.format(
				"[DEBUG] Foreign thread: %s; Main thread: %s,\n timeout: %s",
				environment.tostring(foreignThreadText),
				environment.tostring(mainThreadText),
				environment.tostring(remainingTicks)
			)
		)
	end
	environment.task.wait()
	if environment.getconnections(folder.ChildAdded)[1].Thread ~= foreignThread then
		fail("Invalid thread fetched from the connection[1]")
	end

	-- Calling the connection's Function directly
	childAddedFired = false
	connectChildAdded()
	checkpoint("getconnections-4")
	environment.task.wait(options.delaybetweentests)
	environment.getconnections(folder.ChildAdded)[1].Function()
	if not childAddedFired then
		fail("Failed to trigger the connection by calling its function")
	end

	-- C connection
	checkpoint("getconnections-5")
	environment.task.wait(options.delaybetweentests)
	local idledConnection = environment.getconnections(environment.game.Players.LocalPlayer.Idled)[1]
	if not idledConnection then
		fail("Failed to find a C-Connection (Idled)")
	end
	checkpoint("getconnections-6")
	environment.task.wait(options.delaybetweentests)
	if idledConnection.LuaConnection == true then
		fail("Returned true for a non-LuaConnection[1]")
	end
	if idledConnection.Function then
		fail("Returned a function for a non-LuaConnection[1]")
	end
	if idledConnection.Thread then
		fail("Returned a thread for a non-LuaConnection[1]")
	end

	connectChildAdded()
	environment.task.wait()
	checkpoint("getconnections-7")
	if not environment.getconnections(folder.ChildAdded)[1].LuaConnection then
		fail("Returned false for a valid LuaConnection")
	end
	if not environment.getconnections(environment.game.Players.LocalPlayer.Backpack.ChildAdded)[1].ForeignState then
		fail("Returned false for a ForeignState")
	end
	checkpoint("getconnections-8")

	-- Disabling a game script's Touched connection
	local touchPart = environment.workspace["I AM SUNC_0"].SurfaceGui.Part
	local originalCFrame = touchPart.CFrame
	local touchConnection = environment.getconnections(touchPart.Touched)[1]
	if touchConnection.LuaConnection == false then
		fail("Returned false for a LuaConnection[2]")
	end
	if not touchConnection.Function then
		fail("Did not return a function for a LuaConnection[2]")
	end
	if not touchConnection.Thread then
		fail("Did not return a thread for a LuaConnection[2]")
	end
	local videos = environment.game.ReplicatedStorage.videos
	touchConnection:Disable()
	local touchedFired = false
	local touchListener = touchPart.Touched:Connect(function(_)
		touchedFired = true
	end)
	local remainingTouchTicks = 85
	repeat
		environment.task.wait()
		remainingTouchTicks -= 1
		touchPart.CFrame = environment.game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			* environment.CFrame.new(0, 2, 0.5)
	until touchedFired == true or remainingTouchTicks <= 0
	if not touchedFired then
		warningLogger(false, "getconnections", "Timed out waiting for a connection callback")
		if failureMap.getconnections then
			failureFlag[1] = true
		end
	end
	environment.task.wait()
	touchPart.CFrame = originalCFrame
	environment.task.wait()
	-- The game script clears videos.Archivable when its (disabled) connection runs.
	if not videos.Archivable then
		fail("Connection was triggered after being disabled")
	end
	videos.Archivable = true
	touchConnection:Enable()
	touchListener:Disconnect()
	checkpoint("getconnections-8.5")
	environment.task.wait()

	-- Re-enabled connection must fire again
	local reenabledPart = environment.workspace["I AM SUNC_0"].SurfaceGui.Part
	local reenabledOriginalCFrame = reenabledPart.CFrame
	local reenabledConnection = environment.getconnections(reenabledPart.Touched)[1]
	local reenabledVideos = environment.game.ReplicatedStorage.videos
	reenabledConnection:Enable()
	local remainingReenabledTicks = 85
	repeat
		environment.task.wait()
		remainingReenabledTicks -= 1
		reenabledPart.CFrame = environment.game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			* environment.CFrame.new(0, 2, 0.5)
	until reenabledVideos.Archivable == false or remainingReenabledTicks <= 0
	environment.task.wait()
	reenabledPart.CFrame = reenabledOriginalCFrame
	environment.task.wait()
	if reenabledVideos.Archivable then
		warningLogger(false, "getconnections", "Failed to enable back a connection after disabling")
		if failureMap.getconnections then
			failureFlag[1] = true
		end
	end
	reenabledVideos.Archivable = true
	environment.task.wait()
	reenabledConnection:Enable()
	if options.printcheckpoints then
		checkpointLogger("getconnections-9")
		if failureMap.getconnections then
			failureFlag[1] = true
		end
	end
	environment.task.wait()

	-- Fire arguments and Function of a connection made by this thread
	local argumentFolder = environment.Instance.new("Folder")
	argumentFolder.ChildAdded:Connect(function(argument, _)
		if argument ~= "\1HELL\8O\2" then
			fail("First argument did not match when triggering :Fire")
		end
	end)
	environment.getconnections(argumentFolder.ChildAdded)[1]:Fire("\1HELL\8O\2")
	environment.game.Players.LocalPlayer.OnTeleport:Connect(checkpointLogger)
	if environment.getconnections(environment.game.Players.LocalPlayer.OnTeleport)[1].Function ~= checkpointLogger then
		fail("Failed to retrieve a function from a connection made by the current thread")
	end
	environment.task.wait()

	-- :Once connection made from a spawned thread
	local onceFolder = environment.Instance.new("Folder")
	local onceToken = random()
	local onceToggled = false
	local onceThread = environment.task.spawn(function()
		onceFolder.ChildAdded:Once(function(argument, _)
			if argument == onceToken then
				onceToggled = not onceToggled
			end
		end)
	end)
	environment.task.wait()
	if environment.getconnections(onceFolder.ChildAdded)[1].Thread ~= onceThread then
		fail("Invalid thread fetched from the connection[2]")
	end
	environment.getconnections(onceFolder.ChildAdded)[1]:Fire(onceToken)
	environment.task.wait()
	if onceToggled ~= true then
		fail("Failed to fire a :Once connection[1]")
	end
	if #environment.getconnections(onceFolder.ChildAdded) > 0 then
		fail("Connection shouldn't exist after firing once")
	end
	environment.pcall(function()
		environment.getconnections(onceFolder.ChildAdded)[1]:Fire(onceToken)
	end)
	environment.task.wait()

	-- :Once connection made from this thread
	local secondOnceFolder = environment.Instance.new("Folder")
	local secondOnceToken = random()
	local secondOnceToggled = false
	secondOnceFolder.ChildAdded:Once(function(argument, _)
		if argument == secondOnceToken then
			secondOnceToggled = not secondOnceToggled
		end
	end)
	local onceConnection = environment.getconnections(secondOnceFolder.ChildAdded)[1]
	local function readOnceConnectionFields()
		local connection = environment.getconnections(secondOnceFolder.ChildAdded)[1]
		local _ = connection.ForeignState
		_ = connection.Enabled
		_ = connection.LuaConnection
		_ = connection.ForeignState
	end
	for _ = 1, random(30, 99) do
		readOnceConnectionFields()
	end
	if not onceConnection.LuaConnection then
		fail("Returned false for a LuaConnection on :Once")
	end
	if onceConnection.ForeignState then
		fail("Returned true for a non-ForeignState on :Once")
	end
	onceConnection:Disconnect()
	environment.task.wait()
	if onceConnection.Enabled then
		fail("`Enabled` returned true for a disconnected connection")
	end

	-- :Wait connection
	local waitResumed = false
	local waitFolder = environment.Instance.new("Folder")
	local waitThread = environment.task.spawn(function()
		waitFolder.ChildAdded:Wait()
		waitResumed = true
	end)
	local function checkWaitConnection()
		local connection = environment.getconnections(waitFolder.ChildAdded)[1]
		local _ = connection.ForeignState
		_ = connection.Enabled
		_ = connection.LuaConnection
		_ = connection.ForeignState
		if not connection.LuaConnection then
			fail("Returned false for LuaConnection on a :Wait connection")
		end
		if connection.ForeignState then
			fail("Returned true for ForeignState on a :Wait connection")
		end
		if not connection.Thread then
			fail("Failed to retrieve a thread from a :Wait connection")
		end
	end
	for _ = 1, random(30, 99) do
		checkWaitConnection()
	end
	local waitConnection = environment.getconnections(waitFolder.ChildAdded)[1]
	waitConnection:Disable()
	environment.task.wait()
	if not waitConnection.LuaConnection then
		fail("Returned false for LuaConnection on a :Wait connection")
	end
	if waitConnection.ForeignState then
		fail("Returned true for ForeignState on a :Wait connection")
	end
	if waitConnection.Function and environment.type(waitConnection.Function) ~= "function" then
		fail("The Function field was not a function on a :Wait connection")
	end
	if not waitConnection.Thread then
		fail("Failed to retrieve a thread from a :Wait connection")
	end
	if waitConnection.Thread and waitConnection.Thread ~= waitThread then
		fail("Retrieved the wrong thread from a :Wait connection")
	end
	environment.Instance.new("BodyVelocity", waitFolder)
	environment.task.wait()
	if waitResumed then
		fail("Was able to trigger the :Wait connection while being disabled")
	end
	waitResumed = false
	waitConnection:Enable()
	environment.Instance.new("Part", waitFolder)
	environment.task.wait()
	if not waitResumed then
		fail("Wasn't able to trigger the :Wait connection while being enabled, after disabling")
	end
	if waitConnection.Enabled == true then
		fail("Returned true for 'Enabled' after triggering a :Wait connection")
	end

	-- :Fire must not expose the caller's environment
	local fenvFolder = environment.Instance.new("Folder")
	local callerFound = false
	fenvFolder.ChildAdded:Connect(function(_)
		if environment.pcall(environment.getfenv, 3) then
			callerFound = true
		end
	end)
	environment.getconnections(fenvFolder.ChildAdded)[1]:Fire()
	if callerFound then
		fail("Found the caller in the callstack when using :Fire()")
	end
	checkpoint("getconnections-10")

	if options.delaybetweentests and options.delaybetweentests > 0 then
		environment.task.wait(options.delaybetweentests)
	end
	environment.pcall(function()
		environment.getconnections(environment.game.Players.LocalPlayer.Kill)
		environment.getconnections(environment.game.Close)
		environment.getconnections(environment.game.Players.LocalPlayer.OnTeleportInternal)
	end)
end
