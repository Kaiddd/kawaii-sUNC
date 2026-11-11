local integrityMarkers, reportResult, failureMap, failureFlag, failureDetails, _packResults, _unpackResults, environment =
	...

local function fail(message)
	reportResult(false, "debug.getproto", message)
	if failureMap["debug.getproto"] then
		failureFlag[1] = true
	end
end

return function()
	integrityMarkers.ilovelosingcontrol = true

	if not environment.getscriptclosure then
		fail("getscriptclosure is needed in order to test")
	end
	if not environment.getgc then
		fail("getgc is needed in order to test")
	end

	local characterSounds = environment.getscriptclosure(
		environment.game:GetService("Players").LocalPlayer.PlayerScripts.RbxCharacterSounds
	)

	-- Invalid indices on functions without protos must error.
	if
		environment.pcall(function()
			local function emptyFunction(_) end
			environment.debug.getproto(emptyFunction, 0, true)
		end)
	then
		fail("Should error upon entering an invalid index[1]")
	end
	if
		environment.pcall(function()
			local function emptyFunction(_) end
			environment.debug.getproto(emptyFunction, -0.0, true)
		end)
	then
		fail("Should error upon entering an invalid index[2]")
	end
	if
		environment.pcall(function()
			local function emptyFunction(_) end
			environment.debug.getproto(emptyFunction, 72057594037927940, true)
		end)
	then
		fail("Should error upon entering an invalid index[3]")
	end
	if
		environment.pcall(function()
			local function emptyFunction(_) end
			environment.debug.getproto(emptyFunction, -0.0, true)
		end)
	then
		fail("Should error upon entering an invalid index[2]")
	end

	local activeProtos = environment.debug.getproto(characterSounds, 1, true)
	local inactiveProto = environment.debug.getproto(characterSounds, 1, false)
	local defaultProto = environment.debug.getproto(characterSounds, 1)
	if not inactiveProto or not defaultProto then
		fail("Failed to retrieve an inactive proto[1]")
	end
	if not activeProtos then
		fail("Failed to retrieve active proto(s)")
	end
	if activeProtos[1]() ~= false then
		fail("Didn't return the correct value from a script's proto")
	end

	environment.pcall(function()
		if inactiveProto() == false or defaultProto() == false then
			fail("Inactive protos should not be callable[1]")
		end
	end)

	local targetFunction
	for _, object in environment.pairs(environment.getgc()) do
		if environment.type(object) == "function" and environment.debug.info(object, "n") == "forgives_flushed" then
			targetFunction = object
		end
	end
	if not targetFunction then
		fail("Failed to retrieve a function to test")
	end

	local targetProto = environment.debug.getproto(targetFunction, 1)
	if not targetProto then
		fail("Failed to retrieve an inactive proto[2]")
	end

	environment.pcall(function()
		if targetProto() == "blablabla" then
			fail("Inactive protos should not be callable[2]")
		end
	end)

	if
		environment.debug.info(targetProto, "n") ~= "because_hes_unemployed"
		or environment.debug.info(targetProto, "s") ~= "ReplicatedFirst.Hacker"
		or environment.select(2, environment.debug.info(targetProto, "a")) == true
		or environment.debug.info(targetProto, "l") ~= 53
	then
		reportResult(false, "debug.getproto", "Failed to retrieve correct debug information on an inactive proto")
		local retrievedName = environment.debug.info(targetProto, "n") .. " '"
		local retrievedLine = environment.tostring(environment.debug.info(targetProto, "l"))
		local retrievedVararg = environment.tostring(environment.select(2, environment.debug.info(targetProto, "a")))
		failureDetails["debug.getproto"] = environment.string.format(
			"\r\n\r\n\t\t\t\t\t\tThe retrieved debug name of an inactive proto did not match with \"`because_hes_unemployed`\".\r\n\r\n\t\t\t\t\t\tRetrieved name:\r\n\r\n\t\t\t\t\t\t%s | expected: 'because_hes_unemployed'\r\n\r\n\t\t\t\t\t\tRetrieved currentline:\r\n\r\n\t\t\t\t\t\t%s | expected: 52\r\n\r\n\t\t\t\t\t\tRetrieved is_vararg:\r\n\r\n\t\t\t\t\t\t%s | expected: false\r\n\r\n\t\t\t\t\t\tRetrieved source:\r\n\r\n\t\t\t\t\t\t%s | expected: ReplicatedFirst.Hacker\r\n\r\n\t\t\t\t\t",
			"' " .. retrievedName,
			retrievedLine,
			retrievedVararg,
			environment.tostring(environment.debug.info(targetProto, "s"))
		)
	end
end
