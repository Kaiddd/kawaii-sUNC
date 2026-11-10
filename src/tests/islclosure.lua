local reportResult, environment
reportResult, environment = ...
return function(argument)
  if environment.islclosure(environment.task.spawn) then
    reportResult(false, "islclosure", "Couldn't determine if the function is lclosure")
  end
  local islclosure2 = environment.islclosure
  
  local function callback(argument)
    return
  end
  
  if islclosure2(callback) then
    return
  end
  reportResult(false, "islclosure", "Returned false for an lclosure")
  return
end
