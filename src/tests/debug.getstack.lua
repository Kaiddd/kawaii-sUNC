local options, checkpointLogger, failedTests, reportResult, failureMap, failureFlag, hostFactories, environment = ...

return function()
	local function reportFailure(message)
		reportResult(false, "debug.getstack", message)
		if failureMap["debug.getstack"] then
			failureFlag[1] = true
		end
	end

	if failedTests.getgc or not environment.getgc then
		reportFailure("Can't test due to 'getgc' not working reliably")
	end
	if failedTests.hookfunction or not environment.hookfunction then
		reportFailure("Can't test due to 'hookfunction' not working reliably")
	end

	-- The host helper hooks a game function and sets stackFound[1] once it reads the expected stack value.
	local stackFound = { false }
	hostFactories[2]({ stackFound, options, checkpointLogger })()

	local attemptsLeft = 150
	repeat
		environment.task.wait()
		attemptsLeft -= 1
	until stackFound[1] == true or attemptsLeft <= 0

	if stackFound[1] == false then
		reportFailure("Couldn't retrieve an expected stack value from a foreign thread")
	end
end
