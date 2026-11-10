local captured1, reportResult, failureMap, failureFlag, checkpointLogger, packResults, unpackResults, environment
captured1, reportResult, failureMap, failureFlag, checkpointLogger, packResults, unpackResults, environment = ...
return function(argument)
  local value2, new2, transparency2, itemResult3, environment2
  local item = captured1[1]
  environment2 = environment
  transparency2 = environment2.workspace.eeeeeeeeeeeeeeeeeeee.Transparency
  itemResult3 = item(transparency2)
  argument = itemResult3
  value2 = 0.8
  if itemResult3 == 0.8 then
    argument = true
  else
    argument = false
  end
  if not argument then
    local somestufffirst2 = environment.workspace.somestufffirst
    local cFrame = environment.workspace.somestufflast.CFrame
    somestufffirst2.CFrame = cFrame
    environment.task.wait(0.1)
    local somestufffirst3 = environment.workspace.somestufffirst
    new2 = environment.CFrame.new
    local result = new2(50, 50, 300)
    somestufffirst3.CFrame = result
    value2 = environment.fireproximityprompt
    itemResult3 = value2
    environment2 = environment
    transparency2 = environment2.workspace.gwentsotsk.Part.ProximityPrompt
    value2(transparency2)
    argument = 300
    repeat
      environment.task.wait()
      argument = argument - 1
      checkpointLogger("waiting for false", environment.workspace.eeeeeeeeeeeeeeeeeeee.Transparency)
      local item3 = captured1[1]
      environment2 = environment
      new2 = environment2.workspace.eeeeeeeeeeeeeeeeeeee.Transparency
      itemResult3 = item3(new2)
      value2 = itemResult3
      transparency2 = 0.8
      if itemResult3 == 0.8 then
        value2 = true
      else
        value2 = false
      end
      if not value2 then
        local item4 = captured1[1]
        environment2 = environment
        new2 = environment2.workspace.eeeeeeeeeeeeeeeeeeee.Transparency
        itemResult3 = item4(new2)
        value2 = itemResult3
        transparency2 = 0.4
        if itemResult3 == 0.4 then
          value2 = true
        else
          value2 = false
        end
      end
      if not value2 then
        transparency2 = 0
        if argument <= 0 then
          value2 = true
        else
          value2 = false
        end
      end
    until value2
    itemResult3 = captured1[1](environment.workspace.eeeeeeeeeeeeeeeeeeee.Transparency)
    value2 = itemResult3
    transparency2 = 0.8
    if itemResult3 ~= 0.8 then
      value2 = true
    else
      value2 = false
    end
    if value2 then
      local itemResult2 = captured1[1](environment.workspace.eeeeeeeeeeeeeeeeeeee.Transparency)
      value2 = itemResult2
      local value = 0.4
      if itemResult2 ~= 0.4 then
        value2 = true
      else
        value2 = false
      end
    end
    if value2 then
      local checkpointLogger2 = checkpointLogger
      local item2 = captured1[1]
      local transparency = environment.workspace.eeeeeeeeeeeeeeeeeeee.Transparency
      local results = packResults(item2(transparency))
      local unpackResults2 = unpackResults
      local resultCount = results.n
      checkpointLogger2(unpackResults2(results, 1, resultCount))
      reportResult(false, "fireproximityprompt", "Failed to fire a proximityprompt on the server.")
      if failureMap.fireproximityprompt then
        failureFlag[1] = true
      end
    end
    itemResult3 = captured1[1](environment.workspace.eeeeeeeeeeeeeeeeeeee.Transparency)
    value2 = itemResult3
    transparency2 = 0.4
    if itemResult3 == 0.4 then
      value2 = true
    else
      value2 = false
    end
    if value2 then
      local reportResult2 = reportResult
      local reportResult22 = reportResult2
      reportResult2(false, "fireproximityprompt", "Failed to fire a proximityprompt on the server")
      value2 = failureMap.fireproximityprompt
      if value2 then
        value2 = true
        failureFlag[1] = true
      end
    end
    if argument <= 0 then
      value2 = true
    else
      value2 = false
    end
    if value2 then
      local itemResult = captured1[1](environment.workspace.eeeeeeeeeeeeeeeeeeee.Transparency)
      value2 = itemResult
      if itemResult ~= 0.8 then
        value2 = true
      else
        value2 = false
      end
    end
    if not value2 then
      return
    end
    reportResult(false, "fireproximityprompt", "Timed out while waiting for a response from the server")
    if not failureMap.fireproximityprompt then
      return
    end
    failureFlag[1] = true
    return
  end
  reportResult(false, "fireproximityprompt", "Failed to fire a proximityprompt on the server")
  if not failureMap.fireproximityprompt then
    return
  end
  failureFlag[1] = true
  return
end
