local reportResult, failureMap, failureFlag, environment = ...

local function fail(message)
	reportResult(false, "iscclosure", message)
	if failureMap.iscclosure then
		failureFlag[1] = true
	end
end

return function()
	-- The original checks this twice.
	if not environment.newcclosure then
		fail("newcclosure is needed in order to test")
	end
	if not environment.newcclosure then
		fail("newcclosure is needed in order to test")
	end

	local wrappedClosure = environment.newcclosure(function(_) end)
	if not environment.iscclosure(wrappedClosure) then
		fail("Failed to determine a cclosure made from 'newcclosure'")
	end

	if not environment.iscclosure(environment.coroutine.wrap) then
		fail("Failed to determine a native cclosure")
	end

	if environment.iscclosure(function(_) end) then
		fail("Failed to determine a non-cclosure")
	end
end
