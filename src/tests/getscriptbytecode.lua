local reportResult, failureMap, failureFlag, environment = ...

return function()
	local characterSounds = environment.game:GetService("Players").LocalPlayer.PlayerScripts.RbxCharacterSounds
	local soundsBytecode = environment.getscriptbytecode(characterSounds)
	if environment.type(soundsBytecode) ~= "string" then
		reportResult(false, "getscriptbytecode", "Couldn't fetch the script's bytecode")
		if failureMap.getscriptbytecode then
			failureFlag[1] = true
		end
	end
	local firstByte = environment.string.byte(soundsBytecode, 1)
	if firstByte < 3 or firstByte > 10 then
		reportResult(false, "getscriptbytecode", "Didn't return the correct byte[1]")
		if failureMap.getscriptbytecode then
			failureFlag[1] = true
		end
	end
	if not environment.string.find(soundsBytecode, "terminate") then
		reportResult(false, "getscriptbytecode", "Couldn't fetch a string from the bytecode[1]")
		if failureMap.getscriptbytecode then
			failureFlag[1] = true
		end
	end

	-- The same script is checked twice
	for _ = 1, 2 do
		local bytecode = environment.getscriptbytecode(environment.workspace.replicatesigmal.Script)
		if environment.string.byte(bytecode, 1) < 3 or environment.string.byte(bytecode, 1) > 10 then
			reportResult(false, "getscriptbytecode", "Didn't return the correct byte[2]")
			if failureMap.getscriptbytecode then
				failureFlag[1] = true
			end
		end
		if not environment.string.find(bytecode, "TriggerEnded") then
			reportResult(false, "getscriptbytecode", "Couldn't fetch a string from the bytecode[2]")
			if failureMap.getscriptbytecode then
				failureFlag[1] = true
			end
		end
		if environment.string.find(bytecode, "TriggerEndedP") then
			reportResult(false, "getscriptbytecode", "Was able to retrieve an invalid string from the bytecode[1]")
			if failureMap.getscriptbytecode then
				failureFlag[1] = true
			end
		end
	end

	local container = environment.game:GetService("ReplicatedStorage")["would_you_be_a_bop_if_you_were_a_girl?"]
	local chillBytecode = environment.getscriptbytecode(container["yes? Interesting..."])
	if environment.string.byte(chillBytecode, 1) < 3 or environment.string.byte(chillBytecode, 1) > 10 then
		reportResult(false, "getscriptbytecode", "Didn't return the correct byte[3]")
		if failureMap.getscriptbytecode then
			failureFlag[1] = true
		end
	end
	if not environment.string.find(chillBytecode, "IWantToChill") then
		reportResult(false, "getscriptbytecode", "Couldn't fetch a string from the bytecode[3]")
		if failureMap.getscriptbytecode then
			failureFlag[1] = true
		end
	end
	if
		environment.string.find(chillBytecode, "IWantToChillW")
		or environment.string.find(chillBytecode, "IWantToChill ")
	then
		reportResult(false, "getscriptbytecode", "Was able to retrieve an invalid string from the bytecode[2]")
		if failureMap.getscriptbytecode then
			failureFlag[1] = true
		end
	end
end
