local reportResult, failureMap, failureFlag, environment
reportResult, failureMap, failureFlag, environment = ...
return function(argument)
  local triggerEndedActionReplicated, mouseButton1Click, mouseWheelForward, replicatesignal2, hasTag, environment2
  replicatesignal2 = environment.replicatesignal
  environment2 = environment
  mouseWheelForward = environment2.game.Players.LocalPlayer.PlayerGui.ScreenGui.Frame.MouseWheelForward
  replicatesignal2(mouseWheelForward, 3, 2147483648)
  argument = 400
  repeat
    mouseWheelForward = environment.task.wait
    mouseWheelForward()
    argument = argument - 1
    environment2 = environment
    local localPlayer2 = environment2.game.Players.LocalPlayer
    hasTag = localPlayer2:HasTag("thunderclient?")
    replicatesignal2 = hasTag
    if not hasTag then
      mouseWheelForward = 0
      if argument <= 0 then
        replicatesignal2 = true
      else
        replicatesignal2 = false
      end
    end
  until replicatesignal2
  local localPlayer = environment.game.Players.LocalPlayer
  hasTag = localPlayer:HasTag("thunderclient?")
  if not hasTag then
    reportResult(false, "replicatesignal", "Timed out while trying to trigger Frame.MouseWheelForward signal with specific arguments.")
    if failureMap.replicatesignal then
      hasTag = failureFlag
      hasTag[1] = true
    end
  end
  mouseWheelForward = environment.replicatesignal
  triggerEndedActionReplicated = environment.workspace.replicatesigmal.ProximityPrompt.TriggerEndedActionReplicated
  environment2 = environment
  mouseWheelForward(triggerEndedActionReplicated, environment2.game.Players.LocalPlayer)
  replicatesignal2 = 400
  repeat
    triggerEndedActionReplicated = environment.task.wait
    triggerEndedActionReplicated()
    replicatesignal2 = replicatesignal2 - 1
    environment2 = environment
    local freakyBox4 = environment2.workspace.FreakyBox
    hasTag = freakyBox4:HasTag("Boi so tuff rn")
    mouseWheelForward = hasTag
    if not hasTag then
      triggerEndedActionReplicated = 0
      if replicatesignal2 <= 0 then
        mouseWheelForward = true
      else
        mouseWheelForward = false
      end
    end
  until mouseWheelForward
  local freakyBox = environment.workspace.FreakyBox
  hasTag = freakyBox:HasTag("Boi so tuff rn")
  if not hasTag then
    reportResult(false, "replicatesignal", "Timed out while trying to trigger ProximityPrompt.TriggerEndedActionReplicated signal")
    if failureMap.replicatesignal then
      hasTag = failureFlag
      hasTag[1] = true
    end
  end
  triggerEndedActionReplicated = environment.replicatesignal
  environment2 = environment
  mouseButton1Click = environment2.game.Players.LocalPlayer.PlayerGui.ScreenGui.Frame.TextButton.MouseButton1Click
  triggerEndedActionReplicated(mouseButton1Click)
  mouseWheelForward = 400
  repeat
    mouseButton1Click = environment.task.wait
    mouseButton1Click()
    mouseWheelForward = mouseWheelForward - 1
    environment2 = environment
    local e3 = environment2.workspace.FreakyBox.e
    hasTag = e3:HasTag("bro, hello? - flushed")
    triggerEndedActionReplicated = hasTag
    if not hasTag then
      mouseButton1Click = 0
      if mouseWheelForward <= 0 then
        triggerEndedActionReplicated = true
      else
        triggerEndedActionReplicated = false
      end
    end
  until triggerEndedActionReplicated
  local e2 = environment.workspace.FreakyBox.e
  if not e2:HasTag("bro, hello? - flushed") then
    reportResult(false, "replicatesignal", "Timed out while trying to trigger TextButton.MouseButton1Click")
    if failureMap.replicatesignal then
      failureFlag[1] = true
    end
  end
  mouseButton1Click = environment.replicatesignal
  local game2 = environment.game
  hasTag = game2:GetService("Players")
  local mouseDrag = hasTag.LocalPlayer.PlayerGui.ArcHandles.MouseDrag
  environment2 = environment
  local y = environment2.Enum.Axis.Y
  argument = -0.1
  mouseButton1Click(mouseDrag, y, -55.116, -0.1)
  triggerEndedActionReplicated = 400
  repeat
    argument = environment.task.wait
    argument()
    triggerEndedActionReplicated = triggerEndedActionReplicated - 1
    environment2 = environment
    local freakyBox3 = environment2.workspace.FreakyBox
    hasTag = freakyBox3:HasTag("Begging on everyone's knees to be popular")
    mouseButton1Click = hasTag
    if not hasTag then
      argument = 0
      if triggerEndedActionReplicated <= 0 then
        mouseButton1Click = true
      else
        mouseButton1Click = false
      end
    end
  until mouseButton1Click
  local freakyBox2 = environment.workspace.FreakyBox
  if freakyBox2:HasTag("Begging on everyone's knees to be popular") then
    return
  end
  reportResult(false, "replicatesignal", "Timed out while trying to trigger ArcHandles.MouseDrag signal")
  if not failureMap.replicatesignal then
    return
  end
  failureFlag[1] = true
  return
end
