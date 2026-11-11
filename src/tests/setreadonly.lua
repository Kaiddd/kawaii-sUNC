local reportResult, environment = ...

return function()
	local unfrozenTable = { success = false }
	environment.table.freeze(unfrozenTable)
	if not environment.table.isfrozen(unfrozenTable) then
		reportResult(
			false,
			"setreadonly",
			"chopped af \240\159\148\165\240\159\148\165\240\159\148\165\240\159\148\165"
		)
	end
	environment.setreadonly(unfrozenTable, false)
	unfrozenTable.success = true
	if not unfrozenTable.success then
		reportResult(false, "setreadonly", "Failed to set the value in the frozen table")
	end

	local frozenTable = { 5 }
	environment.table.freeze(frozenTable)
	local function writeFrozenTable()
		frozenTable[1] = true
	end
	if environment.pcall(writeFrozenTable) then
		reportResult(false, "setreadonly", "I like my UNC not faked, bruh \240\159\146\166")
	end
end
