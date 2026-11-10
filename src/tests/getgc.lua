local reportResult, failureMap, failureFlag, captured4, packResults, unpackResults, environment
reportResult, failureMap, failureFlag, captured4, packResults, unpackResults, environment = ...
return function(argument)
  local value, getgc2, value2, value3, pairs2, value4, getgc3, value5, value6, value7, capturedValue, capturedValue2, value8, value10, value11, value12, values, value15, value16, resultCount, callback, callbackResult
  getgc3 = environment.getgc
  value10 = getgc3
  value10 = value10()
  argument = value10
  value = environment.type
  value10 = value
  value8 = argument
  value11 = value8
  value10 = value10(value11)
  getgc3 = value10
  value = "table"
  if getgc3 == value then
    getgc3 = false
  else
    getgc3 = true
  end
  if getgc3 then
    value = reportResult
    value10 = value
    value2 = false
    value11 = value2
    value3 = "getgc"
    value8 = value3
    value12 = value8
    value5 = "Didn't return a table value"
    value8 = value5
    value10(value11, value12, value8)
  end
  value = environment.pcall
  value10 = value
  
  function value2(argument)
    local item22, pairs2, value5, value8, results2, item4, environment2
    argument = 0
    pairs2 = environment.pairs
    value8 = pairs2
    environment2 = environment
    local getgc2 = environment2.getgc
    local results = packResults(getgc2())
    results2 = results
    local unpackResults2 = unpackResults
    local resultCount = results.n
    local callbackResult = (function(a_native_fixed_result_call_1, ...)
      return {
        a_native_fixed_result_call_1(...)
      }
    end)(pairs2, unpackResults2(results, 1, resultCount))
    item4 = callbackResult[1]
    local item = callbackResult[2]
    local item2 = callbackResult[3]
    local value = item4
    local item3 = item
    item22 = item2
    while true do
      value8, results2 = value(item3, item22)
      item22 = value8
      local value2 = results2
      value5 = nil
      if value8 == nil then
        value5 = true
      else
        value5 = false
      end
      if value5 then
        break
      end
      environment2 = environment
      value5 = environment2.game
      item4 = value2:IsDescendantOf(value5)
      pairs2 = item4
      if item4 then
        pairs2 = 1
        argument = argument + 1
      end
    end
    if argument >= 0 then
      pairs2 = true
    else
      pairs2 = false
    end
    if pairs2 then
      reportResult(false, "getgc", "Everyone must GetDescendants of game \240\159\153\143\240\159\153\143\240\159\153\143[1]")
      pairs2 = failureMap.getgc
      if pairs2 then
        pairs2 = true
        failureFlag[1] = true
      end
    end
    if argument == #environment.getgc() then
      pairs2 = true
    else
      pairs2 = false
    end
    if not pairs2 then
      return
    end
    reportResult(false, "getgc", "Everyone must GetDescendants of game \240\159\153\143\240\159\153\143\240\159\153\143[2]")
    if not failureMap.getgc then
      return
    end
    failureFlag[1] = true
    return
  end
  
  value11 = value2
  value10(value11)
  getgc3 = {}
  values = {}
  values[1] = value
  value = values
  
  function value2(argument)
    return
  end
  
  value[1] = value2
  value3 = environment.task
  value5 = "wait"
  value3 = value3.wait
  value10 = value3
  value10()
  value3 = environment.task
  value5 = "wait"
  value3 = value3.wait
  value8 = value3
  value10 = value8
  value10()
  value2 = false
  value3 = false
  value5 = false
  pairs2 = environment.pairs
  value10 = pairs2
  getgc2 = environment.getgc
  value8 = getgc2
  value11 = value8
  value12 = true
  values = packResults
  value15 = value11
  value16 = value12
  value11 = values(value15(value16))
  values = value10
  value15 = unpackResults
  value16 = value11
  resultCount = value11.n
  callbackResult = (function(a_native_fixed_result_call_1, ...)
    return {
      a_native_fixed_result_call_1(...)
    }
  end)(values, value15(value16, 1, resultCount))
  values = callbackResult[1]
  value15 = callbackResult[2]
  value16 = callbackResult[3]
  value4 = values
  value6 = value15
  value7 = value16
  
  function callback()
    local pairs22, getgc32, value3, value5, value122
    while true do
      local value42 = value4
      value10 = value42
      local value62 = value6
      value11 = value62
      local value72 = value7
      value12 = value72
      local value102 = value10
      local value112 = value11
      value122 = value12
      value3, value5 = value102(value112, value122)
      value10 = value3
      value11 = value5
      local value103 = value10
      value7 = value103
      local value113 = value11
      capturedValue = value113
      capturedValue2 = nil
      if value7 ~= capturedValue2 then
        capturedValue2 = false
      else
        capturedValue2 = true
      end
      if capturedValue2 then
        return 0
      end
      local value73 = value7
      value7 = value73
      local capturedValue3 = capturedValue
      capturedValue = capturedValue3
      local capturedValue4 = capturedValue
      getgc32 = getgc3
      if capturedValue4 ~= getgc32 then
        pairs2 = false
      else
        pairs2 = true
      end
      pairs22 = pairs2
      if pairs22 then
        pairs22 = true
        value2 = true
      end
    end
  end
  
  callback = callback()
  pairs2 = environment.pairs
  value8 = pairs2
  value10 = value8
  argument = environment.getgc
  values = packResults
  value15 = argument
  value11 = values(value15())
  values = value10
  value15 = unpackResults
  value16 = value11
  resultCount = value11.n
  callbackResult = (function(a_native_fixed_result_call_1, ...)
    return {
      a_native_fixed_result_call_1(...)
    }
  end)(values, value15(value16, 1, resultCount))
  values = callbackResult[1]
  value15 = callbackResult[2]
  value16 = callbackResult[3]
  value4 = values
  value6 = value15
  value7 = value16
  
  function callback()
    local pairs22, getgc32, value8, value9, value122
    while true do
      local value42 = value4
      value10 = value42
      local value62 = value6
      value11 = value62
      local value72 = value7
      value12 = value72
      local value102 = value10
      local value112 = value11
      value122 = value12
      value8, value9 = value102(value112, value122)
      value10 = value8
      value11 = value9
      local value103 = value10
      value7 = value103
      local value113 = value11
      capturedValue = value113
      capturedValue2 = nil
      if value7 ~= capturedValue2 then
        capturedValue2 = false
      else
        capturedValue2 = true
      end
      if capturedValue2 then
        return 0
      end
      local value73 = value7
      value7 = value73
      local capturedValue3 = capturedValue
      capturedValue = capturedValue3
      local item = value[1]
      argument = item
      if capturedValue ~= argument then
        pairs2 = false
      else
        pairs2 = true
      end
      if pairs2 then
        value3 = true
      end
      local capturedValue4 = capturedValue
      getgc32 = getgc3
      if capturedValue4 ~= getgc32 then
        pairs2 = false
      else
        pairs2 = true
      end
      pairs22 = pairs2
      if pairs22 then
        pairs22 = true
        value5 = true
      end
    end
  end
  
  callback = callback()
  pairs2 = value5
  if pairs2 then
    argument = reportResult
    value10 = argument
    getgc2 = false
    value11 = getgc2
    value12 = "getgc"
    value10(value11, value12, "Was able to retrieve a table with a non-true argument passed")
    pairs2 = failureMap
    argument = "getgc"
    pairs2 = pairs2.getgc
    if pairs2 then
      pairs2 = true
      values = failureFlag
      values[1] = pairs2
    end
  end
  pairs2 = false
  argument = environment.pairs
  value10 = argument
  getgc2 = environment.getgc
  values = packResults
  value15 = getgc2
  value11 = values(value15())
  values = value10
  value15 = unpackResults
  value16 = value11
  resultCount = value11.n
  callbackResult = (function(a_native_fixed_result_call_1, ...)
    return {
      a_native_fixed_result_call_1(...)
    }
  end)(values, value15(value16, 1, resultCount))
  values = callbackResult[1]
  value15 = callbackResult[2]
  value16 = callbackResult[3]
  value4 = values
  value6 = value15
  value7 = value16
  
  function callback()
    local argument4, getgc24, gc22, capturedValue42, value122, value14, environment2
    while "type" do
      local value42 = value4
      value10 = value42
      local value62 = value6
      value11 = value62
      local value72 = value7
      value12 = value72
      local value102 = value10
      local value112 = value11
      value122 = value12
      gc22, capturedValue42 = value102(value112, value122)
      value10 = gc22
      value11 = capturedValue42
      local value103 = value10
      value7 = value103
      local value113 = value11
      capturedValue = value113
      capturedValue2 = nil
      if value7 ~= capturedValue2 then
        capturedValue2 = false
      else
        capturedValue2 = true
      end
      if capturedValue2 then
        return 0
      end
      local value73 = value7
      value7 = value73
      local capturedValue3 = capturedValue
      capturedValue = capturedValue3
      environment2 = environment
      local value2 = environment2.type
      getgc2 = value2
      local getgc22 = getgc2
      local capturedValue4 = capturedValue
      capturedValue42 = capturedValue4
      gc22 = getgc22(capturedValue4)
      value14 = gc22
      argument = gc22
      getgc2 = "function"
      local argument2 = argument
      getgc24 = getgc2
      if argument2 ~= getgc24 then
        argument = false
      else
        argument = true
      end
      argument4 = argument
      if argument4 then
        local tostring2 = environment.tostring
        getgc2 = tostring2
        local getgc23 = getgc2
        value8 = getgc23
        local value82 = value8
        value10 = value82
        local capturedValue5 = capturedValue
        value11 = capturedValue5
        local value10Result = value10(value11)
        value10 = value10Result
        local value104 = value10
        argument = value104
        environment2 = environment
        local tostring3 = environment2.tostring
        value = tostring3
        local value3 = value
        value8 = value3
        local value83 = value8
        value10 = value83
        local captured42 = captured4
        getgc3 = captured42
        local getgc32 = getgc3
        value8 = getgc32
        local value84 = value8
        value11 = value84
        local value105 = value10
        capturedValue42 = value11
        gc22 = value105(capturedValue42)
        value10 = gc22
        local value106 = value10
        getgc2 = value106
        local argument3 = argument
        getgc24 = getgc2
        if argument3 ~= getgc24 then
          argument = false
        else
          argument = true
        end
        argument4 = argument
        if argument4 then
          argument4 = true
          pairs2 = true
        end
      end
    end
  end
  
  callback = callback()
  argument = not pairs2
  if argument then
    getgc2 = reportResult
    value8 = getgc2
    value10 = value8
    value = false
    value8 = value
    value11 = value8
    value12 = "getgc"
    value10(value11, value12, "Couldn't find a game function")
    argument = failureMap
    getgc2 = "getgc"
    argument = argument.getgc
    if argument then
      argument = true
      values = failureFlag
      values[1] = argument
    end
  end
  argument = not value2
  argument = argument or not value3
  if argument then
    getgc2 = reportResult
    value8 = getgc2
    value10 = value8
    value = false
    value11 = value
    value12 = "getgc"
    value10(value11, value12, "Couldn't fetch a needed value")
    argument = failureMap
    getgc2 = "getgc"
    argument = argument.getgc
    if argument then
      argument = true
      values = failureFlag
      values[1] = argument
    end
  end
  getgc2 = environment.Instance
  value = "new"
  getgc2 = getgc2.new
  value8 = getgc2
  value10 = value8
  value11 = "Part"
  value10 = value10(value11)
  argument = value10
  value = environment.task
  getgc3 = "wait"
  value = value.wait
  value10 = value
  value10()
  getgc2 = false
  value = environment.pairs
  value10 = value
  value = environment.getgc
  value11 = value
  value = true
  value8 = value
  value12 = value8
  values = packResults
  value15 = value11
  value16 = value12
  value11 = values(value15(value16))
  values = value10
  value15 = unpackResults
  value16 = value11
  resultCount = value11.n
  callbackResult = (function(a_native_fixed_result_call_1, ...)
    return {
      a_native_fixed_result_call_1(...)
    }
  end)(values, value15(value16, 1, resultCount))
  values = callbackResult[1]
  value15 = callbackResult[2]
  value16 = callbackResult[3]
  value4 = values
  value6 = value15
  value7 = value16
  
  function callback()
    local value5, getgc33, value104Result, value114, value122, environment2
    repeat
      repeat
        local value42 = value4
        value10 = value42
        local value62 = value6
        value11 = value62
        local value72 = value7
        value12 = value72
        local value102 = value10
        local value112 = value11
        value122 = value12
        value104Result, value114 = value102(value112, value122)
        value10 = value104Result
        value11 = value114
        local value103 = value10
        value7 = value103
        local value113 = value11
        capturedValue = value113
        capturedValue2 = nil
        if value7 ~= capturedValue2 then
          capturedValue2 = false
        else
          capturedValue2 = true
        end
        if capturedValue2 then
          return 1
        end
        local value73 = value7
        value7 = value73
        local capturedValue4 = capturedValue
        capturedValue = capturedValue4
        environment2 = environment
        local value2 = environment2.type
        getgc3 = value2
        local getgc32 = getgc3
        value10 = getgc32
        local capturedValue5 = capturedValue
        value8 = capturedValue5
        local value82 = value8
        value11 = value82
        local value104 = value10
        value114 = value11
        value104Result = value104(value114)
        value10 = value104Result
        local value105 = value10
        value = value105
        getgc3 = "userdata"
        local value3 = value
        getgc33 = getgc3
        if value3 ~= getgc33 then
          value = false
        else
          value = true
        end
        value5 = value
      until value5
      local capturedValue3 = capturedValue
      getgc33 = argument
      if capturedValue3 ~= getgc33 then
        value = false
      else
        value = true
      end
      value5 = value
    until value5
    return 0
  end
  
  if callback() == 0 then
    getgc2 = true
  end
  value = not getgc2
  if not value then
    return
  end
  getgc3 = reportResult
  value10 = getgc3
  value = false
  value11 = value
  value = "getgc"
  value8 = value
  value12 = value8
  value10(value11, value12, "Failed to retrieve a userdata object")
  value = failureMap
  getgc3 = "getgc"
  value = value.getgc
  if not value then
    return
  else
    value = true
    values = failureFlag
    values[1] = value
    return
  end
  return
end
