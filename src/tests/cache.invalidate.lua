local captured1, reportResult, captured3, failureFlag, packResults, unpackResults, environment
captured1, reportResult, captured3, failureFlag, packResults, unpackResults, environment = ...
return function(argument)
  local value, value2, value3, value4, value5, value6, value7, value8, capturedValue, capturedValue2, capturedValue3, workspace2, value9, capturedValue4, value10, captured12, result, value11, value12, value13, value14, result2, packResults2, value15, value16, value17, resultCount, resultCount2, callback, callbackResult
  argument = environment.getreg
  if argument then
    argument = false
    value = false
    captured12 = captured1
    value11 = captured12
    value2 = 1
    captured12 = value2
    value12 = captured12
    value13 = 99999999
    value11 = value11(value12, value13)
    value6 = value11
    value2 = environment.Instance
    value3 = "new"
    value2 = value2.new
    captured12 = value2
    value11 = captured12
    value3 = "Part"
    captured12 = value3
    value12 = captured12
    workspace2 = environment.workspace
    value13 = workspace2
    value11 = value11(value12, value13)
    value7 = value11
    value2 = "Anchored"
    value3 = true
    value7.Anchored = value3
    value2 = "CFrame"
    workspace2 = environment.CFrame
    value10 = "new"
    workspace2 = workspace2.new
    captured12 = workspace2
    value11 = captured12
    value12 = 0
    value9 = -200
    captured12 = value9
    value13 = captured12
    value14 = 0
    value11 = value11(value12, value13, value14)
    value3 = value11
    value7[value2] = value3
    value2 = "Name"
    value7.Name = value6
    value3 = environment.cache
    workspace2 = "invalidate"
    value3 = value3.invalidate
    value11 = value3
    captured12 = value7
    value12 = captured12
    value11(value12)
    value2 = environment.pairs
    value11 = value2
    value3 = environment.getreg
    packResults2 = packResults
    value15 = value3
    result = packResults2(value15())
    value12 = result
    packResults2 = value11
    value15 = unpackResults
    value16 = value12
    resultCount = value12.n
    callbackResult = (function(a_native_fixed_result_call_1, ...)
      return {
        a_native_fixed_result_call_1(...)
      }
    end)(packResults2, value15(value16, 1, resultCount))
    packResults2 = callbackResult[1]
    value15 = callbackResult[2]
    value16 = callbackResult[3]
    value4 = packResults2
    value5 = value15
    value8 = value16
    
    function callback()
      local value24, value33, callback, value114Result, value126, value133, environment2
      while "pairs" do
        local value42 = value4
        value11 = value42
        local value52 = value5
        value12 = value52
        local value82 = value8
        value13 = value82
        local value112 = value11
        local value122 = value12
        value133 = value13
        value114Result, value126 = value112(value122, value133)
        value11 = value114Result
        value12 = value126
        local value113 = value11
        value8 = value113
        local value123 = value12
        capturedValue = value123
        capturedValue2 = nil
        if value8 ~= capturedValue2 then
          capturedValue2 = false
        else
          capturedValue2 = true
        end
        if capturedValue2 then
          return 0
        end
        local value83 = value8
        value8 = value83
        local capturedValue5 = capturedValue
        capturedValue = capturedValue5
        environment2 = environment
        local value = environment2.type
        value3 = value
        local value32 = value3
        value11 = value32
        local capturedValue6 = capturedValue
        captured12 = capturedValue6
        local captured122 = captured12
        value12 = captured122
        local value114 = value11
        value126 = value12
        value114Result = value114(value126)
        value11 = value114Result
        local value115 = value11
        value2 = value115
        value3 = "table"
        local value22 = value2
        value33 = value3
        if value22 ~= value33 then
          value2 = false
        else
          value2 = true
        end
        value24 = value2
        if value24 then
          environment2 = environment
          local pairs2 = environment2.pairs
          value2 = pairs2
          local value23 = value2
          value11 = value23
          local capturedValue7 = capturedValue
          captured12 = capturedValue7
          local captured123 = captured12
          value12 = captured123
          local value116 = value11
          local value124 = value12
          value114Result, value126, value133 = value116(value124)
          value11 = value114Result
          value12 = value126
          value13 = value133
          local value117 = value11
          capturedValue = value117
          local value125 = value12
          capturedValue2 = value125
          local value132 = value13
          capturedValue3 = value132
          local capturedValue8 = capturedValue
          capturedValue = capturedValue8
          local capturedValue22 = capturedValue2
          capturedValue2 = capturedValue22
          local capturedValue32 = capturedValue3
          capturedValue3 = capturedValue32
          
          function callback()
            local value23, value34, item, value32Result, capturedValue422, value133, value5, capturedValue423, unpackResults2, value134, environment2
            while "Instance" do
              local capturedValue5 = capturedValue
              value11 = capturedValue5
              local capturedValue22 = capturedValue2
              value12 = capturedValue22
              local capturedValue32 = capturedValue3
              value13 = capturedValue32
              local value112 = value11
              local value122 = value12
              value133 = value13
              value32Result, capturedValue422 = value112(value122, value133)
              value11 = value32Result
              value12 = capturedValue422
              local value113 = value11
              capturedValue3 = value113
              local value123 = value12
              workspace2 = value123
              value9 = nil
              if capturedValue3 ~= value9 then
                value9 = false
              else
                value9 = true
              end
              if value9 then
                return 0
              end
              local capturedValue33 = capturedValue3
              capturedValue3 = capturedValue33
              local workspace22 = workspace2
              capturedValue4 = workspace22
              environment2 = environment
              local typeof2 = environment2.typeof
              value3 = typeof2
              local value32 = value3
              local capturedValue42 = capturedValue4
              capturedValue423 = capturedValue42
              capturedValue422 = capturedValue42
              value32Result = value32(capturedValue42)
              value5 = value32Result
              value2 = value32Result
              value3 = "Instance"
              local value22 = value2
              value34 = value3
              if value22 ~= value34 then
                value2 = false
              else
                value2 = true
              end
              value23 = value2
              if not value23 then
              else
                local string2 = environment.string
                value3 = string2
                workspace2 = "find"
                item = value3[workspace2]
                value3 = item
                local value33 = value3
                value11 = value33
                local tostring2 = environment.tostring
                value10 = tostring2
                local value102 = value10
                captured12 = value102
                local captured122 = captured12
                value12 = captured122
                local capturedValue43 = capturedValue4
                value13 = capturedValue43
                local value124 = value12
                capturedValue422 = value13
                value32Result = value124(capturedValue422)
                value12 = value32Result
                local value125 = value12
                workspace2 = value125
                local workspace23 = workspace2
                value12 = workspace23
                environment2 = environment
                local tostring3 = environment2.tostring
                value9 = tostring3
                local value92 = value9
                value13 = value92
                local value62 = value6
                value14 = value62
                local packResults2 = packResults
                local value132 = value13
                local value142 = value14
                local packResults2Result = packResults2(value132(value142))
                result = packResults2Result
                local result2 = result
                value13 = result2
                local value114 = value11
                capturedValue423 = value12
                unpackResults2 = unpackResults
                value134 = value13
                local resultCount = value13.n
                value5 = value114(capturedValue423, unpackResults2(value134, 1, resultCount))
                value34 = value5
                value2 = value5
              end
              value23 = value2
              if value23 then
                value23 = true
                argument = true
              end
            end
          end
          
          value114Result = callback()
          value24 = value114Result
          value33 = value114Result
          result2 = value114Result
        end
      end
    end
    
    result2 = callback()
    value3 = environment.task
    workspace2 = "wait"
    value3 = value3.wait
    value11 = value3
    value12 = 1
    value11(value12)
    value2 = argument
    if value2 then
      value3 = reportResult
      captured12 = value3
      value11 = captured12
      workspace2 = false
      value12 = workspace2
      value13 = "cache.invalidate"
      value14 = "Was able to find the cached instance in registry"
      value11(value12, value13, value14)
      value2 = captured3
      value3 = "cache.invalidate"
      value2 = value2[value3]
      if value2 then
        value2 = true
        packResults2 = failureFlag
        packResults2[1] = value2
      end
    end
    value2 = value7
    packResults2 = value2
    value3 = packResults2
    value2 = packResults2.Destroy
    value11 = value2
    captured12 = value3
    value12 = captured12
    value11(value12)
    value3 = captured1
    captured12 = value3
    value11 = captured12
    value12 = 1
    value13 = 99999999
    value11 = value11(value12, value13)
    value2 = value11
    workspace2 = environment.Instance
    value10 = "new"
    workspace2 = workspace2.new
    value11 = workspace2
    value12 = "Part"
    value9 = environment.workspace
    value13 = value9
    value11 = value11(value12, value13)
    value3 = value11
    workspace2 = "CFrame"
    value9 = environment.CFrame
    argument = "new"
    value9 = value9.new
    captured12 = value9
    value11 = captured12
    value12 = 0
    argument = -200
    value13 = argument
    value14 = 0
    value11 = value11(value12, value13, value14)
    value10 = value11
    value3[workspace2] = value10
    workspace2 = "Anchored"
    value10 = true
    value3.Anchored = value10
    workspace2 = "Name"
    value3.Name = value2
    value10 = environment.cache
    value9 = "invalidate"
    value10 = value10.invalidate
    captured12 = value10
    value11 = captured12
    value12 = value3
    value11(value12)
    workspace2 = environment.workspace
    packResults2 = workspace2
    value10 = packResults2
    workspace2 = packResults2.FindFirstChild
    value11 = workspace2
    captured12 = value10
    value12 = captured12
    argument = environment.tostring
    captured12 = argument
    value13 = captured12
    value14 = value2
    packResults2 = packResults
    value15 = value13
    value16 = value14
    result = packResults2(value15(value16))
    value13 = result
    packResults2 = value11
    value15 = value12
    value16 = unpackResults
    value17 = value13
    resultCount2 = value13.n
    workspace2 = packResults2(value15, value16(value17, 1, resultCount2))
    value10 = environment.pairs
    value11 = value10
    value9 = environment.getreg
    packResults2 = packResults
    value15 = value9
    result = packResults2(value15())
    value12 = result
    packResults2 = value11
    value15 = unpackResults
    value16 = value12
    resultCount = value12.n
    callbackResult = (function(a_native_fixed_result_call_1, ...)
      return {
        a_native_fixed_result_call_1(...)
      }
    end)(packResults2, value15(value16, 1, resultCount))
    packResults2 = callbackResult[1]
    value15 = callbackResult[2]
    value16 = callbackResult[3]
    value4 = packResults2
    value5 = value15
    value8 = value16
    
    function callback()
      local value104, value93, callback, value114Result, value126, value133, environment2
      while "pairs" do
        local value42 = value4
        value11 = value42
        local value52 = value5
        value12 = value52
        local value82 = value8
        value13 = value82
        local value112 = value11
        local value122 = value12
        value133 = value13
        value114Result, value126 = value112(value122, value133)
        value11 = value114Result
        value12 = value126
        local value113 = value11
        value8 = value113
        local value123 = value12
        capturedValue = value123
        capturedValue2 = nil
        if value8 ~= capturedValue2 then
          capturedValue2 = false
        else
          capturedValue2 = true
        end
        if capturedValue2 then
          return 0
        end
        local value83 = value8
        value8 = value83
        local capturedValue5 = capturedValue
        capturedValue = capturedValue5
        environment2 = environment
        local value3 = environment2.type
        value9 = value3
        local value92 = value9
        value11 = value92
        local capturedValue6 = capturedValue
        captured12 = capturedValue6
        local captured122 = captured12
        value12 = captured122
        local value114 = value11
        value126 = value12
        value114Result = value114(value126)
        value11 = value114Result
        local value115 = value11
        value10 = value115
        value9 = "table"
        local value102 = value10
        value93 = value9
        if value102 ~= value93 then
          value10 = false
        else
          value10 = true
        end
        value104 = value10
        if value104 then
          environment2 = environment
          local pairs2 = environment2.pairs
          value10 = pairs2
          local value103 = value10
          captured12 = value103
          local captured123 = captured12
          value11 = captured123
          local capturedValue7 = capturedValue
          captured12 = capturedValue7
          local captured124 = captured12
          value12 = captured124
          local value116 = value11
          local value124 = value12
          value114Result, value126, value133 = value116(value124)
          value11 = value114Result
          value12 = value126
          value13 = value133
          local value117 = value11
          capturedValue = value117
          local value125 = value12
          capturedValue2 = value125
          local value132 = value13
          capturedValue3 = value132
          local capturedValue8 = capturedValue
          capturedValue = capturedValue8
          local capturedValue22 = capturedValue2
          capturedValue2 = capturedValue22
          local capturedValue32 = capturedValue3
          capturedValue3 = capturedValue32
          
          function callback()
            local value103, value94, item, value114Result, value124, value133, value116Result, value125, unpackResults2, value134, environment2
            while "Instance" do
              local capturedValue5 = capturedValue
              value11 = capturedValue5
              local capturedValue22 = capturedValue2
              value12 = capturedValue22
              local capturedValue32 = capturedValue3
              value13 = capturedValue32
              local value112 = value11
              local value122 = value12
              value133 = value13
              value114Result, value124 = value112(value122, value133)
              value11 = value114Result
              value12 = value124
              local value113 = value11
              capturedValue3 = value113
              local value123 = value12
              workspace2 = value123
              value9 = nil
              if capturedValue3 ~= value9 then
                value9 = false
              else
                value9 = true
              end
              if value9 then
                return 0
              end
              local capturedValue33 = capturedValue3
              capturedValue3 = capturedValue33
              local workspace22 = workspace2
              capturedValue4 = workspace22
              environment2 = environment
              local typeof2 = environment2.typeof
              value9 = typeof2
              local value92 = value9
              captured12 = value92
              local captured122 = captured12
              value11 = captured122
              local capturedValue42 = capturedValue4
              captured12 = capturedValue42
              local captured123 = captured12
              value12 = captured123
              local value114 = value11
              value124 = value12
              value114Result = value114(value124)
              value11 = value114Result
              local value115 = value11
              value10 = value115
              value9 = "Instance"
              local value102 = value10
              value94 = value9
              if value102 ~= value94 then
                value10 = false
              else
                value10 = true
              end
              value103 = value10
              if not value103 then
              else
                local string2 = environment.string
                value9 = string2
                argument = "find"
                item = value9[argument]
                value9 = item
                local value93 = value9
                captured12 = value93
                local captured124 = captured12
                value11 = captured124
                local tostring2 = environment.tostring
                argument = tostring2
                local argument2 = argument
                local capturedValue43 = capturedValue4
                value124 = capturedValue43
                value114Result = argument2(capturedValue43)
                argument = value114Result
                local argument3 = argument
                captured12 = argument3
                local captured125 = captured12
                value12 = captured125
                environment2 = environment
                local tostring3 = environment2.tostring
                argument = tostring3
                local argument4 = argument
                value13 = argument4
                local value22 = value2
                value14 = value22
                local packResults2 = packResults
                local value132 = value13
                local value142 = value14
                local packResults2Result = packResults2(value132(value142))
                result = packResults2Result
                local result2 = result
                value13 = result2
                local value116 = value11
                value125 = value12
                unpackResults2 = unpackResults
                value134 = value13
                local resultCount = value13.n
                value116Result = value116(value125, unpackResults2(value134, 1, resultCount))
                value94 = value116Result
                value10 = value116Result
              end
              value103 = value10
              if value103 then
                value103 = true
                value = true
              end
            end
          end
          
          value114Result = callback()
          value104 = value114Result
          value93 = value114Result
          result2 = value114Result
        end
      end
    end
    
    result2 = callback()
    value9 = environment.task
    argument = "wait"
    value9 = value9.wait
    value11 = value9
    value11()
    value10 = value3
    packResults2 = value10
    value9 = packResults2
    value10 = packResults2.Destroy
    captured12 = value10
    value11 = captured12
    value12 = value9
    value11(value12)
    value10 = not value
    if not value10 then
      return
    end
    value9 = reportResult
    value11 = value9
    argument = false
    value12 = argument
    argument = "cache.invalidate"
    captured12 = argument
    value13 = captured12
    value14 = "Wasn't able to find the cached instance in registry"
    value11(value12, value13, value14)
    value10 = captured3
    value9 = "cache.invalidate"
    value10 = value10[value9]
    if not value10 then
      return
    else
      value10 = true
      packResults2 = failureFlag
      packResults2[1] = value10
      return
    end
  else
    value = reportResult
    captured12 = value
    value11 = captured12
    value6 = false
    value12 = value6
    value13 = "cache.invalidate"
    value14 = "Can't test due to getreg being nil"
    value11(value12, value13, value14)
    argument = captured3
    value = "cache.invalidate"
    argument = argument[value]
    if not argument then
      return
    else
      argument = true
      packResults2 = failureFlag
      packResults2[1] = argument
      return
    end
  end
  return
end
