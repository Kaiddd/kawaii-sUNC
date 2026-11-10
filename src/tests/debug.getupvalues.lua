local reportResult, captured2, failureFlag, environment
reportResult, captured2, failureFlag, environment = ...
return function(argument)
  local length
  if not environment.getsenv then
    reportResult(false, "debug.getupvalues", "getsenv is needed in order to test")
    if captured2["debug.getupvalues"] then
      failureFlag[1] = true
    end
  end
  local onFreeFall2 = environment.getsenv(environment.game.Players.LocalPlayer.Character.Animate).onFreeFall
  length = #environment.debug.getupvalues(onFreeFall2)
  if length == 3 then
    length = false
  else
    length = true
  end
  if not length then
    return
  end
  reportResult(false, "debug.getupvalues", "Invalid upvalue count")
  if not captured2["debug.getupvalues"] then
    return
  end
  failureFlag[1] = true
  return
end
