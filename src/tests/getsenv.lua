local reportResult, failureMap, failureFlag, failureMap4, packResults, unpackResults, metadata, environment
reportResult, failureMap, failureFlag, failureMap4, packResults, unpackResults, metadata, environment = ...
return function(argument)
  local value, value2, value3, value4, values, value5, getsenv2, value6, value7, value8, value9, value11, result, value12, value13, players, resultCount, value15, resultCount2, environment2, value17
  value2 = nil
  value3 = nil
  environment2 = environment
  argument = environment2.game
  players = argument:GetService("Players")
  argument = players.LocalPlayer.Character.Animate
  value5 = false
  values = {}
  value6 = 1
  value7 = 20
  value8 = 1
  while true do
    if value6 <= value7 then
      value = true
    else
      value = false
    end
    if not value then
      break
    end
    environment2 = environment
    getsenv2 = environment2.getsenv
    result = getsenv2(argument)
    value = result
    values[value6] = result
    value6 = value6 + value8
  end
  environment2 = environment
  value6 = environment2.pairs
  result, value12, value13 = value6(values)
  value7 = result
  value6 = value12
  getsenv2 = value13
  value4 = result
  value8 = value12
  value9 = value13
  while true do
    result, value12 = value4(value8, value9)
    getsenv2 = result
    values = value12
    value6 = nil
    if result == nil then
      value6 = true
    else
      value6 = false
    end
    if value6 then
      break
    end
    value9 = getsenv2
    value6 = values
    environment2 = environment
    values = environment2.getsenv
    value12 = argument
    result = values(argument)
    value7 = result
    if value6 ~= result then
      value6 = true
    else
      value6 = false
    end
    if value6 then
      value7 = reportResult
      result = value7
      values = false
      value12 = false
      value7(false, "getsenv", "Returned table should be static")
      value6 = failureMap.getsenv
      if value6 then
        value6 = true
        players = failureFlag
        players[1] = true
      end
    end
  end
  value7 = environment.getsenv
  if value7(environment.game.Players.LocalPlayer.PlayerScripts.lefty).groksays ~= environment.getsenv(environment.game.Players.LocalPlayer.PlayerScripts.lefty).groksays then
    value7 = true
  else
    value7 = false
  end
  if value7 then
    reportResult(false, "getsenv", "Boi what sigma you doing \240\159\152\130\240\159\164\148")
    if failureMap.getsenv then
      failureFlag[1] = true
    end
  end
  result = environment.getsenv(argument)
  value7 = result
  result = environment.type(result)
  values = result
  if result ~= "table" then
    values = true
  else
    values = false
  end
  if values then
    reportResult(false, "getsenv", "Didn't return a table value")
    if failureMap.getsenv then
      failureFlag[1] = true
    end
  end
  values = value7.script
  if values ~= argument then
    values = true
  else
    values = false
  end
  if values then
    reportResult(false, "getsenv", "Script global shouldn't differ")
    if failureMap.getsenv then
      failureFlag[1] = true
    end
    value2 = metadata["127"][1]
  end
  if not value7.onRunning then
    value5 = true
    reportResult(false, "getsenv", "Failed to fetch a value from the script's env[1]")
    if failureMap.getsenv then
      failureFlag[1] = true
    end
  end
  result = environment.type
  getsenv2 = value7.getToolAnim
  argument = environment.workspace
  players = packResults(getsenv2(argument))
  value11 = players
  resultCount = players.n
  value15 = 31
  if not (resultCount < 31) then
    value2 = value11[value15]
  end
  resultCount = unpackResults
  resultCount2 = value11.n
  players = result(resultCount(value11, 1, resultCount2))
  values = players
  if players ~= "nil" then
    values = true
  else
    values = false
  end
  if values then
    value5 = true
    reportResult(false, "getsenv", "Failed to retrieve the value from the script's function")
    if failureMap.getsenv then
      failureFlag[1] = true
    end
  end
  value4 = environment.pcall
  
  function value(argument)
    local getsenv2 = environment.getsenv
    local game2 = environment.game
    if not getsenv2(game2:GetService("StarterPlayer").StarterPlayerScripts.PlayerModule.CommonUtils.FlagUtil) then
      return
    end
    reportResult(false, "getsenv", "Was able to retrieve the environment of a non-running script")
    if not failureMap.getsenv then
      return
    end
    failureFlag[1] = true
    return
  end
  
  value4(value)
  values = false
  result = environment.getsenv(environment.game.Players.LocalPlayer.PlayerScripts.lefty)
  value4 = result
  value = result
  if not result then
    reportResult(false, "getsenv", "Failed to retrieve the environment of a game script")
    value = failureMap.getsenv
    if value then
      value = true
      failureFlag[1] = true
    end
  else
    value = value4.geeked
    if value ~= "locked in" then
      value = true
    else
      value = false
    end
    if value then
      values = true
      reportResult(false, "getsenv", "Failed to fetch a value from the script's env[2]")
      if failureMap.getsenv then
        failureFlag[1] = true
      end
    end
  end
  environment2 = environment
  getsenv2 = environment2.xpcall
  result = getsenv2
  
  function argument(argument)
    if environment.getsenv(environment.game.ReplicatedStorage["First I go whip out the bost"]) then
      return
    end
    reportResult(false, "getsenv", "Failed to fetch the environment of a Script with script global set to nil[1]")
    if not failureMap.getsenv then
      return
    end
    failureFlag[1] = true
    return
  end
  
  value12 = argument
  
  function value6(argument, argument2)
    reportResult(false, "getsenv", "Failed to fetch the environment of a Script with script global set to nil[2]. Error: " .. argument)
    if not failureMap.getsenv then
      return
    end
    failureFlag[1] = true
    return
  end
  
  value13 = value6
  getsenv2(argument, value6)
  value = "\n"
  getsenv2 = value5
  if value5 then
    environment2 = environment
    getsenv2 = environment2.pairs
    result, value12, value13 = getsenv2(value7)
    value7 = result
    value6 = value12
    getsenv2 = value13
    value8 = value12
    value9 = value13
    while true do
      result, value12 = value7(value8, value9)
      value5 = result
      argument = value12
      getsenv2 = nil
      if result == nil then
        getsenv2 = true
      else
        getsenv2 = false
      end
      if getsenv2 then
        break
      end
      value9 = value5
      value6 = argument
      argument = environment.tostring
      result = argument(value5)
      environment2 = environment
      value5 = environment2.tostring
      value12 = value6
      result = value5(value6)
      value5 = value2 + value3
    end
    getsenv2 = failureMap4
    value5 = environment.string.format
    value2 = "\r\n\r\n\t\t\t\t\t\tFailed to find one or more environment members from the \"Animate\" script.\r\n\r\n\t\t\t\t\t\tgetsenv(animate) return:\r\n\r\n\t\t\t\t\t\t%s\r\n\r\n\r\n\t\t\t\t\t"
    result = value5("\r\n\r\n\t\t\t\t\t\tFailed to find one or more environment members from the \"Animate\" script.\r\n\r\n\t\t\t\t\t\tgetsenv(animate) return:\r\n\r\n\t\t\t\t\t\t%s\r\n\r\n\r\n\t\t\t\t\t", value)
    getsenv2.getsenv = result
    value = "\n"
  end
  if not values then
    return
  end
  environment2 = environment
  getsenv2 = environment2.pairs
  result, value12, value13 = getsenv2(value4)
  value6 = value12
  getsenv2 = value13
  value4 = result
  value8 = value12
  value9 = value13
  while true do
    result, value12 = value4(value8, value9)
    getsenv2 = result
    values = value12
    value6 = nil
    if result == nil then
      value6 = true
    else
      value6 = false
    end
    if value6 then
      getsenv2 = failureMap4
      value6 = failureMap4.getsenv
      value2 = environment.string.format
      value12 = "\r\n\r\n\t\t\t\t\t\tFailed to find one or more environment members from the \"lefty\" script.\r\n\r\n\t\t\t\t\t\tgetsenv(lefty) return:\r\n\r\n\t\t\t\t\t\t%s\r\n\r\n\t\t\t\t\t"
      result = value2("\r\n\r\n\t\t\t\t\t\tFailed to find one or more environment members from the \"lefty\" script.\r\n\r\n\t\t\t\t\t\tgetsenv(lefty) return:\r\n\r\n\t\t\t\t\t\t%s\r\n\r\n\t\t\t\t\t", value)
      value17 = value6 .. result
      getsenv2.getsenv = value17
      return
    end
    value9 = getsenv2
    getsenv2 = environment.tostring(getsenv2)
    environment2 = environment
    value17 = environment2.tostring(values) .. "\n"
    value6 = value17
    value17 = getsenv2 .. " -> " .. value17
    getsenv2 = value17
    value17 = value .. value17
    value = value17
  end
end
