local reportResult, failureMap, failureFlag, environment
reportResult, failureMap, failureFlag, environment = ...
return function(argument)
  local hiddenproperty2
  environment.task.wait()
  local fire = environment.Instance.new("Fire")
  local fire2 = fire
  local head = environment.game.Players.LocalPlayer.Character.Head
  fire.Parent = head
  environment.task.wait(0.075)
  environment.sethiddenproperty(fire, "size_xml", 1)
  environment.task.wait(0.02)
  local hiddenproperty = environment.gethiddenproperty(fire, "size_xml")
  hiddenproperty2 = hiddenproperty
  if hiddenproperty ~= 1 then
    hiddenproperty2 = false
  else
    hiddenproperty2 = true
  end
  if hiddenproperty2 then
    hiddenproperty2 = head.Fire.Size
    if hiddenproperty2 == 1 then
      hiddenproperty2 = false
    else
      hiddenproperty2 = true
    end
    if not hiddenproperty2 then
      fire2:Destroy()
      return
    end
    reportResult(false, "sethiddenproperty", "Actual size isn't matching with 'gethiddenproperty' ")
    if not failureMap.sethiddenproperty then
      fire2:Destroy()
      return
    end
    failureFlag[1] = true
    fire2:Destroy()
    return
  end
  reportResult(false, "sethiddenproperty", "Couldn't identify changed hidden property through 'gethiddenproperty' ")
  if not failureMap.sethiddenproperty then
    fire2:Destroy()
    return
  end
  failureFlag[1] = true
  fire2:Destroy()
  return
end
