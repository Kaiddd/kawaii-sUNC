local captured1, reportResult, failureMap, failureFlag, packResults, unpackResults, environment
captured1, reportResult, failureMap, failureFlag, packResults, unpackResults, environment = ...
return function(argument)
  local metatable2, result3, getrawmetatable3
  if captured1.getrawmetatable then
    reportResult(false, "setrawmetatable", "Can't test due to 'getrawmetatable' not working reliably")
    if failureMap.setrawmetatable then
      failureFlag[1] = true
    end
  end
  local setrawmetatable2 = environment.setrawmetatable
  local values = {}
  local values2 = {}
  
  local function callback(argument)
    return "bomlol"
  end
  
  values2.__index = callback
  local setrawmetatable2Result = setrawmetatable2(values, values2)
  local setrawmetatable3 = environment.setrawmetatable
  local values3 = {}
  local genv = environment.getgenv()
  values3.__index = genv
  setrawmetatable3(setrawmetatable2Result, values3)
  local result = environment.type(setrawmetatable2Result.print)
  result3 = result
  if result == "function" then
    result3 = false
  else
    result3 = true
  end
  if result3 then
    reportResult(false, "setrawmetatable", "Failed to change the metatable")
    if failureMap.setrawmetatable then
      failureFlag[1] = true
    end
  end
  local values4 = {}
  local setrawmetatable4 = environment.setrawmetatable
  local values5 = {}
  values5.__metatable = "real2"
  setrawmetatable4(values4, values5)
  local setrawmetatable5 = environment.setrawmetatable
  local values6 = {}
  setrawmetatable5(values4, values6)
  local metatable = environment.getmetatable(values4)
  metatable2 = metatable
  if metatable ~= "real2" then
    metatable2 = false
  else
    metatable2 = true
  end
  if metatable2 then
    reportResult(false, "setrawmetatable", "Failed to set a metatable on a locked metatable")
    if failureMap.setrawmetatable then
      failureFlag[1] = true
    end
  end
  local values7 = {}
  local setrawmetatable6 = environment.setrawmetatable
  local values8 = {}
  local genv2 = environment.getgenv()
  values8.__index = genv2
  local setrawmetatable6Result = setrawmetatable6(values7, values8)
  local values9 = {}
  local setrawmetatable7 = environment.setrawmetatable
  local values10 = {}
  local genv3 = environment.getgenv()
  values10.__index = genv3
  local setrawmetatable7Result = setrawmetatable7(values9, values10)
  local setrawmetatable8 = environment.setrawmetatable
  local rawmetatable = environment.getrawmetatable(values7)
  local getrawmetatable2 = environment.getrawmetatable
  local results = packResults(getrawmetatable2(values9))
  local unpackResults2 = unpackResults
  local resultCount = results.n
  local setrawmetatable8Result = setrawmetatable8(rawmetatable, unpackResults2(results, 1, resultCount))
  local rawmetatable2 = environment.getrawmetatable(values7)
  local rawmetatable3 = environment.getrawmetatable(values9)
  getrawmetatable3 = environment.getrawmetatable
  local result2 = getrawmetatable3(setrawmetatable8Result)
  if setrawmetatable6Result ~= nil then
    getrawmetatable3 = false
  else
    getrawmetatable3 = true
  end
  if getrawmetatable3 then
  elseif setrawmetatable7Result ~= nil then
    getrawmetatable3 = false
  else
    getrawmetatable3 = true
  end
  if getrawmetatable3 then
    reportResult(false, "setrawmetatable", "Failed to obtain a return value")
    getrawmetatable3 = failureMap.setrawmetatable
    if getrawmetatable3 then
      getrawmetatable3 = true
      failureFlag[1] = true
    end
  end
  if values9 ~= setrawmetatable8Result then
    getrawmetatable3 = false
  else
    getrawmetatable3 = true
  end
  if getrawmetatable3 then
    reportResult(false, "setrawmetatable", "Invalid table-to-metatable references[1]")
    getrawmetatable3 = failureMap.setrawmetatable
    if getrawmetatable3 then
      getrawmetatable3 = true
      failureFlag[1] = true
    end
  end
  if values7 ~= setrawmetatable8Result then
    getrawmetatable3 = false
  else
    getrawmetatable3 = true
  end
  if getrawmetatable3 then
    reportResult(false, "setrawmetatable", "Invalid table-to-metatable reference[2]")
    getrawmetatable3 = failureMap.setrawmetatable
    if getrawmetatable3 then
      getrawmetatable3 = true
      failureFlag[1] = true
    end
  end
  if values7 ~= rawmetatable2 then
    getrawmetatable3 = false
  else
    getrawmetatable3 = true
  end
  if getrawmetatable3 then
    reportResult(false, "setrawmetatable", "A table and its metatable should not be equal to eachother[1]")
    getrawmetatable3 = failureMap.setrawmetatable
    if getrawmetatable3 then
      getrawmetatable3 = true
      failureFlag[1] = true
    end
  end
  if values9 ~= rawmetatable3 then
    getrawmetatable3 = false
  else
    getrawmetatable3 = true
  end
  if getrawmetatable3 then
    reportResult(false, "setrawmetatable", "A table and its metatable should not be equal to eachother[2]")
    getrawmetatable3 = failureMap.setrawmetatable
    if getrawmetatable3 then
      getrawmetatable3 = true
      failureFlag[1] = true
    end
  end
  if setrawmetatable8Result ~= result2 then
    getrawmetatable3 = false
  else
    getrawmetatable3 = true
  end
  if getrawmetatable3 then
    reportResult(false, "setrawmetatable", "Invalid return. Should not return its own metatable")
    getrawmetatable3 = failureMap.setrawmetatable
    if getrawmetatable3 then
      getrawmetatable3 = true
      failureFlag[1] = true
    end
  end
  if values7 ~= result2 then
    getrawmetatable3 = false
  else
    getrawmetatable3 = true
  end
  if getrawmetatable3 then
    reportResult(false, "setrawmetatable", "A table and its metatable should not be equal to eachother[3]")
    if failureMap.setrawmetatable then
      failureFlag[1] = true
    end
  end
  getrawmetatable3 = not setrawmetatable8Result.print
  if getrawmetatable3 then
    reportResult(false, "setrawmetatable", "Failed to retrieve a value from a metatable")
    getrawmetatable3 = failureMap.setrawmetatable
    if getrawmetatable3 then
      getrawmetatable3 = true
      failureFlag[1] = true
    end
  end
  if rawmetatable2 ~= rawmetatable3 then
    getrawmetatable3 = false
  else
    getrawmetatable3 = true
  end
  if getrawmetatable3 then
    reportResult(false, "setrawmetatable", "Different metatable should not equal to eachother")
    getrawmetatable3 = failureMap.setrawmetatable
    if getrawmetatable3 then
      getrawmetatable3 = true
      failureFlag[1] = true
    end
  end
  if rawmetatable3 == result2 then
    getrawmetatable3 = false
  else
    getrawmetatable3 = true
  end
  if not getrawmetatable3 then
    return
  end
  reportResult(false, "setrawmetatable", "Invalid metatable-to-metatable reference")
  if not failureMap.setrawmetatable then
    return
  end
  failureFlag[1] = true
  return
end
