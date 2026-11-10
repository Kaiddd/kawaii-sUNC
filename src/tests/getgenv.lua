local reportResult, failureMap, failureFlag, captured4, environment
reportResult, failureMap, failureFlag, captured4, environment = ...
return function(argument)
  local captured42, value6, result, environment2
  environment.getgenv().kingvonisud = 123
  environment.kingvonisud = nil
  argument = environment.kingvonisud
  if argument == nil then
    argument = true
  else
    argument = false
  end
  if argument then
    reportResult(false, "getgenv", "Global environment is not shared properly")
    if failureMap.getgenv then
      failureFlag[1] = true
    end
  end
  environment.getgenv().ok = "nice"
  environment.getgenv().ok = nil
  environment2 = environment
  argument = environment2.ok
  if not argument then
    environment2 = environment
    argument = environment2.getgenv().ok
  end
  if argument then
    reportResult(false, "getgenv", "Global environment is not shared properly[2]")
    if failureMap.getgenv then
      failureFlag[1] = true
    end
  end
  captured42 = captured4
  result = captured42(232, 477)
  local value = result
  local value2 = 1
  
  local function callback(argument)
    return
  end
  
  argument = 1 - 1
  while true do
    argument = argument + value2
    if not (value >= argument) then
      break
    end
    result = captured4(1, 10)
    captured42 = result
    value6 = 1
    if result == 1 then
      captured42 = true
    else
      captured42 = false
    end
    if not captured42 then
      environment2 = environment
      value6 = environment2.getfenv
      result = value6
      captured42 = 0
      value6(0)
    else
      environment2 = environment
      value6 = environment2.getfenv
      result = value6
      captured42 = callback
      value6(callback)
    end
  end
  environment.getfenv(0).df = "hi"
  environment.getfenv(1).df = "hi"
  environment.getfenv(environment.getgenv).df = "hi"
  argument = environment.getgenv().df
  if argument == "hi" then
    argument = true
  else
    argument = false
  end
  if argument then
    reportResult(false, "getgenv", "The function environment of `getgenv` should not be the result of it[1]")
  end
  local fenv = environment.getfenv(environment.getgenv)
  argument = fenv
  if fenv ~= environment.getfenv() then
    argument = true
  else
    argument = false
  end
  if argument then
    reportResult(false, "getgenv", "The environment of getgenv should be the same as current")
  end
  local fenv2 = environment.getfenv(environment.getgenv)
  argument = fenv2
  if fenv2 == environment.getgenv() then
    argument = true
  else
    argument = false
  end
  if not argument then
    return
  end
  reportResult(false, "getgenv", "The function environment of `getgenv` should not be the result of it[2]")
  return
end
