local reportResult, failureMap, failureFlag, options, checkpointLogger, warningLogger, captured7, packResults, unpackResults, environment
reportResult, failureMap, failureFlag, options, checkpointLogger, warningLogger, captured7, packResults, unpackResults, environment = ...
return function(argument)
  local callback, value, value2, value3, value4, event, value5, value6, value7, value8, game2, value9, item, value10, length, value12, bindableEvent, value13, value14, value15, value16, gsub2, tostring2, values, value19, value20, resultCount, unpackResults2, resultCount2, environment2, value24
  value4 = nil
  value = nil
  if not environment.hookmetamethod then
    reportResult(false, "getconnections", "hookmetamethod is needed in order to test")
    if not failureMap.getconnections then
      return
    end
    failureFlag[1] = true
    return
  end
  argument = {}
  argument.Enabled = "boolean"
  argument.ForeignState = "boolean"
  argument.LuaConnection = "boolean"
  argument.Function = "function"
  argument.Thread = "thread"
  argument.Fire = "function"
  argument.Defer = "function"
  argument.Disconnect = "function"
  argument.Disable = "function"
  value19 = "function"
  argument.Enable = "function"
  bindableEvent = environment.Instance.new("BindableEvent")
  value5 = bindableEvent
  event = bindableEvent.Event
  value2 = event
  event = event.Connect
  
  function callback(argument)
    return
  end
  
  event(value2, callback)
  value2 = environment.getconnections
  callback = bindableEvent.Event
  event = value2(callback)[1]
  environment2 = environment
  value2 = environment2.pairs
  bindableEvent, value13, value14 = value2(argument)
  value3 = bindableEvent
  value2 = value13
  argument = value14
  value7 = bindableEvent
  value8 = value13
  value10 = value14
  while true do
    bindableEvent, value13 = value7(value8, value10)
    value2 = bindableEvent
    argument = value13
    value3 = nil
    if bindableEvent == nil then
      value3 = true
    else
      value3 = false
    end
    if value3 then
      break
    end
    value10 = value2
    value5 = value2
    value6 = argument
    value2 = event[value2]
    callback = nil
    if value2 == nil then
      value2 = true
    else
      value2 = false
    end
    if value2 then
      callback = reportResult
      argument = "' field"
      value24 = value5 .. "' field"
      value9 = value24
      value19 = value24
      value24 = "Did not return a table with a '" .. value24
      callback(false, "getconnections", value24)
    end
    environment2 = environment
    callback = environment2.type
    value3 = event[value5]
    value13 = value3
    bindableEvent = callback(value3)
    value2 = bindableEvent
    if bindableEvent ~= value6 then
      value2 = true
    else
      value2 = false
    end
    if value2 then
      callback = reportResult
      bindableEvent = callback
      value3 = false
      value13 = false
      environment2 = environment
      value9 = environment2.type
      item = event[value5]
      value16 = item
      value24 = " (got " .. value9(item) .. ")"
      value = value24
      value24 = value6 .. value24
      value4 = value24
      value24 = " as a " .. value24
      argument = value24
      value24 = value5 .. value24
      value9 = value24
      value19 = value24
      value24 = "Did not return a table with " .. value24
      callback(false, "getconnections", value24)
    end
  end
  values = {}
  values[1] = callback
  callback = values
  values[1] = false
  value3 = environment.pcall
  
  function event(argument)
    local folder = environment.Instance.new("Folder")
    argument = #environment.getconnections(folder)
    if not (argument > 0) then
      argument = false
    else
      argument = true
    end
    if not argument then
      return
    end
    reportResult(false, "getconnections", "REAL connections \240\159\164\175\240\159\152\178[1]")
    if not failureMap.getconnections then
      return
    end
    failureFlag[1] = true
    return
  end
  
  value3(event)
  value3 = environment.Instance.new
  event = "Folder"
  value2 = value3("Folder")
  values = {}
  values[1] = value3
  value3 = values
  do
    local value26, value27
    value26 = value2
    value27 = callback
    
    function event(argument)
      local childAdded = value26.ChildAdded
      local childAdded2 = childAdded
      local connect = childAdded.Connect
      
      local function callback(argument)
        value27[1] = true
        return
      end
      
      connect(childAdded2, callback)
      return
    end
  end
  value3[1] = event
  value3[1]()
  event = environment.getconnections(value2.ChildAdded)
  argument = 1
  value5 = 56
  value6 = 1
  while true do
    if argument <= value5 then
      value7 = true
    else
      value7 = false
    end
    if not value7 then
      break
    end
    value4 = argument
    value = event.ForeignState
    value = event.Enabled
    value = event.LuaConnection
    value = event.ForeignState
    argument = argument + value6
  end
  length = #event
  value9 = 1
  if length ~= 1 then
    length = true
  else
    length = false
  end
  if length then
    value9 = reportResult
    value4 = "getconnections"
    value9(false, "getconnections", "REAL connections \240\159\164\175\240\159\152\178[2]")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  length = event.ForeignState
  value9 = true
  if length == true then
    length = true
  else
    length = false
  end
  if length then
    value9 = reportResult
    value4 = "getconnections"
    value9(false, "getconnections", "Those who return true: \240\159\146\128")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  length = event[1]
  value9 = length
  length:Fire()
  if not callback[1] then
    value9 = reportResult
    value4 = 1
    value9(false, "getconnections", "Failed to trigger the :Fire signal")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  if options.printcheckpoints then
    checkpointLogger("getconnections-1")
  end
  value9 = environment.task.wait
  value9()
  callback[1] = false
  if not event[1].Enabled then
    value9 = reportResult
    value4 = "getconnections"
    value9(false, "getconnections", "Returned false for an enabled connection on 'Enabled' field")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  length = event[1]
  length:Disable()
  value9 = environment.Instance.new
  value9("Folder", value2)
  if callback[1] then
    value9 = reportResult
    value4 = 1
    value9(false, "getconnections", "Triggered the connection after disabling")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  if event[1].Enabled then
    value9 = reportResult
    value4 = "getconnections"
    value9(false, "getconnections", "Returned true for a disabled connection on 'Enabled' field")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  callback[1] = false
  if options.printcheckpoints then
    checkpointLogger("getconnections-2")
  end
  environment.task.wait()
  length = event[1]
  length:Enable()
  environment.Instance.new("Folder", value2)
  value9 = environment.task.wait
  value9()
  if not callback[1] then
    value9 = reportResult
    value4 = "getconnections"
    value9(false, "getconnections", "Failed to trigger the connection after re-enabling the connection")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  callback[1] = false
  value3[1]()
  if options.printcheckpoints then
    checkpointLogger("getconnections-3")
  end
  environment.task.wait()
  argument = 25
  values = {}
  values[1] = value4
  value4 = values
  values[1] = nil
  values = {}
  values[1] = value
  value = values
  values[1] = nil
  bindableEvent = environment.hookmetamethod
  environment2 = environment
  value13 = environment2.game
  value14 = "__namecall"
  do
    local value28, value29, value30, value31 = nil, callback, nil, nil
    value28 = value
    value29 = value2
    value30 = value4
    value31 = callback
    
    function item(...)
      local value = (...)
      local runningResult = environment.coroutine.running()
      value28[1] = runningResult
      local childAdded = value29.ChildAdded
      local childAdded2 = childAdded
      local connect = childAdded.Connect
      
      local function callback(argument)
        value31[1] = true
        return
      end
      
      connect(childAdded2, callback)
      return value30[1](...)
    end
  end
  bindableEvent = bindableEvent(value13, value14, item)
  length = bindableEvent
  value4[1] = bindableEvent
  repeat
    environment2 = environment
    environment2.task.wait()
    length = 1
    argument = argument - 1
    if argument <= 0 then
      length = true
    else
      length = false
    end
    if not length then
      length = value[1]
      if length ~= nil then
        length = true
      else
        length = false
      end
    end
  until length
  value9 = environment.hookmetamethod
  bindableEvent = value9
  game2 = environment.game
  value13 = game2
  value14 = "__namecall"
  item = value4[1]
  value15 = item
  value9(game2, "__namecall", item)
  length = value[1]
  if length == nil then
    length = true
  else
    length = false
  end
  if length then
    bindableEvent = reportResult
    value13 = false
    value14 = "getconnections"
    value15 = "Failed to get a foreign thread"
    bindableEvent(false, "getconnections", "Failed to get a foreign thread")
    if failureMap.getconnections then
      values = failureFlag
      values[1] = true
    end
  end
  if options.printcheckpoints then
    bindableEvent = checkpointLogger
    value13 = environment.string.format
    value14 = [[
[DEBUG] Foreign thread: %s; Main thread: %s,
 timeout: %s]]
    value15 = environment.tostring((environment.string.gsub("thread:" .. environment.tostring(value[1]), "thread:", "")))
    value16 = environment.tostring
    gsub2 = environment.string.gsub
    value8 = "thread:"
    tostring2 = environment.tostring
    value6 = environment.coroutine
    value7 = "running"
    value6 = value6.running
    values = packResults(value6())
    value12 = values
    value19 = values.n
    value20 = 19
    if not (value19 < 19) then
      value4 = value12[value20]
    end
    value20 = 22
    if not (value19 < 22) then
      event = value12[value20]
    end
    value19 = unpackResults
    resultCount = value12.n
    value16 = value16((gsub2(value8 .. tostring2(value19(value12, 1, resultCount)), "thread:", "")))
    event = environment.tostring
    values = packResults(event(argument))
    value12 = values
    value19 = values.n
    value20 = 25
    if not (value19 < 25) then
      value4 = value12[value20]
    end
    value20 = 28
    if not (value19 < 28) then
      event = value12[value20]
    end
    values = packResults
    unpackResults2 = unpackResults
    resultCount2 = value12.n
    values = values(value13(value14, value15, value16, unpackResults2(value12, 1, resultCount2)))
    value12 = values
    value19 = values.n
    value20 = 30
    if not (value19 < 30) then
      value4 = value12[value20]
    end
    value20 = 33
    if not (value19 < 33) then
      event = value12[value20]
    end
    value19 = unpackResults
    resultCount = value12.n
    bindableEvent(value19(value12, 1, resultCount))
  end
  environment.task.wait()
  length = environment.getconnections(value2.ChildAdded)[1]
  value9 = length.Thread
  if value9 ~= value[1] then
    value9 = true
  else
    value9 = false
  end
  if value9 then
    reportResult(false, "getconnections", "Invalid thread fetched from the connection[1]")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  callback[1] = false
  value3[1]()
  if options.printcheckpoints then
    checkpointLogger("getconnections-4")
  end
  environment.task.wait(options.delaybetweentests)
  environment.getconnections(value2.ChildAdded)[1].Function()
  if not callback[1] then
    reportResult(false, "getconnections", "Failed to trigger the connection by calling its function")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  if options.printcheckpoints then
    checkpointLogger("getconnections-5")
  end
  environment.task.wait(options.delaybetweentests)
  game2 = environment.game.Players.LocalPlayer.Idled
  value9 = environment.getconnections(game2)[1]
  if not value9 then
    reportResult(false, "getconnections", "Failed to find a C-Connection (Idled)")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  if options.printcheckpoints then
    checkpointLogger("getconnections-6")
  end
  environment.task.wait(options.delaybetweentests)
  item = value9.LuaConnection
  if item == true then
    item = true
  else
    item = false
  end
  if item then
    reportResult(false, "getconnections", "Returned true for a non-LuaConnection[1]")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  if value9.Function then
    reportResult(false, "getconnections", "Returned a function for a non-LuaConnection[1]")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  if value9.Thread then
    reportResult(false, "getconnections", "Returned a thread for a non-LuaConnection[1]")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  value3[1]()
  environment.task.wait()
  if options.printcheckpoints then
    checkpointLogger("getconnections-7")
  end
  if not environment.getconnections(value2.ChildAdded)[1].LuaConnection then
    reportResult(false, "getconnections", "Returned false for a valid LuaConnection")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  if not environment.getconnections(environment.game.Players.LocalPlayer.Backpack.ChildAdded)[1].ForeignState then
    reportResult(false, "getconnections", "Returned false for a ForeignState")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  if options.printcheckpoints then
    checkpointLogger("getconnections-8")
  end
  value4 = environment.workspace["I AM SUNC_0"].SurfaceGui.Part
  value5 = value4.CFrame
  event = environment.getconnections(value4.Touched)[1]
  game2 = event.LuaConnection
  value8 = false
  if game2 == false then
    game2 = true
  else
    game2 = false
  end
  if game2 then
    value8 = reportResult
    value8(false, "getconnections", "Returned false for a LuaConnection[2]")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  if not event.Function then
    value8 = reportResult
    value6 = "Did not return a function for a LuaConnection[2]"
    value8(false, "getconnections", "Did not return a function for a LuaConnection[2]")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  if not event.Thread then
    reportResult(false, "getconnections", "Did not return a thread for a LuaConnection[2]")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  environment2 = environment
  game2 = environment2.game.ReplicatedStorage.videos
  event:Disable()
  values = {}
  values[1] = event
  values[1] = false
  value8 = value4.Touched
  item = values
  bindableEvent = value8.Connect
  value13 = value8
  value9 = values
  do
    local value32
    value32 = value9
    
    function item(argument)
      value32[1] = true
      return
    end
  end
  bindableEvent = bindableEvent(value13, item)
  value8 = bindableEvent
  item = 85
  repeat
    environment.task.wait()
    item = item - 1
    value7 = environment.game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    environment2 = environment
    value = environment2.CFrame.new
    length = 0.5
    bindableEvent = value(0, 2, 0.5)
    value7 = value7 * bindableEvent
    value4.CFrame = value7
    value7 = true
    value6 = value9[1]
    if value6 == true then
      value6 = true
    else
      value6 = false
    end
    if not value6 then
      value7 = 0
      if item <= 0 then
        value6 = true
      else
        value6 = false
      end
    end
  until value6
  if not value9[1] then
    warningLogger(false, "getconnections", "Timed out waiting for a connection callback")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  environment.task.wait()
  value4.CFrame = value5
  environment.task.wait()
  if not game2.Archivable then
    reportResult(false, "getconnections", "Connection was triggered after being disabled")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  game2.Archivable = true
  event:Enable()
  value8:Disconnect()
  if options.printcheckpoints then
    checkpointLogger("getconnections-8.5")
  end
  environment.task.wait()
  value6 = environment.workspace["I AM SUNC_0"].SurfaceGui.Part
  value7 = value6.CFrame
  callback = environment.getconnections(value6.Touched)[1]
  environment2 = environment
  value = environment2.game.ReplicatedStorage.videos
  event = callback
  value10 = callback.Enable
  bindableEvent = value10
  value10(callback)
  value10 = 85
  repeat
    environment.task.wait()
    value10 = value10 - 1
    length = environment.game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    environment2 = environment
    value3 = environment2.CFrame.new
    argument = 2
    bindableEvent = value3(0, 2, 0.5)
    length = length * bindableEvent
    value6.CFrame = length
    event = value.Archivable
    length = false
    if event == false then
      event = true
    else
      event = false
    end
    if not event then
      length = 0
      if value10 <= 0 then
        event = true
      else
        event = false
      end
    end
  until event
  environment.task.wait()
  value6.CFrame = value7
  environment.task.wait()
  if value.Archivable then
    warningLogger(false, "getconnections", "Failed to enable back a connection after disabling")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  value.Archivable = true
  environment.task.wait()
  callback:Enable()
  if options.printcheckpoints then
    checkpointLogger("getconnections-9")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  environment.task.wait()
  bindableEvent = environment.Instance.new("Folder")
  length = bindableEvent.ChildAdded
  value4 = length
  length = length.Connect
  
  function value3(argument, argument2)
    if argument == "\001HELL\bO\002" then
      argument2 = false
    else
      argument2 = true
    end
    if not argument2 then
      return
    end
    reportResult(false, "getconnections", "First argument did not match when triggering :Fire")
    if not failureMap.getconnections then
      return
    end
    failureFlag[1] = true
    return
  end
  
  length(value4, value3)
  length = environment.getconnections(bindableEvent.ChildAdded)[1]
  length:Fire("\001HELL\bO\002")
  length = environment.game.Players.LocalPlayer.OnTeleport
  length:Connect(checkpointLogger)
  value4 = environment.getconnections(environment.game.Players.LocalPlayer.OnTeleport)[1].Function
  value3 = checkpointLogger
  if value4 ~= value3 then
    value4 = true
  else
    value4 = false
  end
  if value4 then
    value3 = reportResult
    argument = "getconnections"
    value3(false, "getconnections", "Failed to retrieve a function from a connection made by the current thread")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  environment.task.wait()
  value4 = environment.Instance.new("Folder")
  value3 = captured7()
  value2 = false
  values = {}
  values[1] = argument
  argument = values
  values[1] = false
  bindableEvent = environment.task.spawn
  do
    local value33, value34, value35 = nil, value2, value4
    value33 = value4
    value34 = value3
    value35 = argument
    
    function value6(argument)
      local childAdded = value33.ChildAdded
      local childAdded2 = childAdded
      local once = childAdded.Once
      
      local function callback(argument, argument2)
        argument2 = value34
        if argument ~= argument2 then
          argument2 = false
        else
          argument2 = true
        end
        if not argument2 then
          return
        end
        local condition = not value35[1]
        value35[1] = condition
        return
      end
      
      once(childAdded2, callback)
      return
    end
  end
  value2 = bindableEvent(value6)
  environment.task.wait()
  value5 = environment.getconnections(value4.ChildAdded)[1].Thread
  if value5 ~= value2 then
    value5 = true
  else
    value5 = false
  end
  if value5 then
    reportResult(false, "getconnections", "Invalid thread fetched from the connection[2]")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  value5 = environment.getconnections(value4.ChildAdded)[1]
  value5:Fire(value3)
  environment.task.wait()
  value5 = argument[1]
  if value5 ~= true then
    value5 = true
  else
    value5 = false
  end
  if value5 then
    reportResult(false, "getconnections", "Failed to fire a :Once connection[1]")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  value6 = environment.getconnections
  value = "ChildAdded"
  callback = value4.ChildAdded
  value5 = #value6(callback)
  value6 = 0
  if value5 > 0 then
    value5 = true
  else
    value5 = false
  end
  if value5 then
    value6 = reportResult
    callback = false
    value = "getconnections"
    value6(false, "getconnections", "Connection shouldn't exist after firing once")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  bindableEvent = environment.pcall
  do
    local value36, value37 = nil, value3
    value36 = value4
    value37 = value3
    
    function callback(argument)
      local item = environment.getconnections(value36.ChildAdded)[1]
      item:Fire(value37)
      return
    end
  end
  bindableEvent(callback)
  environment.task.wait()
  value5 = environment.Instance.new("Folder")
  bindableEvent = captured7()
  value6 = bindableEvent
  values = {}
  values[1] = value
  values[1] = false
  callback = value5.ChildAdded
  argument = values
  value = callback
  callback = callback.Once
  bindableEvent = callback
  value13 = value
  value = values
  do
    local value38, value39 = nil, value3
    value38 = value6
    value39 = value
    
    function argument(argument, argument2)
      argument2 = value38
      if argument ~= argument2 then
        argument2 = false
      else
        argument2 = true
      end
      if not argument2 then
        return
      end
      local condition = not value39[1]
      value39[1] = condition
      return
    end
  end
  bindableEvent(value13, argument)
  environment2 = environment
  argument = environment2.getconnections
  value = value5.ChildAdded
  bindableEvent = argument(value)
  callback = bindableEvent[1]
  value3 = captured7
  value6 = 30
  bindableEvent = value3(30, 99)
  value = bindableEvent
  value2 = 1
  argument = 1 - 1
  while true do
    argument = argument + value2
    if not (value >= argument) then
      break
    end
    do
      local value40
      value40 = value5
      
      function value6(argument)
        local item = environment.getconnections(value40.ChildAdded)[1]
        local foreignState = item.ForeignState
        local enabled = item.Enabled
        local luaConnection = item.LuaConnection
        local foreignState2 = item.ForeignState
        return
      end
    end
    value6()
  end
  argument = callback.LuaConnection
  argument = not argument
  if argument then
    reportResult(false, "getconnections", "Returned false for a LuaConnection on :Once")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  argument = callback.ForeignState
  if argument then
    reportResult(false, "getconnections", "Returned true for a non-ForeignState on :Once")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  argument = callback.Disconnect
  argument(callback)
  environment2 = environment
  value = environment2.task
  value = value.wait
  value()
  value = "Enabled"
  argument = callback.Enabled
  if argument then
    reportResult(false, "getconnections", "`Enabled` returned true for a disconnected connection")
    argument = failureMap
    value = "getconnections"
    if argument.getconnections then
      failureFlag[1] = true
    end
  end
  values = {}
  values[1] = value
  value = values
  values[1] = false
  environment2 = environment
  value2 = environment2.Instance
  value2 = value2.new
  bindableEvent = value2("Folder")
  argument = bindableEvent
  environment2 = environment
  value4 = environment2.task
  value4 = value4.spawn
  bindableEvent = value4
  do
    local value41, value42 = nil, value
    value41 = argument
    value42 = value
    
    function value3(argument)
      local childAdded = value41.ChildAdded
      childAdded:Wait()
      value42[1] = true
      return
    end
  end
  bindableEvent = bindableEvent(value3)
  value2 = bindableEvent
  value5 = captured7
  callback = 30
  bindableEvent = value5(30, 99)
  value3 = bindableEvent
  value6 = 1
  value4 = 1 - 1
  while true do
    value4 = value4 + value6
    if not (value3 >= value4) then
      break
    end
    do
      local value43, value44, value45, value46 = nil, value, argument, callback
      value43 = argument
      
      function callback(argument)
        local item = environment.getconnections(value43.ChildAdded)[1]
        local foreignState = item.ForeignState
        local enabled = item.Enabled
        local luaConnection = item.LuaConnection
        local foreignState2 = item.ForeignState
        if not item.LuaConnection then
          reportResult(false, "getconnections", "Returned false for LuaConnection on a :Wait connection")
          if failureMap.getconnections then
            failureFlag[1] = true
          end
        end
        if item.ForeignState then
          reportResult(false, "getconnections", "Returned true for ForeignState on a :Wait connection")
          if failureMap.getconnections then
            failureFlag[1] = true
          end
        end
        if item.Thread then
          return
        end
        reportResult(false, "getconnections", "Failed to retrieve a thread from a :Wait connection")
        if not failureMap.getconnections then
          return
        end
        failureFlag[1] = true
        return
      end
    end
    callback()
  end
  environment2 = environment
  value3 = environment2.getconnections
  value6 = argument.ChildAdded
  bindableEvent = value3(value6)
  value4 = bindableEvent[1]
  value3 = value4.Disable
  value3(value4)
  environment2 = environment
  value6 = environment2.task
  value6 = value6.wait
  bindableEvent = value6
  value6()
  value3 = value4.LuaConnection
  value3 = not value3
  if value3 then
    value6 = reportResult
    bindableEvent = value6
    value6(false, "getconnections", "Returned false for LuaConnection on a :Wait connection")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  value3 = value4.ForeignState
  if value3 then
    value6 = reportResult
    bindableEvent = value6
    value6(false, "getconnections", "Returned true for ForeignState on a :Wait connection")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  value3 = value4.Function
  if value3 then
    bindableEvent = environment.type(value4.Function)
    value3 = bindableEvent
    if bindableEvent ~= "function" then
      value3 = true
    else
      value3 = false
    end
  end
  if value3 then
    reportResult(false, "getconnections", "The Function field was not a function on a :Wait connection")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  value3 = value4.Thread
  value3 = not value3
  if value3 then
    reportResult(false, "getconnections", "Failed to retrieve a thread from a :Wait connection")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  value3 = value4.Thread
  if value3 then
    value3 = value4.Thread
    if value3 ~= value2 then
      value3 = true
    else
      value3 = false
    end
  end
  if value3 then
    reportResult(false, "getconnections", "Retrieved the wrong thread from a :Wait connection")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  environment2 = environment
  value6 = environment2.Instance
  value6 = value6.new
  value6("BodyVelocity", argument)
  environment2 = environment
  value6 = environment2.task
  value6 = value6.wait
  value6()
  value3 = value[1]
  if value3 then
    reportResult(false, "getconnections", "Was able to trigger the :Wait connection while being disabled")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  value[1] = false
  value3 = value4.Enable
  value3(value4)
  environment2 = environment
  value6 = environment2.Instance
  value6 = value6.new
  value6("Part", argument)
  environment2 = environment
  value6 = environment2.task
  value6 = value6.wait
  value6()
  value3 = value[1]
  value3 = not value3
  if value3 then
    reportResult(false, "getconnections", "Wasn't able to trigger the :Wait connection while being enabled, after disabling")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  value3 = value4.Enabled
  if value3 == true then
    value3 = true
  else
    value3 = false
  end
  if value3 then
    reportResult(false, "getconnections", "Returned true for 'Enabled' after triggering a :Wait connection")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  environment2 = environment
  value6 = environment2.Instance
  value6 = value6.new
  bindableEvent = value6("Folder")
  value3 = bindableEvent
  values = {}
  values[1] = "new"
  values[1] = false
  value6 = bindableEvent.ChildAdded
  value5 = values
  event = value6
  value6 = value6.Connect
  bindableEvent = value6
  value13 = event
  event = values
  do
    local value47
    value47 = event
    
    function value5(argument)
      if not environment.pcall(environment.getfenv, 3) then
        return
      end
      value47[1] = true
      return
    end
  end
  bindableEvent(value13, value5)
  environment2 = environment
  value5 = environment2.getconnections
  callback = value3.ChildAdded
  bindableEvent = value5(callback)
  value6 = bindableEvent[1]
  value5 = event
  event = value6
  value6 = value6.Fire
  bindableEvent = value6
  value6(event)
  value6 = value5[1]
  if value6 then
    bindableEvent = reportResult
    callback = false
    value5 = "getconnections"
    bindableEvent(false, "getconnections", "Found the caller in the callstack when using :Fire()")
    if failureMap.getconnections then
      failureFlag[1] = true
    end
  end
  value6 = options
  value6 = value6.printcheckpoints
  if value6 then
    value5 = checkpointLogger
    callback = "getconnections-10"
    value5("getconnections-10")
  end
  value6 = options
  value6 = value6.delaybetweentests
  if value6 then
    value6 = options.delaybetweentests
    value5 = 0
    if value6 > 0 then
      value6 = true
    else
      value6 = false
    end
  end
  if not value6 then
    value5 = environment.pcall
    
    function callback(argument)
      environment.getconnections(environment.game.Players.LocalPlayer.Kill)
      environment.getconnections(environment.game.Close)
      environment.getconnections(environment.game.Players.LocalPlayer.OnTeleportInternal)
      return
    end
    
    value5(callback)
    return
  end
  environment2 = environment
  value5 = environment2.task
  value5 = value5.wait
  callback = options
  callback = callback.delaybetweentests
  value5(callback)
  environment2 = environment
  value5 = environment2.pcall
  
  function callback(argument)
    environment.getconnections(environment.game.Players.LocalPlayer.Kill)
    environment.getconnections(environment.game.Close)
    environment.getconnections(environment.game.Players.LocalPlayer.OnTeleportInternal)
    return
  end
  
  value5(callback)
  return
end
