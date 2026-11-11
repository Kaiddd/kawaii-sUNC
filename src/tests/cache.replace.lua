local failedTests, reportResult, failureMap, failureFlag, environment = ...

return function()
	if failedTests["cache.invalidate"] then
		reportResult(false, "cache.replace", "Can't test due to cache.invalidate not working reliably")
	end

	local frame = environment.Instance.new("Frame")
	frame.Parent = environment.workspace
	frame.Name = "FF"

	local part = environment.Instance.new("Part")
	part.Name = "FF2"
	part.Parent = environment.workspace
	part.Transparency = 1

	-- Index both instances by name so they are cached before the replacement
	local _ = environment.workspace.FF
	local _ = environment.workspace.FF2
	environment.task.wait()

	environment.cache.replace(frame, part)
	if environment.workspace.FF ~= part then
		reportResult(false, "cache.replace", "Failed to replace the instance cache with a new one")
		if failureMap["cache.replace"] then
			failureFlag[1] = true
		end
	end
	if environment.workspace.FF.Transparency ~= 1 then
		reportResult(false, "cache.replace", "Failed to retrieve a property from the replaced instance")
		if failureMap["cache.replace"] then
			failureFlag[1] = true
		end
	end
	if frame == part then
		reportResult(false, "cache.replace", "Should only replace the instance cache, not the reference")
		if failureMap["cache.replace"] then
			failureFlag[1] = true
		end
	end

	frame:Destroy()
	part:Destroy()
end
