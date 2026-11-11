local failedTests, reportResult, random, checkpointLogger, _packResults, _unpackResults, environment = ...

return function()
	if failedTests.getgenv or not environment.getgenv then
		reportResult(false, "isexecutorclosure", "getgenv is needed in order to test")
	end

	local concatIsExecutorClosure = environment.isexecutorclosure(environment.table.concat)
	local function executorClosure(_) end
	local function checkNilArgument()
		if environment.isexecutorclosure(nil) then
			reportResult(false, "isexecutorclosure", "Returned true for no closure")
		end
	end

	for _ = 1, random(2, 5) do
		environment.isexecutorclosure(environment.table.foreach)
		if
			not environment.isexecutorclosure(executorClosure)
			or not environment.isexecutorclosure(environment.isexecutorclosure)
			or not environment.isexecutorclosure(environment.getgenv)
		then
			reportResult(false, "isexecutorclosure", "Couldn't determine if the function is an exec-closure")
		end
		environment.pcall(checkNilArgument)
		if environment.debug.info(executorClosure, "l") == -1 then
			reportResult(false, "isexecutorclosure", "The closure should not be defined at line -1")
		end
	end

	if
		concatIsExecutorClosure
		or environment.isexecutorclosure(environment.table.foreach)
		or environment.isexecutorclosure(environment.pairs)
		or environment.isexecutorclosure(environment.table.clear)
	then
		reportResult(false, "isexecutorclosure", "Returned true for a non-exec closure")
	end
	if not environment.isexecutorclosure(executorClosure) then
		reportResult(false, "isexecutorclosure", "Couldn't determine if the function is an exec-closure")
	end

	-- A program function exposed through getgenv is still not an executor closure
	environment.getgenv().hello = checkpointLogger
	if environment.isexecutorclosure(environment.getgenv().hello) then
		reportResult(false, "isexecutorclosure", "Returned true for a non-exec closure.")
	end
	environment.getgenv().hello = nil

	if environment.isexecutorclosure(environment.game.Boppa:Invoke()) then
		reportResult(false, "isexecutorclosure", "bro+ are we deduzik")
	end
end
