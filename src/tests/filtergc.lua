local reportResult, failureMap, failureFlag, captured4, captured5, packResults, unpackResults, hostFactories, environment
reportResult, failureMap, failureFlag, captured4, captured5, packResults, unpackResults, hostFactories, environment = ...
return function(argument)
  local filtergc2, filtergc3, values, value, value2, values2, value3, filtergc4, values3, result, value6, genv, result2, values4, reportResult2, resultCount, textFragment, textFragment2
  if not environment.getfunctionhash then
    reportResult(false, "filtergc", "getfunctionhash is needed in order to test")
    if failureMap.filtergc then
      failureFlag[1] = true
    end
  end
  if captured4.getfunctionhash then
    reportResult(false, "filtergc", "Can't test due to 'getfunctionhash' not working reliably")
    if failureMap.filtergc then
      failureFlag[1] = true
    end
  end
  filtergc3 = environment.filtergc
  values = {}
  result = filtergc3("function", values)
  argument = result
  result2 = environment.type(result)
  filtergc3 = result2
  if result2 ~= "table" then
    filtergc3 = true
  else
    filtergc3 = false
  end
  if filtergc3 then
    reportResult(false, "filtergc", "`returnOne` should be false by default and returning a table")
    filtergc3 = failureMap.filtergc
    if filtergc3 then
      filtergc3 = true
      failureFlag[1] = true
    end
  end
  if argument == nil then
    filtergc3 = true
  else
    filtergc3 = false
  end
  if not filtergc3 then
    filtergc3 = #argument
    if filtergc3 == 0 then
      filtergc3 = true
    else
      filtergc3 = false
    end
  end
  if filtergc3 then
    reportResult(false, "filtergc", "Returned an empty table when provided no options")
    if failureMap.filtergc then
      failureFlag[1] = true
    end
  end
  filtergc2 = environment.filtergc
  argument = {}
  argument.Name = "imaeemuhttaginmyphase"
  result = filtergc2("function", argument, true)
  filtergc3 = result
  result2 = environment.type(result)
  filtergc2 = result2
  if result2 == "table" then
    filtergc2 = true
  else
    filtergc2 = false
  end
  if filtergc2 then
    reportResult(false, "filtergc", "Returned a table while 'returnOne' was set to true")
    if failureMap.filtergc then
      failureFlag[1] = true
    end
  end
  if not filtergc3 then
    reportResult(false, "filtergc", "[Name] Failed to find a function by name")
    if failureMap.filtergc then
      failureFlag[1] = true
    end
  end
  filtergc2 = {}
  filtergc2.prrrrpapa = "f"
  filtergc2[":Pboi"] = 2
  result = environment.filtergc
  argument = {}
  values2 = {}
  values2[1] = ":Pboi"
  values2[2] = "prrrrpapa"
  argument.Keys = values2
  result = result("table", argument)
  argument = false
  filtergc3 = environment.pairs
  result, value6, genv = filtergc3(result)
  filtergc3 = result
  value = value6
  value2 = genv
  values = result
  while true do
    result, value6 = values(value, value2)
    value2 = result
    filtergc3 = value6
    value3 = nil
    if result == nil then
      value3 = true
    else
      value3 = false
    end
    if value3 then
      break
    end
    if filtergc3 == filtergc2 then
      filtergc3 = true
    else
      filtergc3 = false
    end
    if filtergc3 then
      argument = true
    end
  end
  if not argument then
    reportResult(false, "filtergc", "[KEYS] Failed to find a table with specified keys")
    if failureMap.filtergc then
      failureFlag[1] = true
    end
  end
  result = captured5(1, 54)
  argument = {}
  argument[":Pboi"] = result
  result = environment.filtergc
  filtergc2 = {}
  values2 = {}
  values2[1] = ":Pboi"
  filtergc2.Keys = values2
  result = result("table", filtergc2)
  values2 = false
  value3 = environment.pairs
  result, value6, genv = value3(result)
  filtergc3 = result
  value = value6
  value2 = genv
  values = result
  while true do
    result, value6 = values(value, value2)
    value2 = result
    filtergc3 = value6
    value3 = nil
    if result == nil then
      value3 = true
    else
      value3 = false
    end
    if value3 then
      break
    end
    if filtergc3 == argument then
      value3 = true
    else
      value3 = false
    end
    if value3 then
      values2 = true
    end
  end
  if not values2 then
    reportResult(false, "filtergc", "[KEYS] Failed to find a table with specified keys")
    if failureMap.filtergc then
      failureFlag[1] = true
    end
  end
  result = captured5(3, 999)
  value3 = result
  filtergc2 = {}
  filtergc2.prrrrpapa = "fawfawfaw"
  filtergc2[":Pboi"] = result
  values2 = environment.filtergc
  values = {}
  filtergc3 = {}
  filtergc3[1] = result
  filtergc3[2] = "fawfawfaw"
  values.Values = filtergc3
  result = values2("table", values)
  values2 = false
  argument = environment.pairs
  result, value6, genv = argument(result)
  filtergc3 = result
  value = value6
  value2 = genv
  values = result
  while true do
    result, value6 = values(value, value2)
    value2 = result
    filtergc3 = value6
    value3 = nil
    if result == nil then
      value3 = true
    else
      value3 = false
    end
    if value3 then
      break
    end
    if filtergc3 == filtergc2 then
      argument = true
    else
      argument = false
    end
    if argument then
      values2 = true
    end
  end
  if not values2 then
    reportResult(false, "filtergc", "[VALUES] Failed to find a table with specified value[1]")
    if failureMap.filtergc then
      failureFlag[1] = true
    end
  end
  argument = {}
  argument.prrrrpapa = "fawfawfaw"
  filtergc4 = environment.filtergc
  values2 = {}
  filtergc2 = {}
  filtergc2[1] = "fawfawfaw"
  values2.Values = filtergc2
  result = filtergc4("table", values2)
  filtergc4 = false
  filtergc3 = environment.pairs
  result, value6, genv = filtergc3(result)
  filtergc3 = result
  value = value6
  value2 = genv
  values = result
  while true do
    result, value6 = values(value, value2)
    value2 = result
    filtergc3 = value6
    value3 = nil
    if result == nil then
      value3 = true
    else
      value3 = false
    end
    if value3 then
      break
    end
    if filtergc3 == argument then
      filtergc3 = true
    else
      filtergc3 = false
    end
    if filtergc3 then
      filtergc4 = true
    end
  end
  if not filtergc4 then
    reportResult(false, "filtergc", "[VALUES] Failed to find a table with specified value[2]")
    if failureMap.filtergc then
      failureFlag[1] = true
    end
  end
  result = captured5(77, 999)
  filtergc3 = result
  values2 = {}
  values2.prrrrpapa = "fawfawfaw"
  values2[":Pboi"] = result
  result = environment.filtergc
  value = {}
  filtergc2 = {}
  filtergc2[":Pboi"] = filtergc3
  filtergc2.prrrrpapa = "fawfawfaw"
  value.KeyValuePairs = filtergc2
  result = result("table", value)
  filtergc2 = false
  argument = environment.pairs
  result, value6, genv = argument(result)
  filtergc3 = result
  value = value6
  value2 = genv
  values = result
  while true do
    result, value6 = values(value, value2)
    value2 = result
    filtergc3 = value6
    value3 = nil
    if result == nil then
      value3 = true
    else
      value3 = false
    end
    if value3 then
      break
    end
    if filtergc3 == values2 then
      argument = true
    else
      argument = false
    end
    if argument then
      filtergc2 = true
    end
  end
  if not filtergc2 then
    reportResult(false, "filtergc", "[KVPairs] Failed to find a table with specified KeyValue pairs[1]")
    if failureMap.filtergc then
      failureFlag[1] = true
    end
  end
  argument = {}
  argument.prrrrpapa = "fawfawfaw"
  filtergc4 = environment.filtergc
  values = {}
  values2 = {}
  values2.prrrrpapa = "fawfawfaw"
  values.KeyValuePairs = values2
  result = filtergc4("table", values)
  filtergc4 = false
  filtergc2 = environment.pairs
  result, value6, genv = filtergc2(result)
  filtergc3 = result
  value = value6
  value2 = genv
  values = result
  while true do
    result, value6 = values(value, value2)
    value2 = result
    filtergc3 = value6
    value3 = nil
    if result == nil then
      value3 = true
    else
      value3 = false
    end
    if value3 then
      break
    end
    if filtergc3 == argument then
      filtergc2 = true
    else
      filtergc2 = false
    end
    if filtergc2 then
      filtergc4 = true
    end
  end
  if not filtergc4 then
    reportResult(false, "filtergc", "[KVPairs] Failed to find a table with specified KeyValue pairs[2]")
    if failureMap.filtergc then
      failureFlag[1] = true
    end
  end
  values = environment.setmetatable
  values3 = {}
  values2 = {}
  genv = environment.getgenv()
  values2.__index = genv
  result = values(values3, values2)
  filtergc2 = result
  values3 = environment.filtergc
  values = {}
  result2 = environment.getmetatable(result)
  values.Metatable = result2
  result = values3("table", values)
  values3 = false
  values2 = environment.pairs
  result, value6, genv = values2(result)
  filtergc3 = result
  value = value6
  value2 = genv
  values = result
  while true do
    result, value6 = values(value, value2)
    value2 = result
    filtergc3 = value6
    value3 = nil
    if result == nil then
      value3 = true
    else
      value3 = false
    end
    if value3 then
      break
    end
    if filtergc3 == filtergc2 then
      values2 = true
    else
      values2 = false
    end
    if values2 then
      values3 = true
    end
  end
  if not values3 then
    reportResult(false, "filtergc", "[METATABLE] Failed to find a table with the specified metatable")
    if failureMap.filtergc then
      failureFlag[1] = true
    end
  end
  values = environment.filtergc
  argument = {}
  argument.Name = "send"
  filtergc3 = {}
  filtergc3[1] = "WaitForChild"
  argument.Constants = filtergc3
  result = values("function", argument)
  values2 = result
  values = #result
  if values > 1 then
    values = true
  else
    values = false
  end
  if values then
    reportResult(false, "filtergc", "[FUNC] Retrieved more than one viable option")
    if failureMap.filtergc then
      failureFlag[1] = true
    end
  end
  values = #values2
  if values == 0 then
    values = true
  else
    values = false
  end
  if values then
    reportResult(false, "filtergc", "[FUNC] Retrieved less than one viable option")
    if failureMap.filtergc then
      failureFlag[1] = true
    end
  end
  result2 = hostFactories[4]
  values4 = {}
  reportResult2 = reportResult
  values4[1] = reportResult2
  reportResult2 = failureMap
  values4[2] = reportResult2
  reportResult2 = failureFlag
  values4[3] = reportResult2
  result2 = result2(values4)
  filtergc3 = result2
  result2()
  result2 = {}
  result2[1] = filtergc3
  filtergc3 = result2
  result2[1] = nil
  result2 = hostFactories[5]
  values4 = {}
  values4[1] = filtergc3
  result2(values4)()
  values = #filtergc3[1]
  if values == 0 then
    values = true
  else
    values = false
  end
  if not values then
    values = #filtergc3[1]
    if values > 1 then
      values = true
    else
      values = false
    end
  end
  if values then
    reportResult(false, "filtergc", "[FUNC] Failed to retrieve a function with a constant which equals to NaN[1].")
    if failureMap.filtergc then
      failureFlag[1] = true
    end
  end
  argument = environment.select
  value = filtergc3[1][1]
  result2 = packResults(value(2))
  reportResult2 = unpackResults
  resultCount = result2.n
  result2 = argument(2, reportResult2(result2, 1, resultCount))
  values = result2
  if result2 ~= "hi" then
    values = true
  else
    values = false
  end
  if values then
    reportResult(false, "filtergc", "[FUNC] Failed to retrieve a function with the constant which equals to NaN[2].")
    if failureMap.filtergc then
      failureFlag[1] = true
    end
  end
  argument = environment.filtergc
  filtergc3 = {}
  value2 = {}
  textFragment = "brotzatza "
  textFragment2 = "there's no function like this"
  result2 = textFragment .. textFragment2
  value2[1] = result2
  filtergc3.Constants = value2
  filtergc3.IgnoreExecutor = false
  argument = #argument("function", filtergc3)
  if argument > 0 then
    argument = true
  else
    argument = false
  end
  if argument then
    reportResult(false, "filtergc", "[FUNC IgnoreExec] Returned more than 0 possible functions for a non-existant function")
    if failureMap.filtergc then
      failureFlag[1] = true
    end
  end
  result = environment.filtergc
  value = {}
  filtergc2 = {}
  filtergc3 = 0 / 0
  filtergc2[1] = filtergc3
  value.Upvalues = filtergc2
  result = result("function", value)
  argument = result
  value = #result
  if value == 0 then
    value = true
  else
    value = false
  end
  if not value then
    value = #argument
    if value > 1 then
      value = true
    else
      value = false
    end
  end
  if value then
    reportResult(false, "filtergc", "[FUNC UPVALS] Failed to retrieve a function with the upvalue 0/0")
    if failureMap.filtergc then
      failureFlag[1] = true
    end
  end
  filtergc3 = environment.select
  value2 = argument[1]
  result2 = packResults(value2())
  reportResult2 = unpackResults
  resultCount = result2.n
  result2 = filtergc3(2, reportResult2(result2, 1, resultCount))
  value = result2
  if result2 ~= "mau" then
    value = true
  else
    value = false
  end
  if not value then
    return
  end
  reportResult(false, "filtergc", "[FUNC UPVALS] Failed to retrieve a function with the upvalue 0/0.")
  if not failureMap.filtergc then
    return
  end
  failureFlag[1] = true
  return
end
