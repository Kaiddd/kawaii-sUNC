local reportResult, originalIdentity, environment = ...

return function()
	local function readDataCostAtIdentity0()
		environment.setthreadidentity(0)
		return environment.game.DataCost
	end
	local lowSuccess, lowResult = environment.pcall(readDataCostAtIdentity0)
	if environment.typeof(lowResult) == "Instance" then
		reportResult(false, "setthreadidentity", "Should also set capabilities according to the identity[1]")
	end
	if lowSuccess and environment.string.find(lowResult, "lacking capability") then
		reportResult(false, "setthreadidentity", "Couldn't set the identity to verify capability[1]")
	end

	local function createPlayerAtIdentity6()
		environment.setthreadidentity(6)
		return environment.Instance.new("Player")
	end
	local midSuccess, midResult = environment.pcall(createPlayerAtIdentity6)
	if environment.typeof(midResult) == "Instance" then
		reportResult(false, "setthreadidentity", "Should also set capabilities according to the identity[2]")
	end
	if midSuccess and environment.string.find(midResult, "lacking capability") then
		reportResult(false, "setthreadidentity", "Couldn't set the identity to verify capability[2]")
	end

	local function createPlayerAtIdentity8()
		environment.setthreadidentity(8)
		return environment.Instance.new("Player")
	end
	local highSuccess, highResult = environment.pcall(createPlayerAtIdentity8)
	if not highSuccess then
		reportResult(false, "setthreadidentity", "Couldn't set the identity to verify capability[3]")
	elseif environment.typeof(highResult) == "Instance" and highResult.ClassName ~= "Player" then
		reportResult(false, "setthreadidentity", "Couldn't set the identity to verify capability[4]")
	end

	environment.setthreadidentity(originalIdentity)
	environment.setthreadidentity(2)
	environment.task.wait()

	local function writeGameplayPaused()
		environment.game:GetService("Players").LocalPlayer.GameplayPaused = false
	end
	if environment.pcall(writeGameplayPaused) then
		reportResult(false, "setthreadidentity", "Couldn't set the identity to verify capability[5]")
	end
	environment.setthreadidentity(originalIdentity)
	environment.task.wait()
end
