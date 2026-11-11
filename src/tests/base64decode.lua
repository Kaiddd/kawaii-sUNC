local encodedSampleAudio, decodedResult, reportResult, environment = ...

return function()
	decodedResult[1] = environment.base64decode(encodedSampleAudio)
	if not environment.string.find(decodedResult[1], "compatible_brands") then
		reportResult(false, "base64decode", "Couldn't find the needed value inside the output")
	end
end
