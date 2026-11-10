local reportResult, failureMap, failureFlag, warningLogger, options, checkpointLogger, captured7, captured8, packResults, unpackResults, environment
reportResult, failureMap, failureFlag, warningLogger, options, checkpointLogger, captured7, captured8, packResults, unpackResults, environment = ...
return function(argument)
  local value, game2, callback, value2, value3, loadstring2, callback2, value4, reportResult2, hookfunctionResult, wrap2, select2, value6, value7, value8, value9, value10, packResults2, httpGet, value12, resultCount, resultCount2, environment2, value14
  value = nil
  argument = environment.getsenv
  if not argument then
    argument = not environment.newcclosure
  end
  if not argument then
    reportResult(false, "hookfunction", "getsenv and newcclosure is needed in order to test")
    if not failureMap.hookfunction then
      return
    end
    failureFlag[1] = true
    return
  end
  argument = environment.workspace["I AM SUNC_0"].SurfaceGui.ImageLabel.Active
  if argument == true then
    argument = true
  else
    argument = false
  end
  if argument then
    reportResult(false, "hookfunction", "Failed to successfully hook a script's function")
    if failureMap.hookfunction then
      failureFlag[1] = true
    end
  end
  loadstring2 = environment.loadstring
  value7 = loadstring2
  environment2 = environment
  game2 = environment2.game
  packResults2 = packResults
  httpGet = game2.HttpGet
  packResults2 = packResults2(httpGet(game2, "https://raw.githubusercontent.com/senS24th/es-unk-stuff/refs/heads/main/gitlab_just_doing_anything_ts_days/hookfankshan.lua"))
  value6 = packResults2
  httpGet = packResults2.n
  value12 = 24
  if not (httpGet < 24) then
    value = value6[value12]
  end
  httpGet = unpackResults
  resultCount = value6.n
  packResults2 = value7(httpGet(value6, 1, resultCount))
  value7, value8 = packResults2()
  argument = value7
  value2 = value8
  value3 = 66
  repeat
    environment.task.wait()
    value3 = value3 - 1
    environment2 = environment
    loadstring2 = environment2.workspace["I AM SUNC_0"].SurfaceGui.ImageLabel.Active
    if not loadstring2 then
      if value3 <= 0 then
        loadstring2 = true
      else
        loadstring2 = false
      end
    end
  until loadstring2
  warningLogger(argument, value2)
  loadstring2 = environment.workspace["I AM SUNC_0"].SurfaceGui.ImageLabel.Active
  if loadstring2 == false then
    loadstring2 = true
  else
    loadstring2 = false
  end
  if loadstring2 then
    reportResult(false, "hookfunction", "Failed to successfully hook a script's function")
    if failureMap.hookfunction then
      failureFlag[1] = true
    end
  end
  environment.workspace["I AM SUNC_0"].SurfaceGui.ImageLabel.Active = false
  if options.printcheckpoints then
    checkpointLogger("hookfunction-1: L -> L[1]")
  end
  loadstring2 = options.delaybetweentests
  if loadstring2 > 0 then
    loadstring2 = true
  else
    loadstring2 = false
  end
  if loadstring2 then
    environment.task.wait(options.delaybetweentests)
  end
  game2 = environment.pcall
  
  function callback(argument)
    local hookfunction2 = environment.hookfunction
    
    local function callback(argument)
      return
    end
    
    hookfunction2(callback)
    return
  end
  
  value7 = game2(callback)
  game2 = value7
  if value7 then
    reportResult(false, "hookfunction", "Hookfunction did not error when only one parameter was passed")
    game2 = failureMap
    callback = "hookfunction"
    if game2.hookfunction then
      failureFlag[1] = true
    end
  end
  game2 = nil
  packResults2 = {}
  packResults2[1] = callback
  callback = packResults2
  packResults2[1] = nil
  do
    local value16
    value16 = callback
    
    function game2(argument)
      value16[1] = 1
      return
    end
  end
  value2 = environment.hookfunction
  value7 = value2
  value8 = game2
  do
    local value17
    value17 = callback
    
    function value2(argument)
      value17[1] = 2
      return
    end
  end
  value7(value8, value2)
  value2 = environment.hookfunction
  value7 = value2
  value8 = game2
  do
    local value18
    value18 = callback
    
    function value2(argument)
      value18[1] = 3
      return
    end
  end
  value7(value8, value2)
  game2()
  value2 = 3
  argument = callback[1]
  if argument ~= 3 then
    argument = true
  else
    argument = false
  end
  if argument then
    reportResult(false, "restorefunction", "Failed to hook a hook")
    argument = failureMap
    value2 = "hookfunction"
    if argument.hookfunction then
      failureFlag[1] = true
    end
  end
  argument = 0
  packResults2 = {}
  packResults2[1] = value2
  value2 = packResults2
  packResults2[1] = 0
  do
    local value19
    value19 = value2
    
    function argument(argument)
      local value = value19[1] + 1
      value19[1] = value
      return false
    end
  end
  callback = captured7(10, 80)
  value7 = environment.hookfunction
  value8 = argument
  do
    local value20
    value20 = callback
    
    function callback2(argument)
      return true, "harhar", value20
    end
  end
  value7 = value7(value8, callback2)
  value2 = value7
  packResults2 = value7()
  game2 = packResults2
  if packResults2 ~= false then
    game2 = true
  else
    game2 = false
  end
  if game2 then
    reportResult(false, "hookfunction", "Function didn't return hooked value")
    if failureMap.hookfunction then
      failureFlag[1] = true
    end
  end
  if options.printcheckpoints then
    checkpointLogger("hookfunction-1: L -> L[2]")
  end
  value7, value8, value9 = argument()
  game2 = value7
  loadstring2 = value8
  callback2 = value9
  if value7 ~= true then
    game2 = true
  else
    game2 = false
  end
  if not game2 then
    if loadstring2 ~= "harhar" then
      game2 = true
    else
      game2 = false
    end
  end
  if not game2 then
    if callback2 ~= callback then
      game2 = true
    else
      game2 = false
    end
  end
  if game2 then
    reportResult(false, "hookfunction", "Function didn't return hooked value")
    if failureMap.hookfunction then
      failureFlag[1] = true
    end
  end
  loadstring2 = environment.pcall
  value7, value8, value9, value10 = loadstring2(argument)
  value3 = value8
  callback2 = value9
  value4 = value10
  loadstring2 = not value7
  if loadstring2 then
    reportResult2 = reportResult
    value10 = "Hooked function threw an error when it shouldn't"
    reportResult2(false, "hookfunction", "Hooked function threw an error when it shouldn't")
    loadstring2 = failureMap.hookfunction
    if loadstring2 then
      loadstring2 = true
      failureFlag[1] = true
    end
  end
  reportResult2 = true
  if value3 ~= true then
    loadstring2 = true
  else
    loadstring2 = false
  end
  if not loadstring2 then
    reportResult2 = "harhar"
    if callback2 ~= "harhar" then
      loadstring2 = true
    else
      loadstring2 = false
    end
  end
  if not loadstring2 then
    if value4 ~= callback then
      loadstring2 = true
    else
      loadstring2 = false
    end
  end
  if loadstring2 then
    reportResult2 = reportResult
    value10 = "Function didn't return the needed values in a pcall"
    reportResult2(false, "hookfunction", "Function didn't return the needed values in a pcall")
    if failureMap.hookfunction then
      failureFlag[1] = true
    end
  end
  environment.hookfunction(argument, value2)
  reportResult2 = environment.Instance.new
  loadstring2 = reportResult2("BindableFunction")
  do
    local value21
    value21 = loadstring2
    
    function reportResult2(argument)
      value21.Name = "Respect"
      return
    end
  end
  environment.Function2_ = reportResult2
  game2 = environment.Function2_
  loadstring2.OnInvoke = game2
  value7 = environment.hookfunction
  value8 = environment.Function2_
  do
    local value22
    value22 = loadstring2
    
    function argument(argument)
      value22.Name = "Sigma moment"
      return
    end
  end
  value7(value8, argument)
  loadstring2:Invoke()
  reportResult2 = loadstring2.Name
  game2 = "Sigma moment"
  if reportResult2 ~= "Sigma moment" then
    reportResult2 = true
  else
    reportResult2 = false
  end
  if reportResult2 then
    game2 = reportResult
    value10 = "Couldn't hook the function and change the value"
    game2(false, "hookfunction", "Couldn't hook the function and change the value")
    if failureMap.hookfunction then
      failureFlag[1] = true
    end
  end
  if options.printcheckpoints then
    checkpointLogger("hookfunction-2: C -> L")
  end
  reportResult2 = options.delaybetweentests
  if reportResult2 > 0 then
    reportResult2 = true
  else
    reportResult2 = false
  end
  if reportResult2 then
    environment.task.wait(options.delaybetweentests)
  end
  callback = environment.pcall
  
  function argument(argument)
    argument = false
    local values = {}
    values[1] = nil
    local values2 = values
    values[1] = false
    do
      local value11
      value11 = values2
      
      function argument(argument, argument2)
        argument2 = "Hello"
        if argument ~= "Hello" then
          argument2 = false
        else
          argument2 = true
        end
        if not argument2 then
          return
        end
        value11[1] = true
        return
      end
    end
    local hookfunctionResult = environment.hookfunction(environment.coroutine.resume, argument)
    environment.coroutine.resume("Hello")
    if not values2[1] then
      reportResult(false, "hookfunction", "Failed to hook C -> L Closures")
      if failureMap.hookfunction then
        failureFlag[1] = true
      end
    end
    values2[1] = false
    environment.hookfunction(environment.coroutine.resume, hookfunctionResult)
    environment.pcall(environment.coroutine.resume, "Hello")
    environment.task.wait()
    if not values2[1] then
      return
    end
    reportResult(false, "hookfunction", "Failed to restore a C -> L hook back to original[1]")
    if not failureMap.hookfunction then
      return
    end
    failureFlag[1] = true
    return
  end
  
  value7, value8 = callback(argument)
  game2 = value8
  if not value7 then
    argument = reportResult
    value2 = environment.tostring
    value14 = "Encountered an error trying to hook C -> L Closures: " .. value2(game2)
    value10 = value14
    argument(false, "hookfunction", value14)
    if failureMap.hookfunction then
      failureFlag[1] = true
    end
  end
  if options.printcheckpoints then
    checkpointLogger("hookfunction-3: L -> C")
  end
  callback = options.delaybetweentests
  if callback > 0 then
    callback = true
  else
    callback = false
  end
  if callback then
    environment.task.wait(options.delaybetweentests)
  end
  callback = environment.pcall
  
  function loadstring2(argument)
    local callbackResult2, callback2
    local values = {}
    values[1] = nil
    local values2 = values
    values[1] = true
    
    local function callback(argument)
      return "2"
    end
    
    local hookfunctionResult = environment.hookfunction(callback, environment.coroutine.yield)
    local wrap2 = environment.coroutine.wrap
    do
      local callback3, values22
      callback3 = callback
      values22 = values2
      
      function callback2(argument)
        callback3()
        values22[1] = false
        return
      end
    end
    wrap2(callback2)()
    if not values2[1] then
      reportResult(false, "hookfunction", "Failed to hook L -> C Closures")
      if failureMap.hookfunction then
        failureFlag[1] = true
      end
    end
    environment.hookfunction(callback, hookfunctionResult)
    local callbackResult = callback()
    callbackResult2 = callbackResult
    if callbackResult == "2" then
      callbackResult2 = false
    else
      callbackResult2 = true
    end
    if not callbackResult2 then
      return
    end
    reportResult(false, "hookfunction", "Failed to restore an L -> C hook back to original[1]")
    if not failureMap.hookfunction then
      return
    end
    failureFlag[1] = true
    return
  end
  
  value7, value8 = callback(loadstring2)
  argument = value8
  if not value7 then
    loadstring2 = reportResult
    value10 = environment.tostring(argument)
    value = value10
    value14 = "Encountered an error trying to hook L -> C Closures: " .. value10
    value2 = value14
    loadstring2(false, "hookfunction", value14)
    if failureMap.hookfunction then
      failureFlag[1] = true
    end
  end
  if options.printcheckpoints then
    checkpointLogger("hookfunction-4: C -> C")
  end
  callback = options.delaybetweentests
  if callback > 0 then
    callback = true
  else
    callback = false
  end
  if callback then
    environment.task.wait(options.delaybetweentests)
  end
  callback = environment.pcall
  
  function game2(argument)
    local callback
    local values = {}
    values[1] = nil
    local values2 = values
    values[1] = false
    local create2 = environment.coroutine.create
    do
      local value12
      value12 = values2
      
      function callback(argument)
        value12[1] = true
        return
      end
    end
    local create2Result = create2(callback)
    local hookfunctionResult = environment.hookfunction(environment.coroutine.yield, environment.coroutine.resume)
    environment.coroutine.yield(create2Result)
    if not values2[1] then
      reportResult(false, "hookfunction", "Failed to hook C -> C Closures")
      if failureMap.hookfunction then
        failureFlag[1] = true
      end
    end
    values2[1] = false
    environment.hookfunction(environment.coroutine.yield, hookfunctionResult)
    environment.task.spawn(environment.coroutine.yield, create2Result)
    environment.task.wait()
    if not values2[1] then
      return
    end
    reportResult(false, "hookfunction", "Failed to restore a C -> C hook back to original")
    if not failureMap.hookfunction then
      return
    end
    failureFlag[1] = true
    return
  end
  
  value7, value8 = callback(game2)
  loadstring2 = value8
  if not value7 then
    game2 = reportResult
    value2 = false
    value = "hookfunction"
    value14 = "Encountered an error trying to hook `C -> C` Closures: " .. environment.tostring(loadstring2)
    game2(false, "hookfunction", value14)
    if failureMap.hookfunction then
      failureFlag[1] = true
    end
  end
  if options.printcheckpoints then
    checkpointLogger("hookfunction-5: L -> C -> L")
  end
  callback = options.delaybetweentests
  game2 = 0
  if callback > 0 then
    callback = true
  else
    callback = false
  end
  if callback then
    game2 = environment.task.wait
    value2 = options
    value = "delaybetweentests"
    game2(value2.delaybetweentests)
  end
  
  function callback(argument)
    return "1"
  end
  
  function game2(argument)
    return "2"
  end
  
  packResults2 = {}
  packResults2[1] = value
  value = packResults2
  packResults2[1] = nil
  value3 = environment.hookfunction
  argument = environment.coroutine.wrap
  value7 = value3(callback, argument)
  packResults2[1] = value7
  value7 = callback
  do
    local value23, value24
    value23 = callback
    value24 = value
    
    function argument(argument)
      local value232 = value23
      
      local function callback(argument)
        return value24[1]()
      end
      
      return value232(callback)
    end
  end
  value2 = value7(argument)()
  value3 = environment.hookfunction(game2, environment.coroutine.resume)
  hookfunctionResult = environment.hookfunction(environment.coroutine.wrap, game2)
  select2 = environment.select
  callback2 = environment.pcall
  packResults2 = packResults(callback2(callback))
  value12 = unpackResults
  resultCount2 = packResults2.n
  argument = select2(2, value12(packResults2, 1, resultCount2))
  loadstring2 = environment.select
  reportResult2 = environment.pcall
  wrap2 = environment.coroutine.wrap
  packResults2 = packResults(reportResult2(wrap2))
  value12 = unpackResults
  resultCount2 = packResults2.n
  select2 = loadstring2(2, value12(packResults2, 1, resultCount2))
  packResults2 = value2()
  loadstring2 = packResults2
  if packResults2 ~= "1" then
    loadstring2 = true
  else
    loadstring2 = false
  end
  if loadstring2 then
    reportResult(false, "hookfunction", "Failed to get a valid return from and 'old' function")
    if failureMap.hookfunction then
      failureFlag[1] = true
    end
  end
  value7 = environment.string.find(argument, "missing argument #1 to 'resume'")
  loadstring2 = not value7
  if loadstring2 then
    reportResult(false, "hookfunction", "Retrieved an invalid error message when trying to call a hooked function[1]")
    if failureMap.hookfunction then
      failureFlag[1] = true
    end
    loadstring2 = captured8
    value7 = environment.string.format("\r\n\r\n\t\t\t\t\t\t\t\thookfunction L -> C -> L returned an invalid error message (err1), expected \"missing argument #1 to 'resume', got:\r\n\r\n\t\t\t\t\t\t\t\t%s\r\n\r\n\t\t\t\t\t\t\t", argument)
    loadstring2.hookfunction = value7
  end
  value7 = environment.string.find(select2, "missing argument #1 to 'resume'")
  loadstring2 = not value7
  if loadstring2 then
    reportResult(false, "hookfunction", "Retrieved an invalid error message when trying to call a hooked function[2]")
    if failureMap.hookfunction then
      failureFlag[1] = true
    end
    loadstring2 = captured8
    value7 = environment.string.format("\r\n\r\n\t\t\t\t\t\t\t\thookfunction L -> C -> L returned an invalid error message (err2), expected \"missing argument #1 to 'resume', got:\r\n\r\n\t\t\t\t\t\t\t\t%s\r\n\r\n\t\t\t\t\t\t\t", select2)
    loadstring2.hookfunction = value7
  end
  environment.hookfunction(environment.coroutine.wrap, hookfunctionResult)
  environment.hookfunction(callback, value[1])
  environment.hookfunction(game2, value3)
  packResults2 = callback()
  loadstring2 = packResults2
  if packResults2 ~= "1" then
    loadstring2 = true
  else
    loadstring2 = false
  end
  if loadstring2 then
    reportResult(false, "hookfunction", "Failed to restore an L -> C hook back to original[2]")
    if failureMap.hookfunction then
      failureFlag[1] = true
    end
  end
  packResults2 = game2()
  loadstring2 = packResults2
  if packResults2 ~= "2" then
    loadstring2 = true
  else
    loadstring2 = false
  end
  if loadstring2 then
    reportResult(false, "hookfunction", "Failed to restore an L -> C hook back to original[3]")
    if failureMap.hookfunction then
      failureFlag[1] = true
    end
  end
  value4 = environment.type
  reportResult2 = environment.coroutine.wrap
  
  function wrap2(argument)
    return
  end
  
  packResults2 = packResults(reportResult2(wrap2))
  httpGet = unpackResults
  resultCount = packResults2.n
  packResults2 = value4(httpGet(packResults2, 1, resultCount))
  loadstring2 = packResults2
  if packResults2 ~= "function" then
    loadstring2 = true
  else
    loadstring2 = false
  end
  if loadstring2 then
    reportResult(false, "hookfunction", "Failed to restore a C -> L hook back to original[2]")
    if failureMap.hookfunction then
      failureFlag[1] = true
    end
  end
  if options.printcheckpoints then
    checkpointLogger("hookfunction-6: L -> NC")
  end
  loadstring2 = options.delaybetweentests
  if loadstring2 > 0 then
    loadstring2 = true
  else
    loadstring2 = false
  end
  if loadstring2 then
    environment.task.wait(options.delaybetweentests)
  end
  
  function loadstring2(argument)
    return
  end
  
  callback2 = captured7
  value7 = callback2(99, 520)
  packResults2 = {}
  packResults2[1] = callback2
  callback2 = packResults2
  packResults2[1] = value7
  value4 = packResults2[1]
  value7 = environment.newcclosure
  do
    local value25
    value25 = callback2
    
    function reportResult2(argument)
      local value = value25[1] + 1
      value25[1] = value
      return
    end
  end
  reportResult2 = value7(reportResult2)
  value7 = environment.pcall
  do
    local value26, value27 = nil, value
    value26 = loadstring2
    value27 = reportResult2
    
    function game2(argument)
      return environment.hookfunction(value26, value27)
    end
  end
  value7, value8 = value7(game2)
  reportResult2 = value8
  if not value7 then
    game2 = reportResult
    value14 = "Encountered an error trying to hook L -> NC Closures: " .. reportResult2
    game2(false, "hookfunction", value14)
    if failureMap.hookfunction then
      failureFlag[1] = true
    end
  end
  loadstring2()
  game2 = value4 + 1
  argument = callback2[1]
  if argument ~= game2 then
    argument = true
  else
    argument = false
  end
  if argument then
    game2 = reportResult
    callback = "hookfunction"
    game2(false, "hookfunction", "Failed to hook L -> NC Closures")
    if failureMap.hookfunction then
      failureFlag[1] = true
    end
  end
  value7 = environment.pcall
  do
    local value28, value29 = nil, reportResult2
    value28 = loadstring2
    value29 = reportResult2
    
    function callback(argument)
      environment.hookfunction(value28, value29)
      return
    end
  end
  value7, value8 = value7(callback)
  game2 = value8
  if not value7 then
    callback = reportResult
    value14 = "Encountered an error trying to restore a L -> NC hook: " .. game2
    value2 = value14
    callback(false, "hookfunction", value14)
    if failureMap.hookfunction then
      failureFlag[1] = true
    end
  end
  loadstring2()
  callback = 7
  argument = callback2[1]
  if argument == 7 then
    argument = true
  else
    argument = false
  end
  if argument then
    callback = reportResult
    value2 = "Failed to restore a L -> NC hook"
    callback(false, "hookfunction", "Failed to restore a L -> NC hook")
    if failureMap.hookfunction then
      failureFlag[1] = true
    end
  end
  if options.printcheckpoints then
    checkpointLogger("hookfunction-7: NC -> L")
  end
  argument = options.delaybetweentests
  if argument > 0 then
    argument = true
  else
    argument = false
  end
  if argument then
    environment.task.wait(options.delaybetweentests)
  end
  callback = environment.newcclosure
  
  function value(argument)
    return
  end
  
  argument = callback(value)
  value = captured7
  value7 = value(30, 120)
  packResults2 = {}
  packResults2[1] = value
  value = packResults2
  packResults2[1] = value7
  callback = packResults2[1]
  do
    local value30
    value30 = value
    
    function loadstring2(argument)
      local value = value30[1] + 0.5
      value30[1] = value
      return
    end
  end
  value3 = environment.pcall
  value7 = value3
  do
    local value31, value32 = nil, reportResult2
    value31 = argument
    value32 = loadstring2
    
    function value2(argument)
      return environment.hookfunction(value31, value32)
    end
  end
  value7, value8 = value7(value2)
  packResults2 = {}
  packResults2[1] = value3
  value3 = packResults2
  packResults2[1] = value8
  if not value7 then
    value7 = reportResult
    value4 = value3[1]
    value7(false, "hookfunction", "Encountered an error trying to hook NC -> L Closures: " .. value4)
    if failureMap.hookfunction then
      failureFlag[1] = true
    end
  end
  argument()
  value7 = loadstring2
  loadstring2()
  value2 = callback + 1
  game2 = value[1]
  if game2 ~= value2 then
    game2 = true
  else
    game2 = false
  end
  if game2 then
    value7 = reportResult
    callback = "hookfunction"
    value7(false, "hookfunction", "Failed to hook NC -> L Closures")
    if failureMap.hookfunction then
      failureFlag[1] = true
    end
  end
  value7 = environment.pcall
  do
    local value33, value34 = nil, loadstring2
    value33 = argument
    value34 = value3
    
    function callback(argument)
      environment.hookfunction(value33, value34[1])
      return
    end
  end
  value7, value8 = value7(callback)
  callback2 = value8
  if not value7 then
    value7 = reportResult
    value4 = "hookfunction"
    value7(false, "hookfunction", "Encountered an error trying to restore a NC -> L hook: " .. callback2)
    if failureMap.hookfunction then
      failureFlag[1] = true
    end
  end
  argument()
  game2 = value[1]
  if game2 == 8 then
    game2 = true
  else
    game2 = false
  end
  if game2 then
    reportResult(false, "hookfunction", "Failed to restore a NC -> L hook")
    if failureMap.hookfunction then
      failureFlag[1] = true
    end
  end
  if options.printcheckpoints then
    checkpointLogger("hookfunction-8: NC -> C")
  end
  game2 = options.delaybetweentests
  if game2 > 0 then
    game2 = true
  else
    game2 = false
  end
  if game2 then
    environment.task.wait(options.delaybetweentests)
  end
  value7 = environment.pcall
  do
    local value35, value36, value37, value38 = nil, value3, nil, nil
    value35 = value3
    
    function value4(argument)
      local hookfunctionResult2
      local values = {}
      values[1] = nil
      local values2 = values
      values[1] = true
      local newcclosure2 = environment.newcclosure
      
      local function callback(argument)
        return "2"
      end
      
      local newcclosure2Result = newcclosure2(callback)
      local newcclosure2Result2 = newcclosure2Result
      local hookfunctionResult = environment.hookfunction(newcclosure2Result, environment.coroutine.yield)
      hookfunctionResult2 = hookfunctionResult
      value35[1] = hookfunctionResult
      local wrap2 = environment.coroutine.wrap
      do
        local newcclosure2Result22, values22
        newcclosure2Result22 = newcclosure2Result2
        values22 = values2
        
        function hookfunctionResult2(argument)
          newcclosure2Result22()
          values22[1] = false
          return
        end
      end
      wrap2(hookfunctionResult2)()
      if not values2[1] then
        reportResult(false, "hookfunction", "Failed to hook NC -> C Closures")
        if failureMap.hookfunction then
          failureFlag[1] = true
        end
      end
      environment.hookfunction(newcclosure2Result2, value35[1])
      local newcclosure2Result2Result = newcclosure2Result2()
      hookfunctionResult2 = newcclosure2Result2Result
      if newcclosure2Result2Result == "2" then
        hookfunctionResult2 = false
      else
        hookfunctionResult2 = true
      end
      if not hookfunctionResult2 then
        return
      end
      reportResult(false, "hookfunction", "Failed to restore an NC -> C hook back to original[1]")
      if not failureMap.hookfunction then
        return
      end
      failureFlag[1] = true
      return
    end
  end
  value7, value8 = value7(value4)
  value2 = value8
  if not value7 then
    reportResult(false, "hookfunction", "Encountered an error trying to hook NC -> C Closures: " .. environment.tostring(value2))
    if failureMap.hookfunction then
      failureFlag[1] = true
    end
  end
  if options.printcheckpoints then
    checkpointLogger("hookfunction-9: C -> NC")
  end
  game2 = options.delaybetweentests
  if game2 > 0 then
    game2 = true
  else
    game2 = false
  end
  if game2 then
    environment.task.wait(options.delaybetweentests)
  end
  game2 = environment.pcall
  
  function value2(argument)
    local callback
    local values = {}
    values[1] = nil
    local values2 = values
    values[1] = false
    local newcclosure2 = environment.newcclosure
    do
      local value10
      value10 = values2
      
      function callback(argument, argument2)
        argument2 = "Hello"
        if argument ~= "Hello" then
          argument2 = false
        else
          argument2 = true
        end
        if not argument2 then
          return
        end
        value10[1] = true
        return
      end
    end
    local newcclosure2Result = newcclosure2(callback)
    local hookfunctionResult = environment.hookfunction(environment.coroutine.resume, newcclosure2Result)
    environment.coroutine.resume("Hello")
    if not values2[1] then
      reportResult(false, "hookfunction", "Failed to hook C -> NC Closures")
      if failureMap.hookfunction then
        failureFlag[1] = true
      end
    end
    values2[1] = false
    environment.hookfunction(environment.coroutine.resume, hookfunctionResult)
    environment.pcall(environment.coroutine.resume, "Hello")
    if not values2[1] then
      return
    end
    reportResult(false, "hookfunction", "Failed to restore a C -> NC hook back to original[1]")
    if not failureMap.hookfunction then
      return
    end
    failureFlag[1] = true
    return
  end
  
  value7, value8 = game2(value2)
  callback = value8
  if not value7 then
    reportResult(false, "hookfunction", "Encountered an error trying to hook C -> NC Closures: " .. environment.tostring(callback))
    if failureMap.hookfunction then
      failureFlag[1] = true
    end
  end
  if options.printcheckpoints then
    checkpointLogger("hookfunction-10: detection & ENV leak test")
  end
  game2 = options.delaybetweentests
  value2 = 0
  if game2 > 0 then
    game2 = true
  else
    game2 = false
  end
  if game2 then
    value2 = environment.task.wait
    value2(options.delaybetweentests)
  end
  packResults2 = {}
  packResults2[1] = value2
  value2 = packResults2
  packResults2[1] = nil
  value = environment.hookfunction
  value7 = value
  argument = environment.getrawmetatable
  environment2 = environment
  callback = argument(environment2.game).__namecall
  value8 = callback
  do
    local value39
    value39 = value2
    
    function argument(...)
      local value = (...)
      return value39[1](...)
    end
  end
  value7 = value7(value8, argument)
  value2[1] = value7
  game2 = 28
  repeat
    callback = environment.task.wait
    callback(0.1)
    game2 = game2 - 1
    environment2 = environment
    value = environment2.game.ReplicatedStorage.TestFuncs.awuuu
    packResults2 = value:GetAttribute("cwazybwo")
    value = packResults2
    if not packResults2 then
      callback = 0
      if game2 <= 0 then
        value = true
      else
        value = false
      end
    end
  until value
  environment.hookfunction(environment.getrawmetatable(environment.game).__namecall, value2[1])
  value = environment.game.ReplicatedStorage.TestFuncs.awuuu
  if not value:GetAttribute("cwazybwo") then
    return
  end
  reportResult(false, "hookfunction", "generic namecall hook detected")
  if not failureMap.hookfunction then
    return
  end
  failureFlag[1] = true
  return
end
