local reportResult, failureMap, failureFlag, environment = ...

return function()
	local clickDetector = environment.Instance.new("ClickDetector")
	local fired = false
	clickDetector.MouseClick:Once(function(player)
		if player ~= environment.game.Players.LocalPlayer then
			reportResult(false, "fireclickdetector", "Wrong argument passed")
			if failureMap.fireclickdetector then
				failureFlag[1] = true
			end
		end
		fired = true
	end)
	environment.fireclickdetector(clickDetector)
	environment.task.wait()

	if clickDetector.Parent ~= nil then
		reportResult(false, "fireclickdetector", "Let it go bro...\240\159\146\148\240\159\146\148[2]")
		if failureMap.fireclickdetector then
			failureFlag[1] = true
		end
	end
	if not fired then
		reportResult(false, "fireclickdetector", "Couldn't fire the click detector")
		if failureMap.fireclickdetector then
			failureFlag[1] = true
		end
	end

	local eventDetector = environment.Instance.new("ClickDetector")
	local clickFired = false
	local hoverEnterFired = false
	local rightClickFired = false
	local hoverLeaveFired = false
	eventDetector.MouseClick:Connect(function()
		clickFired = true
	end)
	eventDetector.MouseHoverEnter:Connect(function()
		hoverEnterFired = true
	end)
	eventDetector.RightMouseClick:Connect(function()
		rightClickFired = true
	end)
	eventDetector.MouseHoverLeave:Connect(function()
		hoverLeaveFired = true
	end)

	environment.fireclickdetector(eventDetector, 0, "MouseClick")
	environment.task.wait()
	environment.fireclickdetector(eventDetector, 0, "RightMouseClick")
	environment.task.wait()
	environment.fireclickdetector(eventDetector, 0, "MouseHoverEnter")
	environment.task.wait()
	environment.fireclickdetector(eventDetector, 0, "MouseHoverLeave")
	environment.task.wait()

	-- The messages below do not line up with the flags they check; this matches the original test
	if not clickFired then
		reportResult(false, "fireclickdetector", "Failed to fire with 'MouseClick' as 3rd argument")
		if failureMap.fireclickdetector then
			failureFlag[1] = true
		end
	end
	if not hoverEnterFired then
		reportResult(false, "fireclickdetector", "Failed to fire with 'RightMouseClick' as 3rd argument")
		if failureMap.fireclickdetector then
			failureFlag[1] = true
		end
	end
	if not rightClickFired then
		reportResult(false, "fireclickdetector", "Failed to fire with 'MouseHoverEnter' as 3rd argument")
		if failureMap.fireclickdetector then
			failureFlag[1] = true
		end
	end
	if not hoverLeaveFired then
		reportResult(false, "fireclickdetector", "Failed to fire with 'MouseHoverEnter' as 3rd argument")
		if failureMap.fireclickdetector then
			failureFlag[1] = true
		end
	end
end
