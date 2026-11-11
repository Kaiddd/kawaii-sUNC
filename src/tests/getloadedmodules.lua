local reportResult, failureMap, failureFlag, checkpointLogger, _packResults, _unpackResults, environment = ...

return function()
	local function reportFailure(message)
		reportResult(false, "getloadedmodules", message)
		if failureMap.getloadedmodules then
			failureFlag[1] = true
		end
	end

	if not environment.require then
		reportFailure("require is needed in order to test")
	end

	-- seenModules is never populated (same as the original), so this check never fires.
	local seenModules = {}
	local hasDuplicate = false
	for _, module in environment.pairs(environment.getloadedmodules()) do
		if seenModules[module] then
			hasDuplicate = true
			break
		end
	end
	if hasDuplicate then
		reportFailure("Shouldn't return duplicates")
	end
	checkpointLogger("CP1")

	local foundReplicatedFirstModule = false
	local foundPlayerScriptsModule = false
	for _, module in environment.pairs(environment.getloadedmodules()) do
		if module == environment.game:GetService("ReplicatedFirst").bleepbloop["getting rich like this is a hobby"] then
			foundReplicatedFirstModule = true
		end
		if
			module
			== environment.game.Players.LocalPlayer.PlayerScripts["Pull off in a Tonka, yeah, this a big body"]
		then
			foundPlayerScriptsModule = true
		end
	end
	checkpointLogger("CP2")
	if not foundReplicatedFirstModule and foundPlayerScriptsModule then
		reportFailure("Aaaand we're ud ash \240\159\146\148\240\159\146\148\240\159\165\128\240\159\165\128")
	end

	for _, module in environment.pairs(environment.getloadedmodules()) do
		if
			module == environment.game.Players.LocalPlayer.PlayerScripts.ModuleScripka
			or module == environment.game.StarterPlayer.StarterPlayerScripts.ModuleScripka
		then
			reportFailure("Returned an unloaded module")
		end
	end
	checkpointLogger("CP3")

	local requiredModuleWorks = false
	for _, module in environment.pairs(environment.getloadedmodules()) do
		if module.Name == "scriptsomemodulesrn" and module.ClassName == "ModuleScript" then
			if environment.require(module)({ RIP = 95 }) == 9 then
				requiredModuleWorks = true
			end
		end
	end
	checkpointLogger("CP4")
	environment.task.wait()
	if not requiredModuleWorks then
		reportFailure("Couldn't find a loaded module[1]")
	end

	local foundReplicatedStorageModule = false
	for _, module in environment.pairs(environment.getloadedmodules()) do
		if
			module
			== environment.game.ReplicatedStorage["would_you_be_a_bop_if_you_were_a_girl?"]["yes? Interesting..."]
		then
			foundReplicatedStorageModule = true
		end
	end
	checkpointLogger("CP5")
	if not foundReplicatedStorageModule then
		reportFailure("Couldn't find a loaded module[2]")
	end
end
