local reportResult, _packResults, _unpackResults, environment = ...

return function()
	local compressed = environment.lz4compress("t65")
	if environment.lz4decompress(compressed, 3) ~= "t65" then
		reportResult(false, "lz4decompress", "Couldn't decompress into expected string")
	end
	if environment.string.byte(environment.lz4decompress(compressed, 3)) ~= 116 then
		reportResult(false, "lz4decompress", "Couldn't match expected bytes with the output")
	end

	local fixture = environment.game:HttpGet(
		"https://raw.githubusercontent.com/Kaiddd/kawaii-sUNC/main/src/test-dependencies/lz4-audio-fixture.bin"
	)
	if #fixture <= #environment.lz4compress(fixture) then
		reportResult(false, "lz4compress", "Compressed output was bigger or equal to the original")
	end
end
