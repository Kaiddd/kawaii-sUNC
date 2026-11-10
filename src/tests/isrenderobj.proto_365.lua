local reportResult, captured2, environment
reportResult, captured2, environment = ...
return function(argument)
  if environment.pcall(environment.isrenderobj, "Hi") then
    if environment.isrenderobj("Hi") then
      reportResult(false, "isrenderobj", "??? What are you doing bro \240\159\152\173\240\159\152\173")
    end
  end
  if environment.isrenderobj(captured2) then
    return
  end
  reportResult(false, "isrenderobj", "Couldn't determine a rendered object")
  return
end
