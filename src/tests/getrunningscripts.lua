local reportResult, failureMap, failureFlag, _packResults, _unpackResults, environment = ...

local function fail(message)
	reportResult(false, "getrunningscripts", message)
	if failureMap.getrunningscripts then
		failureFlag[1] = true
	end
end

return function()
	local seen = {}
	local hasDuplicate = false
	for _, script in environment.pairs(environment.getrunningscripts()) do
		if seen[script] then
			hasDuplicate = true
			break
		end
		seen[script] = true
	end
	if hasDuplicate then
		fail("Shouldn't return duplicates")
	end

	local foundActorScript = false
	for _, script in environment.pairs(environment.getrunningscripts()) do
		if script == environment.game:GetService("ReplicatedFirst").bleepbloop.suncinit then
			foundActorScript = true
			break
		end
	end
	if foundActorScript then
		fail("Shouldn't return scripts initialized in an actor state")
	end

	local foundFinishedScript = false
	for _, script in environment.pairs(environment.getrunningscripts()) do
		if script == environment.game.Players.LocalPlayer.PlayerScripts.boidontbemean then
			foundFinishedScript = true
			break
		end
	end
	if foundFinishedScript then
		fail("Fetched a script with a thread that's no longer running")
	end

	local foundFakeActorScript = false
	for _, script in environment.pairs(environment.getrunningscripts()) do
		if script == environment.game:GetService("ReplicatedFirst")["Wow?"] then
			foundFakeActorScript = true
		end
	end
	environment.task.wait()
	if not foundFakeActorScript then
		fail("Couldn't return a running script parented to a fake actor")
	end

	local foundClientScript = false
	for _, script in environment.pairs(environment.getrunningscripts()) do
		if script == environment.game.ReplicatedStorage.Scurry.FakeGrimReaper.respect.Script then
			foundClientScript = true
		end
	end
	if not foundClientScript then
		fail("Was unable to find a running 'Script' with 'Client' RunContext")
	end

	local foundNilParentedScript = false
	for _, script in environment.pairs(environment.getrunningscripts()) do
		if script.Name == "ANG3LJ0RDAN" then
			foundNilParentedScript = true
		end
	end
	if not foundNilParentedScript then
		fail("Was unable to find a running script parented to nil")
	end

	local foundScriptWithoutGlobal = false
	for _, script in environment.pairs(environment.getrunningscripts()) do
		if script and script.Name:find("seebau") then
			local name = script.Name
			local folder = environment.game:GetService("ReplicatedStorage").Folder.Folder.Folder.Folder.Folder.Folder
			if name == "seebau" .. folder["is this my life?..."].Value then
				foundScriptWithoutGlobal = true
			end
		end
	end
	if not foundScriptWithoutGlobal then
		fail("Was unable to find a running script with its script global set to nil")
	end
end
