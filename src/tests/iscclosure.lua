local reportResult, failureMap, failureFlag, environment
reportResult, failureMap, failureFlag, environment = ...
return function(argument)
  if not environment.newcclosure then
    reportResult(false, "iscclosure", "newcclosure is needed in order to test")
    if failureMap.iscclosure then
      failureFlag[1] = true
    end
  end
  if not environment.newcclosure then
    reportResult(false, "iscclosure", "newcclosure is needed in order to test")
    if failureMap.iscclosure then
      failureFlag[1] = true
    end
  end
  local newcclosure2 = environment.newcclosure
  
  local function callback(argument)
    return
  end
  
  local newcclosure2Result = newcclosure2(callback)
  if not environment.iscclosure(newcclosure2Result) then
    reportResult(false, "iscclosure", "Failed to determine a cclosure made from 'newcclosure'")
    if failureMap.iscclosure then
      failureFlag[1] = true
    end
  end
  if not environment.iscclosure(environment.coroutine.wrap) then
    reportResult(false, "iscclosure", "Failed to determine a native cclosure")
    if failureMap.iscclosure then
      failureFlag[1] = true
    end
  end
  local iscclosure2 = environment.iscclosure
  
  local function callback2(argument)
    return
  end
  
  if not iscclosure2(callback2) then
    return
  end
  reportResult(false, "iscclosure", "Failed to determine a non-cclosure")
  if not failureMap.iscclosure then
    return
  end
  failureFlag[1] = true
  return
end
