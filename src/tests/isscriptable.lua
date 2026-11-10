local captured1, reportResult, environment
captured1, reportResult, environment = ...
return function(argument)
  if not captured1.setscriptable then
    reportResult(false, "isscriptable", "Can't test due to 'setscriptable' not working reliably")
    return
  end
  local script = environment.Instance.new("Script")
  local script2 = script
  if environment.isscriptable(script, "isPlayerScript") then
    reportResult(false, "isscriptable", "Returned true for a non-scriptable property")
  end
  environment.setscriptable(script2, "isPlayerScript", true)
  environment.task.wait()
  if environment.isscriptable(script2, "isPlayerScript") then
    environment.task.wait(0.5)
    environment.setscriptable(script2, "isPlayerScript", false)
    environment.setscriptable(script2, "isPlayerScript", false)
    return
  end
  reportResult(false, "isscriptable", "Returned false for a scriptable property")
  environment.task.wait(0.5)
  environment.setscriptable(script2, "isPlayerScript", false)
  environment.setscriptable(script2, "isPlayerScript", false)
  return
end
