local sampleAudio, encodedResult, reportResult, environment = ...

return function()
	encodedResult[1] = environment.base64encode(sampleAudio)
	if not environment.string.find(encodedResult[1], "FNRTMuMTAw") then
		reportResult(false, "base64encode", "Couldn't match with expected output")
	end

	if #environment.base64encode(sampleAudio) ~= 534580 then
		reportResult(false, "base64encode", "Failed to encode a string with null bytes")
	end

	local encoded = environment.base64encode(
		"I can easily bypassed roblox but it will cost me 500k$ i can using null coding and exe exploits i cant say most of it because u know its illegal This ensures the XOR will never produce Ox20, causing it to always jump and bypass the Hyperion :: Yara :: ScanStats call completely. This is probably the cleanest way to disable their scanning without breaking other parts of the code."
	)
	if encoded:sub(#encoded, #encoded) == "\n" then
		reportResult(false, "base64encode", "Found line break at the end of base64 encoded string")
	end
	if
		encoded
		~= "SSBjYW4gZWFzaWx5IGJ5cGFzc2VkIHJvYmxveCBidXQgaXQgd2lsbCBjb3N0IG1lIDUwMGskIGkgY2FuIHVzaW5nIG51bGwgY29kaW5nIGFuZCBleGUgZXhwbG9pdHMgaSBjYW50IHNheSBtb3N0IG9mIGl0IGJlY2F1c2UgdSBrbm93IGl0cyBpbGxlZ2FsIFRoaXMgZW5zdXJlcyB0aGUgWE9SIHdpbGwgbmV2ZXIgcHJvZHVjZSBPeDIwLCBjYXVzaW5nIGl0IHRvIGFsd2F5cyBqdW1wIGFuZCBieXBhc3MgdGhlIEh5cGVyaW9uIDo6IFlhcmEgOjogU2NhblN0YXRzIGNhbGwgY29tcGxldGVseS4gVGhpcyBpcyBwcm9iYWJseSB0aGUgY2xlYW5lc3Qgd2F5IHRvIGRpc2FibGUgdGhlaXIgc2Nhbm5pbmcgd2l0aG91dCBicmVha2luZyBvdGhlciBwYXJ0cyBvZiB0aGUgY29kZS4="
	then
		reportResult(false, "base64encode", "Encoded output didn't match expected output")
	end
end
