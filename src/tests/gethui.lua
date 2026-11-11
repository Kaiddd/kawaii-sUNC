local failedTests, reportResult, environment = ...

return function()
	if failedTests.setthreadidentity or not environment.setthreadidentity then
		reportResult(false, "gethui", "setthreadidentity is needed in order to test")
	end

	environment.gethui()

	-- Anything parented to gethui() must not show up under CoreGui
	local connection = environment.game.CoreGui.DescendantAdded:Connect(function(descendant)
		environment.task.wait()
		if descendant:FindFirstChild("kingvon") then
			reportResult(
				false,
				"gethui",
				"King Von did not die for this \240\159\152\173\240\159\150\164\240\159\146\148"
			)
		end
	end)

	local frame = environment.Instance.new("Frame")
	frame.Name = "kingvon"
	frame.Parent = environment.gethui()
	environment.task.wait()
	connection:Disconnect()

	if environment.gethui() ~= environment.gethui() then
		reportResult(false, "gethui", "Shouldn't create different references each time it's called")
	end
end
