local captured1, reportResult, failureMap, failureFlag, environment
captured1, reportResult, failureMap, failureFlag, environment = ...
return function(argument)
  local condition
  argument = captured1.cloneref
  if argument then
  else
    argument = not environment.cloneref
  end
  if argument then
    reportResult(false, "compareinstances", "Can't verify due to cloneref not working reliably")
    if failureMap.compareinstances then
      failureFlag[1] = true
    end
  end
  local clonerefResult = environment.cloneref(environment.game)
  local clonerefResult2 = clonerefResult
  local clonerefResult3 = environment.cloneref(clonerefResult.workspace)
  if not environment.compareinstances(clonerefResult, environment.game) then
    reportResult(false, "compareinstances", "Compared instances cloned with cloneref should be the same under 'compareinstances' ")
    if failureMap.compareinstances then
      failureFlag[1] = true
    end
  end
  if not environment.compareinstances(clonerefResult2, environment.workspace.Parent) then
    reportResult(false, "compareinstances", "Couldn't retrieve the correct value for compareinstances[1]")
    if failureMap.compareinstances then
      failureFlag[1] = true
    end
  end
  condition = not environment.compareinstances(clonerefResult2, clonerefResult3.Parent)
  if condition then
  else
    condition = not environment.compareinstances(environment.workspace, clonerefResult3)
  end
  if condition then
    reportResult(false, "compareinstances", "Couldn't retrieve the correct value for compareinstances[2]")
    if failureMap.compareinstances then
      failureFlag[1] = true
    end
  end
  local part = environment.Instance.new("Part")
  local part2 = part
  local cloneResult = part:Clone()
  if not environment.compareinstances(part2, cloneResult) then
    return
  end
  reportResult(false, "compareinstances", "Cloned instances shouldn't equal")
  if not failureMap.compareinstances then
    return
  end
  failureFlag[1] = true
  return
end
