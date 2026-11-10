local reportResult, captured2, failureFlag, captured4, checkpointLogger, options, packResults, unpackResults, environment
reportResult, captured2, failureFlag, captured4, checkpointLogger, options, packResults, unpackResults, environment = ...
return function(argument)
  local spawn2, value6, value7, callback, send, onClose3, result5, value10, environment2
  value6 = nil
  argument = not environment.WebSocket
  if argument then
    reportResult(false, "WebSocket.connect", "WebSocket is nil")
    local captured24 = captured2
    value6 = "WebSocket.connect"
    if captured24["WebSocket.connect"] then
      failureFlag[1] = true
    end
  end
  argument = false
  local values = {}
  values[1] = value6
  local values2 = values
  values[1] = false
  environment2 = environment
  spawn2 = environment2.task.spawn
  local value = spawn2
  do
    local value22, value23, value24, values22
    values22 = values2
    
    function argument(argument)
      local pcall3
      pcall3 = environment.pcall
      
      local function callback(argument)
        environment.WebSocket.connect("ws://")
        return
      end
      
      local result = pcall3(callback)
      argument = result
      if result then
      else
        local pcall2 = environment.pcall
        
        local function callback2(argument)
          environment.WebSocket.connect("wss://")
          return
        end
        
        argument = pcall2(callback2)
      end
      if not argument then
        values22[1] = true
        return
      end
      reportResult(false, "WebSocket.connect", "Allowed connection to an invalid server - 'ws://' ")
      if not captured2["WebSocket.connect"] then
        values22[1] = true
        return
      end
      failureFlag[1] = true
      values22[1] = true
      return
    end
  end
  value(argument)
  repeat
    environment2 = environment
    spawn2 = environment2.task.wait
    spawn2()
    argument = values2[1]
  until argument
  local values3 = {}
  values3[1] = spawn2
  local values32 = values3
  values3[1] = nil
  environment2 = environment
  local pcall2 = environment2.pcall
  do
    local value25, values322
    values322 = values32
    
    function callback(argument)
      local connect2 = environment.WebSocket.connect
      local captured42 = captured4
      local results = packResults(captured42("yF9CD19jyvNLSh+MqO/jIUI6Vmt0huQW", "vywxNXBMuYYlKWj/hoGWTCdWOQVa5Yt7"))
      local unpackResults2 = unpackResults
      local resultCount = results.n
      local connect2Result = connect2(unpackResults2(results, 1, resultCount))
      values322[1] = connect2Result
      return
    end
  end
  result5, value10 = pcall2(callback)
  local value2 = value10
  argument = not result5
  if argument then
    local reportResult3 = reportResult
    environment2 = environment
    reportResult3(false, "WebSocket.connect", "Encountered an error while trying to connect to the websocket: " .. value2 .. " " .. environment2.tostring(values32[1]))
    local captured23 = captured2
    callback = "WebSocket.connect"
    if captured23["WebSocket.connect"] then
      failureFlag[1] = true
    end
  end
  argument = 275
  repeat
    environment2 = environment
    environment2.task.wait()
    callback = 1
    argument = argument - 1
    if argument <= 0 then
      callback = true
    else
      callback = false
    end
    if not callback then
      callback = values32[1]
      if callback ~= nil then
        callback = true
      else
        callback = false
      end
    end
  until callback
  if argument <= 0 then
    callback = true
  else
    callback = false
  end
  if callback then
    callback = values32[1]
    if callback == nil then
      callback = true
    else
      callback = false
    end
  end
  if callback then
    reportResult(false, "WebSocket.connect", "Timed out while trying to connect to the websocket")
    if captured2["WebSocket.connect"] then
      failureFlag[1] = true
    end
  end
  result5 = environment.type(values32[1])
  callback = result5
  if result5 ~= "table" then
    callback = true
  else
    callback = false
  end
  if callback then
    local result4 = environment.type(values32[1])
    callback = result4
    if result4 ~= "userdata" then
      callback = true
    else
      callback = false
    end
  end
  if callback then
    reportResult(false, "WebSocket.connect", "Didn't return a valid field value[1]")
    if captured2["WebSocket.connect"] then
      failureFlag[1] = true
    end
  end
  if environment.type(values32[1]) == "userdata" then
  end
  local result = environment.type(values32[1].Send)
  callback = result
  if result ~= "function" then
    callback = true
  else
    callback = false
  end
  if callback then
    reportResult(false, "WebSocket.connect", "Didn't return the needed value[1]")
    if captured2["WebSocket.connect"] then
      failureFlag[1] = true
    end
  end
  local result2 = environment.type(values32[1].Close)
  callback = result2
  if result2 ~= "function" then
    callback = true
  else
    callback = false
  end
  if callback then
    reportResult(false, "WebSocket.connect", "Didn't return the needed value[2]")
    if captured2["WebSocket.connect"] then
      failureFlag[1] = true
    end
  end
  result5 = environment.type(values32[1].OnMessage)
  callback = result5
  if result5 ~= "table" then
    callback = true
  else
    callback = false
  end
  if callback then
    local result3 = environment.type(values32[1].OnMessage)
    callback = result3
    if result3 ~= "userdata" then
      callback = true
    else
      callback = false
    end
  end
  if callback then
    reportResult(false, "WebSocket.connect", "Didn't return a valid field value[2]")
    if captured2["WebSocket.connect"] then
      failureFlag[1] = true
    end
  end
  environment2 = environment
  local value3 = environment2.type
  local item = values32[1]
  argument = "OnClose"
  onClose3 = item.OnClose
  result5 = value3(onClose3)
  callback = result5
  value6 = "table"
  if result5 ~= "table" then
    callback = true
  else
    callback = false
  end
  if callback then
    environment2 = environment
    local value4 = environment2.type
    local item3 = values32[1]
    argument = "OnClose"
    onClose3 = item3.OnClose
    local value4Result = value4(onClose3)
    callback = value4Result
    local value5 = "userdata"
    if value4Result ~= "userdata" then
      callback = true
    else
      callback = false
    end
  end
  if callback then
    local reportResult2 = reportResult
    argument = 1
    onClose3 = false
    reportResult2(false, "WebSocket.connect", "Didn't return a valid field value[3]")
    if captured2["WebSocket.connect"] then
      failureFlag[1] = true
    end
  end
  callback = {}
  callback[1] = "\226\152\132\239\184\143\240\157\148\163\240\157\150\145\240\157\147\178\240\157\147\171\240\157\146\131\240\144\141\136\206\181\207\129\225\184\159l\240\157\148\158B\201\131\240\157\148\162r\226\157\164\239\184\143w\240\144\141\135\240\159\144\184\219\158\206\191\206\178\206\178l\206\158~g\224\175\144o\240\157\147\171ble"
  callback[2] = "\226\152\128\239\184\143\194\167n\196\177\195\167K\240\159\140\128e\240\157\144\145\196\145\206\180\240\159\146\161o\224\185\145\225\146\170\240\157\144\158#f\240\159\164\170\225\143\158u\239\191\165\226\131\157f\240\159\140\128F\240\159\142\135\226\147\148r\226\130\166u\240\157\147\137t\226\149\160\226\130\172r"
  callback[3] = "\201\139\240\157\147\1381\240\159\141\132x\226\159\176\226\132\180\226\134\175ic\226\157\134q\226\153\154uan\226\137\136\240\159\141\163d\226\148\151a\194\174yque\226\168\143\226\167\178agm\240\159\128\132ire"
  callback[4] = "Blath\206\181r\200\191\226\153\146\240\157\147\128i\207\132e\195\180\240\159\156\142wh\206\177\198\172c\194\165\201\166@#\226\130\165a\225\136\173al\226\132\184l\225\187\139\240\157\148\177\226\156\136\239\184\143"
  callback[5] = "\227\130\180\227\131\131\240\157\148\185bl\240\157\147\174\226\138\157g1\240\159\146\148\200\179\226\167\184gou\240\159\145\129k\226\128\176f\196\188\194\1612b\226\130\180\240\157\155\155\226\155\167\226\138\157\226\149\172i\209\152\209\134\240\157\144\160\206\178et"
  callback[6] = "\202\156u1l0@\206\178a\226\132\147oo\226\136\172hoos+\226\130\164\195\139\226\167\153n\226\132\162y\234\156\157she\240\157\148\145an~\196\177\226\155\167g\226\147\144ns"
  callback[7] = "bA\226\157\141mB\240\159\156\181o\226\167\141zle==\198\146an\206\148an\202\155le<\226\131\160wHi\226\156\176r\226\136\143i\226\135\148gig"
  callback[8] = "\225\131\154o\226\177\163\240\159\154\128l0#g@9gin\240\157\149\178\240\157\150\140$in\240\157\146\169|c\240\157\150\148mP\240\159\150\164oo\240\159\167\160\226\132\156y"
  callback[9] = "\236\188\144rf\240\159\146\165uf\226\130\186le\226\129\147flum@x\226\138\1573d$\206\187abo\195\182z\226\155\180led"
  callback[10] = "\226\140\155\225\155\151\240\157\148\176\240\159\143\180d@ddle\240\159\142\137f\226\132\181i\226\158\148bb\194\174\226\128\160\240\159\142\161fl\226\155\169a$\240\159\167\161bber"
  local values4 = {}
  values4[1] = onClose3
  local values42 = values4
  values4[1] = 0
  local values5 = {}
  values5[1] = argument
  local values52 = values5
  values5[1] = false
  value6 = 85
  local onMessage = values32[1].OnMessage
  local connect2 = onMessage.Connect
  local onMessage2 = onMessage
  do
    local values422, value26, values323, values522, value27, value28 = nil, values32, nil, value6, nil, nil
    values422 = values42
    value26 = callback
    values323 = values32
    values522 = values52
    
    function callback(argument, argument2)
      local item4, value2
      local value = argument
      item4 = values422[1]
      if item4 ~= 0 then
        item4 = false
      else
        item4 = true
      end
      if not item4 then
      else
        local findResult2 = environment.string.find(argument, "\224\164\168\240\159\151\191\224\164\174\224\164\184\224\165\141\224\164\164\224\165\135 \224\164\164\224\165\169\224\164\176\224\165\128 \224\164\166\194\161h\240\159\152\130\240\159\152\130\240\159\152\130")
        item4 = findResult2
      end
      if not item4 then
      else
        local findResult = environment.string.find(argument, "y0u w4nt t0 3xpr3ss s0m3th\194\161ng s\194\161m\194\161l4r \194\161n H\194\161nd\194\161")
        item4 = findResult
      end
      if item4 then
        values422[1] = 1
        return
      end
      item4 = values422[1]
      value2 = 1
      if item4 ~= 1 then
        item4 = false
      else
        item4 = true
      end
      if item4 then
        local tonumberResult = environment.tonumber(argument)
        local tonumberResult2 = tonumberResult
        value2 = tonumberResult
        if not tonumberResult then
        elseif not (tonumberResult2 >= 1) then
          value2 = false
        else
          value2 = true
        end
        if not value2 then
        elseif not (tonumberResult2 <= #value26) then
          value2 = false
        else
          value2 = true
        end
        if not value2 then
        else
          value2 = value26[tonumberResult2]
        end
        if not value2 then
          return
        end
        local item3 = values323[1]
        local item32 = item3
        local send = item3.Send
        argument = value26[tonumberResult2]
        send(item32, argument)
        values422[1] = 2
        return
      end
      item4 = values422[1]
      if item4 ~= 2 then
        item4 = false
      else
        item4 = true
      end
      if not item4 then
        return
      end
      value2 = "\208\158\208\186\208\181\208\185 \209\133\208\190\209\128\208\190\209\136\208\190"
      if argument ~= "\208\158\208\186\208\181\208\185 \209\133\208\190\209\128\208\190\209\136\208\190" then
        item4 = false
      else
        item4 = true
      end
      if item4 then
        values522[1] = true
        local item2 = values323[1]
        local item22 = item2
        item4 = item2.Close
        item4(item22)
        return
      end
      checkpointLogger("ok so then wtf did I get? idk probably", argument)
      if argument == "\208\158\208\186\208\181\208\185 \209\133\208\190\209\128\208\190\209\136\208\190" then
        item4 = false
      else
        item4 = true
      end
      if item4 then
        item4 = options.printcheckpoints
        if not item4 then
          return
        end
        checkpointLogger("uh what:", argument)
        return
      end
      if value ~= "\228\189\160\230\152\175\228\184\170\231\172\168\232\155\139" then
        item4 = false
      else
        item4 = true
      end
      if item4 then
      elseif value ~= "\227\129\149\227\130\136\227\129\134\227\129\170\227\130\137\227\128\129\227\129\138\227\129\170\227\130\137\233\173\148\230\179\149\228\189\191\227\129\132" then
        item4 = false
      else
        item4 = true
      end
      if not item4 then
        return
      end
      local item = values323[1]
      item:Close()
      return
    end
  end
  connect2(onMessage2, callback)
  value7 = 55
  local values6 = {}
  values6[1] = callback
  values6[1] = false
  local onClose = values32[1].OnClose
  onClose3 = values6
  local connect3 = onClose.Connect
  local onClose2 = onClose
  local values62 = values6
  do
    local value29
    value29 = values62
    
    function onClose3(argument)
      value29[1] = true
      return
    end
  end
  connect3(onClose2, onClose3)
  local item2 = values32[1]
  local values622 = values62
  local item22 = item2
  send = item2.Send
  local item222 = item22
  local values6222 = values622
  onClose3 = "Helloush \208\191\209\128\208\184\208\178\208\181\209\130"
  send(item222, "Helloush \208\191\209\128\208\184\208\178\208\181\209\130")
  repeat
    environment2 = environment
    onClose3 = environment2.task.wait
    onClose3(0.012)
    value6 = value6 - 1
    send = values52[1]
    if not send then
      onClose3 = 0
      if value6 <= 0 then
        send = true
      else
        send = false
      end
    end
  until send
  send = not values52[1]
  if send then
    reportResult(false, "WebSocket.connect", "Failed to receive a wanted message from the server")
    local captured22 = captured2
    onClose3 = "WebSocket.connect"
    send = captured22["WebSocket.connect"]
    if send then
      send = true
      failureFlag[1] = true
    end
  end
  repeat
    environment2 = environment
    onClose3 = environment2.task.wait
    onClose3(0.1)
    value7 = value7 - 1
    send = values6222[1]
    if not send then
      onClose3 = 0
      if value7 <= 0 then
        send = true
      else
        send = false
      end
    end
  until send
  if values6222[1] then
    return
  end
  reportResult(false, "WebSocket.connect", "Failed to retrieve a closed signal")
  if not captured2["WebSocket.connect"] then
    return
  end
  failureFlag[1] = true
  return
end
