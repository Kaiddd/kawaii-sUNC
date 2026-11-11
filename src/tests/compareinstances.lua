local failedTests, reportResult, failureMap, failureFlag, environment = ...

return function()
	if failedTests.cloneref or not environment.cloneref then
		reportResult(false, "compareinstances", "Can't verify due to cloneref not working reliably")
		if failureMap.compareinstances then
			failureFlag[1] = true
		end
	end

	local gameReference = environment.cloneref(environment.game)
	local workspaceReference = environment.cloneref(gameReference.workspace)

	if not environment.compareinstances(gameReference, environment.game) then
		reportResult(
			false,
			"compareinstances",
			"Compared instances cloned with cloneref should be the same under 'compareinstances' "
		)
		if failureMap.compareinstances then
			failureFlag[1] = true
		end
	end
	if not environment.compareinstances(gameReference, environment.workspace.Parent) then
		reportResult(false, "compareinstances", "Couldn't retrieve the correct value for compareinstances[1]")
		if failureMap.compareinstances then
			failureFlag[1] = true
		end
	end
	if
		not environment.compareinstances(gameReference, workspaceReference.Parent)
		or not environment.compareinstances(environment.workspace, workspaceReference)
	then
		reportResult(false, "compareinstances", "Couldn't retrieve the correct value for compareinstances[2]")
		if failureMap.compareinstances then
			failureFlag[1] = true
		end
	end

	local part = environment.Instance.new("Part")
	local partClone = part:Clone()
	if environment.compareinstances(part, partClone) then
		reportResult(false, "compareinstances", "Cloned instances shouldn't equal")
		if failureMap.compareinstances then
			failureFlag[1] = true
		end
	end
end
