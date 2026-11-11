local reportResult, failureMap, failureFlag, random, environment = ...

local function fail(message)
	reportResult(false, "getgenv", message)
	if failureMap.getgenv then
		failureFlag[1] = true
	end
end

return function()
	environment.getgenv().kingvonisud = 123
	environment.kingvonisud = nil
	if environment.kingvonisud == nil then
		fail("Global environment is not shared properly")
	end

	environment.getgenv().ok = "nice"
	environment.getgenv().ok = nil
	if environment.ok or environment.getgenv().ok then
		fail("Global environment is not shared properly[2]")
	end

	-- Call getfenv a random number of times, mostly with level 0.
	local iterations = random(232, 477)
	local function emptyFunction(_) end
	for _ = 1, iterations do
		if random(1, 10) ~= 1 then
			environment.getfenv(0)
		else
			environment.getfenv(emptyFunction)
		end
	end

	environment.getfenv(0).df = "hi"
	environment.getfenv(1).df = "hi"
	environment.getfenv(environment.getgenv).df = "hi"
	if environment.getgenv().df == "hi" then
		reportResult(false, "getgenv", "The function environment of `getgenv` should not be the result of it[1]")
	end
	if environment.getfenv(environment.getgenv) ~= environment.getfenv() then
		reportResult(false, "getgenv", "The environment of getgenv should be the same as current")
	end
	if environment.getfenv(environment.getgenv) == environment.getgenv() then
		reportResult(false, "getgenv", "The function environment of `getgenv` should not be the result of it[2]")
	end
end
