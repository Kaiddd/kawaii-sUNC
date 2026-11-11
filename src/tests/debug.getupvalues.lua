local reportResult, failureMap, failureFlag, environment = ...

local function fail(message)
	reportResult(false, "debug.getupvalues", message)
	if failureMap["debug.getupvalues"] then
		failureFlag[1] = true
	end
end

return function()
	if not environment.getsenv then
		fail("getsenv is needed in order to test")
	end

	local onFreeFall = environment.getsenv(environment.game.Players.LocalPlayer.Character.Animate).onFreeFall
	if #environment.debug.getupvalues(onFreeFall) ~= 3 then
		fail("Invalid upvalue count")
	end
end
