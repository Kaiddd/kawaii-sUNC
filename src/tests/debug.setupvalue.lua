local reportResult, captured2, failureFlag, environment
reportResult, captured2, failureFlag, environment = ...
return function(argument)
  local upvalue2, pcall2Result2
  if not environment.getsenv then
    reportResult(false, "debug.setupvalue", "getsenv is needed in order to test")
    if captured2["debug.setupvalue"] then
      failureFlag[1] = true
    end
  end
  local getTool2 = environment.getsenv(environment.game.Players.LocalPlayer.Character.Animate).getTool
  environment.debug.setupvalue(getTool2, 1, environment.game)
  local upvalue = environment.debug.getupvalue(getTool2, 1)
  upvalue2 = upvalue
  if upvalue == environment.game then
    upvalue2 = false
  else
    upvalue2 = true
  end
  if upvalue2 then
    reportResult(false, "debug.setupvalue", "Couldn't set the upvalue of a script's function")
    upvalue2 = captured2["debug.setupvalue"]
    if upvalue2 then
      upvalue2 = true
      failureFlag[1] = true
    end
  end
  environment.debug.setupvalue(getTool2, 1, environment.game.Players.LocalPlayer.Character)
  local values = {}
  values[1] = upvalue2
  local values2 = values
  
  local function callback(argument)
    return
  end
  
  values[1] = callback
  local pcall2 = environment.pcall
  
  local function callback2(argument)
    local setupvalue2 = environment.debug.setupvalue
    
    local function callback(argument)
      return
    end
    
    setupvalue2(callback, 0, 0)
    return
  end
  
  local pcall2Result = pcall2(callback2)
  pcall2Result2 = pcall2Result
  if pcall2Result then
    reportResult(false, "debug.setupvalue", "Should error upon entering an invalid upvalue index[1]")
    pcall2Result2 = captured2["debug.setupvalue"]
    if pcall2Result2 then
      pcall2Result2 = true
      failureFlag[1] = true
    end
  end
  local pcall3 = environment.pcall
  do
    local value9
    value9 = values2
    
    function pcall2Result2(argument)
      environment.debug.setupvalue(value9[1], 2147483648, 0)
      return
    end
  end
  if pcall3(pcall2Result2) then
    reportResult(false, "debug.setupvalue", "Should error upon entering an invalid upvalue index[2]")
    if captured2["debug.setupvalue"] then
      failureFlag[1] = true
    end
  end
  local pcall4 = environment.pcall
  
  local function callback3(argument)
    environment.debug.setupvalue(2147483648, 1, 1)
    return
  end
  
  if pcall4(callback3) then
    reportResult(false, "debug.setupvalue", "Should error upon entering an invalid level[1]")
    if captured2["debug.setupvalue"] then
      failureFlag[1] = true
    end
  end
  local pcall5 = environment.pcall
  
  local function callback4(argument)
    environment.debug.setupvalue(0, 1, 1)
    return
  end
  
  if not pcall5(callback4) then
    return
  end
  reportResult(false, "debug.setupvalue", "Should error upon entering an invalid level[2]")
  if not captured2["debug.setupvalue"] then
    return
  end
  failureFlag[1] = true
  return
end
