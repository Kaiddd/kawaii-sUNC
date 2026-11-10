local failureMap, reportResult, failureFlag, packResults, unpackResults, environment
failureMap, reportResult, failureFlag, packResults, unpackResults, environment = ...
return function(argument)
  local writefile2, base64decode2, value, value4, environment2
  argument = failureMap.writefile
  if argument then
    argument = failureMap.isfile
  end
  if not argument then
    reportResult(false, "getcustomasset", "Can't verify due to 'writefile' or 'isfile' not working reliably")
    if not failureMap.getcustomasset then
      return
    end
    failureFlag[1] = true
    return
  end
  if not failureMap.base64decode then
    reportResult(false, "getcustomasset", "Can't verify due to 'base64decode' not working reliably")
    if not failureMap.getcustomasset then
      return
    end
    failureFlag[1] = true
    return
  end
  local game2 = environment.game
  local httpGetResult = game2:HttpGet("https://raw.githubusercontent.com/senS24th/es-unk-stuff/refs/heads/main/gitlab_just_doing_anything_ts_days/encodedBytecode")
  writefile2 = environment.writefile
  value4 = writefile2
  environment2 = environment
  base64decode2 = environment2.base64decode
  local results = packResults(base64decode2(httpGetResult))
  local unpackResults2 = unpackResults
  local resultCount = results.n
  writefile2("lea.mp3", unpackResults2(results, 1, resultCount))
  repeat
    environment.task.wait()
    environment2 = environment
    writefile2 = environment2.isfile
    value4 = writefile2("lea.mp3")
    base64decode2 = value4
  until base64decode2
  environment2 = environment
  writefile2 = environment2.getcustomasset
  value = "lea.mp3"
  local result = writefile2("lea.mp3")
  repeat
    environment2 = environment
    value = environment2.task.wait
    value()
    writefile2 = result
  until writefile2
  local sound = environment.Instance.new("Sound")
  local workspace2 = environment.workspace
  sound.Parent = workspace2
  sound.SoundId = result
  sound.Volume = 0
  sound:Play()
  environment.task.wait(0.131)
  value = sound.TimePosition
  if value == 0 then
    value = true
  else
    value = false
  end
  if not value then
    return
  end
  reportResult(false, "getcustomasset", "Couldn't successfully load an mp3 custom asset")
  if not failureMap.getcustomasset then
    return
  end
  failureFlag[1] = true
  return
end
