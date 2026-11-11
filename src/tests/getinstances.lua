local reportResult, failureMap, failureFlag, environment = ...

local function fail(message)
	reportResult(false, "getinstances", message)
	if failureMap.getinstances then
		failureFlag[1] = true
	end
end

return function()
	local part = environment.Instance.new("Part")
	local instances = environment.getinstances()
	part.Name = "."
	environment.task.wait(0.08)

	local foundPart = false
	for _, instance in environment.pairs(instances) do
		if instance == part then
			foundPart = true
		end
	end
	part:Destroy()
	if not foundPart then
		fail("Failed to fetch an instance outside of 'game' ")
	end

	local foundPlayer = false
	for _, instance in environment.pairs(instances) do
		if instance.Name == environment.game.Players.LocalPlayer.Name then
			foundPlayer = true
		end
	end
	if not foundPlayer then
		fail("Couldn't fetch the needed value")
	end

	if #environment.getinstances() == #environment.game:GetDescendants() then
		fail("Invalid count. `getinstances` should not be `game:GetDescendants()`")
	end
end
