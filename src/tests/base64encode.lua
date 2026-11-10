local captured1, captured2, reportResult, environment
captured1, captured2, reportResult, environment = ...
return function(argument)
  local subResult2, base64encodeResult2
  local base64encodeResult = environment.base64encode(captured1)
  captured2[1] = base64encodeResult
  if not environment.string.find(captured2[1], "FNRTMuMTAw") then
    reportResult(false, "base64encode", "Couldn't match with expected output")
  end
  argument = #environment.base64encode(captured1)
  if argument == 534580 then
    argument = false
  else
    argument = true
  end
  if argument then
    reportResult(false, "base64encode", "Failed to encode a string with null bytes")
  end
  local value = "SSBjYW4gZWFzaWx5IGJ5cGFzc2VkIHJvYmxveCBidXQgaXQgd2lsbCBjb3N0IG1lIDUwMGskIGkgY2FuIHVzaW5nIG51bGwgY29kaW5nIGFuZCBleGUgZXhwbG9pdHMgaSBjYW50IHNheSBtb3N0IG9mIGl0IGJlY2F1c2UgdSBrbm93IGl0cyBpbGxlZ2FsIFRoaXMgZW5zdXJlcyB0aGUgWE9SIHdpbGwgbmV2ZXIgcHJvZHVjZSBPeDIwLCBjYXVzaW5nIGl0IHRvIGFsd2F5cyBqdW1wIGFuZCBieXBhc3MgdGhlIEh5cGVyaW9uIDo6IFlhcmEgOjogU2NhblN0YXRzIGNhbGwgY29tcGxldGVseS4gVGhpcyBpcyBwcm9iYWJseSB0aGUgY2xlYW5lc3Qgd2F5IHRvIGRpc2FibGUgdGhlaXIgc2Nhbm5pbmcgd2l0aG91dCBicmVha2luZyBvdGhlciBwYXJ0cyBvZiB0aGUgY29kZS4="
  base64encodeResult2 = environment.base64encode("I can easily bypassed roblox but it will cost me 500k$ i can using null coding and exe exploits i cant say most of it because u know its illegal This ensures the XOR will never produce Ox20, causing it to always jump and bypass the Hyperion :: Yara :: ScanStats call completely. This is probably the cleanest way to disable their scanning without breaking other parts of the code.")
  local value2 = base64encodeResult2
  local length = #base64encodeResult2
  local length2 = #base64encodeResult2
  local subResult = base64encodeResult2:sub(length, length2)
  subResult2 = subResult
  if subResult ~= "\n" then
    subResult2 = false
  else
    subResult2 = true
  end
  if subResult2 then
    local reportResult2 = reportResult
    subResult2 = "Found line break at the end of base64 encoded string"
    reportResult2(false, "base64encode", "Found line break at the end of base64 encoded string")
  end
  if value2 == value then
    subResult2 = false
  else
    subResult2 = true
  end
  if not subResult2 then
    return
  end
  reportResult(false, "base64encode", "Encoded output didn't match expected output")
  return
end
