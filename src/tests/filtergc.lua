local reportResult, failureMap, failureFlag, failedTests, random, _packResults, _unpackResults, hostFactories, environment =
	...

local function fail(message)
	reportResult(false, "filtergc", message)
	if failureMap.filtergc then
		failureFlag[1] = true
	end
end

-- Searches the GC with `filter` and reports whether the exact table `target` was returned.
-- `target` must be created before the search so that filtergc can find it.
local function findsTable(filter, target)
	local found = false
	for _, candidate in environment.pairs(environment.filtergc("table", filter)) do
		if candidate == target then
			found = true
		end
	end
	return found
end

return function()
	if not environment.getfunctionhash then
		fail("getfunctionhash is needed in order to test")
	end
	if failedTests.getfunctionhash then
		fail("Can't test due to 'getfunctionhash' not working reliably")
	end

	local allFunctions = environment.filtergc("function", {})
	if environment.type(allFunctions) ~= "table" then
		fail("`returnOne` should be false by default and returning a table")
	end
	if allFunctions == nil or #allFunctions == 0 then
		fail("Returned an empty table when provided no options")
	end

	local namedFunction = environment.filtergc("function", { Name = "imaeemuhttaginmyphase" }, true)
	if environment.type(namedFunction) == "table" then
		fail("Returned a table while 'returnOne' was set to true")
	end
	if not namedFunction then
		fail("[Name] Failed to find a function by name")
	end

	local keysTarget = { prrrrpapa = "f", [":Pboi"] = 2 }
	if not findsTable({ Keys = { ":Pboi", "prrrrpapa" } }, keysTarget) then
		fail("[KEYS] Failed to find a table with specified keys")
	end

	local singleKeyTarget = { [":Pboi"] = random(1, 54) }
	if not findsTable({ Keys = { ":Pboi" } }, singleKeyTarget) then
		fail("[KEYS] Failed to find a table with specified keys")
	end

	local valuesNumber = random(3, 999)
	local valuesTarget = { prrrrpapa = "fawfawfaw", [":Pboi"] = valuesNumber }
	if not findsTable({ Values = { valuesNumber, "fawfawfaw" } }, valuesTarget) then
		fail("[VALUES] Failed to find a table with specified value[1]")
	end

	local singleValueTarget = { prrrrpapa = "fawfawfaw" }
	if not findsTable({ Values = { "fawfawfaw" } }, singleValueTarget) then
		fail("[VALUES] Failed to find a table with specified value[2]")
	end

	local pairsNumber = random(77, 999)
	local pairsTarget = { prrrrpapa = "fawfawfaw", [":Pboi"] = pairsNumber }
	if not findsTable({ KeyValuePairs = { [":Pboi"] = pairsNumber, prrrrpapa = "fawfawfaw" } }, pairsTarget) then
		fail("[KVPairs] Failed to find a table with specified KeyValue pairs[1]")
	end

	local singlePairTarget = { prrrrpapa = "fawfawfaw" }
	if not findsTable({ KeyValuePairs = { prrrrpapa = "fawfawfaw" } }, singlePairTarget) then
		fail("[KVPairs] Failed to find a table with specified KeyValue pairs[2]")
	end

	local metatableTarget = environment.setmetatable({}, { __index = environment.getgenv() })
	if not findsTable({ Metatable = environment.getmetatable(metatableTarget) }, metatableTarget) then
		fail("[METATABLE] Failed to find a table with the specified metatable")
	end

	local sendFunctions = environment.filtergc("function", { Name = "send", Constants = { "WaitForChild" } })
	if #sendFunctions > 1 then
		fail("[FUNC] Retrieved more than one viable option")
	end
	if #sendFunctions == 0 then
		fail("[FUNC] Retrieved less than one viable option")
	end

	-- Host factory 4 runs the `-0` constant check; host factory 5 stores
	-- filtergc("function", { Constants = { 0 / 0 } }) into nanResults[1].
	hostFactories[4]({ reportResult, failureMap, failureFlag })()
	local nanResults = { nil }
	hostFactories[5]({ nanResults })()
	if #nanResults[1] == 0 or #nanResults[1] > 1 then
		fail("[FUNC] Failed to retrieve a function with a constant which equals to NaN[1].")
	end
	if environment.select(2, nanResults[1][1](2)) ~= "hi" then
		fail("[FUNC] Failed to retrieve a function with the constant which equals to NaN[2].")
	end

	-- Built at runtime so this function's own constants don't contain the searched string.
	local missingConstant = environment.table.concat({ "brotzatza ", "there's no function like this" })
	if #environment.filtergc("function", { Constants = { missingConstant }, IgnoreExecutor = false }) > 0 then
		fail("[FUNC IgnoreExec] Returned more than 0 possible functions for a non-existant function")
	end

	local nanUpvalueFunctions = environment.filtergc("function", { Upvalues = { 0 / 0 } })
	if #nanUpvalueFunctions == 0 or #nanUpvalueFunctions > 1 then
		fail("[FUNC UPVALS] Failed to retrieve a function with the upvalue 0/0")
	end
	if environment.select(2, nanUpvalueFunctions[1]()) ~= "mau" then
		fail("[FUNC UPVALS] Failed to retrieve a function with the upvalue 0/0.")
	end
end
