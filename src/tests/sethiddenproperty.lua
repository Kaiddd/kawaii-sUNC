local reportResult, failureMap, failureFlag, environment = ...

local function fail(message)
	reportResult(false, "sethiddenproperty", message)
	if failureMap.sethiddenproperty then
		failureFlag[1] = true
	end
end

return function()
	environment.task.wait()
	local fire = environment.Instance.new("Fire")
	local head = environment.game.Players.LocalPlayer.Character.Head
	fire.Parent = head
	environment.task.wait(0.075)
	environment.sethiddenproperty(fire, "size_xml", 1)
	environment.task.wait(0.02)

	if environment.gethiddenproperty(fire, "size_xml") == 1 then
		if head.Fire.Size ~= 1 then
			fail("Actual size isn't matching with 'gethiddenproperty' ")
		end
	else
		fail("Couldn't identify changed hidden property through 'gethiddenproperty' ")
	end

	fire:Destroy()
end
