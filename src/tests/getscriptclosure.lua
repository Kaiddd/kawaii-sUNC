local reportResult, failureMap, failureFlag, captured4, packResults, unpackResults, environment
reportResult, failureMap, failureFlag, captured4, packResults, unpackResults, environment = ...
return function(argument)
  local value5, value6, value7, value8, value9, value10, value12, value13, value42, tostring2Result, value16, value17, constants2, environment2, value23
  if not environment.debug.getconstants then
    reportResult(false, "getscriptclosure", "debug.getconstants is needed in order to test")
    if failureMap.getscriptclosure then
      failureFlag[1] = true
    end
  end
  local pcall2 = environment.pcall
  local getscriptclosure2 = environment.getscriptclosure
  local game2 = environment.game
  if not pcall2(getscriptclosure2, game2:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule) then
    reportResult(false, "getscriptclosure", "Failed to retrieve the closure from a ModuleScript")
    if failureMap.getscriptclosure then
      failureFlag[1] = true
    end
  end
  if not environment.pcall(environment.getscriptclosure, environment.game.Players.LocalPlayer.Character.Animate) then
    reportResult(false, "getscriptclosure", "Failed to retrieve the closure from a LocalScript")
    if failureMap.getscriptclosure then
      failureFlag[1] = true
    end
  end
  local pcall3 = environment.pcall
  local getscriptclosure3 = environment.getscriptclosure
  local game3 = environment.game
  if not pcall3(getscriptclosure3, game3:GetService("ReplicatedStorage").Folder.Folder.Script) then
    reportResult(false, "getscriptclosure", "Failed to retrieve the closure from a Script with RunContext set to Client")
    if failureMap.getscriptclosure then
      failureFlag[1] = true
    end
  end
  local getconstants2 = environment.debug.getconstants
  local getscriptclosure4 = environment.getscriptclosure
  local game4 = environment.game
  local script = game4:GetService("ReplicatedStorage").Folder.Folder.Script
  local results = packResults(getscriptclosure4(script))
  local unpackResults2 = unpackResults
  local resultCount = results.n
  constants2 = getconstants2(unpackResults2(results, 1, resultCount))
  value5 = false
  value6 = false
  value7 = false
  value9 = 0
  value8 = ""
  environment2 = environment
  local pairs2 = environment2.pairs
  tostring2Result, value16, value17 = pairs2(constants2)
  local value = tostring2Result
  local value2 = value16
  value10 = value17
  value13 = value17
  while true do
    tostring2Result, value16 = value(value2, value13)
    local value3 = tostring2Result
    local value4 = value16
    value13 = nil
    if tostring2Result == nil then
      value13 = true
    else
      value13 = false
    end
    if value13 then
      break
    end
    value13 = value3
    value42 = value4
    value9 = value9 + 1
    value23 = value8 .. environment.tostring(value4) .. [[

						]]
    value8 = value23
    local tostringResult = environment.tostring(value4)
    value10 = tostringResult
    if tostringResult == "Color" then
      value10 = true
    else
      value10 = false
    end
    if value10 then
      value5 = true
    end
    constants2 = environment.tostring(value42)
    value10 = constants2
    if constants2 == "50" then
      value10 = true
    else
      value10 = false
    end
    if value10 then
      value6 = true
    end
    environment2 = environment
    local tostring2 = environment2.tostring
    value16 = value42
    tostring2Result = tostring2(value42)
    value10 = tostring2Result
    value12 = "create"
    if tostring2Result == "create" then
      value10 = true
    else
      value10 = false
    end
    if value10 then
      value7 = true
    end
  end
  value10 = not value5 or not value6 or not value7
  if value10 then
    local captured42 = captured4
    local formatResult = environment.string.format("\r\n\r\n\t\t\t\t\t\tReturned one or more wrong constants from a script's closure using this:\r\n\t\t\t\t\t\tdebug.getconstants(getscriptclosure(game:GetService(\"ReplicatedStorage\").Folder.Folder.Script))\r\n\r\n\t\t\t\t\t\tOutput returned:\r\n\r\n\t\t\t\t\t\t%s\r\n\t\t\t\t\t", value8)
    captured42.getscriptclosure = formatResult
  end
  if not value5 then
    reportResult(false, "getscriptclosure", "Couldn't find a constant from the script's closure[1]")
    if failureMap.getscriptclosure then
      failureFlag[1] = true
    end
  end
  if not value6 then
    reportResult(false, "getscriptclosure", "Couldn't find a constant from the script's closure[2]")
    if failureMap.getscriptclosure then
      failureFlag[1] = true
    end
  end
  if value7 then
    return
  end
  reportResult(false, "getscriptclosure", "Couldn't find a constant from the script's closure[3]")
  if not failureMap.getscriptclosure then
    return
  end
  failureFlag[1] = true
  return
end
