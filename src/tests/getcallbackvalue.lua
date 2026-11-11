local integrityMarkers, reportResult, failureMap, failureFlag, checkpointLogger, _packResults, _unpackResults, environment =
	...

return function()
	-- The program checks this marker after the test to make sure it actually ran
	integrityMarkers.whytheystoptostare = true

	local gotCallback, invalidCallback = environment.pcall(function()
		return environment.getcallbackvalue("", "OnInvoke")
	end)
	if gotCallback and environment.type(invalidCallback) == "function" then
		reportResult(false, "getcallbackvalue", "Was able to get a callback from an invalid instance")
		if failureMap.getcallbackvalue then
			failureFlag[1] = true
		end
	end

	-- Members that are not callbacks must not crash the executor; errors are ignored
	environment.pcall(function()
		environment.getcallbackvalue(environment.game, "Close")
		environment.getcallbackvalue(environment.game, "IsA")
		environment.getcallbackvalue(environment.game, "GetPropertyChangedSignal")
		environment.getcallbackvalue(environment.game, "\n\n\n\n\n\n\t")
		environment.getcallbackvalue(environment.game, environment.string.rep("0", 0))
		environment.getcallbackvalue(environment.Instance.new("Part"), "SetPredictionMode")
	end)

	local invoked = false
	local bindable = environment.Instance.new("BindableFunction")
	local function onInvoke()
		invoked = true
	end
	bindable.OnInvoke = onInvoke

	local callback = environment.getcallbackvalue(bindable, "OnInvoke")
	if callback ~= onInvoke or environment.tostring(callback) ~= environment.tostring(onInvoke) then
		reportResult(false, "getcallbackvalue", "The callback received does not match the actual callback")
		if failureMap.getcallbackvalue then
			failureFlag[1] = true
		end
	end
	checkpointLogger(callback)
	callback()
	environment.task.wait()
	if not invoked then
		reportResult(false, "getcallbackvalue", "The callback value didn't behave as expected")
		if failureMap.getcallbackvalue then
			failureFlag[1] = true
		end
	end
end
