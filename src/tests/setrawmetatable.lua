local failedTests, reportResult, failureMap, failureFlag, _packResults, _unpackResults, environment = ...

local function fail(message)
	reportResult(false, "setrawmetatable", message)
	if failureMap.setrawmetatable then
		failureFlag[1] = true
	end
end

return function()
	if failedTests.getrawmetatable then
		fail("Can't test due to 'getrawmetatable' not working reliably")
	end

	local proxy = environment.setrawmetatable({}, {
		__index = function()
			return "bomlol"
		end,
	})
	environment.setrawmetatable(proxy, { __index = environment.getgenv() })
	if environment.type(proxy.print) ~= "function" then
		fail("Failed to change the metatable")
	end

	local locked = {}
	environment.setrawmetatable(locked, { __metatable = "real2" })
	environment.setrawmetatable(locked, {})
	if environment.getmetatable(locked) == "real2" then
		fail("Failed to set a metatable on a locked metatable")
	end

	local firstTable = {}
	local firstResult = environment.setrawmetatable(firstTable, { __index = environment.getgenv() })
	local secondTable = {}
	local secondResult = environment.setrawmetatable(secondTable, { __index = environment.getgenv() })
	-- Chain the two metatables: firstTable's metatable gets secondTable's metatable as its own.
	local chainedResult =
		environment.setrawmetatable(environment.getrawmetatable(firstTable), environment.getrawmetatable(secondTable))
	local firstMetatable = environment.getrawmetatable(firstTable)
	local secondMetatable = environment.getrawmetatable(secondTable)
	local chainedMetatable = environment.getrawmetatable(chainedResult)

	if firstResult == nil or secondResult == nil then
		fail("Failed to obtain a return value")
	end
	if secondTable == chainedResult then
		fail("Invalid table-to-metatable references[1]")
	end
	if firstTable == chainedResult then
		fail("Invalid table-to-metatable reference[2]")
	end
	if firstTable == firstMetatable then
		fail("A table and its metatable should not be equal to eachother[1]")
	end
	if secondTable == secondMetatable then
		fail("A table and its metatable should not be equal to eachother[2]")
	end
	if chainedResult == chainedMetatable then
		fail("Invalid return. Should not return its own metatable")
	end
	if firstTable == chainedMetatable then
		fail("A table and its metatable should not be equal to eachother[3]")
	end
	if not chainedResult.print then
		fail("Failed to retrieve a value from a metatable")
	end
	if firstMetatable == secondMetatable then
		fail("Different metatable should not equal to eachother")
	end
	if secondMetatable ~= chainedMetatable then
		fail("Invalid metatable-to-metatable reference")
	end
end
