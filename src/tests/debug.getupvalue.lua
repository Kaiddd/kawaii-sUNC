local reportResult, failureMap, failureFlag, environment = ...

return function()
	if not environment.getsenv then
		reportResult(false, "debug.getupvalue", "getsenv is needed in order to test")
		if failureMap["debug.getupvalue"] then
			failureFlag[1] = true
		end
	end

	local onFreeFall = environment.getsenv(environment.game.Players.LocalPlayer.Character.Animate).onFreeFall
	local upvalue = environment.debug.getupvalue(onFreeFall, 2)
	if environment.tostring(upvalue) ~= "Humanoid" then
		reportResult(false, "debug.getupvalue", "Couldn't retrieve an upvalue from the script's function")
		if failureMap["debug.getupvalue"] then
			failureFlag[1] = true
		end
	end
end
