local failureMap, reportResult, failureFlag, options, checkpointLogger, random, _packResults, _unpackResults, environment =
	...

-- Flags written by hooked functions live in tables so they stay shared even if
-- hookfunction copies the hook's upvalues into the target.
return function()
	if not failureMap.hookfunction then
		reportResult(false, "restorefunction", "Can't test due to 'hookfunction' not working reliably")
		if failureMap.restorefunction then
			failureFlag[1] = true
		end
		return
	end

	if options.printcheckpoints then
		checkpointLogger("restorefunction-1: L -> C Restore")
	end
	if options.delaybetweentests > 0 then
		environment.task.wait(options.delaybetweentests)
	end

	for _ = 1, 5 do
		environment.task.wait()

		-- L -> L hook on a BindableFunction callback
		local hookCalled = { false }
		local bindable = environment.Instance.new("BindableFunction")
		local function original(_)
			hookCalled[1] = false
		end
		local function hook(_)
			hookCalled[1] = true
		end
		environment.hookfunction(original, hook)
		bindable.OnInvoke = original
		bindable:Invoke()
		environment.task.wait()
		environment.restorefunction(original)
		environment.task.wait()
		bindable:Invoke()
		environment.task.wait()
		if hookCalled[1] then
			reportResult(false, "restorefunction", "Couldn't restore a function back to original")
			if failureMap.restorefunction then
				failureFlag[1] = true
			end
		end

		-- L -> C hook: hooked to coroutine.yield, then restored inside the coroutine
		local originalCalled = { false }
		local yieldTarget = function(_)
			originalCalled[1] = true
		end
		environment.hookfunction(yieldTarget, environment.coroutine.yield)
		local thread = environment.coroutine.create(function()
			environment.coroutine.yield()
			yieldTarget()
			environment.restorefunction(yieldTarget)
			yieldTarget()
		end)
		environment.coroutine.resume(thread)
		environment.coroutine.resume(thread)
		environment.coroutine.resume(thread)
		environment.task.wait()
		if not originalCalled[1] then
			reportResult(false, "restorefunction", "Failed to restore a L -> C hook back to original[1]")
			if failureMap.restorefunction then
				failureFlag[1] = true
			end
		end
	end

	if options.printcheckpoints then
		checkpointLogger("restorefunction-2: C -> C and L -> C Restore")
	end
	if options.delaybetweentests > 0 then
		environment.task.wait(options.delaybetweentests)
	end

	-- With coroutine.yield hooked to coroutine.resume the wrapped coroutine runs to completion
	local hookedFinished = false
	local hookedSpawnRan = false
	environment.hookfunction(environment.coroutine.yield, environment.coroutine.resume)
	environment.coroutine.wrap(function()
		environment.coroutine.yield(environment.task.spawn(function()
			hookedSpawnRan = true
		end))
		hookedFinished = true
	end)()
	environment.task.wait()
	environment.restorefunction(environment.coroutine.yield)

	-- Once restored it must suspend again
	local restoredFinished = false
	local restoredSpawnRan = false
	if hookedFinished and hookedSpawnRan then
		environment.coroutine.wrap(function()
			environment.coroutine.yield(environment.task.spawn(function()
				restoredSpawnRan = true
			end))
			restoredFinished = true
		end)()
	end
	if restoredFinished or not restoredSpawnRan then
		reportResult(false, "restorefunction", "Failed to restore a C -> C hook back to original[1]")
		if failureMap.restorefunction then
			failureFlag[1] = true
		end
	end

	local function emptyHook(_) end
	local function returnsBBB(_)
		return "BBB"
	end
	for _ = 1, 115 do
		environment.hookfunction(environment.coroutine.yield, environment.coroutine.resume)
		environment.hookfunction(environment.coroutine.resume, environment.coroutine.resume)
		environment.hookfunction(environment.coroutine.resume, environment.coroutine.yield)
		environment.hookfunction(environment.coroutine.yield, emptyHook)
		environment.hookfunction(returnsBBB, environment.coroutine.yield)
		environment.restorefunction(returnsBBB)
		environment.restorefunction(environment.coroutine.yield)
		environment.restorefunction(environment.coroutine.resume)
	end

	local resumedPastYield = false
	local yieldingThread = environment.coroutine.create(function()
		environment.coroutine.yield()
		resumedPastYield = true
	end)
	environment.coroutine.resume(yieldingThread)
	if resumedPastYield then
		reportResult(false, "restorefunction", "Failed to restore a C -> C hook back to original[2]")
		if failureMap.restorefunction then
			failureFlag[1] = true
		end
	end
	environment.coroutine.resume(yieldingThread)
	if not resumedPastYield then
		reportResult(false, "restorefunction", "Failed to restore a C -> C hook back to original[3]")
		if failureMap.restorefunction then
			failureFlag[1] = true
		end
	end
	if returnsBBB() ~= "BBB" then
		reportResult(false, "restorefunction", "Failed to restore a L -> C hook back to original[2]")
		if failureMap.restorefunction then
			failureFlag[1] = true
		end
	end

	-- Hooking twice and restoring once must go all the way back to the original
	local lastCalled = {}
	local function target(_)
		lastCalled[1] = 1
	end
	local function firstHook(_)
		lastCalled[1] = 2
	end
	environment.hookfunction(target, firstHook)
	local function secondHook(_)
		lastCalled[1] = 3
	end
	environment.hookfunction(target, secondHook)
	environment.restorefunction(target)
	target()
	if lastCalled[1] ~= 1 then
		reportResult(false, "restorefunction", "Failed to fully restore a hooked function")
		if failureMap.restorefunction then
			failureFlag[1] = true
		end
	end

	if options.printcheckpoints then
		checkpointLogger("restorefunction-3: Restore NC[1] -> NC[2] and NC[2] -> NC[1] x4")
		if failureMap.restorefunction then
			failureFlag[1] = true
		end
	end
	if options.delaybetweentests > 0 then
		environment.task.wait(options.delaybetweentests)
	end

	-- New C closures hooked onto each other, then both restored
	local firstValue = random()
	local secondValue = random()
	local function getFirstValue(...)
		return firstValue
	end
	local firstClosure = environment.newcclosure(getFirstValue)
	local function getSecondValue(...)
		return secondValue
	end
	local secondClosure = environment.newcclosure(getSecondValue)
	environment.hookfunction(firstClosure, secondClosure)
	environment.hookfunction(secondClosure, firstClosure)
	environment.hookfunction(secondClosure, firstClosure)
	environment.hookfunction(secondClosure, firstClosure)
	environment.hookfunction(secondClosure, firstClosure)
	environment.restorefunction(firstClosure)
	environment.restorefunction(secondClosure)
	if firstClosure() ~= firstValue then
		reportResult(false, "restorefunction", "Failed to restore NC[1] -> NC[2] -> NC[1]. [1]")
		if failureMap.restorefunction then
			failureFlag[1] = true
		end
	end
	if secondClosure() ~= secondValue then
		reportResult(false, "restorefunction", "Failed to restore NC[1] -> NC[2] -> NC[1]. [2]")
		if failureMap.restorefunction then
			failureFlag[1] = true
		end
	end
end
