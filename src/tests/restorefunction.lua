local failureMap, reportResult, failureFlag, options, checkpointLogger, captured6, packResults, unpackResults, environment
failureMap, reportResult, failureFlag, options, checkpointLogger, captured6, packResults, unpackResults, environment = ...
return function(argument)
  local value, callback, result, new2, wait2, checkpointLogger2, value2, item, wait3, callback2, value4, value5, values, environment2
  argument = not failureMap.hookfunction
  if not argument then
    if options.printcheckpoints then
      checkpointLogger2 = checkpointLogger
      value4 = checkpointLogger2
      value2 = "restorefunction-1: L -> C Restore"
      value5 = "restorefunction-1: L -> C Restore"
      checkpointLogger2("restorefunction-1: L -> C Restore")
    end
    argument = options.delaybetweentests
    checkpointLogger2 = 0
    if argument > 0 then
      argument = true
    else
      argument = false
    end
    if argument then
      environment2 = environment
      checkpointLogger2 = environment2.task.wait
      value4 = checkpointLogger2
      value2 = options.delaybetweentests
      value5 = value2
      checkpointLogger2(value2)
    end
    checkpointLogger2 = 5
    value2 = 1
    argument = 1 - 1
    while "restorefunction-2: C -> C and L -> C Restore" do
      argument = argument + value2
      if not (checkpointLogger2 >= argument) then
        break
      end
      wait2 = environment.task.wait
      wait2()
      values = {}
      values[1] = wait2
      wait2 = values
      values[1] = false
      new2 = environment.Instance.new
      result = new2("BindableFunction")
      do
        local value19
        value19 = wait2
        
        function new2(argument)
          value19[1] = false
          return
        end
      end
      value4 = environment.hookfunction
      value5 = new2
      do
        local value20
        value20 = wait2
        
        function callback(argument)
          value20[1] = true
          return
        end
      end
      value4(value5, callback)
      result.OnInvoke = new2
      result:Invoke()
      environment.task.wait()
      environment.restorefunction(new2)
      environment.task.wait()
      result:Invoke()
      wait3 = environment.task.wait
      wait3()
      item = wait2[1]
      if item then
        wait3 = reportResult
        value = false
        wait3(false, "restorefunction", "Couldn't restore a function back to original")
        item = failureMap
        wait3 = "restorefunction"
        if item.restorefunction then
          failureFlag[1] = true
        end
      end
      values = {}
      values[1] = wait3
      wait3 = values
      values[1] = false
      values = {}
      values[1] = false
      item = values
      do
        local value21
        value21 = wait3
        
        function value(argument)
          value21[1] = true
          return
        end
      end
      item[1] = value
      callback = environment.hookfunction
      wait2 = item[1]
      result = environment.coroutine.yield
      callback(wait2, result)
      value4 = environment.coroutine.create
      do
        local value22
        value22 = item
        
        function wait2(argument)
          environment.coroutine.yield()
          value22[1]()
          environment.restorefunction(value22[1])
          value22[1]()
          return
        end
      end
      value4 = value4(wait2)
      value = value4
      environment.coroutine.resume(value4)
      wait2 = environment.coroutine.resume
      values = wait2
      wait2(value4)
      wait2 = environment.coroutine.resume
      value5 = value4
      wait2(value4)
      environment2 = environment
      wait2 = environment2.task.wait
      value4 = wait2
      wait2()
      callback = not wait3[1]
      if callback then
        wait2 = reportResult
        value4 = wait2
        result = false
        value5 = false
        new2 = "restorefunction"
        item = "Failed to restore a L -> C hook back to original[1]"
        wait2(false, "restorefunction", "Failed to restore a L -> C hook back to original[1]")
        callback = failureMap.restorefunction
        if callback then
          callback = true
          values = failureFlag
          values[1] = true
        end
      end
    end
    if options.printcheckpoints then
      checkpointLogger("restorefunction-2: C -> C and L -> C Restore")
    end
    argument = options.delaybetweentests
    checkpointLogger2 = 0
    if argument > 0 then
      argument = true
    else
      argument = false
    end
    if argument then
      checkpointLogger2 = environment.task.wait
      value2 = options.delaybetweentests
      checkpointLogger2(value2)
    end
    values = {}
    values[1] = checkpointLogger2
    checkpointLogger2 = values
    values[1] = false
    values = {}
    values[1] = value2
    value2 = values
    values[1] = false
    wait2 = environment.hookfunction
    result = environment.coroutine.yield
    new2 = environment.coroutine.resume
    wait2(result, new2)
    value4 = environment.coroutine.wrap
    do
      local value23, value24
      value23 = checkpointLogger2
      value24 = value2
      
      function new2(argument)
        local yield2 = environment.coroutine.yield
        local spawn2 = environment.task.spawn
        
        local function callback(argument)
          value24[1] = true
          return
        end
        
        local results = packResults(spawn2(callback))
        local unpackResults2 = unpackResults
        local resultCount = results.n
        yield2(unpackResults2(results, 1, resultCount))
        value23[1] = true
        return
      end
    end
    value4(new2)()
    environment.task.wait()
    wait2 = environment.restorefunction
    value4 = wait2
    environment2 = environment
    result = environment2.coroutine.yield
    wait2(result)
    values = {}
    values[1] = wait2
    wait2 = values
    values[1] = false
    values = {}
    values[1] = result
    result = values
    values[1] = false
    if checkpointLogger2[1] and value2[1] then
      environment2 = environment
      value4 = environment2.coroutine.wrap
      do
        local value25, value26 = nil, value2
        value25 = result
        value26 = wait2
        
        function callback(argument)
          local yield2 = environment.coroutine.yield
          local spawn2 = environment.task.spawn
          
          local function callback(argument)
            value26[1] = true
            return
          end
          
          local results = packResults(spawn2(callback))
          local unpackResults2 = unpackResults
          local resultCount = results.n
          yield2(unpackResults2(results, 1, resultCount))
          value25[1] = true
          return
        end
      end
      value4 = value4(callback)
      new2 = value4
      value4()
    end
    argument = result[1]
    if not argument then
      argument = not wait2[1]
    end
    if argument then
      new2 = reportResult
      new2(false, "restorefunction", "Failed to restore a C -> C hook back to original[1]")
      if failureMap.restorefunction then
        failureFlag[1] = true
      end
    end
    argument = nil
    callback = 115
    wait2 = 1
    
    function callback2(argument)
      return
    end
    
    function wait3(argument)
      return "BBB"
    end
    
    value = 1 - 1
    while true do
      value = value + wait2
      if not (callback >= value) then
        break
      end
      environment.hookfunction(environment.coroutine.yield, environment.coroutine.resume)
      environment.hookfunction(environment.coroutine.resume, environment.coroutine.resume)
      environment.hookfunction(environment.coroutine.resume, environment.coroutine.yield)
      environment.hookfunction(environment.coroutine.yield, callback2)
      argument = wait3
      new2 = environment.hookfunction
      checkpointLogger2 = environment.coroutine.yield
      new2(wait3, checkpointLogger2)
      environment.restorefunction(wait3)
      environment.restorefunction(environment.coroutine.yield)
      new2 = environment.restorefunction
      environment2 = environment
      item = environment2.coroutine.resume
      new2(item)
    end
    values = {}
    values[1] = value
    value = values
    values[1] = false
    value4 = environment.coroutine.create
    do
      local value27
      value27 = value
      
      function wait2(argument)
        environment.coroutine.yield()
        value27[1] = true
        return
      end
    end
    value4 = value4(wait2)
    new2 = value4
    environment.coroutine.resume(value4)
    if value[1] then
      reportResult(false, "restorefunction", "Failed to restore a C -> C hook back to original[2]")
      if failureMap.restorefunction then
        failureFlag[1] = true
      end
    end
    environment.coroutine.resume(new2)
    if not value[1] then
      reportResult(false, "restorefunction", "Failed to restore a C -> C hook back to original[3]")
      if failureMap.restorefunction then
        failureFlag[1] = true
      end
    end
    values = argument()
    callback = values
    wait2 = "BBB"
    if values ~= "BBB" then
      callback = true
    else
      callback = false
    end
    if callback then
      reportResult(false, "restorefunction", "Failed to restore a L -> C hook back to original[2]")
      callback = failureMap
      wait2 = "restorefunction"
      if callback.restorefunction then
        failureFlag[1] = true
      end
    end
    callback = nil
    values = {}
    values[1] = wait2
    wait2 = values
    values[1] = nil
    do
      local value28
      value28 = wait2
      
      function callback(argument)
        value28[1] = 1
        return
      end
    end
    value4 = environment.hookfunction
    value5 = callback
    do
      local value29
      value29 = wait2
      
      function checkpointLogger2(argument)
        value29[1] = 2
        return
      end
    end
    value4(value5, checkpointLogger2)
    value4 = environment.hookfunction
    value5 = callback
    do
      local value30
      value30 = wait2
      
      function checkpointLogger2(argument)
        value30[1] = 3
        return
      end
    end
    value4(value5, checkpointLogger2)
    environment.restorefunction(callback)
    callback()
    result = wait2[1]
    if result ~= 1 then
      result = true
    else
      result = false
    end
    if result then
      reportResult(false, "restorefunction", "Failed to fully restore a hooked function")
      if failureMap.restorefunction then
        failureFlag[1] = true
      end
    end
    if options.printcheckpoints then
      checkpointLogger("restorefunction-3: Restore NC[1] -> NC[2] and NC[2] -> NC[1] x4")
      if failureMap.restorefunction then
        failureFlag[1] = true
      end
    end
    result = options.delaybetweentests
    if result > 0 then
      result = true
    else
      result = false
    end
    if result then
      environment.task.wait(options.delaybetweentests)
    end
    result = captured6()
    new2 = captured6()
    value4 = environment.newcclosure
    do
      local value31
      value31 = result
      
      function value2(...)
        return value31
      end
    end
    item = value4(value2)
    value4 = environment.newcclosure
    do
      local value32
      value32 = new2
      
      function argument(...)
        return value32
      end
    end
    value4 = value4(argument)
    checkpointLogger2 = value4
    environment.hookfunction(item, value4)
    environment.hookfunction(value4, item)
    environment.hookfunction(value4, item)
    environment.hookfunction(value4, item)
    environment.hookfunction(value4, item)
    environment.restorefunction(item)
    environment.restorefunction(value4)
    values = item()
    value2 = values
    if values ~= result then
      value2 = true
    else
      value2 = false
    end
    if value2 then
      reportResult(false, "restorefunction", "Failed to restore NC[1] -> NC[2] -> NC[1]. [1]")
      if failureMap.restorefunction then
        failureFlag[1] = true
      end
    end
    values = checkpointLogger2()
    value2 = values
    if values ~= new2 then
      value2 = true
    else
      value2 = false
    end
    if not value2 then
      return
    end
    reportResult(false, "restorefunction", "Failed to restore NC[1] -> NC[2] -> NC[1]. [2]")
    if not failureMap.restorefunction then
      return
    end
    failureFlag[1] = true
    return
  end
  reportResult(false, "restorefunction", "Can't test due to 'hookfunction' not working reliably")
  if not failureMap.restorefunction then
    return
  end
  failureFlag[1] = true
  return
end
