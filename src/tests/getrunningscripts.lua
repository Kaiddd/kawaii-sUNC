local reportResult, failureMap, failureFlag, packResults, unpackResults, environment
reportResult, failureMap, failureFlag, packResults, unpackResults, environment = ...
return function(argument)
  local value, value2, pairs2, getrunningscripts2, value3, capturedValue, value4, value5, value8, result, value9, packResults2, value12, value13, resultCount, callback, callbackResult
  argument = {}
  pairs2 = environment.pairs
  value8 = pairs2
  getrunningscripts2 = environment.getrunningscripts
  packResults2 = packResults
  value12 = getrunningscripts2
  result = packResults2(value12())
  packResults2 = value8
  value12 = unpackResults
  value13 = result
  resultCount = result.n
  callbackResult = (function(a_native_fixed_result_call_1, ...)
    return {
      a_native_fixed_result_call_1(...)
    }
  end)(packResults2, value12(value13, 1, resultCount))
  packResults2 = callbackResult[1]
  value12 = callbackResult[2]
  value13 = callbackResult[3]
  value = packResults2
  value2 = value12
  value3 = value13
  
  function callback()
    local pairs22, argument2, capturedValue3, value6, value7, value92
    while true do
      local value4 = value
      value8 = value4
      local value22 = value2
      result = value22
      local value32 = value3
      value9 = value32
      local value82 = value8
      local result2 = result
      value92 = value9
      value6, value7 = value82(result2, value92)
      value8 = value6
      result = value7
      local value83 = value8
      value3 = value83
      local result3 = result
      capturedValue = result3
      value5 = nil
      if value3 ~= value5 then
        value5 = false
      else
        value5 = true
      end
      if value5 then
        return 1
      end
      local value33 = value3
      value3 = value33
      local capturedValue2 = capturedValue
      capturedValue = capturedValue2
      local item = argument[capturedValue]
      pairs2 = item
      if pairs2 then
        return 0
      end
      pairs2 = true
      pairs22 = pairs2
      argument2 = argument
      capturedValue3 = capturedValue
      argument2[capturedValue3] = pairs22
    end
  end
  
  if callback() == 0 then
    getrunningscripts2 = reportResult
    value8 = getrunningscripts2
    value4 = false
    result = value4
    value9 = "getrunningscripts"
    value5 = "Shouldn't return duplicates"
    value8(result, value9, value5)
    pairs2 = failureMap
    getrunningscripts2 = "getrunningscripts"
    pairs2 = pairs2.getrunningscripts
    if pairs2 then
      pairs2 = true
      packResults2 = failureFlag
      packResults2[1] = pairs2
    end
  end
  pairs2 = environment.pairs
  value8 = pairs2
  getrunningscripts2 = environment.getrunningscripts
  packResults2 = packResults
  value12 = getrunningscripts2
  result = packResults2(value12())
  packResults2 = value8
  value12 = unpackResults
  value13 = result
  resultCount = result.n
  callbackResult = (function(a_native_fixed_result_call_1, ...)
    return {
      a_native_fixed_result_call_1(...)
    }
  end)(packResults2, value12(value13, 1, resultCount))
  packResults2 = callbackResult[1]
  value12 = callbackResult[2]
  value13 = callbackResult[3]
  value = packResults2
  value2 = value12
  value3 = value13
  
  function callback()
    local pairs22, getrunningscripts22, item2, service, value7, argument22, getrunningscripts23, environment2
    repeat
      local value6 = value
      value8 = value6
      local value22 = value2
      result = value22
      local value32 = value3
      value9 = value32
      local value82 = value8
      local result2 = result
      local value92 = value9
      service, value7 = value82(result2, value92)
      value8 = service
      result = value7
      local value83 = value8
      value3 = value83
      local result3 = result
      capturedValue = result3
      value5 = nil
      if value3 ~= value5 then
        value5 = false
      else
        value5 = true
      end
      if value5 then
        return 1
      end
      local value33 = value3
      value3 = value33
      local capturedValue2 = capturedValue
      capturedValue = capturedValue2
      environment2 = environment
      local game2 = environment2.game
      getrunningscripts2 = game2
      argument = "ReplicatedFirst"
      local getService = getrunningscripts2.GetService
      getrunningscripts23 = getrunningscripts2
      local argument2 = argument
      value7 = getrunningscripts23
      argument22 = argument2
      service = getService(getrunningscripts23, argument2)
      getrunningscripts2 = service
      value4 = "bleepbloop"
      local item = getrunningscripts2[value4]
      getrunningscripts2 = item
      value4 = "suncinit"
      item2 = getrunningscripts2[value4]
      getrunningscripts2 = item2
      local capturedValue3 = capturedValue
      getrunningscripts22 = getrunningscripts2
      if capturedValue3 ~= getrunningscripts22 then
        pairs2 = false
      else
        pairs2 = true
      end
      pairs22 = pairs2
    until pairs22
    return 0
  end
  
  if callback() == 0 then
    getrunningscripts2 = reportResult
    value8 = getrunningscripts2
    value4 = false
    result = value4
    value9 = "getrunningscripts"
    value8(result, value9, "Shouldn't return scripts initialized in an actor state")
    pairs2 = failureMap
    getrunningscripts2 = "getrunningscripts"
    pairs2 = pairs2.getrunningscripts
    if pairs2 then
      pairs2 = true
      packResults2 = failureFlag
      packResults2[1] = pairs2
    end
  end
  pairs2 = environment.pairs
  value8 = pairs2
  getrunningscripts2 = environment.getrunningscripts
  packResults2 = packResults
  value12 = getrunningscripts2
  result = packResults2(value12())
  packResults2 = value8
  value12 = unpackResults
  value13 = result
  resultCount = result.n
  callbackResult = (function(a_native_fixed_result_call_1, ...)
    return {
      a_native_fixed_result_call_1(...)
    }
  end)(packResults2, value12(value13, 1, resultCount))
  packResults2 = callbackResult[1]
  value12 = callbackResult[2]
  value13 = callbackResult[3]
  value = packResults2
  value2 = value12
  value3 = value13
  
  function callback()
    local pairs22, getrunningscripts22, item4, value7, value10, value92, environment2
    repeat
      local value6 = value
      value8 = value6
      local value22 = value2
      result = value22
      local value32 = value3
      value9 = value32
      local value82 = value8
      local result2 = result
      value92 = value9
      value7, value10 = value82(result2, value92)
      value8 = value7
      result = value10
      local value83 = value8
      value3 = value83
      local result3 = result
      capturedValue = result3
      value5 = nil
      if value3 ~= value5 then
        value5 = false
      else
        value5 = true
      end
      if value5 then
        return 1
      end
      local value33 = value3
      value3 = value33
      local capturedValue2 = capturedValue
      capturedValue = capturedValue2
      environment2 = environment
      local game2 = environment2.game
      getrunningscripts2 = game2
      value4 = "Players"
      local item = getrunningscripts2[value4]
      getrunningscripts2 = item
      value4 = "LocalPlayer"
      local item2 = getrunningscripts2[value4]
      getrunningscripts2 = item2
      value4 = "PlayerScripts"
      local item3 = getrunningscripts2[value4]
      getrunningscripts2 = item3
      value4 = "boidontbemean"
      item4 = getrunningscripts2[value4]
      getrunningscripts2 = item4
      local capturedValue3 = capturedValue
      getrunningscripts22 = getrunningscripts2
      if capturedValue3 ~= getrunningscripts22 then
        pairs2 = false
      else
        pairs2 = true
      end
      pairs22 = pairs2
    until pairs22
    return 0
  end
  
  if callback() == 0 then
    getrunningscripts2 = reportResult
    value8 = getrunningscripts2
    value4 = false
    result = value4
    argument = "getrunningscripts"
    value9 = argument
    value8(result, value9, "Fetched a script with a thread that's no longer running")
    pairs2 = failureMap
    getrunningscripts2 = "getrunningscripts"
    pairs2 = pairs2.getrunningscripts
    if pairs2 then
      pairs2 = true
      packResults2 = failureFlag
      packResults2[1] = pairs2
    end
  end
  pairs2 = false
  getrunningscripts2 = environment.pairs
  value8 = getrunningscripts2
  value4 = environment.getrunningscripts
  packResults2 = packResults
  value12 = value4
  result = packResults2(value12())
  packResults2 = value8
  value12 = unpackResults
  value13 = result
  resultCount = result.n
  callbackResult = (function(a_native_fixed_result_call_1, ...)
    return {
      a_native_fixed_result_call_1(...)
    }
  end)(packResults2, value12(value13, 1, resultCount))
  packResults2 = callbackResult[1]
  value12 = callbackResult[2]
  value13 = callbackResult[3]
  value = packResults2
  value2 = value12
  value3 = value13
  
  function callback()
    local getrunningscripts22, value42, item, service, value7, value522, value43, environment2
    while "game" do
      local value6 = value
      value8 = value6
      local value22 = value2
      result = value22
      local value32 = value3
      value9 = value32
      local value82 = value8
      local result2 = result
      local value92 = value9
      service, value7 = value82(result2, value92)
      value8 = service
      result = value7
      local value83 = value8
      value3 = value83
      local result3 = result
      capturedValue = result3
      value5 = nil
      if value3 ~= value5 then
        value5 = false
      else
        value5 = true
      end
      if value5 then
        return 0
      end
      local value33 = value3
      value3 = value33
      local capturedValue2 = capturedValue
      capturedValue = capturedValue2
      environment2 = environment
      local game2 = environment2.game
      value4 = game2
      value5 = "ReplicatedFirst"
      local getService = value4.GetService
      value43 = value4
      local value52 = value5
      value7 = value43
      value522 = value52
      service = getService(value43, value52)
      value4 = service
      argument = "Wow?"
      item = value4[argument]
      value4 = item
      local capturedValue3 = capturedValue
      value42 = value4
      if capturedValue3 ~= value42 then
        getrunningscripts2 = false
      else
        getrunningscripts2 = true
      end
      getrunningscripts22 = getrunningscripts2
      if getrunningscripts22 then
        getrunningscripts22 = true
        pairs2 = true
      end
    end
  end
  
  callback = callback()
  value4 = environment.task
  argument = "wait"
  value4 = value4.wait
  value8 = value4
  value8()
  getrunningscripts2 = not pairs2
  if getrunningscripts2 then
    value4 = reportResult
    value8 = value4
    argument = false
    result = argument
    value5 = "getrunningscripts"
    value9 = value5
    value8(result, value9, "Couldn't return a running script parented to a fake actor")
    getrunningscripts2 = failureMap
    value4 = "getrunningscripts"
    getrunningscripts2 = getrunningscripts2.getrunningscripts
    if getrunningscripts2 then
      getrunningscripts2 = true
      packResults2 = failureFlag
      packResults2[1] = getrunningscripts2
    end
  end
  getrunningscripts2 = false
  value4 = environment.pairs
  value8 = value4
  argument = environment.getrunningscripts
  packResults2 = packResults
  value12 = argument
  result = packResults2(value12())
  packResults2 = value8
  value12 = unpackResults
  value13 = result
  resultCount = result.n
  callbackResult = (function(a_native_fixed_result_call_1, ...)
    return {
      a_native_fixed_result_call_1(...)
    }
  end)(packResults2, value12(value13, 1, resultCount))
  packResults2 = callbackResult[1]
  value12 = callbackResult[2]
  value13 = callbackResult[3]
  value = packResults2
  value2 = value12
  value3 = value13
  
  function callback()
    local value42, argument2, item5, value7, value10, value92, environment2
    while "game" do
      local value6 = value
      value8 = value6
      local value22 = value2
      result = value22
      local value32 = value3
      value9 = value32
      local value82 = value8
      local result2 = result
      value92 = value9
      value7, value10 = value82(result2, value92)
      value8 = value7
      result = value10
      local value83 = value8
      value3 = value83
      local result3 = result
      capturedValue = result3
      value5 = nil
      if value3 ~= value5 then
        value5 = false
      else
        value5 = true
      end
      if value5 then
        return 0
      end
      local value33 = value3
      value3 = value33
      local capturedValue2 = capturedValue
      capturedValue = capturedValue2
      environment2 = environment
      local game2 = environment2.game
      argument = game2
      value5 = "ReplicatedStorage"
      local item = argument[value5]
      argument = item
      value5 = "Scurry"
      local item2 = argument[value5]
      argument = item2
      value5 = "FakeGrimReaper"
      local item3 = argument[value5]
      argument = item3
      value5 = "respect"
      local item4 = argument[value5]
      argument = item4
      value5 = "Script"
      item5 = argument[value5]
      argument = item5
      local capturedValue3 = capturedValue
      argument2 = argument
      if capturedValue3 ~= argument2 then
        value4 = false
      else
        value4 = true
      end
      value42 = value4
      if value42 then
        value42 = true
        getrunningscripts2 = true
      end
    end
  end
  
  callback = callback()
  value4 = not getrunningscripts2
  if value4 then
    argument = reportResult
    value8 = argument
    value5 = false
    result = value5
    pairs2 = "getrunningscripts"
    value9 = pairs2
    value8(result, value9, "Was unable to find a running 'Script' with 'Client' RunContext")
    value4 = failureMap
    argument = "getrunningscripts"
    value4 = value4.getrunningscripts
    if value4 then
      value4 = true
      packResults2 = failureFlag
      packResults2[1] = value4
    end
  end
  value4 = false
  argument = environment.pairs
  value8 = argument
  value5 = environment.getrunningscripts
  packResults2 = packResults
  value12 = value5
  result = packResults2(value12())
  packResults2 = value8
  value12 = unpackResults
  value13 = result
  resultCount = result.n
  callbackResult = (function(a_native_fixed_result_call_1, ...)
    return {
      a_native_fixed_result_call_1(...)
    }
  end)(packResults2, value12(value13, 1, resultCount))
  packResults2 = callbackResult[1]
  value12 = callbackResult[2]
  value13 = callbackResult[3]
  value = packResults2
  value2 = value12
  value3 = value13
  
  function callback()
    local argument3, value52, item, value7, value10, value92
    while "Name" do
      local value6 = value
      value8 = value6
      local value22 = value2
      result = value22
      local value32 = value3
      value9 = value32
      local value82 = value8
      local result2 = result
      value92 = value9
      value7, value10 = value82(result2, value92)
      value8 = value7
      result = value10
      local value83 = value8
      value3 = value83
      local result3 = result
      capturedValue = result3
      value5 = nil
      if value3 ~= value5 then
        value5 = false
      else
        value5 = true
      end
      if value5 then
        return 0
      end
      local value33 = value3
      value3 = value33
      local capturedValue2 = capturedValue
      capturedValue = capturedValue2
      value5 = "Name"
      item = capturedValue[value5]
      argument = item
      value5 = "ANG3LJ0RDAN"
      local argument2 = argument
      value52 = value5
      if argument2 ~= value52 then
        argument = false
      else
        argument = true
      end
      argument3 = argument
      if argument3 then
        argument3 = true
        value4 = true
      end
    end
  end
  
  callback = callback()
  argument = not value4
  if argument then
    value5 = reportResult
    value8 = value5
    pairs2 = false
    result = pairs2
    value9 = "getrunningscripts"
    value8(result, value9, "Was unable to find a running script parented to nil")
    argument = failureMap
    value5 = "getrunningscripts"
    argument = argument.getrunningscripts
    if argument then
      argument = true
      packResults2 = failureFlag
      packResults2[1] = argument
    end
  end
  argument = false
  value5 = environment.pairs
  value8 = value5
  pairs2 = environment.getrunningscripts
  packResults2 = packResults
  value12 = pairs2
  result = packResults2(value12())
  packResults2 = value8
  value12 = unpackResults
  value13 = result
  resultCount = result.n
  callbackResult = (function(a_native_fixed_result_call_1, ...)
    return {
      a_native_fixed_result_call_1(...)
    }
  end)(packResults2, value12(value13, 1, resultCount))
  packResults2 = callbackResult[1]
  value12 = callbackResult[2]
  value13 = callbackResult[3]
  value = packResults2
  value2 = value12
  value3 = value13
  
  function callback()
    local value53, capturedValue32, item9, find2Result, value10, value92, value54, environment2, value72
    while "game" do
      local value6 = value
      value8 = value6
      local value22 = value2
      result = value22
      local value32 = value3
      value9 = value32
      local value82 = value8
      local result2 = result
      value92 = value9
      find2Result, value10 = value82(result2, value92)
      value8 = find2Result
      result = value10
      local value83 = value8
      value3 = value83
      local result3 = result
      capturedValue = result3
      value5 = nil
      if value3 ~= value5 then
        value5 = false
      else
        value5 = true
      end
      if value5 then
        return 0
      end
      local value33 = value3
      value3 = value33
      local capturedValue2 = capturedValue
      capturedValue = capturedValue2
      local capturedValue3 = capturedValue
      capturedValue32 = capturedValue3
      value5 = capturedValue3
      value53 = value5
      if not value53 then
      else
        value4 = "Name"
        item9 = capturedValue[value4]
        value5 = item9
        getrunningscripts2 = "seebau"
        local find2 = value5.find
        value54 = value5
        local getrunningscripts23 = getrunningscripts2
        value10 = value54
        value92 = getrunningscripts23
        find2Result = find2(value54, getrunningscripts23)
        capturedValue32 = find2Result
        value5 = find2Result
      end
      value53 = value5
      if value53 then
        pairs2 = "Name"
        local item = capturedValue[pairs2]
        value5 = item
        pairs2 = "seebau"
        environment2 = environment
        local game2 = environment2.game
        getrunningscripts2 = game2
        capturedValue = "ReplicatedStorage"
        local getService = getrunningscripts2.GetService
        value54 = getrunningscripts2
        local capturedValue4 = capturedValue
        value92 = capturedValue4
        local service = getService(value54, capturedValue4)
        getrunningscripts2 = service
        value4 = "Folder"
        local item2 = getrunningscripts2[value4]
        getrunningscripts2 = item2
        value4 = "Folder"
        local item3 = getrunningscripts2[value4]
        getrunningscripts2 = item3
        value4 = "Folder"
        local item4 = getrunningscripts2[value4]
        getrunningscripts2 = item4
        value4 = "Folder"
        local item5 = getrunningscripts2[value4]
        getrunningscripts2 = item5
        value4 = "Folder"
        local item6 = getrunningscripts2[value4]
        getrunningscripts2 = item6
        value4 = "Folder"
        local item7 = getrunningscripts2[value4]
        getrunningscripts2 = item7
        value4 = "is this my life?..."
        local item8 = getrunningscripts2[value4]
        getrunningscripts2 = item8
        value4 = "Value"
        item9 = getrunningscripts2[value4]
        getrunningscripts2 = item9
        local pairs22 = pairs2
        local getrunningscripts22 = getrunningscripts2
        find2Result = pairs22
        value10 = getrunningscripts22
        local value7 = pairs22 .. getrunningscripts22
        value72 = value7
        pairs2 = value7
        local value52 = value5
        capturedValue32 = pairs2
        if value52 ~= capturedValue32 then
          value5 = false
        else
          value5 = true
        end
        value53 = value5
        if value53 then
          value53 = true
          argument = true
        end
      end
    end
  end
  
  callback = callback()
  value5 = not argument
  if not value5 then
    return
  end
  pairs2 = reportResult
  value8 = pairs2
  getrunningscripts2 = false
  result = getrunningscripts2
  value9 = "getrunningscripts"
  value8(result, value9, "Was unable to find a running script with its script global set to nil")
  value5 = failureMap
  pairs2 = "getrunningscripts"
  value5 = value5.getrunningscripts
  if not value5 then
    return
  else
    value5 = true
    packResults2 = failureFlag
    packResults2[1] = value5
    return
  end
  return
end
