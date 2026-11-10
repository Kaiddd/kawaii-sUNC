local captured1, reportResult, captured3, failureFlag, environment
captured1, reportResult, captured3, failureFlag, environment = ...
return function(argument)
  local fF3
  if captured1["cache.invalidate"] then
    reportResult(false, "cache.replace", "Can't test due to cache.invalidate not working reliably")
  end
  local frame = environment.Instance.new("Frame")
  local frame2 = frame
  local workspace2 = environment.workspace
  frame.Parent = workspace2
  frame.Name = "FF"
  local part = environment.Instance.new("Part")
  local part2 = part
  part.Name = "FF2"
  local workspace3 = environment.workspace
  part.Parent = workspace3
  part.Transparency = 1
  local fF = environment.workspace.FF
  local fF2 = environment.workspace.FF2
  environment.task.wait()
  environment.cache.replace(frame2, part)
  fF3 = environment.workspace.FF
  if fF3 == part then
    fF3 = false
  else
    fF3 = true
  end
  if fF3 then
    reportResult(false, "cache.replace", "Failed to replace the instance cache with a new one")
    if captured3["cache.replace"] then
      failureFlag[1] = true
    end
  end
  fF3 = environment.workspace.FF.Transparency
  if fF3 == 1 then
    fF3 = false
  else
    fF3 = true
  end
  if fF3 then
    reportResult(false, "cache.replace", "Failed to retrieve a property from the replaced instance")
    fF3 = captured3["cache.replace"]
    if fF3 then
      fF3 = true
      failureFlag[1] = true
    end
  end
  if frame2 ~= part2 then
    fF3 = false
  else
    fF3 = true
  end
  if not fF3 then
    frame2:Destroy()
    part2:Destroy()
    return
  end
  reportResult(false, "cache.replace", "Should only replace the instance cache, not the reference")
  if not captured3["cache.replace"] then
    frame2:Destroy()
    part2:Destroy()
    return
  end
  failureFlag[1] = true
  frame2:Destroy()
  part2:Destroy()
  return
end
