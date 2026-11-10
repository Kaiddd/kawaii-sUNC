local reportResult, captured2, failureFlag, packResults, unpackResults, environment
reportResult, captured2, failureFlag, packResults, unpackResults, environment = ...
return function(argument)
  local value, value2, tostring2Result, unpackResults3, resultCount2
  if not environment.getscriptclosure then
    reportResult(false, "debug.getconstant", "getscriptclosure is needed in order to test")
    if captured2["debug.getconstant"] then
      failureFlag[1] = true
    end
  end
  local getscriptclosure2 = environment.getscriptclosure
  local game2 = environment.game
  local scriptclosure2 = getscriptclosure2(game2:GetService("Players").LocalPlayer.PlayerScripts.PlayerScriptsLoader)
  local scriptclosure22 = scriptclosure2
  local tostring2 = environment.tostring
  local getconstant2 = environment.debug.getconstant
  local results = packResults(getconstant2(scriptclosure2, 7))
  unpackResults3 = unpackResults
  resultCount2 = results.n
  tostring2Result = tostring2(unpackResults3(results, 1, resultCount2))
  value2 = tostring2Result
  value = "WaitForChild"
  if tostring2Result == "WaitForChild" then
    value2 = false
  else
    value2 = true
  end
  if not value2 then
  else
    local tostring3 = environment.tostring
    local getconstant3 = environment.debug.getconstant
    local results2 = packResults(getconstant3(scriptclosure22, 3))
    local unpackResults2 = unpackResults
    local resultCount = results2.n
    local tostring3Result = tostring3(unpackResults2(results2, 1, resultCount))
    value2 = tostring3Result
    if tostring3Result == "script" then
      value2 = false
    else
      value2 = true
    end
  end
  if value2 then
    reportResult(false, "debug.getconstant", "Couldn't retrieve the correct constant(s) from a script's closure")
    if captured2["debug.getconstant"] then
      failureFlag[1] = true
    end
  end
  local pcall2 = environment.pcall
  
  local function callback(argument)
    environment.debug.getconstant(1, 72057594037927936)
    return
  end
  
  if pcall2(callback) then
    reportResult(false, "debug.getconstant", "Should error upon entering invalid index[1]")
    if captured2["debug.getconstant"] then
      failureFlag[1] = true
    end
  end
  local pcall3 = environment.pcall
  
  local function callback2(argument)
    environment.debug.getconstant(1152921504606846976, 0)
    return
  end
  
  if pcall3(callback2) then
    reportResult(false, "debug.getconstant", "Should error upon entering invalid level[1]")
    if captured2["debug.getconstant"] then
      failureFlag[1] = true
    end
  end
  local pcall4 = environment.pcall
  
  local function callback3(argument)
    environment.debug.getconstant(1, 0)
    return
  end
  
  if pcall4(callback3) then
    reportResult(false, "debug.getconstant", "Should error upon entering invalid index[2]")
    if captured2["debug.getconstant"] then
      failureFlag[1] = true
    end
  end
  local pcall5 = environment.pcall
  
  local function callback4(argument)
    environment.debug.getconstant(0, 1)
    return
  end
  
  if not pcall5(callback4) then
    return
  end
  reportResult(false, "debug.getconstant", "Should error upon entering invalid level[2]")
  if not captured2["debug.getconstant"] then
    return
  end
  failureFlag[1] = true
  return
end
