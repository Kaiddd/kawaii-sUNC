local captured1, reportResult, environment
captured1, reportResult, environment = ...
return function(argument)
  local hui2
  argument = captured1.setthreadidentity
  if argument then
  else
    argument = not environment.setthreadidentity
  end
  if argument then
    reportResult(false, "gethui", "setthreadidentity is needed in order to test")
  end
  environment.gethui()
  local descendantAdded = environment.game.CoreGui.DescendantAdded
  local descendantAdded2 = descendantAdded
  local connect = descendantAdded.Connect
  
  local function callback(argument, argument2)
    environment.task.wait()
    if not argument:FindFirstChild("kingvon") then
      return
    end
    reportResult(false, "gethui", "King Von did not die for this \240\159\152\173\240\159\150\164\240\159\146\148")
    return
  end
  
  local connectResult = connect(descendantAdded2, callback)
  local frame = environment.Instance.new("Frame")
  local frame2 = frame
  frame.Name = "kingvon"
  local hui = environment.gethui()
  frame2.Parent = hui
  environment.task.wait()
  connectResult:Disconnect()
  hui2 = environment.gethui()
  if hui2 == environment.gethui() then
    hui2 = false
  else
    hui2 = true
  end
  if not hui2 then
    return
  end
  reportResult(false, "gethui", "Shouldn't create different references each time it's called")
  return
end
