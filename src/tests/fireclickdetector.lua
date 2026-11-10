local reportResult, failureMap, failureFlag, environment
reportResult, failureMap, failureFlag, environment = ...
return function(argument)
  local parent, value3, value4, values7
  value3 = nil
  value4 = nil
  local value
  local clickDetector = environment.Instance.new("ClickDetector")
  local clickDetector2 = clickDetector
  local values = {}
  values[1] = "new"
  values[1] = false
  local mouseClick = clickDetector.MouseClick
  values7 = values
  local once = mouseClick.Once
  local mouseClick2 = mouseClick
  local values2 = values
  do
    local value17, value18, value19, values22
    values22 = values2
    
    function values7(argument, argument2)
      if argument == environment.game.Players.LocalPlayer then
        argument2 = false
      else
        argument2 = true
      end
      if not argument2 then
        values22[1] = true
        return
      end
      reportResult(false, "fireclickdetector", "Wrong argument passed")
      if not failureMap.fireclickdetector then
        values22[1] = true
        return
      end
      failureFlag[1] = true
      values22[1] = true
      return
    end
  end
  once(mouseClick2, values7)
  environment.fireclickdetector(clickDetector2)
  environment.task.wait()
  parent = clickDetector2.Parent
  values7 = nil
  if parent == nil then
    parent = false
  else
    parent = true
  end
  if parent then
    local reportResult3 = reportResult
    value3 = "fireclickdetector"
    value4 = "Let it go bro...\240\159\146\148\240\159\146\148[2]"
    reportResult3(false, "fireclickdetector", "Let it go bro...\240\159\146\148\240\159\146\148[2]")
    if failureMap.fireclickdetector then
      failureFlag[1] = true
    end
  end
  if not values2[1] then
    local reportResult2 = reportResult
    value3 = 3
    reportResult2(false, "fireclickdetector", "Couldn't fire the click detector")
    if failureMap.fireclickdetector then
      failureFlag[1] = true
    end
  end
  local clickDetector3 = environment.Instance.new("ClickDetector")
  local clickDetector32 = clickDetector3
  local values3 = {}
  values3[1] = "new"
  local values32 = values3
  values3[1] = false
  local values4 = {}
  values4[1] = value3
  local values42 = values4
  values4[1] = false
  local values5 = {}
  values5[1] = value4
  local values52 = values5
  values5[1] = false
  local values6 = {}
  values6[1] = value
  local values62 = values6
  values6[1] = false
  local mouseClick3 = clickDetector3.MouseClick
  argument = values32
  local connect = mouseClick3.Connect
  local mouseClick32 = mouseClick3
  local values322 = values32
  do
    local value20
    value20 = values322
    
    function argument(argument)
      value20[1] = true
      return
    end
  end
  connect(mouseClick32, argument)
  local mouseHoverEnter = clickDetector32.MouseHoverEnter
  argument = values322
  local connect2 = mouseHoverEnter.Connect
  local mouseHoverEnter2 = mouseHoverEnter
  local values3222 = values322
  do
    local value21
    value21 = values42
    
    function argument(argument)
      value21[1] = true
      return
    end
  end
  connect2(mouseHoverEnter2, argument)
  local rightMouseClick = clickDetector32.RightMouseClick
  argument = values3222
  local connect3 = rightMouseClick.Connect
  local rightMouseClick2 = rightMouseClick
  local values32222 = values3222
  do
    local value22
    value22 = values52
    
    function argument(argument)
      value22[1] = true
      return
    end
  end
  connect3(rightMouseClick2, argument)
  local mouseHoverLeave = clickDetector32.MouseHoverLeave
  argument = values32222
  local connect4 = mouseHoverLeave.Connect
  local mouseHoverLeave2 = mouseHoverLeave
  local values322222 = values32222
  do
    local value23
    value23 = values62
    
    function argument(argument)
      value23[1] = true
      return
    end
  end
  connect4(mouseHoverLeave2, argument)
  environment.fireclickdetector(clickDetector32, 0, "MouseClick")
  environment.task.wait()
  environment.fireclickdetector(clickDetector32, 0, "RightMouseClick")
  environment.task.wait()
  environment.fireclickdetector(clickDetector32, 0, "MouseHoverEnter")
  environment.task.wait()
  environment.fireclickdetector(clickDetector32, 0, "MouseHoverLeave")
  environment.task.wait()
  if not values322222[1] then
    reportResult(false, "fireclickdetector", "Failed to fire with 'MouseClick' as 3rd argument")
    if failureMap.fireclickdetector then
      failureFlag[1] = true
    end
  end
  if not values42[1] then
    reportResult(false, "fireclickdetector", "Failed to fire with 'RightMouseClick' as 3rd argument")
    if failureMap.fireclickdetector then
      failureFlag[1] = true
    end
  end
  if not values52[1] then
    reportResult(false, "fireclickdetector", "Failed to fire with 'MouseHoverEnter' as 3rd argument")
    if failureMap.fireclickdetector then
      failureFlag[1] = true
    end
  end
  if values62[1] then
    return
  end
  reportResult(false, "fireclickdetector", "Failed to fire with 'MouseHoverEnter' as 3rd argument")
  if not failureMap.fireclickdetector then
    return
  end
  failureFlag[1] = true
  return
end
