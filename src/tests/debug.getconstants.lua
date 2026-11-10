local reportResult, captured2, failureFlag, checkpointLogger, environment
reportResult, captured2, failureFlag, checkpointLogger, environment = ...
return function(argument)
  local item
  if not environment.getsenv then
    reportResult(false, "debug.getconstants", "getsenv is needed in order to test")
    if captured2["debug.getconstants"] then
      failureFlag[1] = true
    end
  end
  local onFreeFall2 = environment.getsenv(environment.game.Players.LocalPlayer.Character.Animate).onFreeFall
  item = environment.debug.getconstants(onFreeFall2)[1]
  if item == "playAnimation" then
    item = false
  else
    item = true
  end
  if not item then
  else
    item = environment.debug.getconstants(onFreeFall2)[2]
    if item == "fall" then
      item = false
    else
      item = true
    end
  end
  if item then
    reportResult(false, "debug.getconstants", "Couldn't retrieve the correct constants from a script's function")
    if captured2["debug.getconstants"] then
      failureFlag[1] = true
    end
  end
  if environment.pcall(environment.debug.getconstants, checkpointLogger) then
    reportResult(false, "debug.getconstants", "Didn't error on passing C-closures")
    if captured2["debug.getconstants"] then
      failureFlag[1] = true
    end
  end
  local pcall2 = environment.pcall
  
  local function callback(argument)
    environment.getconstants(281474976710655)
    return
  end
  
  if pcall2(callback) then
    reportResult(false, "debug.getconstants", "Should error upon passing an invalid level[1]")
    if captured2["debug.getconstants"] then
      failureFlag[1] = true
    end
  end
  local pcall3 = environment.pcall
  
  local function callback2(argument)
    environment.getconstants(0)
    return
  end
  
  if pcall3(callback2) then
    reportResult(false, "debug.getconstants", "Should error upon passing an invalid level[2]")
    if captured2["debug.getconstants"] then
      failureFlag[1] = true
    end
  end
  local pcall4 = environment.pcall
  
  local function callback3(argument)
    environment.getconstants(32)
    return
  end
  
  if not pcall4(callback3) then
    return
  end
  reportResult(false, "debug.getconstants", "Should error upon passing an invalid level[3]")
  if not captured2["debug.getconstants"] then
    return
  end
  failureFlag[1] = true
  return
end
