local captured1, reportResult, captured3, checkpointLogger, packResults, unpackResults, environment
captured1, reportResult, captured3, checkpointLogger, packResults, unpackResults, environment = ...
return function(argument)
  local value4, captured32, result, environment2
  argument = captured1.getgenv
  if not argument then
    argument = not environment.getgenv
  end
  if argument then
    reportResult(false, "isexecutorclosure", "getgenv is needed in order to test")
  end
  local isexecutorclosure2 = environment.isexecutorclosure
  environment2 = environment
  local isexecutorclosure22 = isexecutorclosure2(environment2.table.concat)
  
  local function callback(argument)
    return
  end
  
  captured32 = captured3
  result = captured32(2, 5)
  local value = result
  local value2 = 1
  
  local function callback2(argument)
    if not environment.isexecutorclosure(nil) then
      return
    end
    reportResult(false, "isexecutorclosure", "Returned true for no closure")
    return
  end
  
  value4 = 1 - 1
  while true do
    value4 = value4 + value2
    if not (value >= value4) then
      break
    end
    environment.isexecutorclosure(environment.table.foreach)
    captured32 = not environment.isexecutorclosure(callback)
    if not captured32 then
      captured32 = not environment.isexecutorclosure(environment.isexecutorclosure)
    end
    if not captured32 then
      captured32 = not environment.isexecutorclosure(environment.getgenv)
    end
    if captured32 then
      reportResult(false, "isexecutorclosure", "Couldn't determine if the function is an exec-closure")
    end
    environment.pcall(callback2)
    environment2 = environment
    result = environment2.debug.info(callback, "l")
    captured32 = result
    if result == -1 then
      captured32 = true
    else
      captured32 = false
    end
    if captured32 then
      result = reportResult
      captured32 = false
      result(false, "isexecutorclosure", "The closure should not be defined at line -1")
    end
  end
  value4 = isexecutorclosure22
  if not isexecutorclosure22 then
    value4 = environment.isexecutorclosure(environment.table.foreach)
  end
  if not value4 then
    value4 = environment.isexecutorclosure(environment.pairs)
  end
  if not value4 then
    value4 = environment.isexecutorclosure(environment.table.clear)
  end
  if value4 then
    reportResult(false, "isexecutorclosure", "Returned true for a non-exec closure")
  end
  if not environment.isexecutorclosure(callback) then
    reportResult(false, "isexecutorclosure", "Couldn't determine if the function is an exec-closure")
  end
  local genv = environment.getgenv()
  local checkpointLogger2 = checkpointLogger
  genv.hello = checkpointLogger2
  if environment.isexecutorclosure(environment.getgenv().hello) then
    reportResult(false, "isexecutorclosure", "Returned true for a non-exec closure.")
  end
  environment.getgenv().hello = nil
  local isexecutorclosure3 = environment.isexecutorclosure
  local boppa = environment.game.Boppa
  local packResults2 = packResults
  local invoke = boppa.Invoke
  local packResults2Result = packResults2(invoke(boppa))
  local unpackResults2 = unpackResults
  local resultCount = packResults2Result.n
  if not isexecutorclosure3(unpackResults2(packResults2Result, 1, resultCount)) then
    return
  end
  reportResult(false, "isexecutorclosure", "bro+ are we deduzik")
  return
end
