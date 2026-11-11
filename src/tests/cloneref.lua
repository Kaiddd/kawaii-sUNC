local reportResult, failureMap, failureFlag, _packResults, _unpackResults, hostFactories, environment = ...

return function()
	if not environment.compareinstances then
		reportResult(false, "cloneref", "compareinstances is needed in order to test")
		if failureMap.cloneref then
			failureFlag[1] = true
		end
	end

	environment.Instance.new("Folder", environment.workspace).Name = "lol"
	environment.task.wait()
	if not environment.cloneref(environment.game).workspace:FindFirstChild("lol") then
		reportResult(false, "cloneref", "Couldn't retrieve an existing member of the reference")
		if failureMap.cloneref then
			failureFlag[1] = true
		end
	end
	environment.workspace.lol:Destroy()

	local typeReference = environment.cloneref(environment.game)
	if
		environment.typeof(typeReference) ~= environment.typeof(environment.game)
		or environment.type(typeReference) ~= environment.type(environment.game)
	then
		reportResult(false, "cloneref", "Reference should have the same type as the original")
		if failureMap.cloneref then
			failureFlag[1] = true
		end
	end

	local reference = environment.cloneref(environment.game)
	if reference == environment.game then
		reportResult(false, "cloneref", "The reference should be different compared to the original")
		if failureMap.cloneref then
			failureFlag[1] = true
		end
	end
	if environment.rawequal(reference, environment.game) then
		reportResult(false, "cloneref", "The reference should not be the same under rawequal")
		if failureMap.cloneref then
			failureFlag[1] = true
		end
	elseif
		environment.rawequal({}, {})
		or environment.rawequal(environment.newproxy(true), {})
		or environment.rawequal(environment.newproxy(false), environment.newproxy(true))
		or environment.rawequal(environment.newproxy(), environment.newproxy())
	then
		-- rawequal itself treats distinct values as equal
		reportResult(false, "cloneref", "The reference should not be the same under rawequal")
		if failureMap.cloneref then
			failureFlag[1] = true
		end
	end

	local gameReference = environment.cloneref(environment.game)
	local workspaceReference = environment.cloneref(gameReference.workspace)
	if environment.compareinstances(gameReference, workspaceReference) then
		reportResult(false, "cloneref", "compareinstances approved invalid references")
		if failureMap.cloneref then
			failureFlag[1] = true
		end
	end
	if gameReference == workspaceReference or workspaceReference.Parent == gameReference then
		reportResult(false, "cloneref", "Invalid references should not equal[1]")
		if failureMap.cloneref then
			failureFlag[1] = true
		end
	end
	if
		environment.rawequal(gameReference, workspaceReference)
		or environment.rawequal(gameReference, workspaceReference.Parent)
	then
		reportResult(false, "cloneref", "Invalid references should not equal[2]")
		if failureMap.cloneref then
			failureFlag[1] = true
		end
	end

	-- The game sets tsatsatsatsa.Massless to true when it detects cloneref usage
	if environment.workspace.tsatsatsatsa.Massless == true then
		local remaining = 488
		repeat
			environment.task.wait()
			remaining -= 1
		until environment.workspace.tsatsatsatsa.Massless == false or remaining <= 0
		if environment.workspace.tsatsatsatsa.Massless == true then
			reportResult(false, "cloneref", "Failed to use cloneref without being detected.")
			if failureMap.cloneref then
				failureFlag[1] = true
			end
		end
	end

	-- The host closure stores cloneref(workspace.Somethingiok) into cloneHolder[1]
	local cloneHolder = {}
	hostFactories[1]({ cloneHolder })()
	local remaining = 300
	repeat
		environment.task.wait()
		remaining -= 1
	until environment.workspace.tsatsatsatsa.Massless == true or remaining <= 0
	if environment.workspace.tsatsatsatsa.Massless == true then
		reportResult(false, "cloneref", "Failed to use cloneref without being detected")
		if failureMap.cloneref then
			failureFlag[1] = true
		end
	end
	cloneHolder[1] = nil
	environment.workspace.tsatsatsatsa.Massless = false
end
