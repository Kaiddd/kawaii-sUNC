local reportResult, environment = ...

return function()
	local result = { "real" }

	-- Inspected through debug.getinfo: keep it vararg and keep the nested call shape
	local function target(...)
		return (function(_)
			environment.boom = "ookok"
			result[1] = "boom"
			return result[1]
		end)(...)
	end

	local info = environment.debug.getinfo(target)
	local expectedTypes = {
		source = "string",
		short_src = "string",
		func = "function",
		what = "string",
		currentline = "number",
		nups = "number",
		numparams = "number",
		is_vararg = "number",
	}
	for field, expectedType in environment.pairs(expectedTypes) do
		if info[field] == nil then
			reportResult(false, "debug.getinfo", "Did not return a table with a '" .. field .. "' field")
		end
		if environment.type(info[field]) ~= expectedType then
			reportResult(
				false,
				"debug.getinfo",
				"Did not return a table with "
					.. field
					.. " as a "
					.. expectedType
					.. " (got "
					.. environment.type(info[field])
					.. ")"
			)
		end
	end

	if info.what ~= "Lua" then
		reportResult(false, "debug.getinfo", "Didn't return a valid `what` field [2]")
	end
	if info.is_vararg > 1 then
		reportResult(false, "debug.getinfo", "Impossible field value for 'is_vararg' ")
	end
	if info.is_vararg == 0 then
		reportResult(false, "debug.getinfo", "Didn't return the correct value for 'is_vararg' ")
	end
	if info.func() ~= "boom" then
		reportResult(false, "debug.getinfo", "Didn't return the correct value from 'func' ")
	end
end
