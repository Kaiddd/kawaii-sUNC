local reportResult, checkpointLogger, environment
reportResult, checkpointLogger, environment = ...
return function(argument)
  local value7, value8, callback5, value10, value11, environment2
  local part = environment.Instance.new("Part")
  local part2 = part
  environment.setscriptable(part, "siz", true)
  local xpcall2 = environment.xpcall
  do
    local part22, value16
    part22 = part2
    
    function callback5(argument)
      local siz2 = part22.siz
      reportResult(false, "setscriptable", "Shouldn't be able to access siz")
      return
    end
  end
  local value = callback5
  
  local function callback(argument, argument2, argument3)
    checkpointLogger(argument, argument2)
    return
  end
  
  xpcall2(value, callback)
  argument = environment.Instance.new("Part")
  value7 = 25
  environment2 = environment
  callback5 = environment2.setscriptable
  value10 = callback5
  value11 = argument
  value8 = "formFactorRaw"
  callback5(argument, "formFactorRaw", true)
  repeat
    environment.task.wait(0.25)
    value7 = value7 - 1
    environment2 = environment
    local isscriptable2 = environment2.isscriptable
    local value6 = argument
    value8 = "formFactorRaw"
    value10 = isscriptable2(argument, "formFactorRaw")
    callback5 = value10
    if not value10 then
      callback5 = 0
      if value7 <= 0 then
        callback5 = true
      else
        callback5 = false
      end
    end
  until callback5
  callback5 = 0
  if value7 <= 0 then
    callback5 = true
  else
    callback5 = false
  end
  if not callback5 then
    local xpcall4 = environment.xpcall
    do
      local value17
      value17 = argument
      
      function value8(argument)
        local tostringResult
        tostringResult = environment.tostring(value17.formFactorRaw)
        argument = tostringResult
        if tostringResult == "Enum.FormFactor.Brick" then
          argument = false
        else
          argument = true
        end
        if argument then
          local errorResult = environment.error("")
          return
        end
        return
      end
    end
    local value4 = value8
    
    local function callback4(argument, argument2, argument3)
      checkpointLogger(argument, argument2)
      reportResult(false, "setscriptable", "Wasn't able to index a hidden property after setting scriptable")
      return
    end
    
    xpcall4(value4, callback4)
    local part4 = environment.Instance.new("Part")
    local part42 = part4
    environment.setscriptable(part4, "formFactorRaw", false)
    value8 = environment.xpcall
    local value5 = value8
    do
      local part422, value18
      part422 = part42
      
      function value8(argument)
        local formFactorRaw2 = part422.formFactorRaw
        reportResult(false, "setscriptable", "Was able to index a hidden property after setting scriptable")
        return
      end
    end
    
    function argument(argument)
      return
    end
    
    value5(value8, argument)
    return
  end
  local reportResult2 = reportResult
  value8 = false
  reportResult2(false, "setscriptable", "Couldn't determine whether the property was set scriptable (Timed out)")
  local xpcall3 = environment.xpcall
  do
    local value19
    value19 = argument
    
    function value8(argument)
      local tostringResult
      tostringResult = environment.tostring(value19.formFactorRaw)
      argument = tostringResult
      if tostringResult == "Enum.FormFactor.Brick" then
        argument = false
      else
        argument = true
      end
      if argument then
        local errorResult = environment.error("")
        return
      end
      return
    end
  end
  local value2 = value8
  
  local function callback2(argument, argument2, argument3)
    checkpointLogger(argument, argument2)
    reportResult(false, "setscriptable", "Wasn't able to index a hidden property after setting scriptable")
    return
  end
  
  xpcall3(value2, callback2)
  local part3 = environment.Instance.new("Part")
  local part32 = part3
  environment.setscriptable(part3, "formFactorRaw", false)
  value8 = environment.xpcall
  local value3 = value8
  do
    local part322, value20
    part322 = part32
    
    function value8(argument)
      local formFactorRaw2 = part322.formFactorRaw
      reportResult(false, "setscriptable", "Was able to index a hidden property after setting scriptable")
      return
    end
  end
  
  local function callback3(argument)
    return
  end
  
  value3(value8, callback3)
  return
end
