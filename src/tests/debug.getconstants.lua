local reportResult, failureMap, failureFlag, checkpointLogger, environment = ...

local function fail(message)
	reportResult(false, "debug.getconstants", message)
	if failureMap["debug.getconstants"] then
		failureFlag[1] = true
	end
end

return function()
	if not environment.getsenv then
		fail("getsenv is needed in order to test")
	end

	local onFreeFall = environment.getsenv(environment.game.Players.LocalPlayer.Character.Animate).onFreeFall
	-- Only reports when both constants are wrong (`and`, as in the original test).
	if
		environment.debug.getconstants(onFreeFall)[1] ~= "playAnimation"
		and environment.debug.getconstants(onFreeFall)[2] ~= "fall"
	then
		fail("Couldn't retrieve the correct constants from a script's function")
	end

	-- checkpointLogger serves as the C-closure sample
	if environment.pcall(environment.debug.getconstants, checkpointLogger) then
		fail("Didn't error on passing C-closures")
	end

	-- These call the global `getconstants` (not `debug.getconstants`), as the original test does.
	local acceptedLevel1 = environment.pcall(function()
		environment.getconstants(281474976710655)
	end)
	if acceptedLevel1 then
		fail("Should error upon passing an invalid level[1]")
	end
	local acceptedLevel2 = environment.pcall(function()
		environment.getconstants(0)
	end)
	if acceptedLevel2 then
		fail("Should error upon passing an invalid level[2]")
	end
	local acceptedLevel3 = environment.pcall(function()
		environment.getconstants(32)
	end)
	if acceptedLevel3 then
		fail("Should error upon passing an invalid level[3]")
	end
end
