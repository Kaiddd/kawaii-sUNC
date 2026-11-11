local reportResult, failureMap, failureFlag, environment = ...

local function fail(message)
	reportResult(false, "firetouchinterest", message)
	if failureMap.firetouchinterest then
		failureFlag[1] = true
	end
end

return function()
	local part = environment.Instance.new("Part")
	part.Name = "LOEALOEA"
	part.Parent = environment.workspace
	part.Anchored = true
	part.CFrame = environment.CFrame.new(0, -555, 0)

	local remainingTicks = 55
	local characterPosition = environment.game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position

	local touched = false
	local touchedByCharacter = false
	part.Touched:Connect(function(hit, _)
		touched = true
		if
			environment.typeof(hit) == "Instance"
			and hit:IsDescendantOf(environment.game.Players.LocalPlayer.character)
		then
			touchedByCharacter = true
		end
	end)

	-- The part must not have been moved next to the character.
	local function checkDistance()
		if (characterPosition - part.CFrame.Position).Magnitude <= 30 then
			fail("In the BIG 25 \240\159\165\128\240\159\153\143")
		end
	end

	environment.firetouchinterest(environment.game.Players.LocalPlayer.character.HumanoidRootPart, part, 1)
	checkDistance()
	environment.firetouchinterest(environment.game.Players.LocalPlayer.character.HumanoidRootPart, part, 0)
	checkDistance()

	repeat
		environment.task.wait()
		remainingTicks -= 1
	until touched or remainingTicks <= 0

	checkDistance()
	if not touched then
		fail("Couldn't trigger the touch signal")
	end
	if not touchedByCharacter then
		fail("Wasn't able to determine the correct firing part")
	end

	part:Destroy()
end
