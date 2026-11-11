local reportResult, failureMap, failureFlag, _packResults, _unpackResults, environment = ...

local function fail(message)
	reportResult(false, "getnilinstances", message)
	if failureMap.getnilinstances then
		failureFlag[1] = true
	end
end

return function()
	environment.getnilinstances()

	local foundParented = false
	for _, instance in environment.pairs(environment.getnilinstances()) do
		if instance.Parent ~= nil then
			foundParented = true
		end
	end
	if foundParented then
		fail("Fetched a non-nil instance")
	end

	environment.Instance.new("Part").Name = ","
	local foundNew = false
	for _, instance in environment.pairs(environment.getnilinstances()) do
		if instance.Name == "," then
			foundNew = true
		end
	end
	if not foundNew then
		fail("Couldn't fetch a nil instance")
	end
end
