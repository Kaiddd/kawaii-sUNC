local reportResult, failureMap, failureFlag, _packResults, _unpackResults, environment = ...

local function fail(...)
	reportResult(false, "getscriptfromthread", ...)
	if failureMap.getscriptfromthread then
		failureFlag[1] = true
	end
end

return function()
	local marker = environment.game.ReplicatedStorage:WaitForChild('"degloved" *speed shocked gif*')
	-- The attribute holds tostring() of the target thread; replace it with the thread found in the registry.
	local targetThread = marker:GetAttribute("goatis_vs_spaghetti_stood_no_chance")

	-- Generalized iteration over getreg(): a table result is walked with next.
	local iterate, state, key = environment.getreg()
	if environment.type(iterate) == "table" then
		iterate, state, key = environment.next, iterate, nil
	end
	while true do
		local nextKey, value = iterate(state, key)
		if nextKey == nil then
			break
		end
		key = nextKey
		if environment.tostring(value) == targetThread then
			targetThread = value
		end
	end

	if
		not environment.getscriptfromthread(targetThread)
		or environment.getscriptfromthread(targetThread).ClassName ~= "Script"
	then
		fail("Retrieved an invalid object: ", environment.getscriptfromthread(targetThread))
	end

	local scriptName = environment.getscriptfromthread(targetThread).Name
	local folder = environment.game:GetService("ReplicatedStorage").Folder.Folder.Folder.Folder.Folder.Folder
	if scriptName ~= "seebau" .. folder["is this my life?..."].Value then
		fail("Failed to retrieve a destroyed script instance with its `Script` global set to junk.")
	end
end
