local reportResult, failureMap, failureFlag, failureDetails, packResults, unpackResults, metadata, environment = ...

local function fail(message)
	reportResult(false, "getsenv", message)
	if failureMap.getsenv then
		failureFlag[1] = true
	end
end

return function()
	-- Junk value carried over from the original; only used by the (always erroring) dump loop below.
	local junkValue

	local animate = environment.game:GetService("Players").LocalPlayer.Character.Animate
	local animateEnvFailed = false

	local environments = {}
	for index = 1, 20 do
		environments[index] = environment.getsenv(animate)
	end
	for _, scriptEnvironment in environment.pairs(environments) do
		if scriptEnvironment ~= environment.getsenv(animate) then
			fail("Returned table should be static")
		end
	end

	if
		environment.getsenv(environment.game.Players.LocalPlayer.PlayerScripts.lefty).groksays
		~= environment.getsenv(environment.game.Players.LocalPlayer.PlayerScripts.lefty).groksays
	then
		fail("Boi what sigma you doing \240\159\152\130\240\159\164\148")
	end

	local animateEnv = environment.getsenv(animate)
	if environment.type(animateEnv) ~= "table" then
		fail("Didn't return a table value")
	end
	if animateEnv.script ~= animate then
		fail("Script global shouldn't differ")
		junkValue = metadata["127"][1]
	end
	if not animateEnv.onRunning then
		animateEnvFailed = true
		fail("Failed to fetch a value from the script's env[1]")
	end

	local toolAnimResults = packResults(animateEnv.getToolAnim(environment.workspace))
	if toolAnimResults.n >= 31 then
		junkValue = toolAnimResults[31]
	end
	if environment.type(unpackResults(toolAnimResults, 1, toolAnimResults.n)) ~= "nil" then
		animateEnvFailed = true
		fail("Failed to retrieve the value from the script's function")
	end

	environment.pcall(function()
		if
			environment.getsenv(
				environment.game:GetService("StarterPlayer").StarterPlayerScripts.PlayerModule.CommonUtils.FlagUtil
			)
		then
			fail("Was able to retrieve the environment of a non-running script")
		end
	end)

	local leftyEnvFailed = false
	local leftyEnv = environment.getsenv(environment.game.Players.LocalPlayer.PlayerScripts.lefty)
	if leftyEnv then
		if leftyEnv.geeked ~= "locked in" then
			leftyEnvFailed = true
			fail("Failed to fetch a value from the script's env[2]")
		end
	else
		fail("Failed to retrieve the environment of a game script")
	end

	environment.xpcall(function()
		if not environment.getsenv(environment.game.ReplicatedStorage["First I go whip out the bost"]) then
			fail("Failed to fetch the environment of a Script with script global set to nil[1]")
		end
	end, function(errorMessage)
		fail("Failed to fetch the environment of a Script with script global set to nil[2]. Error: " .. errorMessage)
	end)

	local dump = "\n"
	if animateEnvFailed then
		for key, value in environment.pairs(animateEnv) do
			environment.tostring(key)
			environment.tostring(value)
			-- Faithful to the original: arithmetic on nil, which errors unless junkValue defines __add.
			local _ = junkValue + nil
		end
		failureDetails.getsenv = environment.string.format(
			'\r\n\r\n\t\t\t\t\t\tFailed to find one or more environment members from the "Animate" script.\r\n\r\n\t\t\t\t\t\tgetsenv(animate) return:\r\n\r\n\t\t\t\t\t\t%s\r\n\r\n\r\n\t\t\t\t\t',
			dump
		)
		dump = "\n"
	end

	if not leftyEnvFailed then
		return
	end
	for key, value in environment.pairs(leftyEnv) do
		dump ..= environment.tostring(key) .. " -> " .. environment.tostring(value) .. "\n"
	end
	failureDetails.getsenv ..= environment.string.format(
		'\r\n\r\n\t\t\t\t\t\tFailed to find one or more environment members from the "lefty" script.\r\n\r\n\t\t\t\t\t\tgetsenv(lefty) return:\r\n\r\n\t\t\t\t\t\t%s\r\n\r\n\t\t\t\t\t',
		dump
	)
end
