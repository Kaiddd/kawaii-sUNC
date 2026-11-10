local reportResult, packResults, unpackResults, environment
reportResult, packResults, unpackResults, environment = ...
return function(argument)
  local length, lz4decompressResult2
  local lz4compressResult = environment.lz4compress("t65")
  local lz4compressResult2 = lz4compressResult
  local lz4decompressResult = environment.lz4decompress(lz4compressResult, 3)
  lz4decompressResult2 = lz4decompressResult
  if lz4decompressResult == "t65" then
    lz4decompressResult2 = false
  else
    lz4decompressResult2 = true
  end
  if lz4decompressResult2 then
    reportResult(false, "lz4decompress", "Couldn't decompress into expected string")
  end
  local byte2 = environment.string.byte
  local lz4decompress2 = environment.lz4decompress
  local results = packResults(lz4decompress2(lz4compressResult2, 3))
  local unpackResults2 = unpackResults
  local resultCount = results.n
  local byte2Result = byte2(unpackResults2(results, 1, resultCount))
  lz4decompressResult2 = byte2Result
  if byte2Result == 116 then
    lz4decompressResult2 = false
  else
    lz4decompressResult2 = true
  end
  if lz4decompressResult2 then
    reportResult(false, "lz4decompress", "Couldn't match expected bytes with the output")
  end
  local game2 = environment.game
  local httpGetResult = game2:HttpGet("https://raw.githubusercontent.com/senS24th/es-unk-stuff/refs/heads/main/gitlab_just_doing_anything_ts_days/uhhhhh")
  length = #environment.lz4compress(httpGetResult)
  if not (length >= #httpGetResult) then
    length = false
  else
    length = true
  end
  if not length then
    return
  end
  reportResult(false, "lz4compress", "Compressed output was bigger or equal to the original")
  return
end
