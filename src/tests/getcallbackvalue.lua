local captured4, reportResult, failureMap, failureFlag, checkpointLogger, packResults, unpackResults, environment
captured4, reportResult, failureMap, failureFlag, checkpointLogger, packResults, unpackResults, environment = ...
return function(argument)
  local value2, getcallbackvalue2, value7, value8
  captured4.whytheystoptostare = true
  local pcall2 = environment.pcall
  
  local function callback(argument)
    return environment.getcallbackvalue("", "OnInvoke")
  end
  
  value7, value8 = pcall2(callback)
  local value = value8
  value2 = value7
  if not value7 then
  else
    local result3 = environment.type(value)
    value2 = result3
    if result3 ~= "function" then
      value2 = false
    else
      value2 = true
    end
  end
  if value2 then
    reportResult(false, "getcallbackvalue", "Was able to get a callback from an invalid instance")
    if failureMap.getcallbackvalue then
      failureFlag[1] = true
    end
  end
  local pcall3 = environment.pcall
  
  local function callback2(argument)
    local callbackvalue = environment.getcallbackvalue(environment.game, "Close")
    local callbackvalue2 = environment.getcallbackvalue(environment.game, "IsA")
    local callbackvalue3 = environment.getcallbackvalue(environment.game, "GetPropertyChangedSignal")
    local callbackvalue4 = environment.getcallbackvalue(environment.game, [[






	]])
    local getcallbackvalue2 = environment.getcallbackvalue
    local game2 = environment.game
    local rep2 = environment.string.rep
    local results = packResults(rep2("0", 0))
    local unpackResults2 = unpackResults
    local resultCount = results.n
    local callbackvalue22 = getcallbackvalue2(game2, unpackResults2(results, 1, resultCount))
    local getcallbackvalue3 = environment.getcallbackvalue
    local part = environment.Instance.new("Part")
    local results2 = packResults(getcallbackvalue3(part, "SetPredictionMode"))
    local unpackResults3 = unpackResults
    local resultCount2 = results2.n
    return callbackvalue, callbackvalue2, callbackvalue3, callbackvalue4, callbackvalue22, unpackResults3(results2, 1, resultCount2)
  end
  
  value7, value8 = pcall3(callback2)
  local values = {}
  values[1] = callback2
  local values2 = values
  values[1] = false
  argument = environment.Instance.new
  local result = argument("BindableFunction")
  do
    local value14
    value14 = values2
    
    function argument(argument)
      value14[1] = true
      return
    end
  end
  result.OnInvoke = argument
  getcallbackvalue2 = environment.getcallbackvalue
  local result2 = getcallbackvalue2(result, "OnInvoke")
  local result22 = result2
  if result2 == argument then
    getcallbackvalue2 = false
  else
    getcallbackvalue2 = true
  end
  if getcallbackvalue2 then
  else
    getcallbackvalue2 = environment.tostring(result22)
    if getcallbackvalue2 == environment.tostring(argument) then
      getcallbackvalue2 = false
    else
      getcallbackvalue2 = true
    end
  end
  if getcallbackvalue2 then
    reportResult(false, "getcallbackvalue", "The callback received does not match the actual callback")
    if failureMap.getcallbackvalue then
      failureFlag[1] = true
    end
  end
  checkpointLogger(result22)
  result22()
  environment.task.wait()
  if values2[1] then
    return
  end
  reportResult(false, "getcallbackvalue", "The callback value didn't behave as expected")
  if not failureMap.getcallbackvalue then
    return
  end
  failureFlag[1] = true
  return
end
