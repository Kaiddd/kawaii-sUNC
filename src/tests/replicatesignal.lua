local reportResult, failureMap, failureFlag, environment = ...

local function fail(message)
	reportResult(false, "replicatesignal", message)
	if failureMap.replicatesignal then
		failureFlag[1] = true
	end
end

-- Each replicated signal makes the server tag an instance; poll for the tag (up to 400 frames).
return function()
	environment.replicatesignal(
		environment.game.Players.LocalPlayer.PlayerGui.ScreenGui.Frame.MouseWheelForward,
		3,
		2147483648
	)
	local remainingTicks = 400
	repeat
		environment.task.wait()
		remainingTicks -= 1
	until environment.game.Players.LocalPlayer:HasTag("thunderclient?") or remainingTicks <= 0
	if not environment.game.Players.LocalPlayer:HasTag("thunderclient?") then
		fail("Timed out while trying to trigger Frame.MouseWheelForward signal with specific arguments.")
	end

	environment.replicatesignal(
		environment.workspace.replicatesigmal.ProximityPrompt.TriggerEndedActionReplicated,
		environment.game.Players.LocalPlayer
	)
	remainingTicks = 400
	repeat
		environment.task.wait()
		remainingTicks -= 1
	until environment.workspace.FreakyBox:HasTag("Boi so tuff rn") or remainingTicks <= 0
	if not environment.workspace.FreakyBox:HasTag("Boi so tuff rn") then
		fail("Timed out while trying to trigger ProximityPrompt.TriggerEndedActionReplicated signal")
	end

	environment.replicatesignal(
		environment.game.Players.LocalPlayer.PlayerGui.ScreenGui.Frame.TextButton.MouseButton1Click
	)
	remainingTicks = 400
	repeat
		environment.task.wait()
		remainingTicks -= 1
	until environment.workspace.FreakyBox.e:HasTag("bro, hello? - flushed") or remainingTicks <= 0
	if not environment.workspace.FreakyBox.e:HasTag("bro, hello? - flushed") then
		fail("Timed out while trying to trigger TextButton.MouseButton1Click")
	end

	local localPlayer = environment.game:GetService("Players").LocalPlayer
	environment.replicatesignal(localPlayer.PlayerGui.ArcHandles.MouseDrag, environment.Enum.Axis.Y, -55.116, -0.1)
	remainingTicks = 400
	repeat
		environment.task.wait()
		remainingTicks -= 1
	until environment.workspace.FreakyBox:HasTag("Begging on everyone's knees to be popular") or remainingTicks <= 0
	if not environment.workspace.FreakyBox:HasTag("Begging on everyone's knees to be popular") then
		fail("Timed out while trying to trigger ArcHandles.MouseDrag signal")
	end
end
