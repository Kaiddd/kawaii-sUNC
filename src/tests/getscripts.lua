local reportResult, failureMap, failureFlag, _packResults, _unpackResults, environment = ...

local function fail(message)
	reportResult(false, "getscripts", message)
	if failureMap.getscripts then
		failureFlag[1] = true
	end
end

return function()
	local foundCoreScript = false
	for _, script in environment.pairs(environment.getscripts()) do
		if script:IsDescendantOf(environment.game.CorePackages) or script:IsDescendantOf(environment.game.CoreGui) then
			foundCoreScript = true
			break
		end
	end
	if foundCoreScript then
		fail("Shouldn't return core scripts by default")
	end

	local foundLocalScript = false
	local localScript = environment.Instance.new("LocalScript")
	for _, script in environment.pairs(environment.getscripts()) do
		if script == localScript then
			foundLocalScript = true
		end
	end
	if not foundLocalScript then
		fail("Couldn't fetch a script parented to nil")
	end

	local foundClientScript = false
	local clientScript = environment.Instance.new("Script")
	clientScript.RunContext = environment.Enum.RunContext.Client
	for _, script in environment.pairs(environment.getscripts()) do
		if script == clientScript then
			foundClientScript = true
		end
	end
	if not foundClientScript then
		fail("Couldn't fetch a 'Script' with RunContext set to Client and parented to nil")
	end
end
