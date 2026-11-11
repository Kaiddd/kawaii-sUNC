local reportResult, environment = ...

return function()
	local compressed = environment.lz4compress("t65")
	if environment.type(compressed) ~= "string" then
		reportResult(false, "lz4compress", "Didn't return a string value after compression")
	end
	if environment.string.byte(compressed) ~= 48 then
		reportResult(false, "lz4compress", "Couldn't match expected bytes with the output")
	end
end
