local reportResult, failureMap, failureFlag, packResults, unpackResults, environment
reportResult, failureMap, failureFlag, packResults, unpackResults, environment = ...
return function(argument)
  local value10, value11, getscripts2, value12, item7, item22, value13, capturedValue, value16, packResults2Result, value17, item8
  argument = environment.pairs
  value16 = argument
  getscripts2 = environment.getscripts
  local packResults2 = packResults
  local value = getscripts2
  packResults2Result = packResults2(value())
  local value2 = value16
  local unpackResults2 = unpackResults
  local value3 = packResults2Result
  local resultCount = packResults2Result.n
  local callbackResult = (function(a_native_fixed_result_call_1, ...)
    return {
      a_native_fixed_result_call_1(...)
    }
  end)(value2, unpackResults2(value3, 1, resultCount))
  item8 = callbackResult[1]
  local item = callbackResult[2]
  local item2 = callbackResult[3]
  value12 = item8
  item7 = item
  item22 = item2
  value13 = item22
  
  local function callback()
    local argument2, value, item, isDescendantOf3, value2, value1022, argument3, environment2
    repeat
      local value122 = value12
      value16 = value122
      local item72 = item7
      packResults2Result = item72
      local value132 = value13
      value17 = value132
      local value162 = value16
      local packResults2Result2 = packResults2Result
      local value172 = value17
      isDescendantOf3, value2 = value162(packResults2Result2, value172)
      value16 = isDescendantOf3
      packResults2Result = value2
      local value163 = value16
      value13 = value163
      local packResults2Result3 = packResults2Result
      item22 = packResults2Result3
      capturedValue = nil
      if value13 ~= capturedValue then
        capturedValue = false
      else
        capturedValue = true
      end
      if capturedValue then
        return 1
      end
      local value133 = value13
      value13 = value133
      local item222 = item22
      item22 = item222
      local item223 = item22
      argument = item223
      environment2 = environment
      local game2 = environment2.game
      value10 = game2
      value11 = "CorePackages"
      item = value10[value11]
      value10 = item
      local isDescendantOf = argument.IsDescendantOf
      argument3 = argument
      local value102 = value10
      value2 = argument3
      value1022 = value102
      isDescendantOf3 = isDescendantOf(argument3, value102)
      value = isDescendantOf3
      argument = isDescendantOf3
      argument2 = argument
      if argument2 then
      else
        local item224 = item22
        argument = item224
        environment2 = environment
        local game3 = environment2.game
        value10 = game3
        value11 = "CoreGui"
        item = value10[value11]
        value10 = item
        local isDescendantOf2 = argument.IsDescendantOf
        argument3 = argument
        local value103 = value10
        value2 = argument3
        value1022 = value103
        isDescendantOf3 = isDescendantOf2(argument3, value103)
        value = isDescendantOf3
        argument = isDescendantOf3
      end
      argument2 = argument
    until argument2
    return 0
  end
  
  if callback() == 0 then
    getscripts2 = reportResult
    value16 = getscripts2
    value10 = false
    packResults2Result = value10
    value17 = "getscripts"
    argument = "Shouldn't return core scripts by default"
    value16(packResults2Result, value17, argument)
    argument = failureMap
    getscripts2 = "getscripts"
    argument = argument.getscripts
    if argument then
      argument = true
      local failureFlag4 = failureFlag
      failureFlag4[1] = argument
    end
  end
  argument = false
  value10 = environment.Instance
  value11 = "new"
  value10 = value10.new
  value16 = value10
  value11 = "LocalScript"
  packResults2Result = value11
  value16 = value16(packResults2Result)
  getscripts2 = value16
  value10 = environment.pairs
  value16 = value10
  value11 = environment.getscripts
  local packResults3 = packResults
  local value4 = value11
  packResults2Result = packResults3(value4())
  local value5 = value16
  local unpackResults3 = unpackResults
  local value6 = packResults2Result
  local resultCount2 = packResults2Result.n
  local callbackResult2 = (function(a_native_fixed_result_call_1, ...)
    return {
      a_native_fixed_result_call_1(...)
    }
  end)(value5, unpackResults3(value6, 1, resultCount2))
  item8 = callbackResult2[1]
  local item3 = callbackResult2[2]
  local item4 = callbackResult2[3]
  value12 = item8
  item7 = item3
  item22 = item4
  value13 = item22
  
  local function callback2()
    local value102, getscripts22, value2, value3, value172
    while true do
      local value122 = value12
      value16 = value122
      local item72 = item7
      packResults2Result = item72
      local value132 = value13
      value17 = value132
      local value162 = value16
      local packResults2Result2 = packResults2Result
      value172 = value17
      value2, value3 = value162(packResults2Result2, value172)
      value16 = value2
      packResults2Result = value3
      local value163 = value16
      value13 = value163
      local packResults2Result3 = packResults2Result
      item22 = packResults2Result3
      capturedValue = nil
      if value13 ~= capturedValue then
        capturedValue = false
      else
        capturedValue = true
      end
      if capturedValue then
        return 0
      end
      local value133 = value13
      value13 = value133
      local item222 = item22
      item22 = item222
      local item223 = item22
      getscripts22 = getscripts2
      if item223 ~= getscripts22 then
        value10 = false
      else
        value10 = true
      end
      value102 = value10
      if value102 then
        value102 = true
        argument = true
      end
    end
  end
  
  local callback2Result = callback2()
  value10 = not argument
  if value10 then
    value11 = reportResult
    value16 = value11
    argument = false
    packResults2Result = argument
    value17 = "getscripts"
    value12 = "Couldn't fetch a script parented to nil"
    value16(packResults2Result, value17, value12)
    value10 = failureMap
    value11 = "getscripts"
    value10 = value10.getscripts
    if value10 then
      value10 = true
      local failureFlag3 = failureFlag
      failureFlag3[1] = value10
    end
  end
  value10 = false
  argument = environment.Instance
  getscripts2 = "new"
  argument = argument.new
  value16 = argument
  packResults2Result = "Script"
  value16 = value16(packResults2Result)
  value11 = value16
  argument = "RunContext"
  getscripts2 = environment.Enum
  value12 = "RunContext"
  getscripts2 = getscripts2.RunContext
  value12 = "Client"
  getscripts2 = getscripts2.Client
  value11[argument] = getscripts2
  argument = environment.pairs
  value16 = argument
  getscripts2 = environment.getscripts
  local packResults4 = packResults
  local value7 = getscripts2
  packResults2Result = packResults4(value7())
  local value8 = value16
  local unpackResults4 = unpackResults
  local value9 = packResults2Result
  local resultCount3 = packResults2Result.n
  local callbackResult3 = (function(a_native_fixed_result_call_1, ...)
    return {
      a_native_fixed_result_call_1(...)
    }
  end)(value8, unpackResults4(value9, 1, resultCount3))
  item8 = callbackResult3[1]
  local item5 = callbackResult3[2]
  local item6 = callbackResult3[3]
  value12 = item8
  item7 = item5
  item22 = item6
  value13 = item22
  
  local function callback3()
    local argument2, value112, value2, value3, value172
    while true do
      local value122 = value12
      value16 = value122
      local item72 = item7
      packResults2Result = item72
      local value132 = value13
      value17 = value132
      local value162 = value16
      local packResults2Result2 = packResults2Result
      value172 = value17
      value2, value3 = value162(packResults2Result2, value172)
      value16 = value2
      packResults2Result = value3
      local value163 = value16
      value13 = value163
      local packResults2Result3 = packResults2Result
      item22 = packResults2Result3
      capturedValue = nil
      if value13 ~= capturedValue then
        capturedValue = false
      else
        capturedValue = true
      end
      if capturedValue then
        return 0
      end
      local value133 = value13
      value13 = value133
      local item222 = item22
      item22 = item222
      local item223 = item22
      value112 = value11
      if item223 ~= value112 then
        argument = false
      else
        argument = true
      end
      argument2 = argument
      if argument2 then
        argument2 = true
        value10 = true
      end
    end
  end
  
  local callback3Result = callback3()
  argument = not value10
  if not argument then
    return
  end
  getscripts2 = reportResult
  value16 = getscripts2
  value12 = false
  packResults2Result = value12
  argument = "getscripts"
  value17 = argument
  value16(packResults2Result, value17, "Couldn't fetch a 'Script' with RunContext set to Client and parented to nil")
  argument = failureMap
  getscripts2 = "getscripts"
  argument = argument.getscripts
  if not argument then
    return
  else
    argument = true
    local failureFlag2 = failureFlag
    failureFlag2[1] = argument
    return
  end
  return
end
