local floorToHundredthsRef, reportResult, failureMap, failureFlag, checkpointLogger, _packResults, _unpackResults, environment =
	...

local function fail(message)
	reportResult(false, "fireproximityprompt", message)
	if failureMap.fireproximityprompt then
		failureFlag[1] = true
	end
end

-- The server reports through this part's Transparency (floored to two decimals):
-- 0.8 means the prompt fired as expected, 0.4 is treated as a failure.
local function serverTransparency()
	return floorToHundredthsRef[1](environment.workspace.eeeeeeeeeeeeeeeeeeee.Transparency)
end

return function()
	if serverTransparency() == 0.8 then
		fail("Failed to fire a proximityprompt on the server")
		return
	end

	environment.workspace.somestufffirst.CFrame = environment.workspace.somestufflast.CFrame
	environment.task.wait(0.1)
	environment.workspace.somestufffirst.CFrame = environment.CFrame.new(50, 50, 300)
	environment.fireproximityprompt(environment.workspace.gwentsotsk.Part.ProximityPrompt)

	local remainingTicks = 300
	repeat
		environment.task.wait()
		remainingTicks -= 1
		checkpointLogger("waiting for false", environment.workspace.eeeeeeeeeeeeeeeeeeee.Transparency)
	until serverTransparency() == 0.8 or serverTransparency() == 0.4 or remainingTicks <= 0

	if serverTransparency() ~= 0.8 and serverTransparency() ~= 0.4 then
		checkpointLogger(serverTransparency())
		fail("Failed to fire a proximityprompt on the server.")
	end
	if serverTransparency() == 0.4 then
		fail("Failed to fire a proximityprompt on the server")
	end
	if remainingTicks <= 0 and serverTransparency() ~= 0.8 then
		fail("Timed out while waiting for a response from the server")
	end
end
