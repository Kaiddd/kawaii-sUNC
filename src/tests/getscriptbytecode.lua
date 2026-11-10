local reportResult, failureMap, failureFlag, environment
reportResult, failureMap, failureFlag, environment = ...
return function(argument)
  local value, result3, byte2, byteResult4
  local game2 = environment.game
  local rbxCharacterSounds = game2:GetService("Players").LocalPlayer.PlayerScripts.RbxCharacterSounds
  local scriptbytecode = environment.getscriptbytecode(rbxCharacterSounds)
  local scriptbytecode2 = scriptbytecode
  local result = environment.type(scriptbytecode)
  result3 = result
  if result == "string" then
    result3 = false
  else
    result3 = true
  end
  if result3 then
    reportResult(false, "getscriptbytecode", "Couldn't fetch the script's bytecode")
    if failureMap.getscriptbytecode then
      failureFlag[1] = true
    end
  end
  byte2 = environment.string.byte
  local result2 = byte2(scriptbytecode2, 1)
  local result22 = result2
  if not (result2 < 3) then
    byte2 = false
  else
    byte2 = true
  end
  if byte2 then
  elseif not (result22 > 10) then
    byte2 = false
  else
    byte2 = true
  end
  if byte2 then
    reportResult(false, "getscriptbytecode", "Didn't return the correct byte[1]")
    if failureMap.getscriptbytecode then
      failureFlag[1] = true
    end
  end
  if not environment.string.find(scriptbytecode2, "terminate") then
    reportResult(false, "getscriptbytecode", "Couldn't fetch a string from the bytecode[1]")
    if failureMap.getscriptbytecode then
      failureFlag[1] = true
    end
  end
  local scriptbytecode3 = environment.getscriptbytecode(environment.workspace.replicatesigmal.Script)
  local scriptbytecode32 = scriptbytecode3
  byteResult4 = environment.string.byte(scriptbytecode3, 1)
  argument = byteResult4
  if not (byteResult4 < 3) then
    argument = false
  else
    argument = true
  end
  if argument then
  else
    local byteResult3 = environment.string.byte(scriptbytecode32, 1)
    argument = byteResult3
    if not (byteResult3 > 10) then
      argument = false
    else
      argument = true
    end
  end
  if argument then
    reportResult(false, "getscriptbytecode", "Didn't return the correct byte[2]")
    if failureMap.getscriptbytecode then
      failureFlag[1] = true
    end
  end
  if not environment.string.find(scriptbytecode32, "TriggerEnded") then
    reportResult(false, "getscriptbytecode", "Couldn't fetch a string from the bytecode[2]")
    if failureMap.getscriptbytecode then
      failureFlag[1] = true
    end
  end
  if environment.string.find(scriptbytecode32, "TriggerEndedP") then
    reportResult(false, "getscriptbytecode", "Was able to retrieve an invalid string from the bytecode[1]")
    if failureMap.getscriptbytecode then
      failureFlag[1] = true
    end
  end
  local scriptbytecode4 = environment.getscriptbytecode(environment.workspace.replicatesigmal.Script)
  local scriptbytecode42 = scriptbytecode4
  byteResult4 = environment.string.byte(scriptbytecode4, 1)
  result3 = byteResult4
  if not (byteResult4 < 3) then
    result3 = false
  else
    result3 = true
  end
  if result3 then
  else
    local byteResult2 = environment.string.byte(scriptbytecode42, 1)
    result3 = byteResult2
    if not (byteResult2 > 10) then
      result3 = false
    else
      result3 = true
    end
  end
  if result3 then
    reportResult(false, "getscriptbytecode", "Didn't return the correct byte[2]")
    if failureMap.getscriptbytecode then
      failureFlag[1] = true
    end
  end
  if not environment.string.find(scriptbytecode42, "TriggerEnded") then
    reportResult(false, "getscriptbytecode", "Couldn't fetch a string from the bytecode[2]")
    if failureMap.getscriptbytecode then
      failureFlag[1] = true
    end
  end
  if environment.string.find(scriptbytecode42, "TriggerEndedP") then
    reportResult(false, "getscriptbytecode", "Was able to retrieve an invalid string from the bytecode[1]")
    if failureMap.getscriptbytecode then
      failureFlag[1] = true
    end
  end
  local getscriptbytecode2 = environment.getscriptbytecode
  local game3 = environment.game
  local scriptbytecode22 = getscriptbytecode2(game3:GetService("ReplicatedStorage")["would_you_be_a_bop_if_you_were_a_girl?"]["yes? Interesting..."])
  local scriptbytecode222 = scriptbytecode22
  byteResult4 = environment.string.byte(scriptbytecode22, 1)
  value = byteResult4
  if not (byteResult4 < 3) then
    value = false
  else
    value = true
  end
  if value then
  else
    local byteResult = environment.string.byte(scriptbytecode222, 1)
    value = byteResult
    if not (byteResult > 10) then
      value = false
    else
      value = true
    end
  end
  if value then
    reportResult(false, "getscriptbytecode", "Didn't return the correct byte[3]")
    if failureMap.getscriptbytecode then
      failureFlag[1] = true
    end
  end
  if not environment.string.find(scriptbytecode222, "IWantToChill") then
    reportResult(false, "getscriptbytecode", "Couldn't fetch a string from the bytecode[3]")
    if failureMap.getscriptbytecode then
      failureFlag[1] = true
    end
  end
  local findResult = environment.string.find(scriptbytecode222, "IWantToChillW")
  value = findResult
  if findResult then
  else
    value = environment.string.find(scriptbytecode222, "IWantToChill ")
  end
  if not value then
    return
  end
  reportResult(false, "getscriptbytecode", "Was able to retrieve an invalid string from the bytecode[2]")
  if not failureMap.getscriptbytecode then
    return
  end
  failureFlag[1] = true
  return
end
