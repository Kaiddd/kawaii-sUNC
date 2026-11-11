local failedTests, reportResult, failureMap, failureFlag, _packResults, _unpackResults, environment = ...

return function()
	if failedTests["cache.invalidate"] then
		reportResult(false, "cache.iscached", "Can't test due to cache.invalidate not working reliably")
	end

	local lighting = environment.game:GetService("Lighting")
	environment.cache.invalidate(lighting)
	if environment.cache.iscached(lighting) then
		reportResult(false, "cache.iscached", "Returned true for a non-cached instance")
		if failureMap["cache.iscached"] then
			failureFlag[1] = true
		end
	end

	if not environment.cache.iscached(environment.game:GetService("CollectionService")) then
		reportResult(false, "cache.iscached", "Returned false for a cached instance")
		if failureMap["cache.iscached"] then
			failureFlag[1] = true
		end
	end
end
