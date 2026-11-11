local failureMap, reportResult, failureFlag, _packResults, _unpackResults, environment = ...

return function()
	local function reportFailure(message)
		reportResult(false, "getcustomasset", message)
		if failureMap.getcustomasset then
			failureFlag[1] = true
		end
	end

	-- failureMap entries are true for functions currently considered working.
	if not (failureMap.writefile and failureMap.isfile) then
		reportFailure("Can't verify due to 'writefile' or 'isfile' not working reliably")
		return
	end
	if not failureMap.base64decode then
		reportFailure("Can't verify due to 'base64decode' not working reliably")
		return
	end

	local encodedAudio = environment.game:HttpGet(
		"https://raw.githubusercontent.com/Kaiddd/kawaii-sUNC/main/src/test-dependencies/sample-audio.base64"
	)
	environment.writefile("lea.mp3", environment.base64decode(encodedAudio))
	repeat
		environment.task.wait()
	until environment.isfile("lea.mp3")

	local assetId = environment.getcustomasset("lea.mp3")
	repeat
		environment.task.wait()
	until assetId

	local sound = environment.Instance.new("Sound")
	sound.Parent = environment.workspace
	sound.SoundId = assetId
	sound.Volume = 0
	sound:Play()
	environment.task.wait(0.131)
	if sound.TimePosition == 0 then
		reportFailure("Couldn't successfully load an mp3 custom asset")
	end
end
