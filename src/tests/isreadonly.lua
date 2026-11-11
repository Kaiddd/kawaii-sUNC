local failedTests, reportResult, environment = ...

return function()
	if failedTests.setreadonly then
		reportResult(false, "isreadonly", "'setreadonly' is needed in order to test")
	end
	local frozenTable = { a = 2 }
	environment.table.freeze(frozenTable)
	reportResult(environment.isreadonly(frozenTable), "isreadonly", "Couldn't determine if the table is read-only")
end
