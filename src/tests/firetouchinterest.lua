local reportResult, failureMap, failureFlag, environment
reportResult, failureMap, failureFlag, environment = ...
return function(argument)
  local value2, value6, connect, environment2
  local part = environment.Instance.new("Part")
  local part2 = part
  part.Name = "LOEALOEA"
  local workspace2 = environment.workspace
  part.Parent = workspace2
  part.Anchored = true
  local newResult = environment.CFrame.new(0, -555, 0)
  part2.CFrame = newResult
  value2 = 55
  local position = environment.game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position
  local values = {}
  values[1] = 0
  local values2 = values
  values[1] = false
  local values3 = {}
  values3[1] = -555
  local values32 = values3
  values3[1] = false
  local touched = part2.Touched
  local touched2 = touched
  connect = touched.Connect
  local value = connect
  local touched22 = touched2
  do
    local values22, values322
    values22 = values2
    values322 = values32
    
    function connect(argument, argument2)
      values22[1] = true
      local typeofResult = environment.typeof(argument)
      argument2 = typeofResult
      if typeofResult ~= "Instance" then
        argument2 = false
      else
        argument2 = true
      end
      if not argument2 then
      else
        local value = argument
        local character2 = environment.game.Players.LocalPlayer.character
        argument2 = value:IsDescendantOf(character2)
      end
      if not argument2 then
        return
      end
      values322[1] = true
      return
    end
  end
  value(touched22, connect)
  environment.firetouchinterest(environment.game.Players.LocalPlayer.character.HumanoidRootPart, part2, 1)
  connect = (position - part2.CFrame.Position).Magnitude
  if connect <= 30 then
    connect = true
  else
    connect = false
  end
  if connect then
    reportResult(false, "firetouchinterest", "In the BIG 25 \240\159\165\128\240\159\153\143")
    if failureMap.firetouchinterest then
      failureFlag[1] = true
    end
  end
  local firetouchinterest2 = environment.firetouchinterest
  environment2 = environment
  firetouchinterest2(environment2.game.Players.LocalPlayer.character.HumanoidRootPart, part2, 0)
  connect = (position - part2.CFrame.Position).Magnitude
  value6 = 30
  if connect <= 30 then
    connect = true
  else
    connect = false
  end
  if connect then
    value6 = reportResult
    value6(false, "firetouchinterest", "In the BIG 25 \240\159\165\128\240\159\153\143")
    connect = failureMap.firetouchinterest
    if connect then
      connect = true
      failureFlag[1] = true
    end
  end
  repeat
    environment2 = environment
    value6 = environment2.task.wait
    value6()
    value2 = value2 - 1
    connect = values2[1]
    if not connect then
      value6 = 0
      if value2 <= 0 then
        connect = true
      else
        connect = false
      end
    end
  until connect
  connect = (position - part2.CFrame.Position).Magnitude
  if connect <= 30 then
    connect = true
  else
    connect = false
  end
  if connect then
    reportResult(false, "firetouchinterest", "In the BIG 25 \240\159\165\128\240\159\153\143")
    if failureMap.firetouchinterest then
      failureFlag[1] = true
    end
  end
  if not values2[1] then
    reportResult(false, "firetouchinterest", "Couldn't trigger the touch signal")
    if failureMap.firetouchinterest then
      failureFlag[1] = true
    end
  end
  if values32[1] then
    part2:Destroy()
    return
  end
  reportResult(false, "firetouchinterest", "Wasn't able to determine the correct firing part")
  if not failureMap.firetouchinterest then
    part2:Destroy()
    return
  end
  failureFlag[1] = true
  part2:Destroy()
  return
end
