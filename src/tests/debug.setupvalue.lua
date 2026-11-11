local reportResult, failureMap, failureFlag, environment = ...

local function fail(message)
	reportResult(false, "debug.setupvalue", message)
	if failureMap["debug.setupvalue"] then
		failureFlag[1] = true
	end
end

return function()
	if not environment.getsenv then
		fail("getsenv is needed in order to test")
	end

	local getTool = environment.getsenv(environment.game.Players.LocalPlayer.Character.Animate).getTool
	environment.debug.setupvalue(getTool, 1, environment.game)
	if environment.debug.getupvalue(getTool, 1) ~= environment.game then
		fail("Couldn't set the upvalue of a script's function")
	end
	environment.debug.setupvalue(getTool, 1, environment.game.Players.LocalPlayer.Character)

	local function noUpvalues(_) end

	if
		environment.pcall(function()
			local function emptyFunction(_) end
			environment.debug.setupvalue(emptyFunction, 0, 0)
		end)
	then
		fail("Should error upon entering an invalid upvalue index[1]")
	end

	if environment.pcall(function()
		environment.debug.setupvalue(noUpvalues, 2147483648, 0)
	end) then
		fail("Should error upon entering an invalid upvalue index[2]")
	end

	if environment.pcall(function()
		environment.debug.setupvalue(2147483648, 1, 1)
	end) then
		fail("Should error upon entering an invalid level[1]")
	end

	if environment.pcall(function()
		environment.debug.setupvalue(0, 1, 1)
	end) then
		fail("Should error upon entering an invalid level[2]")
	end
end
