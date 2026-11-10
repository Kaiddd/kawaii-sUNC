local reportResult, captured2, environment
reportResult, captured2, environment = ...
return function(argument)
  local values2, value3, callback, item, value5, value6, environment2
  local animate = environment.game.Players.LocalPlayer.Character.Animate
  local cloneResult = animate:Clone()
  local cloneResult2 = cloneResult
  local scripthash = environment.getscripthash(cloneResult)
  value3 = nil
  local values = {}
  values[1] = nil
  values2 = values
  values[1] = nil
  environment2 = environment
  local defer2 = environment2.task.defer
  do
    local cloneResult22, value11
    cloneResult22 = cloneResult2
    value11 = values2
    
    function callback(argument)
      local scripthash = environment.getscripthash(cloneResult22)
      value11[1] = scripthash
      return
    end
  end
  defer2(callback)
  repeat
    environment2 = environment
    environment2.task.wait()
    value3 = values2[1]
    if value3 ~= nil then
      value3 = true
    else
      value3 = false
    end
  until value3
  item = values2[1]
  if scripthash ~= item then
    value3 = true
  else
    value3 = false
  end
  if value3 then
    local reportResult2 = reportResult
    values2 = "getscripthash"
    reportResult2(false, "getscripthash", "Returned different results for the same script")
  end
  if not captured2[1](scripthash) then
    reportResult(false, "getscripthash", "Should return a hex representation of a SHA384 or blake2b hash")
  end
  local source = cloneResult2.Source
  cloneResult2.Source = "print('real')"
  local defer3 = environment.task.defer
  do
    local cloneResult23, source2 = nil, values2
    cloneResult23 = cloneResult2
    source2 = source
    
    function values2(argument)
      local cloneResult232 = cloneResult23
      local source22 = source2
      cloneResult232.Source = source22
      return
    end
  end
  defer3(values2)
  local pcall2 = environment.pcall
  local getscripthash2 = environment.getscripthash
  value5, value6 = pcall2(getscripthash2, cloneResult2)
  local value = value6
  values2 = not value5
  if not values2 then
    if value == scripthash then
      values2 = true
    else
      values2 = false
    end
    if values2 then
      reportResult(false, "getscripthash", "Extra Udness Engaged \240\159\148\165\240\159\148\165")
    end
  else
    reportResult(false, "getscripthash", "Should hash the compressed and encrypted bytecode")
  end
  local script = environment.game.ReplicatedStorage.Folder.Folder.Script
  if environment.pcall(environment.getscripthash, script) then
    return
  end
  reportResult(false, "getscripthash", "Failed to get the hash of a Script with RunContext set to Client")
  return
end
