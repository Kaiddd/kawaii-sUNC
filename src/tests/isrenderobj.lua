local reportResult, drawing, environment = ...

return function()
	if environment.pcall(environment.isrenderobj, "Hi") and environment.isrenderobj("Hi") then
		reportResult(false, "isrenderobj", "??? What are you doing bro \240\159\152\173\240\159\152\173")
	end
	if not environment.isrenderobj(drawing) then
		reportResult(false, "isrenderobj", "Couldn't determine a rendered object")
	end
end
