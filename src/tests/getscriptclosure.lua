local reportResult, failureMap, failureFlag, failureDetails, _packResults, _unpackResults, environment = ...

local function fail(message)
	reportResult(false, "getscriptclosure", message)
	if failureMap.getscriptclosure then
		failureFlag[1] = true
	end
end

return function()
	if not environment.debug.getconstants then
		fail("debug.getconstants is needed in order to test")
	end

	if
		not environment.pcall(
			environment.getscriptclosure,
			environment.game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule
		)
	then
		fail("Failed to retrieve the closure from a ModuleScript")
	end
	if not environment.pcall(environment.getscriptclosure, environment.game.Players.LocalPlayer.Character.Animate) then
		fail("Failed to retrieve the closure from a LocalScript")
	end
	if
		not environment.pcall(
			environment.getscriptclosure,
			environment.game:GetService("ReplicatedStorage").Folder.Folder.Script
		)
	then
		fail("Failed to retrieve the closure from a Script with RunContext set to Client")
	end

	local constants = environment.debug.getconstants(
		environment.getscriptclosure(environment.game:GetService("ReplicatedStorage").Folder.Folder.Script)
	)
	local foundColor = false
	local found50 = false
	local foundCreate = false
	local constantDump = ""
	for _, constant in environment.pairs(constants) do
		constantDump ..= environment.tostring(constant) .. "\n\t\t\t\t\t\t"
		if environment.tostring(constant) == "Color" then
			foundColor = true
		end
		if environment.tostring(constant) == "50" then
			found50 = true
		end
		if environment.tostring(constant) == "create" then
			foundCreate = true
		end
	end

	if not foundColor or not found50 or not foundCreate then
		failureDetails.getscriptclosure = environment.string.format(
			'\r\n\r\n\t\t\t\t\t\tReturned one or more wrong constants from a script\'s closure using this:\r\n\t\t\t\t\t\tdebug.getconstants(getscriptclosure(game:GetService("ReplicatedStorage").Folder.Folder.Script))\r\n\r\n\t\t\t\t\t\tOutput returned:\r\n\r\n\t\t\t\t\t\t%s\r\n\t\t\t\t\t',
			constantDump
		)
	end
	if not foundColor then
		fail("Couldn't find a constant from the script's closure[1]")
	end
	if not found50 then
		fail("Couldn't find a constant from the script's closure[2]")
	end
	if not foundCreate then
		fail("Couldn't find a constant from the script's closure[3]")
	end
end
