local reportResult, environment
reportResult, environment = ...
return function(argument)
  local result2
  local lz4compressResult = environment.lz4compress("t65")
  local lz4compressResult2 = lz4compressResult
  local result = environment.type(lz4compressResult)
  result2 = result
  if result == "string" then
    result2 = false
  else
    result2 = true
  end
  if result2 then
    reportResult(false, "lz4compress", "Didn't return a string value after compression")
  end
  local byteResult = environment.string.byte(lz4compressResult2)
  result2 = byteResult
  if byteResult == 48 then
    result2 = false
  else
    result2 = true
  end
  if not result2 then
    return
  end
  reportResult(false, "lz4compress", "Couldn't match expected bytes with the output")
  return
end
