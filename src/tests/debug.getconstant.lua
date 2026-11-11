local reportResult, failureMap, failureFlag, _packResults, _unpackResults, environment = ...

return function()
	local function reportFailure(message)
		reportResult(false, "debug.getconstant", message)
		if failureMap["debug.getconstant"] then
			failureFlag[1] = true
		end
	end

	if not environment.getscriptclosure then
		reportFailure("getscriptclosure is needed in order to test")
	end

	local loaderClosure = environment.getscriptclosure(
		environment.game:GetService("Players").LocalPlayer.PlayerScripts.PlayerScriptsLoader
	)
	if
		environment.tostring(environment.debug.getconstant(loaderClosure, 7)) ~= "WaitForChild"
		and environment.tostring(environment.debug.getconstant(loaderClosure, 3)) ~= "script"
	then
		reportFailure("Couldn't retrieve the correct constant(s) from a script's closure")
	end

	local function getHugeIndex()
		environment.debug.getconstant(1, 2 ^ 56)
	end
	if environment.pcall(getHugeIndex) then
		reportFailure("Should error upon entering invalid index[1]")
	end

	local function getHugeLevel()
		environment.debug.getconstant(2 ^ 60, 0)
	end
	if environment.pcall(getHugeLevel) then
		reportFailure("Should error upon entering invalid level[1]")
	end

	local function getZeroIndex()
		environment.debug.getconstant(1, 0)
	end
	if environment.pcall(getZeroIndex) then
		reportFailure("Should error upon entering invalid index[2]")
	end

	local function getZeroLevel()
		environment.debug.getconstant(0, 1)
	end
	if environment.pcall(getZeroLevel) then
		reportFailure("Should error upon entering invalid level[2]")
	end
end
