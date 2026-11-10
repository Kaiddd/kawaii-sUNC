local options, checkpointLogger, captured3, reportResult, captured5, failureFlag, hostFactories, environment
options, checkpointLogger, captured3, reportResult, captured5, failureFlag, hostFactories, environment = ...
return function(argument)
  local value, value2, environment2
  value2 = nil
  argument = captured3.getgc
  if not argument then
    environment2 = environment
    argument = not environment2.getgc
  end
  if argument then
    local reportResult3 = reportResult
    value2 = false
    reportResult3(false, "debug.getstack", "Can't test due to 'getgc' not working reliably")
    if captured5["debug.getstack"] then
      failureFlag[1] = true
    end
  end
  local captured32 = captured3
  value = "hookfunction"
  argument = captured32.hookfunction
  if not argument then
    environment2 = environment
    argument = not environment2.hookfunction
  end
  if argument then
    local reportResult2 = reportResult
    value2 = false
    reportResult2(false, "debug.getstack", "Can't test due to 'hookfunction' not working reliably")
    local captured52 = captured5
    value = "debug.getstack"
    if captured52["debug.getstack"] then
      failureFlag[1] = true
    end
  end
  local values = {}
  values[1] = value
  local values2 = values
  values[1] = false
  local item = hostFactories[2]
  local values3 = {}
  values3[1] = values2
  local options2 = options
  values3[2] = options2
  local checkpointLogger2 = checkpointLogger
  values3[3] = checkpointLogger2
  values3[4] = value2
  local itemResult = item(values3)
  value2 = itemResult
  itemResult()
  argument = 150
  repeat
    environment2 = environment
    environment2.task.wait()
    argument = argument - 1
    value2 = values2[1]
    if value2 == true then
      value2 = true
    else
      value2 = false
    end
    if not value2 then
      if argument <= 0 then
        value2 = true
      else
        value2 = false
      end
    end
  until value2
  value2 = values2[1]
  if value2 == false then
    value2 = true
  else
    value2 = false
  end
  if not value2 then
    return
  end
  reportResult(false, "debug.getstack", "Couldn't retrieve an expected stack value from a foreign thread")
  if not captured5["debug.getstack"] then
    return
  end
  failureFlag[1] = true
  return
end
