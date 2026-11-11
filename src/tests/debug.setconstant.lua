local failedTests, reportResult, failureMap, failureFlag, random, _packResults, _unpackResults, environment = ...

return function()
	local function reportFailure(message)
		reportResult(false, "debug.setconstant", message)
		if failureMap["debug.setconstant"] then
			failureFlag[1] = true
		end
	end

	local function getGroksays()
		return environment.getsenv(environment.game.Players.LocalPlayer.PlayerScripts.lefty).groksays
	end

	if failedTests["debug.getconstant"] or not environment.debug.getconstant then
		reportFailure("Can't test due to 'debug.getconstant' not working reliably")
	end
	if failedTests.getsenv or not environment.getsenv then
		reportFailure("Can't test due to 'getsenv' not working reliably")
	end

	local newConstant = environment.tostring(random(2000, 9101))
	environment.workspace.FreakyBox.e["Accessory (pillow)"].Handle.CollisionGroup = newConstant

	local groksays = getGroksays()
	environment.debug.setconstant(getGroksays(), 1, newConstant)
	local readBack = environment.debug.getconstant(getGroksays(), 1)

	local attemptsLeft = 60
	repeat
		environment.task.wait(0.06)
		attemptsLeft -= 1
	until environment.workspace.FreakyBox.e["Cube.012Accessory"].Handle.CollisionGroup == "sillypeely"
		or attemptsLeft <= 0

	if environment.workspace.FreakyBox.e["Cube.012Accessory"].Handle.CollisionGroup ~= "sillypeely" then
		reportFailure("Failed to set a constant and retrieve its value[1]")
	end
	if groksays() ~= newConstant or readBack ~= newConstant then
		reportFailure("Failed to set a constant and retrieve its value[2]")
	end
end
