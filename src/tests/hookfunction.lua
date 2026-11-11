local reportResult, failureMap, failureFlag, warningLogger, options, checkpointLogger, random, failureDetails, _packResults, _unpackResults, environment =
	...

return function()
	local function reportFailure(message)
		reportResult(false, "hookfunction", message)
		if failureMap.hookfunction then
			failureFlag[1] = true
		end
	end

	local function beginSection(label)
		if options.printcheckpoints then
			checkpointLogger(label)
		end
		if options.delaybetweentests > 0 then
			environment.task.wait(options.delaybetweentests)
		end
	end

	-- Same condition as the original: only bails out when getsenv is missing but newcclosure exists.
	if not (environment.getsenv or not environment.newcclosure) then
		reportFailure("getsenv and newcclosure is needed in order to test")
		return
	end

	-- The helper script hooks a function inside a game script, which sets the ImageLabel's Active flag.
	if environment.workspace["I AM SUNC_0"].SurfaceGui.ImageLabel.Active == true then
		reportFailure("Failed to successfully hook a script's function")
	end
	local helperResult, helperDetail = environment.loadstring(
		environment.game:HttpGet(
			"https://raw.githubusercontent.com/Kaiddd/kawaii-sUNC/main/src/test-dependencies/hookfunction-helper.lua"
		)
	)()
	local attemptsLeft = 66
	repeat
		environment.task.wait()
		attemptsLeft -= 1
	until environment.workspace["I AM SUNC_0"].SurfaceGui.ImageLabel.Active or attemptsLeft <= 0
	warningLogger(helperResult, helperDetail)
	if environment.workspace["I AM SUNC_0"].SurfaceGui.ImageLabel.Active == false then
		reportFailure("Failed to successfully hook a script's function")
	end
	environment.workspace["I AM SUNC_0"].SurfaceGui.ImageLabel.Active = false

	beginSection("hookfunction-1: L -> L[1]")
	do
		local function hookWithOneArgument()
			local function emptyFunction(_) end
			environment.hookfunction(emptyFunction)
		end
		if environment.pcall(hookWithOneArgument) then
			reportFailure("Hookfunction did not error when only one parameter was passed")
		end

		local hookState = {}
		local function hookTarget(_)
			hookState[1] = 1
		end
		local function firstHook(_)
			hookState[1] = 2
		end
		environment.hookfunction(hookTarget, firstHook)
		local function secondHook(_)
			hookState[1] = 3
		end
		environment.hookfunction(hookTarget, secondHook)
		hookTarget()
		if hookState[1] ~= 3 then
			reportResult(false, "restorefunction", "Failed to hook a hook")
			if failureMap.hookfunction then
				failureFlag[1] = true
			end
		end

		local callCount = { 0 }
		local function countingTarget(_)
			callCount[1] += 1
			return false
		end
		local hookedValue = random(10, 80)
		local function returningHook(_)
			return true, "harhar", hookedValue
		end
		local originalTarget = environment.hookfunction(countingTarget, returningHook)
		if originalTarget() ~= false then
			reportFailure("Function didn't return hooked value")
		end
		if options.printcheckpoints then
			checkpointLogger("hookfunction-1: L -> L[2]")
		end
		local first, second, third = countingTarget()
		if first ~= true or second ~= "harhar" or third ~= hookedValue then
			reportFailure("Function didn't return hooked value")
		end
		local success, pcallFirst, pcallSecond, pcallThird = environment.pcall(countingTarget)
		if not success then
			reportFailure("Hooked function threw an error when it shouldn't")
		end
		if pcallFirst ~= true or pcallSecond ~= "harhar" or pcallThird ~= hookedValue then
			reportFailure("Function didn't return the needed values in a pcall")
		end
		environment.hookfunction(countingTarget, originalTarget)

		local bindable = environment.Instance.new("BindableFunction")
		local function renameToRespect(_)
			bindable.Name = "Respect"
		end
		environment.Function2_ = renameToRespect
		bindable.OnInvoke = environment.Function2_
		local function renameToSigma(_)
			bindable.Name = "Sigma moment"
		end
		environment.hookfunction(environment.Function2_, renameToSigma)
		bindable:Invoke()
		if bindable.Name ~= "Sigma moment" then
			reportFailure("Couldn't hook the function and change the value")
		end
	end

	beginSection("hookfunction-2: C -> L")
	do
		local function hookCToL()
			local hookCalled = { false }
			local function resumeHook(argument, _)
				if argument == "Hello" then
					hookCalled[1] = true
				end
			end
			local originalResume = environment.hookfunction(environment.coroutine.resume, resumeHook)
			environment.coroutine.resume("Hello")
			if not hookCalled[1] then
				reportFailure("Failed to hook C -> L Closures")
			end
			hookCalled[1] = false
			environment.hookfunction(environment.coroutine.resume, originalResume)
			environment.pcall(environment.coroutine.resume, "Hello")
			environment.task.wait()
			if hookCalled[1] then
				reportFailure("Failed to restore a C -> L hook back to original[1]")
			end
		end
		local success, err = environment.pcall(hookCToL)
		if not success then
			reportFailure("Encountered an error trying to hook C -> L Closures: " .. environment.tostring(err))
		end
	end

	beginSection("hookfunction-3: L -> C")
	do
		local function hookLToC()
			local stillRunning = { true }
			local function returnsTwo(_)
				return "2"
			end
			local originalReturnsTwo = environment.hookfunction(returnsTwo, environment.coroutine.yield)
			local function callHookedThenMark(_)
				returnsTwo()
				stillRunning[1] = false
			end
			environment.coroutine.wrap(callHookedThenMark)()
			if not stillRunning[1] then
				reportFailure("Failed to hook L -> C Closures")
			end
			environment.hookfunction(returnsTwo, originalReturnsTwo)
			if returnsTwo() ~= "2" then
				reportFailure("Failed to restore an L -> C hook back to original[1]")
			end
		end
		local success, err = environment.pcall(hookLToC)
		if not success then
			reportFailure("Encountered an error trying to hook L -> C Closures: " .. environment.tostring(err))
		end
	end

	beginSection("hookfunction-4: C -> C")
	do
		local function hookCToC()
			local resumed = { false }
			local function markResumed(_)
				resumed[1] = true
			end
			local thread = environment.coroutine.create(markResumed)
			local originalYield = environment.hookfunction(environment.coroutine.yield, environment.coroutine.resume)
			environment.coroutine.yield(thread)
			if not resumed[1] then
				reportFailure("Failed to hook C -> C Closures")
			end
			resumed[1] = false
			environment.hookfunction(environment.coroutine.yield, originalYield)
			environment.task.spawn(environment.coroutine.yield, thread)
			environment.task.wait()
			if resumed[1] then
				reportFailure("Failed to restore a C -> C hook back to original")
			end
		end
		local success, err = environment.pcall(hookCToC)
		if not success then
			reportFailure("Encountered an error trying to hook `C -> C` Closures: " .. environment.tostring(err))
		end
	end

	beginSection("hookfunction-5: L -> C -> L")
	do
		local function returnsOne(_)
			return "1"
		end
		local function returnsTwo(_)
			return "2"
		end
		local originalReturnsOne = {}
		originalReturnsOne[1] = environment.hookfunction(returnsOne, environment.coroutine.wrap)
		-- returnsOne now behaves like coroutine.wrap, so this produces a wrapped call to the original returnsOne.
		local function wrapOriginal(_)
			local function callOriginal(_)
				return originalReturnsOne[1]()
			end
			return returnsOne(callOriginal)
		end
		local wrappedOriginal = returnsOne(wrapOriginal)()
		local originalReturnsTwo = environment.hookfunction(returnsTwo, environment.coroutine.resume)
		local originalWrap = environment.hookfunction(environment.coroutine.wrap, returnsTwo)
		local hookedError = environment.select(2, environment.pcall(returnsOne))
		local wrapError = environment.select(2, environment.pcall(environment.coroutine.wrap))
		if wrappedOriginal() ~= "1" then
			reportFailure("Failed to get a valid return from and 'old' function")
		end
		if not environment.string.find(hookedError, "missing argument #1 to 'resume'") then
			reportFailure("Retrieved an invalid error message when trying to call a hooked function[1]")
			failureDetails.hookfunction = environment.string.format(
				"\r\n\r\n\t\t\t\t\t\t\t\thookfunction L -> C -> L returned an invalid error message (err1), expected \"missing argument #1 to 'resume', got:\r\n\r\n\t\t\t\t\t\t\t\t%s\r\n\r\n\t\t\t\t\t\t\t",
				hookedError
			)
		end
		if not environment.string.find(wrapError, "missing argument #1 to 'resume'") then
			reportFailure("Retrieved an invalid error message when trying to call a hooked function[2]")
			failureDetails.hookfunction = environment.string.format(
				"\r\n\r\n\t\t\t\t\t\t\t\thookfunction L -> C -> L returned an invalid error message (err2), expected \"missing argument #1 to 'resume', got:\r\n\r\n\t\t\t\t\t\t\t\t%s\r\n\r\n\t\t\t\t\t\t\t",
				wrapError
			)
		end
		environment.hookfunction(environment.coroutine.wrap, originalWrap)
		environment.hookfunction(returnsOne, originalReturnsOne[1])
		environment.hookfunction(returnsTwo, originalReturnsTwo)
		if returnsOne() ~= "1" then
			reportFailure("Failed to restore an L -> C hook back to original[2]")
		end
		if returnsTwo() ~= "2" then
			reportFailure("Failed to restore an L -> C hook back to original[3]")
		end
		local function emptyBody(_) end
		if environment.type(environment.coroutine.wrap(emptyBody)) ~= "function" then
			reportFailure("Failed to restore a C -> L hook back to original[2]")
		end
	end

	beginSection("hookfunction-6: L -> NC")
	do
		local function luaTarget(_) end
		local initialCount = random(99, 520)
		local hookCount = { initialCount }
		local function countHook(_)
			hookCount[1] += 1
		end
		local newCClosureHook = environment.newcclosure(countHook)
		local function hookLToNC()
			return environment.hookfunction(luaTarget, newCClosureHook)
		end
		local success, originalTarget = environment.pcall(hookLToNC)
		if not success then
			reportFailure("Encountered an error trying to hook L -> NC Closures: " .. originalTarget)
		end
		luaTarget()
		if hookCount[1] ~= initialCount + 1 then
			reportFailure("Failed to hook L -> NC Closures")
		end
		local function restoreLToNC()
			environment.hookfunction(luaTarget, originalTarget)
		end
		local restoreSuccess, restoreError = environment.pcall(restoreLToNC)
		if not restoreSuccess then
			reportFailure("Encountered an error trying to restore a L -> NC hook: " .. restoreError)
		end
		luaTarget()
		if hookCount[1] == 7 then
			reportFailure("Failed to restore a L -> NC hook")
		end
	end

	beginSection("hookfunction-7: NC -> L")
	do
		local function emptyFunction(_) end
		local newCClosureTarget = environment.newcclosure(emptyFunction)
		local initialValue = random(30, 120)
		local hookValue = { initialValue }
		local function luaHook(_)
			hookValue[1] += 0.5
		end
		local function hookNCToL()
			return environment.hookfunction(newCClosureTarget, luaHook)
		end
		local success, originalTarget = environment.pcall(hookNCToL)
		if not success then
			reportFailure("Encountered an error trying to hook NC -> L Closures: " .. originalTarget)
		end
		newCClosureTarget()
		luaHook()
		if hookValue[1] ~= initialValue + 1 then
			reportFailure("Failed to hook NC -> L Closures")
		end
		local function restoreNCToL()
			environment.hookfunction(newCClosureTarget, originalTarget)
		end
		local restoreSuccess, restoreError = environment.pcall(restoreNCToL)
		if not restoreSuccess then
			reportFailure("Encountered an error trying to restore a NC -> L hook: " .. restoreError)
		end
		newCClosureTarget()
		if hookValue[1] == 8 then
			reportFailure("Failed to restore a NC -> L hook")
		end
	end

	beginSection("hookfunction-8: NC -> C")
	do
		local function hookNCToC()
			local stillRunning = { true }
			local function returnsTwo(_)
				return "2"
			end
			local newCClosureTarget = environment.newcclosure(returnsTwo)
			local originalTarget = environment.hookfunction(newCClosureTarget, environment.coroutine.yield)
			local function callHookedThenMark(_)
				newCClosureTarget()
				stillRunning[1] = false
			end
			environment.coroutine.wrap(callHookedThenMark)()
			if not stillRunning[1] then
				reportFailure("Failed to hook NC -> C Closures")
			end
			environment.hookfunction(newCClosureTarget, originalTarget)
			if newCClosureTarget() ~= "2" then
				reportFailure("Failed to restore an NC -> C hook back to original[1]")
			end
		end
		local success, err = environment.pcall(hookNCToC)
		if not success then
			reportFailure("Encountered an error trying to hook NC -> C Closures: " .. environment.tostring(err))
		end
	end

	beginSection("hookfunction-9: C -> NC")
	do
		local function hookCToNC()
			local hookCalled = { false }
			local function resumeHook(argument, _)
				if argument == "Hello" then
					hookCalled[1] = true
				end
			end
			local newCClosureHook = environment.newcclosure(resumeHook)
			local originalResume = environment.hookfunction(environment.coroutine.resume, newCClosureHook)
			environment.coroutine.resume("Hello")
			if not hookCalled[1] then
				reportFailure("Failed to hook C -> NC Closures")
			end
			hookCalled[1] = false
			environment.hookfunction(environment.coroutine.resume, originalResume)
			environment.pcall(environment.coroutine.resume, "Hello")
			if hookCalled[1] then
				reportFailure("Failed to restore a C -> NC hook back to original[1]")
			end
		end
		local success, err = environment.pcall(hookCToNC)
		if not success then
			reportFailure("Encountered an error trying to hook C -> NC Closures: " .. environment.tostring(err))
		end
	end

	beginSection("hookfunction-10: detection & ENV leak test")
	local originalNamecall = {}
	local function namecallHook(...)
		return originalNamecall[1](...)
	end
	originalNamecall[1] =
		environment.hookfunction(environment.getrawmetatable(environment.game).__namecall, namecallHook)
	-- The place's detector fingerprints __namecall every frame and flags a change within a
	-- frame or two, so watch every frame for 1 second (was 28 checks 0.1 s apart, 2.8 s).
	local detectionDeadline = environment.os.clock() + 1
	repeat
		environment.task.wait()
		-- Plain index + call rather than a method call: __namecall is hooked at this point.
		local flagHolder = environment.game.ReplicatedStorage.TestFuncs.awuuu
		local detected = flagHolder.GetAttribute(flagHolder, "cwazybwo")
	until detected or environment.os.clock() >= detectionDeadline
	environment.hookfunction(environment.getrawmetatable(environment.game).__namecall, originalNamecall[1])
	if environment.game.ReplicatedStorage.TestFuncs.awuuu:GetAttribute("cwazybwo") then
		reportFailure("generic namecall hook detected")
	end
end
