--[[
	Shared metadata object.

	main.lua adds `__testFactories` and `__programFactory` to this table and passes the same
	table to the runtime, which hands it on to the program and the tests.

	The interpreter data of the virtualized original (instruction tables and constant pools)
	is no longer needed: the runtime now uses the constants directly. Only one remnant is
	still touched by the lifted modules:
	  * tests/getsenv.lua reads metadata["127"][1] (a plain table; on one error path its type
	    ends up in the error message).
]]
return {
	["127"] = { {} },
}
