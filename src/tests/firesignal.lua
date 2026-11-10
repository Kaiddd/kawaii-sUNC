local captured1, reportResult, failureMap, failureFlag, captured5, packResults, unpackResults, environment
captured1, reportResult, failureMap, failureFlag, captured5, packResults, unpackResults, environment = ...
return function(argument)
  local values423, values33, item, values53, childAdded5, value, callback
  value = nil
  argument = not environment.getrawmetatable
  if argument then
  else
    argument = captured1.getrawmetatable
  end
  if argument then
    local reportResult4 = reportResult
    reportResult4(false, "firesignal", "getrawmetatable is not working properly, can't test")
    if failureMap.firesignal then
      failureFlag[1] = true
    end
  end
  if not environment.setreadonly then
    local reportResult3 = reportResult
    value = "setreadonly is needed in order to test"
    reportResult3(false, "firesignal", "setreadonly is needed in order to test")
    if failureMap.firesignal then
      failureFlag[1] = true
    end
  end
  local textButton = environment.Instance.new("TextButton")
  local values = {}
  values[1] = "new"
  local values2 = values
  values[1] = false
  local captured5Result = captured5()
  local values3 = {}
  values3[1] = value
  values3[1] = false
  local mouseButton1Click = textButton.MouseButton1Click
  values33 = values3
  local connect = mouseButton1Click.Connect
  local mouseButton1Click2 = mouseButton1Click
  local values32 = values3
  do
    local values22, values322
    values22 = values2
    values322 = values32
    
    function values33(argument, argument2, argument3)
      values22[1] = argument
      values322[1] = argument2
      return
    end
  end
  connect(mouseButton1Click2, values33)
  environment.firesignal(textButton.MouseButton1Click, captured5Result, "2")
  environment.task.wait(0.075)
  item = values2[1]
  if item == captured5Result then
    item = false
  else
    item = true
  end
  if item then
  else
    item = values32[1]
    if item == "2" then
      item = false
    else
      item = true
    end
  end
  if item then
    reportResult(false, "firesignal", "Couldn't fire the signal successfully")
    if failureMap.firesignal then
      failureFlag[1] = true
    end
  end
  local part = environment.Instance.new("Part")
  local part2 = part
  local workspace2 = environment.workspace
  part.Parent = workspace2
  part.Name = "LPLPLPLPL"
  local newResult = environment.CFrame.new(0, -200, 0)
  part2.CFrame = newResult
  part2.Anchored = true
  local values4 = {}
  values4[1] = true
  local values42 = values4
  values4[1] = false
  local propertyChangedSignal = part2:GetPropertyChangedSignal("Position")
  values423 = values42
  local propertyChangedSignal2 = propertyChangedSignal
  local connect2 = propertyChangedSignal2.Connect
  local propertyChangedSignal22 = propertyChangedSignal2
  local values422 = values42
  do
    local value15
    value15 = values422
    
    function values423(argument)
      value15[1] = true
      return
    end
  end
  connect2(propertyChangedSignal22, values423)
  local firesignal2 = environment.firesignal
  local packResults2 = packResults
  local getPropertyChangedSignal = part2.GetPropertyChangedSignal
  local packResults2Result = packResults2(getPropertyChangedSignal(part2, "Position"))
  local unpackResults2 = unpackResults
  local resultCount = packResults2Result.n
  firesignal2(unpackResults2(packResults2Result, 1, resultCount))
  environment.task.wait(0.075)
  if not values422[1] then
    reportResult(false, "firesignal", "Couldn't fire the signal successfully [2]")
    if failureMap.firesignal then
      failureFlag[1] = true
    end
  end
  part2:Destroy()
  local folder = environment.Instance.new("Folder")
  local folder2 = folder
  local values5 = {}
  values5[1] = "Folder"
  values5[1] = false
  local childAdded = folder.ChildAdded
  values53 = values5
  local connect3 = childAdded.Connect
  local childAdded2 = childAdded
  local values52 = values5
  do
    local value16
    value16 = values52
    
    function values53(argument)
      if not environment.pcall(environment.getfenv, 3) then
        return
      end
      value16[1] = true
      return
    end
  end
  connect3(childAdded2, values53)
  values53 = environment.firesignal
  childAdded5 = folder2.ChildAdded
  values53(childAdded5)
  values423 = values52[1]
  if values423 then
    local reportResult2 = reportResult
    childAdded5 = false
    reportResult2(false, "firesignal", "Found the caller in the callstack while firing the signal")
    local failureMap2 = failureMap
    values53 = "firesignal"
    if failureMap2.firesignal then
      failureFlag[1] = true
    end
  end
  local values6 = {}
  values6[1] = values53
  local values62 = values6
  values6[1] = false
  local values7 = {}
  values7[1] = childAdded5
  local values72 = values7
  values7[1] = false
  local folder3 = environment.Instance.new("Folder")
  local folder32 = folder3
  local childAdded3 = folder3.ChildAdded
  local childAdded32 = childAdded3
  local connect4 = childAdded3.Connect
  local childAdded33 = childAdded3
  do
    local values622, values722 = nil, childAdded32
    values622 = values62
    values722 = values72
    
    function callback(argument, argument2, argument3)
      argument3 = "szs"
      if argument == "szs" then
        argument3 = false
      else
        argument3 = true
      end
      if argument3 then
        values622[1] = true
      end
      argument3 = environment.game
      if argument2 == argument3 then
        argument3 = false
      else
        argument3 = true
      end
      if not argument3 then
        return
      end
      values722[1] = true
      return
    end
  end
  connect4(childAdded33, callback)
  local values8 = {}
  values8[1] = childAdded32
  local values82 = values8
  values8[1] = false
  local values9 = {}
  values9[1] = callback
  local values92 = values9
  values9[1] = false
  local childAdded4 = folder32.ChildAdded
  values33 = values82
  local connect5 = childAdded4.Connect
  local childAdded42 = childAdded4
  local values822 = values82
  do
    local values8222, values922 = nil, values72
    values8222 = values822
    values922 = values92
    
    function values33(argument, argument2, argument3)
      argument3 = "szs"
      if argument == "szs" then
        argument3 = false
      else
        argument3 = true
      end
      if argument3 then
        values8222[1] = true
      end
      argument3 = environment.game
      if argument2 == argument3 then
        argument3 = false
      else
        argument3 = true
      end
      if not argument3 then
        return
      end
      values922[1] = true
      return
    end
  end
  connect5(childAdded42, values33)
  environment.firesignal(folder32.ChildAdded, "szs", environment.game)
  if values62[1] then
    reportResult(false, "firesignal", "Failed to fire multiple signals with the proper arguments[1]")
    if failureMap.firesignal then
      failureFlag[1] = true
    end
  end
  if values72[1] then
    reportResult(false, "firesignal", "Failed to fire multiple signals with the proper arguments[2]")
    if failureMap.firesignal then
      failureFlag[1] = true
    end
  end
  if values822[1] then
    reportResult(false, "firesignal", "Failed to fire multiple signals with the proper arguments[3]")
    if failureMap.firesignal then
      failureFlag[1] = true
    end
  end
  if values92[1] then
    reportResult(false, "firesignal", "Failed to fire multiple signals with the proper arguments[4]")
    if failureMap.firesignal then
      failureFlag[1] = true
    end
  end
  local frame = environment.Instance.new("Frame")
  local frame2 = frame
  local rawmetatable = environment.getrawmetatable(frame)
  local rawmetatable2 = rawmetatable
  local __type2 = rawmetatable.__type
  environment.setreadonly(rawmetatable, false)
  rawmetatable.__type = "RBXScriptSignal"
  item = false
  local values10 = {}
  values10[1] = "RBXScriptSignal"
  local values102 = values10
  values10[1] = false
  local spawn2 = environment.task.spawn
  do
    local frame22, values1022 = nil, values92
    frame22 = frame2
    values1022 = values102
    
    function item(argument)
      local pcall2 = environment.pcall
      
      local function callback(argument)
        environment.firesignal(frame22, 9, 9, 9, 9, 9, 9, 9, 9, 9)
        values1022[1] = true
        return
      end
      
      pcall2(callback)
      return
    end
  end
  spawn2(item)
  if values102[1] then
    reportResult(false, "firesignal", "Should error upon passing an invalid instance")
    if failureMap.firesignal then
      failureFlag[1] = true
    end
  end
  environment.getrawmetatable(frame2).__type = __type2
  environment.setreadonly(rawmetatable2, true)
  environment.task.wait(0.01)
  local typeofResult = environment.typeof(frame2)
  item = typeofResult
  if typeofResult ~= "RBXScriptSignal" then
    item = false
  else
    item = true
  end
  if item then
  else
    item = environment.getrawmetatable(frame2).__type
    if item ~= "RBXScriptSignal" then
      item = false
    else
      item = true
    end
  end
  if not item then
    return
  end
  reportResult(false, "getrawmetatable", "Failed to set back the __type of an instance. ( Instance -> Signal -> Instance ) ")
  if not failureMap.firesignal then
    return
  end
  failureFlag[1] = true
  return
end
