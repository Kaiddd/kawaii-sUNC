local reportResult, environment = ...

return function()
	if environment.islclosure(environment.task.spawn) then
		reportResult(false, "islclosure", "Couldn't determine if the function is lclosure")
	end

	local function luaFunction(_) end
	if not environment.islclosure(luaFunction) then
		reportResult(false, "islclosure", "Returned false for an lclosure")
	end
end
