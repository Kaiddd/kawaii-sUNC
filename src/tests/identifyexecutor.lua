local captured1, environment
captured1, environment = ...
return function(argument)
  local identifyexecutorResult = environment.identifyexecutor()
  local captured12 = captured1
  if environment.type(identifyexecutorResult) == "string" then
    captured12(true, "identifyexecutor", "Didn't return the name as a string")
    return
  end
  captured12(false, "identifyexecutor", "Didn't return the name as a string")
  return
end
