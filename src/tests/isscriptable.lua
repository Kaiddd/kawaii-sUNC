local failureMap, reportResult, environment = ...

return function()
	if not failureMap.setscriptable then
		reportResult(false, "isscriptable", "Can't test due to 'setscriptable' not working reliably")
		return
	end

	local script = environment.Instance.new("Script")
	if environment.isscriptable(script, "isPlayerScript") then
		reportResult(false, "isscriptable", "Returned true for a non-scriptable property")
	end

	environment.setscriptable(script, "isPlayerScript", true)
	environment.task.wait()
	if not environment.isscriptable(script, "isPlayerScript") then
		reportResult(false, "isscriptable", "Returned false for a scriptable property")
	end

	environment.task.wait(0.5)
	environment.setscriptable(script, "isPlayerScript", false)
	environment.setscriptable(script, "isPlayerScript", false)
end
