local reportResult, captured2, failureFlag, packResults, unpackResults, environment
reportResult, captured2, failureFlag, packResults, unpackResults, environment = ...
return function(argument)
  local value6, item11, value7, item73, item83, item92, value22, pairs3, results32, environment2
  if not environment.getscriptclosure then
    reportResult(false, "debug.getprotos", "getscriptclosure is needed in order to test")
    if captured2["debug.getprotos"] then
      failureFlag[1] = true
    end
  end
  local game2 = environment.game
  local value = game2:GetService("ReplicatedFirst")["Wow?"]
  local scriptclosure = environment.getscriptclosure(value)
  value6 = 0
  pairs3 = environment.pairs
  local debug2 = environment.debug
  argument = "getprotos"
  local getprotos2 = debug2.getprotos
  local results = packResults(getprotos2(scriptclosure))
  local unpackResults2 = unpackResults
  local resultCount = results.n
  local callbackResult = (function(a_native_fixed_result_call_1, ...)
    return {
      a_native_fixed_result_call_1(...)
    }
  end)(pairs3, unpackResults2(results, 1, resultCount))
  local item = callbackResult[1]
  local item2 = callbackResult[2]
  item11 = callbackResult[3]
  local item3 = item
  local item22 = item2
  while true do
    pairs3, results32 = item3(item22, item11)
    local value5 = pairs3
    item11 = nil
    if pairs3 == nil then
      item11 = true
    else
      item11 = false
    end
    if item11 then
      break
    end
    item11 = value5
    argument = 1
    value6 = value6 + 1
  end
  local game3 = environment.game
  local sunchookfuncthing2 = game3:GetService("ReplicatedFirst").sunchookfuncthing
  local scriptclosure2 = environment.getscriptclosure(sunchookfuncthing2)
  value7 = 0
  argument = environment.pairs
  pairs3 = argument
  local getprotos3 = environment.debug.getprotos
  local results2 = packResults(getprotos3(scriptclosure2))
  local unpackResults3 = unpackResults
  local resultCount2 = results2.n
  local callbackResult2 = (function(a_native_fixed_result_call_1, ...)
    return {
      a_native_fixed_result_call_1(...)
    }
  end)(argument, unpackResults3(results2, 1, resultCount2))
  local item4 = callbackResult2[1]
  local item5 = callbackResult2[2]
  local item6 = callbackResult2[3]
  local item42 = item4
  local item52 = item5
  item11 = item6
  while true do
    pairs3, results32 = item42(item52, item11)
    local value4 = pairs3
    item11 = nil
    if pairs3 == nil then
      item11 = true
    else
      item11 = false
    end
    if item11 then
      break
    end
    item11 = value4
    argument = 1
    value7 = value7 + 1
  end
  argument = value6 + value7
  if argument ~= 8 then
    argument = true
  else
    argument = false
  end
  if argument then
    reportResult(false, "debug.getprotos", "Invalid script's proto count")
    if captured2["debug.getprotos"] then
      failureFlag[1] = true
    end
  end
  argument = nil
  local pairs2 = environment.pairs
  pairs3 = pairs2
  environment2 = environment
  local getgc2 = environment2.getgc
  local results3 = packResults(getgc2())
  results32 = results3
  local unpackResults4 = unpackResults
  local resultCount3 = results3.n
  local callbackResult3 = (function(a_native_fixed_result_call_1, ...)
    return {
      a_native_fixed_result_call_1(...)
    }
  end)(pairs2, unpackResults4(results3, 1, resultCount3))
  local item7 = callbackResult3[1]
  local item8 = callbackResult3[2]
  local item9 = callbackResult3[3]
  item73 = item7
  item83 = item8
  item11 = item9
  local item72 = item7
  local item82 = item8
  item92 = item9
  while true do
    pairs3, results32 = item72(item82, item92)
    item73 = pairs3
    local value2 = results32
    item83 = nil
    if pairs3 == nil then
      item83 = true
    else
      item83 = false
    end
    if item83 then
      break
    end
    item92 = item73
    value22 = value2
    environment2 = environment
    local value3 = environment2.type
    results32 = value22
    pairs3 = value3(value22)
    item83 = pairs3
    item11 = "function"
    if pairs3 == "function" then
      item83 = true
    else
      item83 = false
    end
    if item83 then
      environment2 = environment
      local info2 = environment2.debug.info
      results32 = value22
      pairs3 = info2(value22, "n")
      item83 = pairs3
      item11 = "forgives_flushed"
      if pairs3 == "forgives_flushed" then
        item83 = true
      else
        item83 = false
      end
    end
    if item83 then
      argument = value22
    end
  end
  pairs3 = environment.debug.getprotos(argument)
  local item10 = pairs3[1]
  if item10 then
    local pcall4 = environment.pcall
    do
      local item102, value18, value19, value20
      item102 = item10
      
      function argument(argument)
        local item102Result = item102()
        argument = item102Result
        if item102Result ~= "blablabla" then
          argument = false
        else
          argument = true
        end
        if not argument then
          return
        end
        reportResult(false, "debug.getprotos", "Inactive protos should not be callable")
        if not captured2["debug.getprotos"] then
          return
        end
        failureFlag[1] = true
        return
      end
    end
    pcall4(argument)
    return
  end
  local reportResult2 = reportResult
  pairs3 = reportResult2
  argument = "Failed to retrieve a proto from a game function"
  reportResult2(false, "debug.getprotos", "Failed to retrieve a proto from a game function")
  if not captured2["debug.getprotos"] then
    local pcall3 = environment.pcall
    do
      local item103, value21, value23, value24
      item103 = item10
      
      function argument(argument)
        local item103Result = item103()
        argument = item103Result
        if item103Result ~= "blablabla" then
          argument = false
        else
          argument = true
        end
        if not argument then
          return
        end
        reportResult(false, "debug.getprotos", "Inactive protos should not be callable")
        if not captured2["debug.getprotos"] then
          return
        end
        failureFlag[1] = true
        return
      end
    end
    pcall3(argument)
    return
  end
  failureFlag[1] = true
  local pcall2 = environment.pcall
  do
    local item104, value25, value26, value27
    item104 = item10
    
    function argument(argument)
      local item104Result = item104()
      argument = item104Result
      if item104Result ~= "blablabla" then
        argument = false
      else
        argument = true
      end
      if not argument then
        return
      end
      reportResult(false, "debug.getprotos", "Inactive protos should not be callable")
      if not captured2["debug.getprotos"] then
        return
      end
      failureFlag[1] = true
      return
    end
  end
  pcall2(argument)
  return
end
