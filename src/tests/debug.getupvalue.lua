local reportResult, captured2, failureFlag, environment
reportResult, captured2, failureFlag, environment = ...
return function(argument)
  local tostringResult2
  if not environment.getsenv then
    reportResult(false, "debug.getupvalue", "getsenv is needed in order to test")
    if captured2["debug.getupvalue"] then
      failureFlag[1] = true
    end
  end
  local onFreeFall2 = environment.getsenv(environment.game.Players.LocalPlayer.Character.Animate).onFreeFall
  local upvalue = environment.debug.getupvalue(onFreeFall2, 2)
  local tostringResult = environment.tostring(upvalue)
  tostringResult2 = tostringResult
  if tostringResult == "Humanoid" then
    tostringResult2 = false
  else
    tostringResult2 = true
  end
  if not tostringResult2 then
    return
  end
  reportResult(false, "debug.getupvalue", "Couldn't retrieve an upvalue from the script's function")
  if not captured2["debug.getupvalue"] then
    return
  end
  failureFlag[1] = true
  return
end
