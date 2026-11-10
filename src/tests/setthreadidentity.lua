local reportResult, captured2, environment
reportResult, captured2, environment = ...
return function(argument)
  local typeofResult3, value9, value11, value12, typeofResult4
  local pcall2 = environment.pcall
  
  local function callback(argument)
    environment.setthreadidentity(0)
    return environment.game.DataCost
  end
  
  value11, value12 = pcall2(callback)
  local value = value11
  local value2 = value12
  local typeofResult = environment.typeof(value12)
  typeofResult3 = typeofResult
  if typeofResult ~= "Instance" then
    typeofResult3 = false
  else
    typeofResult3 = true
  end
  if typeofResult3 then
    reportResult(false, "setthreadidentity", "Should also set capabilities according to the identity[1]")
  end
  typeofResult3 = value
  if not value then
  else
    typeofResult3 = environment.string.find(value2, "lacking capability")
  end
  if typeofResult3 then
    reportResult(false, "setthreadidentity", "Couldn't set the identity to verify capability[1]")
  end
  local pcall3 = environment.pcall
  
  local function callback2(argument)
    environment.setthreadidentity(6)
    return environment.Instance.new("Player")
  end
  
  value11, value12 = pcall3(callback2)
  local value3 = value11
  local value4 = value12
  typeofResult4 = environment.typeof(value12)
  value9 = typeofResult4
  if typeofResult4 ~= "Instance" then
    value9 = false
  else
    value9 = true
  end
  if value9 then
    reportResult(false, "setthreadidentity", "Should also set capabilities according to the identity[2]")
  end
  value9 = value3
  if not value3 then
  else
    value9 = environment.string.find(value4, "lacking capability")
  end
  if value9 then
    reportResult(false, "setthreadidentity", "Couldn't set the identity to verify capability[2]")
  end
  local pcall4 = environment.pcall
  
  local function callback3(argument)
    environment.setthreadidentity(8)
    return environment.Instance.new("Player")
  end
  
  value11, value12 = pcall4(callback3)
  local value5 = value12
  value9 = not value11
  if value9 then
    reportResult(false, "setthreadidentity", "Couldn't set the identity to verify capability[3]")
  else
    local typeofResult2 = environment.typeof(value5)
    value9 = typeofResult2
    if typeofResult2 ~= "Instance" then
      value9 = false
    else
      value9 = true
    end
    if not value9 then
    else
      value9 = value5.ClassName
      if value9 == "Player" then
        value9 = false
      else
        value9 = true
      end
    end
    if value9 then
      reportResult(false, "setthreadidentity", "Couldn't set the identity to verify capability[4]")
    end
  end
  environment.setthreadidentity(captured2)
  environment.setthreadidentity(2)
  environment.task.wait()
  local pcall5 = environment.pcall
  
  local function callback4(argument)
    local game2 = environment.game
    game2:GetService("Players").LocalPlayer.GameplayPaused = false
    return
  end
  
  if not pcall5(callback4) then
    environment.setthreadidentity(captured2)
    environment.task.wait()
    return
  end
  reportResult(false, "setthreadidentity", "Couldn't set the identity to verify capability[5]")
  environment.setthreadidentity(captured2)
  environment.task.wait()
  return
end
