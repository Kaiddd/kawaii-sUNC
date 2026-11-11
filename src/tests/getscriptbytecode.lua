local reportResult, failureMap, failureFlag, environment = ...

-- Luau bytecode starts with its format version. 3 is the oldest version the VM still loads;
-- Roblox ships version 14 as of client 2.746. Versions are small integers, so anything up to
-- 31 is accepted, while source text (printable characters start at byte 32) is not.
-- From version 4 on, the second byte is the type-information version, also a small integer.
local MIN_BYTECODE_VERSION = 3
local MAX_BYTECODE_VERSION = 31
local MAX_TYPES_VERSION = 31

local function hasBytecodeHeader(bytecode)
	local version, typesVersion = environment.string.byte(bytecode, 1, 2)
	if not version or version < MIN_BYTECODE_VERSION or version > MAX_BYTECODE_VERSION then
		return false
	end
	if version >= 4 then
		return typesVersion ~= nil and typesVersion >= 1 and typesVersion <= MAX_TYPES_VERSION
	end
	return true
end

return function()
	local characterSounds = environment.game:GetService("Players").LocalPlayer.PlayerScripts.RbxCharacterSounds
	local soundsBytecode = environment.getscriptbytecode(characterSounds)
	if environment.type(soundsBytecode) ~= "string" then
		reportResult(false, "getscriptbytecode", "Couldn't fetch the script's bytecode")
		if failureMap.getscriptbytecode then
			failureFlag[1] = true
		end
	end
	if not hasBytecodeHeader(soundsBytecode) then
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
		if not hasBytecodeHeader(bytecode) then
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
	if not hasBytecodeHeader(chillBytecode) then
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
