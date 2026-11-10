local captured1, reportResult, captured3, failureFlag, captured5, packResults, unpackResults, environment
captured1, reportResult, captured3, failureFlag, captured5, packResults, unpackResults, environment = ...
return function(argument)
  local value5, environment2
  argument = captured1["debug.getconstant"]
  if not argument then
    argument = not environment.debug.getconstant
  end
  if argument then
    reportResult(false, "debug.setconstant", "Can't test due to 'debug.getconstant' not working reliably")
    if captured3["debug.setconstant"] then
      failureFlag[1] = true
    end
  end
  argument = captured1.getsenv
  if not argument then
    argument = not environment.getsenv
  end
  if argument then
    reportResult(false, "debug.setconstant", "Can't test due to 'getsenv' not working reliably")
    if captured3["debug.setconstant"] then
      failureFlag[1] = true
    end
  end
  argument = 60
  local tostring2 = environment.tostring
  local captured52 = captured5
  local results = packResults(captured52(2000, 9101))
  local unpackResults2 = unpackResults
  local resultCount = results.n
  local tostring2Result = tostring2(unpackResults2(results, 1, resultCount))
  local tostring2Result2 = tostring2Result
  environment.workspace.FreakyBox.e["Accessory (pillow)"].Handle.CollisionGroup = tostring2Result
  local groksays2 = environment.getsenv(environment.game.Players.LocalPlayer.PlayerScripts.lefty).groksays
  environment.debug.setconstant(environment.getsenv(environment.game.Players.LocalPlayer.PlayerScripts.lefty).groksays, 1, tostring2Result)
  local getconstant2 = environment.debug.getconstant
  local getsenv2 = environment.getsenv
  environment2 = environment
  local groksays3 = getsenv2(environment2.game.Players.LocalPlayer.PlayerScripts.lefty).groksays
  value5 = 1
  local constant2 = getconstant2(groksays3, 1)
  repeat
    environment.task.wait(0.06)
    argument = argument - 1
    environment2 = environment
    value5 = environment2.workspace.FreakyBox.e["Cube.012Accessory"].Handle.CollisionGroup
    if value5 == "sillypeely" then
      value5 = true
    else
      value5 = false
    end
    if not value5 then
      if argument <= 0 then
        value5 = true
      else
        value5 = false
      end
    end
  until value5
  value5 = environment.workspace.FreakyBox.e["Cube.012Accessory"].Handle.CollisionGroup
  if value5 ~= "sillypeely" then
    value5 = true
  else
    value5 = false
  end
  if value5 then
    reportResult(false, "debug.setconstant", "Failed to set a constant and retrieve its value[1]")
    if captured3["debug.setconstant"] then
      failureFlag[1] = true
    end
  end
  local groksays2Result = groksays2()
  value5 = groksays2Result
  if groksays2Result ~= tostring2Result2 then
    value5 = true
  else
    value5 = false
  end
  if not value5 then
    if constant2 ~= tostring2Result2 then
      value5 = true
    else
      value5 = false
    end
  end
  if not value5 then
    return
  end
  reportResult(false, "debug.setconstant", "Failed to set a constant and retrieve its value[2]")
  if not captured3["debug.setconstant"] then
    return
  end
  failureFlag[1] = true
  return
end
