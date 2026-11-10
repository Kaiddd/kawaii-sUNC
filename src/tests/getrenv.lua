local reportResult, failureMap, failureFlag, captured4, warningLogger, captured6, captured7, environment
reportResult, failureMap, failureFlag, captured4, warningLogger, captured6, captured7, environment = ...
return function(argument)
  local value7, captured42, tostringResult2, value8, value9, value11, value12, pairs3, value13, value62, tostring2, value52, result3, value18, value19, environment2, value23
  argument = 0
  value7 = false
  if not environment.getrenv()._G then
    reportResult(false, "getrenv", "Missing _G key")
    if failureMap.getrenv then
      failureFlag[1] = true
    end
  end
  local pairs2 = environment.pairs
  local _G2 = environment.getrenv()._G
  result3, value18, value19 = pairs2(_G2)
  value9 = result3
  local value = result3
  local value2 = value18
  value8 = value19
  while true do
    result3, value18 = value(value2, value8)
    value8 = result3
    value9 = nil
    if result3 == nil then
      value9 = true
    else
      value9 = false
    end
    if value9 then
      break
    end
    value9 = 1
    argument = argument + 1
  end
  if argument ~= 963 then
    value9 = true
  else
    value9 = false
  end
  if value9 then
    reportResult(false, "getrenv", "Wrong _G count")
    value7 = true
    if failureMap.getrenv then
      failureFlag[1] = true
    end
  end
  
  local function callback(argument)
    local captured4Result, renv, environment2
    captured4Result = captured4(120, 450)
    local value = captured4Result
    local value2 = 1
    argument = 120 - 1
    while true do
      argument = argument + value2
      if not (value >= argument) then
        return
      end
      local value3 = environment.getrenv()["\213\169\234\167\133\234\157\154"]
      local value4 = environment.getrenv()[" \234\153\174\234\167\133 "]
      local value5 = environment.getrenv()["\234\167\133 \225\147\154\225\152\143\225\151\162\234\167\133 "]
      local value6 = environment.getrenv()["\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133"]
      local dockWidget = environment.getrenv().DockWidget
      local item = environment.getrenv()[environment.string.rep("lI", 90)]
      local value7 = environment.getrenv()["\213\169\234\167\133\234\157\154"]
      local value8 = environment.getrenv()[" \234\153\174\234\167\133 "]
      local value9 = environment.getrenv()["\234\167\133 \225\147\154\225\152\143\225\151\162\234\167\133 "]
      local value10 = environment.getrenv()["\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133"]
      local dockWidget2 = environment.getrenv().DockWidget
      local item2 = environment.getrenv()[environment.string.rep("lI", 90)]
      local value11 = environment.getrenv()["\213\169\234\167\133\234\157\154"]
      local value12 = environment.getrenv()[" \234\153\174\234\167\133 "]
      local value13 = environment.getrenv()["\234\167\133 \225\147\154\225\152\143\225\151\162\234\167\133 "]
      local value14 = environment.getrenv()["\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133"]
      local dockWidget3 = environment.getrenv().DockWidget
      local item3 = environment.getrenv()[environment.string.rep("lI", 90)]
      local value15 = environment.getrenv()["\213\169\234\167\133\234\157\154"]
      local value16 = environment.getrenv()[" \234\153\174\234\167\133 "]
      local value17 = environment.getrenv()["\234\167\133 \225\147\154\225\152\143\225\151\162\234\167\133 "]
      local value18 = environment.getrenv()["\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133"]
      local dockWidget4 = environment.getrenv().DockWidget
      renv = environment.getrenv()
      environment2 = environment
      captured4Result = environment2.string.rep("lI", 90)
      local item4 = renv[captured4Result]
    end
  end
  
  local delay2 = environment.task.delay
  captured42 = captured4
  local result = captured42(0.1, 0.4)
  do
    local value25
    value25 = callback
    
    function captured42(argument)
      environment.task.spawn(value25)
      value25()
      return
    end
  end
  delay2(result, captured42)
  callback()
  local fenv = environment.getfenv(environment.getrenv().warn)
  local fenv2 = environment.getfenv(environment.getgenv().warn)
  captured42 = environment.getfenv
  local result2 = captured42(warningLogger)
  callback()
  if fenv == nil then
    captured42 = true
  else
    captured42 = false
  end
  if not captured42 then
    if fenv2 == nil then
      captured42 = true
    else
      captured42 = false
    end
  end
  if not captured42 then
    if result2 == nil then
      captured42 = true
    else
      captured42 = false
    end
  end
  if not captured42 then
    if fenv ~= fenv2 then
      captured42 = true
    else
      captured42 = false
    end
    if not captured42 then
      if fenv2 ~= result2 then
        captured42 = true
      else
        captured42 = false
      end
    end
    if not captured42 then
      if fenv ~= result2 then
        captured42 = true
      else
        captured42 = false
      end
    else
    end
  end
  if not captured42 then
    captured42 = environment.getrenv().warn
    if captured42 == nil then
      captured42 = true
    else
      captured42 = false
    end
  end
  if not captured42 then
    captured42 = environment.getrenv().print
    if captured42 == nil then
      captured42 = true
    else
      captured42 = false
    end
  end
  if captured42 then
    reportResult(false, "getrenv", "Let it go bro, please... \240\159\146\148\240\159\146\148\240\159\146\148 32 halalitos 3\204\182\204\134\204\133\204\139\204\131\205\132\205\157\205\130\205\138\205\145\204\133\204\133\204\145\204\131\205\128\204\138\204\144\204\128\204\135\204\128\204\155\204\132\204\147\204\139\204\129\205\145\204\138\204\145\204\191\205\141\205\153\204\178\204\171\204\169\204\185\205\153\204\188\205\147\204\187\204\175\204\176\204\170\205\136\204\159\204\1692\204\180\205\128\205\155\204\134\204\128\204\137\205\156 \204\181\204\155\204\148\205\130\204\145\204\143\204\189\205\134\204\189\205\140\205\139\204\191\205\145\205\130\204\141\205\139\204\139\204\129\204\138\204\142\204\128\205\160\205\132\204\128\205\131\205\138\204\152\204\174\204\188\204\169\204\164\204\152\204\166\205\153\204\159\204\151\204\164\204\172\204\168\204\178\204\175\205\136\205\136\204\179\204\170\205\135\205\156\204\157\205\133\204\150\204\167\204\165\205\154\204\152\205\149\204\169\205\150\204\186\205\150h\204\183\205\144\205\130\204\131\205\155\205\134\205\157\204\140\204\134\204\139\204\144\204\131\205\151\205\131\204\144\204\132\204\130\205\157\204\141\204\149\205\132\205\157\205\131\204\137\204\154\205\129\205\130\205\140\204\139\204\190\204\147\204\144\204\172\204\153\204\157\204\151\205\141\205\142\204\173\204\152\204\187\205\148\204\159\204\186\204\174\204\153\204\187\204\164\204\170\205\149\204\179\204\168\204\177\204\178\204\162\204\156\205\147\204\163\204\178a\204\184\204\142\205\129\204\149\204\155\205\132\205\130\204\148\204\154\204\143\204\136\205\128\205\132\205\132\204\190\204\128\205\140\204\149\204\155\204\133\205\145\204\129\205\138\204\143\204\142\204\155\205\149\204\168\204\152\205\150\204\160l\204\180\204\140\204\141\205\132\204\129\204\138\204\128\204\145\204\158\205\156\204\169\204\173\204\188\204\166\204\188\204\170\204\151\204\177\204\157\205\135\204\158\205\141\204\158\204\151\205\148\204\168\204\156\205\141\204\188\205\149\204\158\205\141\205\133\205\136\205\136\204\151\204\176\204\165\204\169\204\159\204\165\204\178\204\163\205\137\204\174\205\133a\204\182\204\147\204\142\204\155\205\130\204\149\205\152\204\142\204\140\205\138\204\149\204\129\205\130\204\135\205\157\204\133\205\157\205\129\205\144\205\151\204\140\205\131\204\140\204\130\204\135\205\139\205\152\204\189\205\129\204\141\204\191\205\128\205\134\204\138\204\143\204\134\205\151\204\129\204\129\205\138\204\143\204\131\204\141\204\190\205\152\204\140\205\134\204\155\204\174\204\171\205\156\204\153\204\179\205\141\204\157\205\141\204\166\204\158\204\174\204\162\205\137\204\173\204\165\204\185\204\157\204\157\204\178\205\142\204\173l\204\182\205\144\205\155\204\154\205\129\205\132\204\141\205\160\204\191\205\134\204\133\204\133\204\140\205\139\204\140\205\139\205\128\204\139\204\139\204\148\205\145\204\134\205\138\204\146\204\138\204\135\204\144\204\149\205\139\204\128\204\134\204\129\205\139\205\131\205\145\204\132\204\128\204\144\204\133\204\141\204\131\204\185\204\172\204\153\204\166\204\175\204\159\205\135\204\157\205\156\204\163\205\148\204\153\204\163\205\148\204\170\205\137\205\133\204\178\204\178\204\179\204\158\204\179i\204\180\204\191\204\143\204\138\204\141\204\135\205\138\204\133\205\138\204\128\204\131\204\189\204\155\205\157\205\152\205\155\204\136\204\129\205\134\205\152\205\139\205\151\205\138\204\133\205\152\204\190\204\189\204\189\204\130\205\144\204\133\205\146\204\136\204\129\205\139\204\143\205\146\205\138\204\133\205\132\205\129\204\155\205\145\205\145\204\134\205\130\204\145\204\190\205\140\204\165\205\136\204\166\204\179\204\168\205\154\204\177\205\156\205\156\205\149\204\173\204\156\204\187\204\164\204\167\205\154\204\161\204\163\204\185\205\150\204\185\204\166\204\188\204\188\204\163\205\142\204\153\205\133\204\167\205\137\204\166\204\170\204\188\204\174\205\149\204\177\204\158\204\175\205\148\204\156\205\150\204\173\204\159\205\136\204\160\205\135t\204\180\204\138\205\152\204\131\205\138\204\190\205\155\204\191\204\132\204\135\204\147\204\139\204\148\205\160\204\144\204\190\204\135\204\130\205\145\205\132\205\128\204\138\205\145\204\133\205\145\204\137\204\130\205\132\204\135\204\134\205\132\204\133\204\134\205\130\204\145\205\131\205\131\205\141\204\170\205\136\205\147\204\169\204\179\204\185\205\153\204\153\205\149\204\153\204\171\204\176\205\147\205\147\204\165\204\171\204\178\204\169\205\148\204\158\205\150\204\185\204\157\204\188\204\159\204\152\205\150\205\137\204\170o\204\180\204\141\205\140\205\146\205\145\205\139\205\144\204\130\204\154\205\129\204\155\205\160\205\157\204\131\205\151\204\138\205\146\204\129\204\145\205\129\205\151\204\129\204\154\205\160\204\179s\204\184\205\157\204\143\205\132\204\128\204\146\204\133\204\132\205\134\205\144\204\128\205\129\204\141\204\138\205\160\204\171\204\169\205\141\204\173\205\149\204\179\204\152\204\153\204\187\205\148\204\158")
    if failureMap.getrenv then
      failureFlag[1] = true
    end
  end
  callback()
  local renv = environment.getrenv()
  local tostringResult = environment.tostring(environment.getrenv()._G)
  tostringResult2 = tostringResult
  if tostringResult ~= environment.game.workspace.FreakyBox.e.Head.CollisionGroup then
    tostringResult2 = true
  else
    tostringResult2 = false
  end
  if not tostringResult2 then
    tostringResult2 = environment.getrenv()._G["g\208\181m"]
    if tostringResult2 ~= "\226\128\158" then
      tostringResult2 = true
    else
      tostringResult2 = false
    end
    if tostringResult2 then
      reportResult(false, "getrenv", "REAL _G moment \240\159\145\145\240\159\140\185[2]")
      if failureMap.getrenv then
        failureFlag[1] = true
      end
    end
  else
    reportResult(false, "getrenv", "REAL _G moment \240\159\145\145\240\159\140\185[1]")
    if failureMap.getrenv then
      failureFlag[1] = true
    end
  end
  if not environment.getrenv().shared["ok\208\181m"] then
    reportResult(false, "getrenv", "Failed to find a .shared value")
    if failureMap.getrenv then
      failureFlag[1] = true
    end
  end
  tostringResult2 = environment.getrenv().shared.wow
  if tostringResult2 then
    tostringResult2 = environment.getrenv().shared.wow
    if tostringResult2 == ",m" then
      tostringResult2 = true
    else
      tostringResult2 = false
    end
  end
  if tostringResult2 then
    reportResult(false, "getrenv", "Shouldn't push values across different VMs")
    if failureMap.getrenv then
      failureFlag[1] = true
    end
  end
  tostringResult2 = false
  value8 = "\n"
  environment2 = environment
  pairs3 = environment2.pairs
  local captured62 = captured6
  result3, value18, value19 = pairs3(captured62)
  local value3 = result3
  local value4 = value18
  value11 = value19
  value12 = value19
  while true do
    result3, value18 = value3(value4, value12)
    value12 = result3
    local value5 = value18
    pairs3 = nil
    if result3 == nil then
      pairs3 = true
    else
      pairs3 = false
    end
    if pairs3 then
      break
    end
    value52 = value5
    pairs3 = renv[value5.name]
    value11 = pairs3
    if pairs3 then
      local typeofResult3 = environment.typeof(pairs3)
      value11 = typeofResult3
      if typeofResult3 == value52.expected then
        value11 = true
      else
        value11 = false
      end
    end
    local name2 = value52.name
    local typeofResult = environment.typeof(pairs3)
    environment2 = environment
    tostring2 = environment2.tostring
    value18 = pairs3
    result3 = tostring2(pairs3)
    local value6 = typeofResult .. " : " .. result3
    value62 = value6
    value13 = name2 .. " -> " .. value6
    if not value11 then
      local expected2 = value52.expected
      environment2 = environment
      local typeofResult2 = environment2.typeof(pairs3)
      tostring2 = " ] "
      value13 = value13 .. "[ MISMATCH. type should be " .. expected2 .. ", got: " .. typeofResult2 .. " ] "
      local reportResult2 = reportResult
      result3 = reportResult2
      value18 = false
      reportResult2(false, "getrenv", "Value/type mismatch")
      if failureMap.getrenv then
        failureFlag[1] = true
      end
      tostringResult2 = true
    end
    value62 = "\n"
    value23 = value8 .. value13 .. "\n"
    value8 = value23
  end
  pairs3 = tostringResult2
  if tostringResult2 then
    local captured73 = captured7
    local formatResult2 = environment.string.format("\r\n\r\n\t\t\t\t\t\tThe value or types of members inside getrenv() returned a mismatch. The executor likely fakes their getrenv.\r\n\t\t\t\t\t\t\r\n\t\t\t\t\t\tgetrenv() output:\r\n\r\n\t\t\t\t\t\t%s\r\n\t\t\t\t\t\t\r\n\t\t\t\t\t", value8)
    captured73.getrenv = formatResult2
  end
  if not value7 then
    return
  end
  local captured72 = captured7
  local formatResult = environment.string.format("\r\n\t\t\t\t\t\r\n\t\t\t\t\t\tThe member count of getrenv()._G mismatched.\r\n\t\t\t\t\t\t\r\n\t\t\t\t\t\tExpected count: 963\r\n\r\n\t\t\t\t\t\tRetrieved count: %s\r\n\r\n\t\t\t\t\t", argument)
  captured72.getrenv = formatResult
  return
end
