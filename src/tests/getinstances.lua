local reportResult, failureMap, failureFlag, environment
reportResult, failureMap, failureFlag, environment = ...
return function(argument)
  local pairs2, value8, value10, value11, value12, value14, value15, value16, environment2
  argument = environment.Instance.new("Part")
  local instances = environment.getinstances()
  local instances2 = instances
  argument.Name = "."
  environment.task.wait(0.08)
  value8 = false
  pairs2 = environment.pairs
  value14, value15, value16 = pairs2(instances)
  local value = value14
  local value2 = value15
  value10 = value16
  while true do
    value14, value15 = value(value2, value10)
    value10 = value14
    value11 = value15
    value12 = nil
    if value14 == nil then
      value12 = true
    else
      value12 = false
    end
    if value12 then
      break
    end
    if value11 == argument then
      pairs2 = true
    else
      pairs2 = false
    end
    if pairs2 then
      value8 = true
    end
  end
  value11 = argument
  argument:Destroy()
  if not value8 then
    local reportResult2 = reportResult
    argument = false
    reportResult2(false, "getinstances", "Failed to fetch an instance outside of 'game' ")
    if failureMap.getinstances then
      failureFlag[1] = true
    end
  end
  pairs2 = false
  environment2 = environment
  value11 = environment2.pairs
  value14, value15, value16 = value11(instances2)
  local value3 = value14
  local value4 = value15
  value10 = value16
  while true do
    value14, value15 = value3(value4, value10)
    value10 = value14
    local value5 = value15
    value12 = nil
    if value14 == nil then
      value12 = true
    else
      value12 = false
    end
    if value12 then
      break
    end
    value11 = value5.Name
    environment2 = environment
    argument = environment2.game.Players.LocalPlayer.Name
    if value11 == argument then
      value11 = true
    else
      value11 = false
    end
    if value11 then
      pairs2 = true
    end
  end
  if not pairs2 then
    reportResult(false, "getinstances", "Couldn't fetch the needed value")
    if failureMap.getinstances then
      failureFlag[1] = true
    end
  end
  value11 = #environment.getinstances()
  local game2 = environment.game
  if value11 == #game2:GetDescendants() then
    value11 = true
  else
    value11 = false
  end
  if not value11 then
    return
  end
  reportResult(false, "getinstances", "Invalid count. `getinstances` should not be `game:GetDescendants()`")
  if not failureMap.getinstances then
    return
  end
  failureFlag[1] = true
  return
end
