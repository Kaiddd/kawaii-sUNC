local reportResult, hashValidatorRef, environment = ...

return function()
	local animate = environment.game.Players.LocalPlayer.Character.Animate
	local clone = animate:Clone()
	local hash = environment.getscripthash(clone)

	local deferredHash
	environment.task.defer(function()
		deferredHash = environment.getscripthash(clone)
	end)
	repeat
		environment.task.wait()
	until deferredHash ~= nil

	if hash ~= deferredHash then
		reportResult(false, "getscripthash", "Returned different results for the same script")
	end
	if not hashValidatorRef[1](hash) then
		reportResult(false, "getscripthash", "Should return a hex representation of a SHA384 or blake2b hash")
	end

	-- The deferred callback restores the original Source.
	local originalSource = clone.Source
	clone.Source = "print('real')"
	environment.task.defer(function()
		clone.Source = originalSource
	end)
	local success, modifiedHash = environment.pcall(environment.getscripthash, clone)
	if success then
		if modifiedHash == hash then
			reportResult(false, "getscripthash", "Extra Udness Engaged \240\159\148\165\240\159\148\165")
		end
	else
		reportResult(false, "getscripthash", "Should hash the compressed and encrypted bytecode")
	end

	if not environment.pcall(environment.getscripthash, environment.game.ReplicatedStorage.Folder.Folder.Script) then
		reportResult(false, "getscripthash", "Failed to get the hash of a Script with RunContext set to Client")
	end
end
