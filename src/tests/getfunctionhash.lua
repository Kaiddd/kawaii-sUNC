local reportResult, failureMap, failureFlag, _packResults, _unpackResults, environment = ...

return function()
	-- Hashed functions: their exact shape (one parameter, body, constants) is what is being tested
	local function emptyA(_) end
	local function emptyB(_) end
	local emptyHolder = { function(_) end }

	local hashA = environment.getfunctionhash(emptyA)
	local hashB = environment.getfunctionhash(emptyB)
	local hashC = environment.getfunctionhash(emptyHolder[1])
	if hashA ~= hashB or hashA ~= hashC or hashB ~= hashC then
		reportResult(false, "getfunctionhash", "Same functions shouldn't have different hashes")
		if failureMap.getfunctionhash then
			failureFlag[1] = true
		end
	end

	-- Reference functions defined by the game, found by their debug names
	local bimbumbumbambam, syrupsyrupsyrup
	local peepbooop, boopbeep
	local coolfunc, coolfunc2
	local coolfunc3, coolfunc4, coolfunc5
	for _, value in environment.pairs(environment.getgc()) do
		if environment.type(value) == "function" and environment.debug.info(value, "n") == "bimbumbumbambam" then
			bimbumbumbambam = value
		end
		if environment.type(value) == "function" and environment.debug.info(value, "n") == "syrupsyrupsyrup" then
			syrupsyrupsyrup = value
		end
		if environment.type(value) == "function" and environment.debug.info(value, "n") == "peepbooop" then
			peepbooop = value
		end
		if environment.type(value) == "function" and environment.debug.info(value, "n") == "boopbeep" then
			boopbeep = value
		end
		if environment.type(value) == "function" and environment.debug.info(value, "n") == "coolfunc" then
			coolfunc = value
		end
		if environment.type(value) == "function" and environment.debug.info(value, "n") == "coolfunc2" then
			coolfunc2 = value
		end
		if environment.type(value) == "function" and environment.debug.info(value, "n") == "coolfunc3" then
			coolfunc3 = value
		end
		if environment.type(value) == "function" and environment.debug.info(value, "n") == "coolfunc4" then
			coolfunc4 = value
		end
		if environment.type(value) == "function" and environment.debug.info(value, "n") == "coolfunc5" then
			coolfunc5 = value
		end
	end
	if not bimbumbumbambam or not syrupsyrupsyrup then
		reportResult(false, "getfunctionhash", "Failed to retrieve needed functions in order to test")
		if failureMap.getfunctionhash then
			failureFlag[1] = true
		end
	end

	if environment.getfunctionhash(syrupsyrupsyrup) == environment.getfunctionhash(bimbumbumbambam) then
		reportResult(false, "getfunctionhash", "Variadic arguments should influence the hash")
		if failureMap.getfunctionhash then
			failureFlag[1] = true
		end
	end

	local function returnsFfa(_)
		return "ffa"
	end
	local returnsFfaHolder = {
		function(_)
			return "ffa"
		end,
	}
	if environment.getfunctionhash(returnsFfa) ~= environment.getfunctionhash(returnsFfaHolder[1]) then
		reportResult(false, "getfunctionhash", "Functions' hash should differ due to no instruction difference")
		if failureMap.getfunctionhash then
			failureFlag[1] = true
		end
	end

	if environment.getfunctionhash(peepbooop) == environment.getfunctionhash(boopbeep) then
		reportResult(false, "getfunctionhash", "Different constants should not have the same hash[1]")
		if failureMap.getfunctionhash then
			failureFlag[1] = true
		end
	end
	if environment.getfunctionhash(coolfunc) == environment.getfunctionhash(coolfunc2) then
		reportResult(false, "getfunctionhash", "Different constants should not have the same hash[2]")
		if failureMap.getfunctionhash then
			failureFlag[1] = true
		end
	end
	if environment.getfunctionhash(coolfunc3) == environment.getfunctionhash(coolfunc4) then
		reportResult(false, "getfunctionhash", "Different instructions should not have the same hash")
		if failureMap.getfunctionhash then
			failureFlag[1] = true
		end
	end
	if environment.getfunctionhash(coolfunc3) ~= environment.getfunctionhash(coolfunc5) then
		reportResult(false, "getfunctionhash", "Same instructions should have the same hash")
		if failureMap.getfunctionhash then
			failureFlag[1] = true
		end
	end
end
