local captured4, reportResult, captured3, failureFlag, captured5, packResults, unpackResults, environment
captured4, reportResult, captured3, failureFlag, captured5, packResults, unpackResults, environment = ...
return function(argument)
  local value, value2, getscriptclosure2, game2, callback, value3, value4, proto, value7, result, result2, tostring2, results, results2, itemResult, unpackResults2, item, unpackResults3, resultCount, resultCount2, resultCount3, resultCount4, environment2, value12, callbackResult
  captured4.ilovelosingcontrol = true
  if not environment.getscriptclosure then
    reportResult(false, "debug.getproto", "getscriptclosure is needed in order to test")
    if captured3["debug.getproto"] then
      failureFlag[1] = true
    end
  end
  if not environment.getgc then
    reportResult(false, "debug.getproto", "getgc is needed in order to test")
    if captured3["debug.getproto"] then
      failureFlag[1] = true
    end
  end
  getscriptclosure2 = environment.getscriptclosure
  game2 = environment.game
  argument = getscriptclosure2(game2:GetService("Players").LocalPlayer.PlayerScripts.RbxCharacterSounds)
  game2 = environment.pcall
  
  function callback(argument)
    local getproto2 = environment.debug.getproto
    
    local function callback(argument)
      return
    end
    
    getproto2(callback, 0, true)
    return
  end
  
  if game2(callback) then
    reportResult(false, "debug.getproto", "Should error upon entering an invalid index[1]")
    if captured3["debug.getproto"] then
      failureFlag[1] = true
    end
  end
  game2 = environment.pcall
  
  function callback(argument)
    local getproto2 = environment.debug.getproto
    
    local function callback(argument)
      return
    end
    
    getproto2(callback, -0, true)
    return
  end
  
  if game2(callback) then
    reportResult(false, "debug.getproto", "Should error upon entering an invalid index[2]")
    if captured3["debug.getproto"] then
      failureFlag[1] = true
    end
  end
  game2 = environment.pcall
  
  function callback(argument)
    local getproto2 = environment.debug.getproto
    
    local function callback(argument)
      return
    end
    
    getproto2(callback, 72057594037927936, true)
    return
  end
  
  if game2(callback) then
    reportResult(false, "debug.getproto", "Should error upon entering an invalid index[3]")
    if captured3["debug.getproto"] then
      failureFlag[1] = true
    end
  end
  game2 = environment.pcall
  
  function callback(argument)
    local getproto2 = environment.debug.getproto
    
    local function callback(argument)
      return
    end
    
    getproto2(callback, -0, true)
    return
  end
  
  if game2(callback) then
    reportResult(false, "debug.getproto", "Should error upon entering an invalid index[2]")
    if captured3["debug.getproto"] then
      failureFlag[1] = true
    end
  end
  game2 = environment.debug.getproto
  value = true
  getscriptclosure2 = game2(argument, 1, true)
  game2 = environment.debug.getproto(argument, 1, false)
  proto = environment.debug.getproto(argument, 1)
  callback = proto
  value2 = not game2 or not proto
  if value2 then
    value = reportResult
    argument = false
    value3 = "debug.getproto"
    value(false, "debug.getproto", "Failed to retrieve an inactive proto[1]")
    value2 = captured3
    value = "debug.getproto"
    if value2["debug.getproto"] then
      failureFlag[1] = true
    end
  end
  if not getscriptclosure2 then
    value = reportResult
    argument = false
    value3 = "debug.getproto"
    value(false, "debug.getproto", "Failed to retrieve active proto(s)")
    if captured3["debug.getproto"] then
      failureFlag[1] = true
    end
  end
  itemResult = getscriptclosure2[1]()
  value2 = itemResult
  value = false
  if itemResult ~= false then
    value2 = true
  else
    value2 = false
  end
  if value2 then
    value = reportResult
    argument = false
    value(false, "debug.getproto", "Didn't return the correct value from a script's proto")
    if captured3["debug.getproto"] then
      failureFlag[1] = true
    end
  end
  proto = environment.pcall
  do
    local value14, value15, value16, value17, value18
    value14 = game2
    value15 = callback
    
    function argument(argument)
      local value14Result
      value14Result = value14()
      argument = value14Result
      if value14Result ~= false then
        argument = false
      else
        argument = true
      end
      if argument then
      else
        local value15Result = value15()
        argument = value15Result
        if value15Result ~= false then
          argument = false
        else
          argument = true
        end
      end
      if not argument then
        return
      end
      reportResult(false, "debug.getproto", "Inactive protos should not be callable[1]")
      if not captured3["debug.getproto"] then
        return
      end
      failureFlag[1] = true
      return
    end
  end
  proto(argument)
  value2 = nil
  value = environment.pairs
  proto = value
  environment2 = environment
  argument = environment2.getgc
  itemResult = packResults(argument())
  value7 = itemResult
  unpackResults2 = unpackResults
  resultCount = itemResult.n
  callbackResult = (function(a_native_fixed_result_call_1, ...)
    return {
      a_native_fixed_result_call_1(...)
    }
  end)(value, unpackResults2(itemResult, 1, resultCount))
  itemResult = callbackResult[1]
  unpackResults2 = callbackResult[2]
  item = callbackResult[3]
  getscriptclosure2 = itemResult
  value = unpackResults2
  argument = item
  game2 = unpackResults2
  callback = item
  while true do
    proto, value7 = getscriptclosure2(game2, callback)
    value = proto
    argument = value7
    callback = nil
    if proto == nil then
      callback = true
    else
      callback = false
    end
    if callback then
      break
    end
    callback = value
    value4 = argument
    environment2 = environment
    argument = environment2.type
    value7 = value4
    proto = argument(value4)
    value = proto
    argument = "function"
    if proto == "function" then
      value = true
    else
      value = false
    end
    if value then
      environment2 = environment
      argument = environment2.debug.info
      value7 = value4
      proto = argument(value4, "n")
      value = proto
      argument = "forgives_flushed"
      if proto == "forgives_flushed" then
        value = true
      else
        value = false
      end
    end
    if value then
      value2 = value4
    end
  end
  if not value2 then
    argument = reportResult
    value3 = false
    argument(false, "debug.getproto", "Failed to retrieve a function to test")
    if captured3["debug.getproto"] then
      itemResult = failureFlag
      itemResult[1] = true
    end
  end
  argument = environment.debug.getproto
  value7 = value2
  value2 = 1
  proto = argument(value7, 1)
  value = proto
  if not proto then
    value3 = reportResult
    value2 = "debug.getproto"
    value3(false, "debug.getproto", "Failed to retrieve an inactive proto[2]")
    if captured3["debug.getproto"] then
      itemResult = failureFlag
      itemResult[1] = true
    end
  end
  proto = environment.pcall
  do
    local value19, value20, value21, value22 = nil, callback, nil, nil
    value19 = value
    
    function value2(argument)
      local value19Result = value19()
      argument = value19Result
      if value19Result ~= "blablabla" then
        argument = false
      else
        argument = true
      end
      if not argument then
        return
      end
      reportResult(false, "debug.getproto", "Inactive protos should not be callable[2]")
      if not captured3["debug.getproto"] then
        return
      end
      failureFlag[1] = true
      return
    end
  end
  proto(value2)
  proto = environment.debug.info(value, "n")
  argument = proto
  value3 = "because_hes_unemployed"
  if proto ~= "because_hes_unemployed" then
    argument = true
  else
    argument = false
  end
  if not argument then
    proto = environment.debug.info(value, "s")
    argument = proto
    value3 = "ReplicatedFirst.Hacker"
    if proto ~= "ReplicatedFirst.Hacker" then
      argument = true
    else
      argument = false
    end
  end
  if not argument then
    value3 = environment.select
    proto = value3
    getscriptclosure2 = environment.debug.info
    itemResult = packResults(getscriptclosure2(value, "a"))
    item = unpackResults
    resultCount2 = itemResult.n
    itemResult = value3(2, item(itemResult, 1, resultCount2))
    argument = itemResult
    if itemResult == true then
      argument = true
    else
      argument = false
    end
  end
  if not argument then
    proto = environment.debug.info(value, "l")
    argument = proto
    if proto ~= 53 then
      argument = true
    else
      argument = false
    end
  end
  if not argument then
    return
  end
  reportResult(false, "debug.getproto", "Failed to retrieve correct debug information on an inactive proto")
  argument = captured5
  proto = environment.string.format
  value12 = "' " .. environment.debug.info(value, "n") .. " '"
  getscriptclosure2 = environment.tostring
  value2 = environment.debug.info
  itemResult = packResults(value2(value, "l"))
  unpackResults2 = unpackResults
  resultCount = itemResult.n
  result = getscriptclosure2(unpackResults2(itemResult, 1, resultCount))
  game2 = environment.tostring
  getscriptclosure2 = environment.select
  value2 = environment.debug.info
  results2 = packResults(value2(value, "a"))
  itemResult = packResults
  unpackResults3 = unpackResults
  resultCount3 = results2.n
  itemResult = itemResult(getscriptclosure2(2, unpackResults3(results2, 1, resultCount3)))
  unpackResults2 = unpackResults
  resultCount = itemResult.n
  result2 = game2(unpackResults2(itemResult, 1, resultCount))
  tostring2 = environment.tostring
  value2 = environment.debug.info
  results = packResults(value2(value, "s"))
  itemResult = packResults
  item = unpackResults
  resultCount2 = results.n
  itemResult = itemResult(tostring2(item(results, 1, resultCount2)))
  resultCount2 = unpackResults
  resultCount4 = itemResult.n
  itemResult = proto("\r\n\r\n\t\t\t\t\t\tThe retrieved debug name of an inactive proto did not match with \"`because_hes_unemployed`\".\r\n\r\n\t\t\t\t\t\tRetrieved name:\r\n\r\n\t\t\t\t\t\t%s | expected: 'because_hes_unemployed'\r\n\r\n\t\t\t\t\t\tRetrieved currentline:\r\n\r\n\t\t\t\t\t\t%s | expected: 52\r\n\r\n\t\t\t\t\t\tRetrieved is_vararg:\r\n\r\n\t\t\t\t\t\t%s | expected: false\r\n\r\n\t\t\t\t\t\tRetrieved source:\r\n\r\n\t\t\t\t\t\t%s | expected: ReplicatedFirst.Hacker\r\n\r\n\t\t\t\t\t", value12, result, result2, resultCount2(itemResult, 1, resultCount4))
  argument["debug.getproto"] = itemResult
  return
end
