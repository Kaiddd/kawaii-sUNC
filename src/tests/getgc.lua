local reportResult, failureMap, failureFlag, gameFunction, _packResults, _unpackResults, environment = ...

return function()
	local gcObjects = environment.getgc()
	if environment.type(gcObjects) ~= "table" then
		reportResult(false, "getgc", "Didn't return a table value")
	end

	-- Errors as soon as it reaches a non-Instance; the pcall swallows that
	environment.pcall(function()
		local descendantCount = 0
		for _, value in environment.pairs(environment.getgc()) do
			if value:IsDescendantOf(environment.game) then
				descendantCount += 1
			end
		end
		if descendantCount >= 0 then
			reportResult(
				false,
				"getgc",
				"Everyone must GetDescendants of game \240\159\153\143\240\159\153\143\240\159\153\143[1]"
			)
			if failureMap.getgc then
				failureFlag[1] = true
			end
		end
		if descendantCount == #environment.getgc() then
			reportResult(
				false,
				"getgc",
				"Everyone must GetDescendants of game \240\159\153\143\240\159\153\143\240\159\153\143[2]"
			)
			if failureMap.getgc then
				failureFlag[1] = true
			end
		end
	end)

	local markerTable = {}
	local function markerFunction(_) end
	environment.task.wait()
	environment.task.wait()

	-- Tables should only be returned by getgc(true)
	local foundTableWithTrue = false
	local foundFunction = false
	local foundTableWithoutTrue = false
	for _, value in environment.pairs(environment.getgc(true)) do
		if value == markerTable then
			foundTableWithTrue = true
		end
	end
	for _, value in environment.pairs(environment.getgc()) do
		if value == markerFunction then
			foundFunction = true
		end
		if value == markerTable then
			foundTableWithoutTrue = true
		end
	end
	if foundTableWithoutTrue then
		reportResult(false, "getgc", "Was able to retrieve a table with a non-true argument passed")
		if failureMap.getgc then
			failureFlag[1] = true
		end
	end

	local foundGameFunction = false
	for _, value in environment.pairs(environment.getgc()) do
		if
			environment.type(value) == "function"
			and environment.tostring(value) == environment.tostring(gameFunction)
		then
			foundGameFunction = true
		end
	end
	if not foundGameFunction then
		reportResult(false, "getgc", "Couldn't find a game function")
		if failureMap.getgc then
			failureFlag[1] = true
		end
	end
	if not foundTableWithTrue or not foundFunction then
		reportResult(false, "getgc", "Couldn't fetch a needed value")
		if failureMap.getgc then
			failureFlag[1] = true
		end
	end

	local part = environment.Instance.new("Part")
	environment.task.wait()
	local foundUserdata = false
	for _, value in environment.pairs(environment.getgc(true)) do
		if environment.type(value) == "userdata" and value == part then
			foundUserdata = true
			break
		end
	end
	if not foundUserdata then
		reportResult(false, "getgc", "Failed to retrieve a userdata object")
		if failureMap.getgc then
			failureFlag[1] = true
		end
	end
end
