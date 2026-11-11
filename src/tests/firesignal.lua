local failureReasons, reportResult, failureMap, failureFlag, random, _packResults, _unpackResults, environment = ...

local function fail(message)
	reportResult(false, "firesignal", message)
	if failureMap.firesignal then
		failureFlag[1] = true
	end
end

return function()
	if not environment.getrawmetatable or failureReasons.getrawmetatable then
		fail("getrawmetatable is not working properly, can't test")
	end
	if not environment.setreadonly then
		fail("setreadonly is needed in order to test")
	end

	-- Arguments are passed through to the connection
	local button = environment.Instance.new("TextButton")
	local receivedFirst = false
	local expectedFirst = random()
	local receivedSecond = false
	button.MouseButton1Click:Connect(function(first, second)
		receivedFirst = first
		receivedSecond = second
	end)
	environment.firesignal(button.MouseButton1Click, expectedFirst, "2")
	environment.task.wait(0.075)
	if receivedFirst ~= expectedFirst or receivedSecond ~= "2" then
		fail("Couldn't fire the signal successfully")
	end

	-- Property changed signals
	local part = environment.Instance.new("Part")
	part.Parent = environment.workspace
	part.Name = "LPLPLPLPL"
	part.CFrame = environment.CFrame.new(0, -200, 0)
	part.Anchored = true
	local positionChanged = false
	part:GetPropertyChangedSignal("Position"):Connect(function()
		positionChanged = true
	end)
	environment.firesignal(part:GetPropertyChangedSignal("Position"))
	environment.task.wait(0.075)
	if not positionChanged then
		fail("Couldn't fire the signal successfully [2]")
	end
	part:Destroy()

	-- The handler must not see the firing script on its call stack
	local callerFolder = environment.Instance.new("Folder")
	local callerFound = false
	callerFolder.ChildAdded:Connect(function()
		if environment.pcall(environment.getfenv, 3) then
			callerFound = true
		end
	end)
	environment.firesignal(callerFolder.ChildAdded)
	if callerFound then
		fail("Found the caller in the callstack while firing the signal")
	end

	-- Every connection receives the arguments
	local firstWrongName = false
	local firstWrongInstance = false
	local folder = environment.Instance.new("Folder")
	folder.ChildAdded:Connect(function(name, instance)
		if name ~= "szs" then
			firstWrongName = true
		end
		if instance ~= environment.game then
			firstWrongInstance = true
		end
	end)
	local secondWrongName = false
	local secondWrongInstance = false
	folder.ChildAdded:Connect(function(name, instance)
		if name ~= "szs" then
			secondWrongName = true
		end
		if instance ~= environment.game then
			secondWrongInstance = true
		end
	end)
	environment.firesignal(folder.ChildAdded, "szs", environment.game)
	if firstWrongName then
		fail("Failed to fire multiple signals with the proper arguments[1]")
	end
	if firstWrongInstance then
		fail("Failed to fire multiple signals with the proper arguments[2]")
	end
	if secondWrongName then
		fail("Failed to fire multiple signals with the proper arguments[3]")
	end
	if secondWrongInstance then
		fail("Failed to fire multiple signals with the proper arguments[4]")
	end

	-- An instance disguised as a signal (__type spoofed) must be rejected
	local frame = environment.Instance.new("Frame")
	local metatable = environment.getrawmetatable(frame)
	local originalType = metatable.__type
	environment.setreadonly(metatable, false)
	metatable.__type = "RBXScriptSignal"
	local firedFakeSignal = false
	environment.task.spawn(function()
		environment.pcall(function()
			environment.firesignal(frame, 9, 9, 9, 9, 9, 9, 9, 9, 9)
			firedFakeSignal = true
		end)
	end)
	if firedFakeSignal then
		fail("Should error upon passing an invalid instance")
	end
	environment.getrawmetatable(frame).__type = originalType
	environment.setreadonly(metatable, true)
	environment.task.wait(0.01)
	if
		environment.typeof(frame) == "RBXScriptSignal"
		or environment.getrawmetatable(frame).__type == "RBXScriptSignal"
	then
		reportResult(
			false,
			"getrawmetatable",
			"Failed to set back the __type of an instance. ( Instance -> Signal -> Instance ) "
		)
		if failureMap.firesignal then
			failureFlag[1] = true
		end
	end
end
