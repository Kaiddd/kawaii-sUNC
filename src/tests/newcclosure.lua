local reportResult, failureMap, failureFlag, captured4, packResults, unpackResults, environment
reportResult, failureMap, failureFlag, captured4, packResults, unpackResults, environment = ...
return function(argument)
  local value, value2, value3, value4, debug2, value5, value6, value7, value8, value9, value10, value11, capturedValue, capturedValue2, value12, result, value13, value14, value15, value16, result2, failureFlag2, value17, value18, value19, resultCount, callback
  argument = environment.debug
  value3 = "info"
  argument = argument.info
  argument = not argument
  if argument then
    value3 = reportResult
    value13 = value3
    value2 = false
    value14 = value2
    value15 = "newcclosure"
    value16 = "debug.info is needed in order to test"
    value13(value14, value15, value16)
    argument = failureMap
    value3 = "newcclosure"
    argument = argument.newcclosure
    if argument then
      argument = true
      failureFlag2 = failureFlag
      failureFlag2[1] = argument
    end
  end
  argument = environment.clonefunction
  argument = not argument
  if not argument then
    argument = captured4
    value3 = "clonefunction"
    argument = argument.clonefunction
  end
  if argument then
    value3 = reportResult
    value13 = value3
    value2 = false
    value14 = value2
    value = "newcclosure"
    value12 = value
    value15 = value12
    value16 = "Can't test due to 'clonefunction' not working reliably"
    value13(value14, value15, value16)
    argument = failureMap
    value3 = "newcclosure"
    argument = argument.newcclosure
    if argument then
      argument = true
      failureFlag2 = failureFlag
      failureFlag2[1] = argument
    end
  end
  
  function argument(argument)
    return "wow"
  end
  
  value2 = environment.newcclosure
  value12 = value2
  value13 = value12
  value12 = argument
  value14 = value12
  value13 = value13(value14)
  value3 = value13
  value2 = argument
  value2 = value2()
  value = value3
  failureFlag2 = value()
  value = failureFlag2
  if value2 == value then
    value2 = false
  else
    value2 = true
  end
  if value2 then
    value = reportResult
    value12 = value
    value13 = value12
    value2 = false
    value14 = value2
    value15 = "newcclosure"
    value = "Closure didn't return the same value as original"
    value12 = value
    value16 = value12
    value13(value14, value15, value16)
    value2 = failureMap
    value = "newcclosure"
    value2 = value2.newcclosure
    if value2 then
      value2 = true
      failureFlag2 = failureFlag
      failureFlag2[1] = value2
    end
  end
  if argument ~= value3 then
    value2 = false
  else
    value2 = true
  end
  if value2 then
    value = reportResult
    value13 = value
    value2 = false
    value14 = value2
    value15 = "newcclosure"
    value = "Closures should differ"
    value12 = value
    value16 = value12
    value13(value14, value15, value16)
    value2 = failureMap
    value = "newcclosure"
    value2 = value2.newcclosure
    if value2 then
      value2 = true
      failureFlag2 = failureFlag
      failureFlag2[1] = value2
    end
  end
  value = environment.newcclosure
  value13 = value
  
  function value2(argument)
    return environment.coroutine.running()
  end
  
  value14 = value2
  value13 = value13(value14)
  value2 = value13
  value = value2
  value = value()
  value2 = environment.coroutine
  argument = "running"
  value2 = value2.running
  failureFlag2 = value2()
  value2 = failureFlag2
  if value == value2 then
    value = false
  else
    value = true
  end
  if value then
    value2 = reportResult
    value13 = value2
    argument = false
    value14 = argument
    value15 = "newcclosure"
    value16 = "Bad implementation of the function, not made in C"
    value13(value14, value15, value16)
    value = failureMap
    value2 = "newcclosure"
    value = value.newcclosure
    if value then
      value = true
      failureFlag2 = failureFlag
      failureFlag2[1] = value
    end
  end
  value2 = environment.newcclosure
  value13 = value2
  
  function argument(argument)
    return
  end
  
  value12 = argument
  value14 = value12
  value13 = value13(value14)
  value = value13
  argument = environment.tostring
  value13 = argument
  debug2 = environment.debug
  argument = "info"
  debug2 = debug2.info
  value14 = debug2
  value12 = value
  value15 = value12
  value16 = "l"
  failureFlag2 = packResults
  value17 = value14
  value18 = value15
  value19 = value16
  result = failureFlag2(value17(value18, value19))
  value14 = result
  failureFlag2 = value13
  value17 = unpackResults
  value18 = value14
  resultCount = value14.n
  failureFlag2 = failureFlag2(value17(value18, 1, resultCount))
  value2 = failureFlag2
  argument = "-1"
  if value2 == argument then
    value2 = false
  else
    value2 = true
  end
  if value2 then
    argument = reportResult
    value12 = argument
    value13 = value12
    value = false
    value14 = value
    value15 = "newcclosure"
    argument = "REAL newcclosure WHAT!!! REAL ILEMENTATION \240\159\146\178\240\159\146\178\240\159\146\178 \240\159\152\130\240\159\152\130\240\159\152\130\240\159\164\163 \240\159\135\178\240\159\135\169#\204\182\204\142\204\144\204\136\205\144\204\128\205\140\204\140\205\132\205\152\204\155\204\189\204\191\204\137\204\148\204\178\205\135\204\186\205\141\205\142\204\187\204\163\204\179\204\152\205\154\205\137\204\162\204\163M\204\182\204\149\204\147\204\141\204\132\205\135\204\169\204\157\204\186\205\141\204\173\204\160\205\147\204\157\204\188\205\141\205\154a\204\182\204\189\205\144\205\145\205\157\205\131\204\142\205\131\204\191\204\143\204\145\204\145\204\190\205\142\204\178\204\160\205\135\205\137\204\160\204\157\205\141\204\171\204\177\204\151\204\172\204\178i\204\181\205\139\204\141\205\140\204\190\205\130\204\171\204\152\205\133\205\136\205\133\205\154\205\133\205\141\204\185\204\163\205\153a\204\181\204\131\205\155\204\128\204\149\205\131\204\131\204\188\205\147\205\153\204\165\204\166S\204\180\204\142\204\128\205\146\205\132\205\160\204\142\204\149\205\132\204\149\205\128\205\132\205\129\204\163\205\135\204\152\204\179a\204\184\204\148\205\129\204\130\205\139\204\130\204\189\204\128\205\146\205\132\204\143\205\136n\204\180\205\157\205\130\205\128\205\145\204\133\204\146\204\190\204\138\204\132\204\142\205\139\205\151\204\130\204\137\205\132\204\157d\204\183\205\151\204\142\205\151\204\142\205\157\204\140\205\140\204\129\204\190\204\132\204\189\204\145\204\164\205\147\205\150\204\168\204\179\205\153\204\187\204\166\204\188u\204\180\204\132\204\190\204\132\204\140\204\154\204\160\204\161\240\159\152\130S\240\159\152\130a\240\159\152\130n\240\159\152\130d\240\159\152\130u\240\159\135\178\240\159\135\169\240\159\152\130\240\159\152\130\240\159\152\130\240\159\152\130"
    value12 = argument
    value16 = value12
    value13(value14, value15, value16)
    value2 = failureMap
    argument = "newcclosure"
    value2 = value2.newcclosure
    if value2 then
      value2 = true
      failureFlag2 = failureFlag
      failureFlag2[1] = value2
    end
  end
  argument = environment.task
  value = "spawn"
  argument = argument.spawn
  value12 = argument
  value13 = value12
  
  function value(argument)
    local newcclosure2 = environment.newcclosure
    
    local function callback(argument, argument2)
      environment.task.wait()
      return argument
    end
    
    local newcclosure2ResultResult = newcclosure2(callback)("meow")
    argument = newcclosure2ResultResult
    if newcclosure2ResultResult == "meow" then
      argument = false
    else
      argument = true
    end
    if not argument then
      return
    end
    reportResult(false, "newcclosure", "Poor/no yielding implementation[1]")
    if not failureMap.newcclosure then
      return
    end
    failureFlag[1] = true
    return
  end
  
  value12 = value
  value14 = value12
  value13(value14)
  argument = environment.task
  value = "wait"
  argument = argument.wait
  value12 = argument
  value13 = value12
  value13()
  argument = environment.pcall
  value13 = argument
  
  function value(argument)
    local newcclosure2 = environment.newcclosure
    
    local function callback(argument, argument2)
      environment.task.wait()
      return argument
    end
    
    newcclosure2(callback)("rela")
    return
  end
  
  value12 = value
  value14 = value12
  value13 = value13(value14)
  value2 = value13
  value2 = not value2
  if value2 then
    argument = reportResult
    value13 = argument
    value = false
    value12 = value
    value14 = value12
    debug2 = "newcclosure"
    value12 = debug2
    value15 = value12
    argument = "Poor/no yielding implementation[2]"
    value12 = argument
    value16 = value12
    value13(value14, value15, value16)
    value2 = failureMap
    argument = "newcclosure"
    value2 = value2.newcclosure
    if value2 then
      value2 = true
      failureFlag2 = failureFlag
      failureFlag2[1] = value2
    end
  end
  value2 = false
  failureFlag2 = {}
  failureFlag2[1] = argument
  argument = failureFlag2
  argument[1] = value2
  value = environment.task
  debug2 = "spawn"
  value = value.spawn
  value13 = value
  do
    local value23
    value23 = argument
    
    function debug2(argument)
      environment.pcall(environment.newcclosure(environment.error), "attempt to yield across metamethod/C-call boundary")
      value23[1] = true
      return
    end
  end
  value14 = debug2
  value13(value14)
  value = environment.task
  debug2 = "wait"
  value = value.wait
  value12 = value
  value13 = value12
  value13()
  value2 = argument[1]
  value2 = not value2
  if value2 then
    value = reportResult
    value12 = value
    value13 = value12
    debug2 = false
    value14 = debug2
    value15 = "newcclosure"
    value16 = "Poor/no yielding implementation[3]"
    value13(value14, value15, value16)
    value2 = failureMap
    value = "newcclosure"
    value2 = value2.newcclosure
    if value2 then
      value2 = true
      failureFlag2 = failureFlag
      failureFlag2[1] = value2
    end
  end
  value = {}
  debug2 = "pmo"
  argument = environment.game
  value2 = environment.DateTime
  value11 = "now"
  value2 = value2.now
  value12 = value2
  value13 = value12
  value13 = value13()
  value3 = value13
  value2 = environment.Vector3
  value11 = "new"
  value2 = value2.new
  value13 = value2
  value11 = 0
  value12 = value11
  value14 = value12
  value15 = 10
  value16 = 0
  value13 = value13(value14, value15, value16)
  value4 = value13
  value2 = environment.RaycastParams
  value11 = "new"
  value2 = value2.new
  value13 = value2
  value13 = value13()
  value9 = value13
  value2 = environment.UDim2
  value11 = "new"
  value2 = value2.new
  value12 = value2
  value13 = value12
  value13 = value13()
  value10 = value13
  value2 = environment.buffer
  value11 = "create"
  value2 = value2.create
  value12 = value2
  value13 = value12
  value11 = 55
  value12 = value11
  value14 = value12
  value13 = value13(value14)
  value6 = value13
  value2 = environment.Faces
  value11 = "new"
  value2 = value2.new
  value12 = value2
  value13 = value12
  value11 = environment.Enum
  value5 = "NormalId"
  value11 = value11.NormalId
  value5 = "Front"
  value11 = value11.Front
  value12 = value11
  value14 = value12
  value13 = value13(value14)
  value7 = value13
  value2 = environment.Instance
  value11 = "new"
  value2 = value2.new
  value13 = value2
  value14 = "BindableEvent"
  value13 = value13(value14)
  value8 = value13
  value2 = "Event"
  value8 = value8.Event
  value[1] = debug2
  value[2] = argument
  value[3] = value3
  value[4] = value4
  value[5] = value9
  value[6] = value10
  value[7] = value6
  value[8] = value7
  value[9] = value8
  value2 = value
  value = 1
  debug2 = 50
  argument = 1
  
  function value5(...)
    local value = (...)
    return environment.table.pack(...)
  end
  
  value = value - argument
  
  function callback()
    local result22, value18, value19, result, value146, value153, value162, failureFlag2, environment2
    while "newcclosure" do
      value19 = value + argument
      value = value19
      if not (value <= debug2) then
        return 1
      end
      local value17 = value
      value3 = value17
      local newcclosure2 = environment.newcclosure
      value9 = newcclosure2
      local value92 = value9
      value12 = value92
      local value122 = value12
      value13 = value122
      local value52 = value5
      value10 = value52
      local value102 = value10
      value14 = value102
      local value13Result = value13(value14)
      value13 = value13Result
      local value132 = value13
      value4 = value132
      local pcall2 = environment.pcall
      value6 = pcall2
      local value62 = value6
      value13 = value62
      do
        local value42, value28
        value42 = value4
        value28 = value2
        
        function value19(argument)
          local value422 = value42
          local unpack2 = environment.table.unpack
          local value282 = value28
          local results = packResults(unpack2(value282))
          local unpackResults2 = unpackResults
          local resultCount = results.n
          return value422(unpackResults2(results, 1, resultCount))
        end
      end
      value7 = value19
      local value72 = value7
      value12 = value72
      local value123 = value12
      value14 = value123
      local value133 = value13
      local value142 = value14
      result, value146 = value133(value142)
      value13 = result
      value14 = value146
      local value134 = value13
      value9 = value134
      local value143 = value14
      value10 = value143
      local condition = not value9
      value6 = condition
      if value6 then
        return 0
      end
      environment2 = environment
      local pairs2 = environment2.pairs
      value6 = pairs2
      local value63 = value6
      value12 = value63
      local value124 = value12
      value13 = value124
      local value103 = value10
      value12 = value103
      local value125 = value12
      value14 = value125
      local value135 = value13
      local value144 = value14
      result, value146, value153 = value135(value144)
      value13 = result
      value14 = value146
      value15 = value153
      local value136 = value13
      value8 = value136
      local value145 = value14
      value7 = value145
      local value152 = value15
      value6 = value152
      local value82 = value8
      value9 = value82
      local value73 = value7
      value10 = value73
      local value64 = value6
      value11 = value64
      
      function value19()
        local value64, value74, item, value, value3, value152
        repeat
          repeat
            local value92 = value9
            value13 = value92
            local value102 = value10
            value14 = value102
            local value112 = value11
            value15 = value112
            local value132 = value13
            local value142 = value14
            value152 = value15
            value, value3 = value132(value142, value152)
            value13 = value
            value14 = value3
            local value133 = value13
            value7 = value133
            local value143 = value14
            value6 = value143
            value8 = nil
            if value7 ~= value8 then
              value8 = false
            else
              value8 = true
            end
            if value8 then
              return 0
            end
            local value72 = value7
            value11 = value72
            local value73 = value7
            capturedValue = value73
            local value63 = value6
            capturedValue2 = value63
            value7 = "n"
            local capturedValue3 = capturedValue
            value74 = value7
            if capturedValue3 == value74 then
              value6 = false
            else
              value6 = true
            end
            value64 = value6
          until value64
          item = value2[capturedValue]
          value6 = item
          local value62 = value6
          value74 = capturedValue2
          if value62 == value74 then
            value6 = false
          else
            value6 = true
          end
          value64 = value6
        until value64
        return 1
      end
      
      result = value19()
      result2 = result
      result22 = result2
      value18 = 0
      if result22 ~= 0 then
        local reportResult2 = reportResult
        value7 = reportResult2
        local value74 = value7
        value13 = value74
        value8 = false
        local value83 = value8
        value12 = value83
        local value126 = value12
        value14 = value126
        value15 = "newcclosure"
        value16 = "Argument return mismatch[1]"
        result = value13
        value146 = value14
        value153 = value15
        value162 = value16
        result(value146, value153, value162)
        local failureMap2 = failureMap
        value6 = failureMap2
        value7 = "newcclosure"
        local value65 = value6
        value18 = value7
        value19 = value65[value18]
        value6 = value19
        result22 = value6
        if result22 then
          value6 = true
          failureFlag2 = failureFlag
          result22 = value6
          value18 = failureFlag2
          failureFlag2[1] = result22
        end
      end
    end
  end
  
  result2 = callback()
  if result2 == 0 then
    value7 = reportResult
    value13 = value7
    value8 = false
    value12 = value8
    value14 = value12
    value2 = "newcclosure"
    value12 = value2
    value15 = value12
    value16 = value10
    value13(value14, value15, value16)
    value6 = failureMap
    value7 = "newcclosure"
    value6 = value6.newcclosure
    if value6 then
      value6 = true
      failureFlag2 = failureFlag
      failureFlag2[1] = value6
    end
  end
  debug2 = environment.task
  argument = "spawn"
  debug2 = debug2.spawn
  value13 = debug2
  
  function argument(argument)
    local newcclosure2 = environment.newcclosure
    local clonefunction2 = environment.clonefunction
    
    local function callback(argument, argument2)
      environment.task.wait()
      return argument
    end
    
    local results = packResults(clonefunction2(callback))
    local unpackResults2 = unpackResults
    local resultCount = results.n
    local newcclosure2ResultResult = newcclosure2(unpackResults2(results, 1, resultCount))("meow")
    argument = newcclosure2ResultResult
    if newcclosure2ResultResult == "meow" then
      argument = false
    else
      argument = true
    end
    if not argument then
      return
    end
    reportResult(false, "newcclosure", "Poor/no yielding implementation[4]")
    if not failureMap.newcclosure then
      return
    end
    failureFlag[1] = true
    return
  end
  
  value14 = argument
  value13(value14)
  debug2 = environment.task
  argument = "wait"
  debug2 = debug2.wait
  value12 = debug2
  value13 = value12
  value13()
  debug2 = environment.pcall
  value12 = debug2
  value13 = value12
  
  function argument(argument)
    local newcclosure2 = environment.newcclosure
    local clonefunction2 = environment.clonefunction
    
    local function callback(argument, argument2)
      environment.task.wait()
      return argument
    end
    
    local results = packResults(clonefunction2(callback))
    local unpackResults2 = unpackResults
    local resultCount = results.n
    newcclosure2(unpackResults2(results, 1, resultCount))("rela")
    return
  end
  
  value12 = argument
  value14 = value12
  value13 = value13(value14)
  value = value13
  value = not value
  if value then
    debug2 = reportResult
    value13 = debug2
    argument = false
    value12 = argument
    value14 = value12
    value15 = "newcclosure"
    value16 = "Poor/no yielding implementation[5]"
    value13(value14, value15, value16)
    value = failureMap
    debug2 = "newcclosure"
    value = value.newcclosure
    if value then
      value = true
      failureFlag2 = failureFlag
      failureFlag2[1] = value
    end
  end
  value = false
  failureFlag2 = {}
  failureFlag2[1] = debug2
  debug2 = failureFlag2
  debug2[1] = value
  argument = environment.task
  value3 = "spawn"
  argument = argument.spawn
  value13 = argument
  do
    local value24
    value24 = debug2
    
    function value3(argument)
      local pcall2 = environment.pcall
      local newcclosure2 = environment.newcclosure
      local clonefunction2 = environment.clonefunction
      local error2 = environment.error
      local results = packResults(clonefunction2(error2))
      local unpackResults2 = unpackResults
      local resultCount = results.n
      pcall2(newcclosure2(unpackResults2(results, 1, resultCount)), "attempt to yield across metamethod/C-call boundary")
      value24[1] = true
      return
    end
  end
  value14 = value3
  value13(value14)
  argument = environment.task
  value3 = "wait"
  argument = argument.wait
  value13 = argument
  value13()
  value = debug2[1]
  value = not value
  if value then
    argument = reportResult
    value13 = argument
    value3 = false
    value14 = value3
    value15 = "newcclosure"
    value16 = "Poor/no yielding implementation[6]"
    value13(value14, value15, value16)
    value = failureMap
    argument = "newcclosure"
    value = value.newcclosure
    if value then
      value = true
      failureFlag2 = failureFlag
      failureFlag2[1] = value
    end
  end
  argument = {}
  value3 = "pmo"
  value4 = environment.game
  value5 = environment.DateTime
  value = "now"
  value5 = value5.now
  value13 = value5
  value13 = value13()
  value9 = value13
  value5 = environment.Vector3
  value = "new"
  value5 = value5.new
  value13 = value5
  value = 0
  value12 = value
  value14 = value12
  value15 = 10
  value16 = 0
  value13 = value13(value14, value15, value16)
  value10 = value13
  value5 = environment.RaycastParams
  value = "new"
  value5 = value5.new
  value13 = value5
  value13 = value13()
  value6 = value13
  value5 = environment.UDim2
  value = "new"
  value5 = value5.new
  value13 = value5
  value13 = value13()
  value7 = value13
  value5 = environment.buffer
  value = "create"
  value5 = value5.create
  value13 = value5
  value = 55
  value12 = value
  value14 = value12
  value13 = value13(value14)
  value8 = value13
  value5 = environment.Faces
  value = "new"
  value5 = value5.new
  value13 = value5
  value = environment.Enum
  value2 = "NormalId"
  value = value.NormalId
  value2 = "Front"
  value = value.Front
  value12 = value
  value14 = value12
  value13 = value13(value14)
  value2 = value13
  value5 = environment.Instance
  value = "new"
  value5 = value5.new
  value13 = value5
  value14 = "BindableEvent"
  value13 = value13(value14)
  value11 = value13
  value5 = "Event"
  value11 = value11.Event
  argument[1] = value3
  argument[2] = value4
  argument[3] = value9
  argument[4] = value10
  argument[5] = value6
  argument[6] = value7
  argument[7] = value8
  argument[8] = value2
  argument[9] = value11
  value = argument
  argument = 1
  value3 = 50
  value4 = 1
  
  function debug2(...)
    local value = (...)
    return environment.table.pack(...)
  end
  
  argument = argument - value4
  
  function callback()
    local result22, value18, value19, result4, value147, value154, value162, value132Result, unpackResults2, value148, environment2
    while "newcclosure" do
      value19 = argument + value4
      argument = value19
      if not (argument <= value3) then
        return 0
      end
      local argument2 = argument
      value9 = argument2
      local newcclosure2 = environment.newcclosure
      value6 = newcclosure2
      local value62 = value6
      value13 = value62
      local clonefunction2 = environment.clonefunction
      value8 = clonefunction2
      local value82 = value8
      value14 = value82
      local debug22 = debug2
      value2 = debug22
      local value22 = value2
      value15 = value22
      local packResults2 = packResults
      local value142 = value14
      local value152 = value15
      local packResults2Result = packResults2(value142(value152))
      result = packResults2Result
      local resultCount = result.n
      local value17 = 615
      if not (resultCount < 615) then
        value19 = result[value17]
        debug2 = value19
      end
      local result3 = result
      value14 = result3
      local value132 = value13
      unpackResults2 = unpackResults
      value148 = value14
      local resultCount2 = value14.n
      value132Result = value132(unpackResults2(value148, 1, resultCount2))
      value10 = value132Result
      local pcall2 = environment.pcall
      value8 = pcall2
      local value83 = value8
      value12 = value83
      local value122 = value12
      value13 = value122
      do
        local value102, value29
        value102 = value10
        value29 = value
        
        function value19(argument)
          local value1022 = value102
          local unpack2 = environment.table.unpack
          local value292 = value29
          local results = packResults(unpack2(value292))
          local unpackResults2 = unpackResults
          local resultCount = results.n
          return value1022(unpackResults2(results, 1, resultCount))
        end
      end
      value2 = value19
      local value23 = value2
      value12 = value23
      local value123 = value12
      value14 = value123
      local value133 = value13
      local value143 = value14
      result4, value147 = value133(value143)
      value13 = result4
      value14 = value147
      local value134 = value13
      value6 = value134
      local value144 = value14
      value7 = value144
      local condition = not value6
      value8 = condition
      if value8 then
        return 1
      end
      environment2 = environment
      local pairs2 = environment2.pairs
      value8 = pairs2
      local value84 = value8
      value13 = value84
      local value72 = value7
      value14 = value72
      local value135 = value13
      local value145 = value14
      result4, value147, value154 = value135(value145)
      value13 = result4
      value14 = value147
      value15 = value154
      local value136 = value13
      value8 = value136
      local value146 = value14
      value7 = value146
      local value153 = value15
      value6 = value153
      local value85 = value8
      value9 = value85
      local value73 = value7
      value10 = value73
      local value63 = value6
      value11 = value63
      
      function value19()
        local value83, value22, item, value3, value4, value152
        repeat
          repeat
            local value92 = value9
            value13 = value92
            local value102 = value10
            value14 = value102
            local value112 = value11
            value15 = value112
            local value132 = value13
            local value142 = value14
            value152 = value15
            value3, value4 = value132(value142, value152)
            value13 = value3
            value14 = value4
            local value133 = value13
            value7 = value133
            local value143 = value14
            value6 = value143
            value8 = nil
            if value7 ~= value8 then
              value8 = false
            else
              value8 = true
            end
            if value8 then
              return 0
            end
            local value72 = value7
            value11 = value72
            local value73 = value7
            capturedValue = value73
            local value62 = value6
            capturedValue2 = value62
            value2 = "n"
            local capturedValue3 = capturedValue
            value22 = value2
            if capturedValue3 == value22 then
              value8 = false
            else
              value8 = true
            end
            value83 = value8
          until value83
          item = value[capturedValue]
          value8 = item
          local value82 = value8
          value22 = capturedValue2
          if value82 == value22 then
            value8 = false
          else
            value8 = true
          end
          value83 = value8
        until value83
        return 1
      end
      
      result4 = value19()
      result2 = result4
      result22 = result2
      value18 = 0
      if result22 ~= 0 then
        local reportResult2 = reportResult
        value2 = reportResult2
        local value24 = value2
        value13 = value24
        value11 = false
        local value112 = value11
        value14 = value112
        value5 = "newcclosure"
        local value52 = value5
        value12 = value52
        local value124 = value12
        value15 = value124
        value16 = "Argument return mismatch[2]"
        result4 = value13
        value147 = value14
        value154 = value15
        value162 = value16
        result4(value147, value154, value162)
        local failureMap2 = failureMap
        value8 = failureMap2
        value2 = "newcclosure"
        local value86 = value8
        value18 = value2
        value19 = value86[value18]
        value8 = value19
        result22 = value8
        if result22 then
          value8 = true
          value132Result = failureFlag
          result22 = value8
          value18 = value132Result
          value132Result[1] = result22
        end
      end
    end
  end
  
  result2 = callback()
  if result2 == 0 then
    return
  end
  value2 = reportResult
  value12 = value2
  value13 = value12
  value11 = false
  value14 = value11
  value15 = "newcclosure"
  value12 = value7
  value16 = value12
  value13(value14, value15, value16)
  value8 = failureMap
  value2 = "newcclosure"
  value8 = value8.newcclosure
  if not value8 then
    return
  else
    value8 = true
    failureFlag2 = failureFlag
    failureFlag2[1] = value8
    return
  end
  return
end
