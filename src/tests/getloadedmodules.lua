local reportResult, failureMap, failureFlag, checkpointLogger, packResults, unpackResults, environment
reportResult, failureMap, failureFlag, checkpointLogger, packResults, unpackResults, environment = ...
return function(argument)
  local reportResult2, value, value2, value3, value4, capturedValue, value5, value6, value7, value8, value10, value11, value12, value13, failureFlag2, value15, value16, resultCount, callback, callbackResult
  argument = environment.require
  argument = not argument
  if argument then
    reportResult2 = reportResult
    value10 = reportResult2
    value = false
    value11 = value
    value5 = "getloadedmodules"
    value8 = value5
    value12 = value8
    argument = "require is needed in order to test"
    value8 = argument
    value13 = value8
    value10(value11, value12, value13)
    argument = failureMap
    reportResult2 = "getloadedmodules"
    argument = argument.getloadedmodules
    if argument then
      argument = true
      failureFlag2 = failureFlag
      failureFlag2[1] = argument
    end
  end
  argument = {}
  reportResult2 = environment.pairs
  value10 = reportResult2
  value = environment.getloadedmodules
  failureFlag2 = packResults
  value15 = value
  value11 = failureFlag2(value15())
  failureFlag2 = value10
  value15 = unpackResults
  value16 = value11
  resultCount = value11.n
  callbackResult = (function(a_native_fixed_result_call_1, ...)
    return {
      a_native_fixed_result_call_1(...)
    }
  end)(failureFlag2, value15(value16, 1, resultCount))
  failureFlag2 = callbackResult[1]
  value15 = callbackResult[2]
  value16 = callbackResult[3]
  value2 = failureFlag2
  value3 = value15
  value4 = value16
  
  function callback()
    local reportResult22, capturedValue3, item, value, value5, value122
    repeat
      local value22 = value2
      value10 = value22
      local value32 = value3
      value11 = value32
      local value42 = value4
      value12 = value42
      local value102 = value10
      local value112 = value11
      value122 = value12
      value, value5 = value102(value112, value122)
      value10 = value
      value11 = value5
      local value103 = value10
      value4 = value103
      local value113 = value11
      capturedValue = value113
      value6 = nil
      if value4 ~= value6 then
        value6 = false
      else
        value6 = true
      end
      if value6 then
        return 1
      end
      local value43 = value4
      value4 = value43
      local capturedValue2 = capturedValue
      capturedValue = capturedValue2
      local argument2 = argument
      capturedValue3 = capturedValue
      item = argument2[capturedValue3]
      reportResult2 = item
      reportResult22 = reportResult2
    until reportResult22
    return 0
  end
  
  if callback() == 0 then
    value = reportResult
    value10 = value
    value5 = false
    value11 = value5
    argument = "getloadedmodules"
    value8 = argument
    value12 = value8
    value13 = "Shouldn't return duplicates"
    value10(value11, value12, value13)
    reportResult2 = failureMap
    value = "getloadedmodules"
    reportResult2 = reportResult2.getloadedmodules
    if reportResult2 then
      reportResult2 = true
      failureFlag2 = failureFlag
      failureFlag2[1] = reportResult2
    end
  end
  value = checkpointLogger
  value10 = value
  value11 = "CP1"
  value10(value11)
  reportResult2 = false
  value = false
  value5 = environment.pairs
  value8 = value5
  value10 = value8
  argument = environment.getloadedmodules
  failureFlag2 = packResults
  value15 = argument
  value11 = failureFlag2(value15())
  failureFlag2 = value10
  value15 = unpackResults
  value16 = value11
  resultCount = value11.n
  callbackResult = (function(a_native_fixed_result_call_1, ...)
    return {
      a_native_fixed_result_call_1(...)
    }
  end)(failureFlag2, value15(value16, 1, resultCount))
  failureFlag2 = callbackResult[1]
  value15 = callbackResult[2]
  value16 = callbackResult[3]
  value2 = failureFlag2
  value3 = value15
  value4 = value16
  
  function callback()
    local value52, argument2, item6, service, value8, value622, argument3, environment2
    while "game" do
      local value22 = value2
      value10 = value22
      local value32 = value3
      value11 = value32
      local value42 = value4
      value12 = value42
      local value102 = value10
      local value112 = value11
      local value122 = value12
      service, value8 = value102(value112, value122)
      value10 = service
      value11 = value8
      local value103 = value10
      value4 = value103
      local value113 = value11
      capturedValue = value113
      value6 = nil
      if value4 ~= value6 then
        value6 = false
      else
        value6 = true
      end
      if value6 then
        return 0
      end
      local value43 = value4
      value4 = value43
      local capturedValue2 = capturedValue
      capturedValue = capturedValue2
      local game2 = environment.game
      argument = game2
      value6 = "ReplicatedFirst"
      local getService = argument.GetService
      argument3 = argument
      local value62 = value6
      value8 = argument3
      value622 = value62
      service = getService(argument3, value62)
      argument = service
      value7 = "bleepbloop"
      local item = argument[value7]
      argument = item
      value7 = "getting rich like this is a hobby"
      local item2 = argument[value7]
      argument = item2
      if capturedValue ~= argument then
        value5 = false
      else
        value5 = true
      end
      if value5 then
        reportResult2 = true
      end
      environment2 = environment
      local game3 = environment2.game
      argument = game3
      value7 = "Players"
      local item3 = argument[value7]
      argument = item3
      value7 = "LocalPlayer"
      local item4 = argument[value7]
      argument = item4
      value7 = "PlayerScripts"
      local item5 = argument[value7]
      argument = item5
      value7 = "Pull off in a Tonka, yeah, this a big body"
      item6 = argument[value7]
      argument = item6
      local capturedValue3 = capturedValue
      argument2 = argument
      if capturedValue3 ~= argument2 then
        value5 = false
      else
        value5 = true
      end
      value52 = value5
      if value52 then
        value52 = true
        value = true
      end
    end
  end
  
  callback = callback()
  argument = checkpointLogger
  value10 = argument
  value11 = "CP2"
  value10(value11)
  value5 = not reportResult2
  value5 = value5 and value
  if value5 then
    argument = reportResult
    value10 = argument
    value7 = false
    value8 = value7
    value11 = value8
    value6 = "getloadedmodules"
    value8 = value6
    value12 = value8
    value13 = "Aaaand we're ud ash \240\159\146\148\240\159\146\148\240\159\165\128\240\159\165\128"
    value10(value11, value12, value13)
    value5 = failureMap
    argument = "getloadedmodules"
    value5 = value5.getloadedmodules
    if value5 then
      value5 = true
      failureFlag2 = failureFlag
      failureFlag2[1] = value5
    end
  end
  value5 = environment.pairs
  value10 = value5
  argument = environment.getloadedmodules
  failureFlag2 = packResults
  value15 = argument
  value11 = failureFlag2(value15())
  failureFlag2 = value10
  value15 = unpackResults
  value16 = value11
  resultCount = value11.n
  callbackResult = (function(a_native_fixed_result_call_1, ...)
    return {
      a_native_fixed_result_call_1(...)
    }
  end)(failureFlag2, value15(value16, 1, resultCount))
  failureFlag2 = callbackResult[1]
  value15 = callbackResult[2]
  value16 = callbackResult[3]
  value2 = failureFlag2
  value3 = value15
  value4 = value16
  
  function callback()
    local value53, argument3, item6, value104, value114, value122, value132, failureFlag2, environment2
    while "getloadedmodules" do
      local value22 = value2
      value10 = value22
      local value32 = value3
      value11 = value32
      local value42 = value4
      value12 = value42
      local value102 = value10
      local value112 = value11
      value122 = value12
      value104, value114 = value102(value112, value122)
      value10 = value104
      value11 = value114
      local value103 = value10
      value4 = value103
      local value113 = value11
      capturedValue = value113
      value6 = nil
      if value4 ~= value6 then
        value6 = false
      else
        value6 = true
      end
      if value6 then
        return 0
      end
      local value43 = value4
      value4 = value43
      local capturedValue2 = capturedValue
      capturedValue = capturedValue2
      environment2 = environment
      local game2 = environment2.game
      argument = game2
      value7 = "Players"
      local item = argument[value7]
      argument = item
      value7 = "LocalPlayer"
      local item2 = argument[value7]
      argument = item2
      value7 = "PlayerScripts"
      local item3 = argument[value7]
      argument = item3
      value7 = "ModuleScripka"
      item6 = argument[value7]
      argument = item6
      local capturedValue3 = capturedValue
      argument3 = argument
      if capturedValue3 ~= argument3 then
        value5 = false
      else
        value5 = true
      end
      value53 = value5
      if value53 then
      else
        environment2 = environment
        local game3 = environment2.game
        argument = game3
        value7 = "StarterPlayer"
        local item4 = argument[value7]
        argument = item4
        value7 = "StarterPlayerScripts"
        local item5 = argument[value7]
        argument = item5
        value7 = "ModuleScripka"
        item6 = argument[value7]
        argument = item6
        local capturedValue4 = capturedValue
        argument3 = argument
        if capturedValue4 ~= argument3 then
          value5 = false
        else
          value5 = true
        end
      end
      value53 = value5
      if value53 then
        local reportResult3 = reportResult
        argument = reportResult3
        local argument2 = argument
        value10 = argument2
        value7 = false
        local value72 = value7
        value11 = value72
        value12 = "getloadedmodules"
        reportResult2 = "Returned an unloaded module"
        local reportResult22 = reportResult2
        value8 = reportResult22
        local value82 = value8
        value13 = value82
        value104 = value10
        value114 = value11
        value122 = value12
        value132 = value13
        value104(value114, value122, value132)
        local failureMap2 = failureMap
        value5 = failureMap2
        argument = "getloadedmodules"
        local value52 = value5
        argument3 = argument
        item6 = value52[argument3]
        value5 = item6
        value53 = value5
        if value53 then
          value5 = true
          failureFlag2 = failureFlag
          value53 = value5
          argument3 = failureFlag2
          failureFlag2[1] = value53
        end
      end
    end
  end
  
  callback = callback()
  argument = checkpointLogger
  value10 = argument
  value11 = "CP3"
  value10(value11)
  value5 = false
  argument = environment.pairs
  value10 = argument
  value7 = environment.getloadedmodules
  failureFlag2 = packResults
  value15 = value7
  value11 = failureFlag2(value15())
  failureFlag2 = value10
  value15 = unpackResults
  value16 = value11
  resultCount = value11.n
  callbackResult = (function(a_native_fixed_result_call_1, ...)
    return {
      a_native_fixed_result_call_1(...)
    }
  end)(failureFlag2, value15(value16, 1, resultCount))
  failureFlag2 = callbackResult[1]
  value15 = callbackResult[2]
  value16 = callbackResult[3]
  value2 = failureFlag2
  value3 = value15
  value4 = value16
  
  function callback()
    local argument5, value73, item, value105Result, value114, value122, environment2
    while "require" do
      local value22 = value2
      value10 = value22
      local value32 = value3
      value11 = value32
      local value42 = value4
      value12 = value42
      local value102 = value10
      local value112 = value11
      value122 = value12
      value105Result, value114 = value102(value112, value122)
      value10 = value105Result
      value11 = value114
      local value103 = value10
      value4 = value103
      local value113 = value11
      capturedValue = value113
      value6 = nil
      if value4 ~= value6 then
        value6 = false
      else
        value6 = true
      end
      if value6 then
        return 0
      end
      local value43 = value4
      value4 = value43
      local capturedValue2 = capturedValue
      capturedValue = capturedValue2
      value7 = "Name"
      item = capturedValue[value7]
      argument = item
      value7 = "scriptsomemodulesrn"
      local argument2 = argument
      value73 = value7
      if argument2 ~= value73 then
        argument = false
      else
        argument = true
      end
      argument5 = argument
      if not argument5 then
      else
        value7 = "ClassName"
        item = capturedValue[value7]
        argument = item
        value7 = "ModuleScript"
        local argument4 = argument
        value73 = value7
        if argument4 ~= value73 then
          argument = false
        else
          argument = true
        end
      end
      argument5 = argument
      if argument5 then
        environment2 = environment
        local require2 = environment2.require
        value6 = require2
        local value62 = value6
        value10 = value62
        local capturedValue3 = capturedValue
        value8 = capturedValue3
        local value82 = value8
        value11 = value82
        local value10Result = value10(value11)
        value10 = value10Result
        local value104 = value10
        value7 = value104
        local value72 = value7
        value8 = value72
        local value83 = value8
        value10 = value83
        local values = {}
        value6 = values
        value6.RIP = 95
        local value63 = value6
        value11 = value63
        local value105 = value10
        value114 = value11
        value105Result = value105(value114)
        value10 = value105Result
        local value106 = value10
        argument = value106
        value7 = 9
        local argument3 = argument
        value73 = value7
        if argument3 ~= value73 then
          argument = false
        else
          argument = true
        end
        argument5 = argument
        if argument5 then
          argument5 = true
          value5 = true
        end
      end
    end
  end
  
  callback = callback()
  value7 = checkpointLogger
  value10 = value7
  value11 = "CP4"
  value10(value11)
  value7 = environment.task
  value6 = "wait"
  value7 = value7.wait
  value10 = value7
  value10()
  argument = not value5
  if argument then
    value7 = reportResult
    value10 = value7
    value6 = false
    value11 = value6
    reportResult2 = "getloadedmodules"
    value8 = reportResult2
    value12 = value8
    value13 = "Couldn't find a loaded module[1]"
    value10(value11, value12, value13)
    argument = failureMap
    value7 = "getloadedmodules"
    argument = argument.getloadedmodules
    if argument then
      argument = true
      failureFlag2 = failureFlag
      failureFlag2[1] = argument
    end
  end
  argument = false
  value7 = environment.pairs
  value10 = value7
  value6 = environment.getloadedmodules
  failureFlag2 = packResults
  value15 = value6
  value11 = failureFlag2(value15())
  failureFlag2 = value10
  value15 = unpackResults
  value16 = value11
  resultCount = value11.n
  callbackResult = (function(a_native_fixed_result_call_1, ...)
    return {
      a_native_fixed_result_call_1(...)
    }
  end)(failureFlag2, value15(value16, 1, resultCount))
  failureFlag2 = callbackResult[1]
  value15 = callbackResult[2]
  value16 = callbackResult[3]
  value2 = failureFlag2
  value3 = value15
  value4 = value16
  
  function callback()
    local value72, value62, item3, value, value5, value122, environment2
    while "game" do
      local value22 = value2
      value10 = value22
      local value32 = value3
      value11 = value32
      local value42 = value4
      value12 = value42
      local value102 = value10
      local value112 = value11
      value122 = value12
      value, value5 = value102(value112, value122)
      value10 = value
      value11 = value5
      local value103 = value10
      value4 = value103
      local value113 = value11
      capturedValue = value113
      value6 = nil
      if value4 ~= value6 then
        value6 = false
      else
        value6 = true
      end
      if value6 then
        return 0
      end
      local value43 = value4
      value4 = value43
      local capturedValue2 = capturedValue
      capturedValue = capturedValue2
      environment2 = environment
      local game2 = environment2.game
      value6 = game2
      reportResult2 = "ReplicatedStorage"
      local item = value6[reportResult2]
      value6 = item
      reportResult2 = "would_you_be_a_bop_if_you_were_a_girl?"
      local item2 = value6[reportResult2]
      value6 = item2
      reportResult2 = "yes? Interesting..."
      item3 = value6[reportResult2]
      value6 = item3
      local capturedValue3 = capturedValue
      value62 = value6
      if capturedValue3 ~= value62 then
        value7 = false
      else
        value7 = true
      end
      value72 = value7
      if value72 then
        value72 = true
        argument = true
      end
    end
  end
  
  callback = callback()
  value6 = checkpointLogger
  value8 = value6
  value10 = value8
  value11 = "CP5"
  value10(value11)
  value7 = not argument
  if not value7 then
    return
  end
  value6 = reportResult
  value10 = value6
  reportResult2 = false
  value11 = reportResult2
  value12 = "getloadedmodules"
  value13 = "Couldn't find a loaded module[2]"
  value10(value11, value12, value13)
  value7 = failureMap
  value6 = "getloadedmodules"
  value7 = value7.getloadedmodules
  if not value7 then
    return
  else
    value7 = true
    failureFlag2 = failureFlag
    failureFlag2[1] = value7
    return
  end
  return
end
