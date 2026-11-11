local random, reportResult, failureMap, failureFlag, _packResults, _unpackResults, environment = ...

local function fail(message)
	reportResult(false, "cache.invalidate", message)
	if failureMap["cache.invalidate"] then
		failureFlag[1] = true
	end
end

-- Scans every table in the registry for an Instance whose tostring() contains `name`.
local function registryContainsInstanceNamed(name)
	local found = false
	for _, value in environment.pairs(environment.getreg()) do
		if environment.type(value) == "table" then
			for _, entry in environment.pairs(value) do
				if
					environment.typeof(entry) == "Instance"
					and environment.string.find(environment.tostring(entry), environment.tostring(name))
				then
					found = true
				end
			end
		end
	end
	return found
end

return function()
	if not environment.getreg then
		fail("Can't test due to getreg being nil")
		return
	end

	-- An invalidated instance must disappear from the registry cache
	local invalidatedName = random(1, 99999999)
	local invalidatedPart = environment.Instance.new("Part", environment.workspace)
	invalidatedPart.Anchored = true
	invalidatedPart.CFrame = environment.CFrame.new(0, -200, 0)
	invalidatedPart.Name = invalidatedName
	environment.cache.invalidate(invalidatedPart)
	local foundInvalidated = registryContainsInstanceNamed(invalidatedName)
	if foundInvalidated then
		fail("Was able to find the cached instance in registry")
	end
	invalidatedPart:Destroy()

	-- Accessing it again (FindFirstChild) must cache it again
	local recachedName = random(1, 99999999)
	local recachedPart = environment.Instance.new("Part", environment.workspace)
	recachedPart.CFrame = environment.CFrame.new(0, -200, 0)
	recachedPart.Anchored = true
	recachedPart.Name = recachedName
	environment.cache.invalidate(recachedPart)
	environment.workspace:FindFirstChild(environment.tostring(recachedName))
	local foundRecached = registryContainsInstanceNamed(recachedName)
	environment.task.wait()
	recachedPart:Destroy()
	if not foundRecached then
		fail("Wasn't able to find the cached instance in registry")
	end
end
