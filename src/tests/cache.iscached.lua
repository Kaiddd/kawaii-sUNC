local captured1, reportResult, captured3, failureFlag, packResults, unpackResults, environment
captured1, reportResult, captured3, failureFlag, packResults, unpackResults, environment = ...
return function(argument)
  if captured1["cache.invalidate"] then
    reportResult(false, "cache.iscached", "Can't test due to cache.invalidate not working reliably")
  end
  local game2 = environment.game
  local lighting = game2:GetService("Lighting")
  environment.cache.invalidate(lighting)
  if environment.cache.iscached(lighting) then
    reportResult(false, "cache.iscached", "Returned true for a non-cached instance")
    if captured3["cache.iscached"] then
      failureFlag[1] = true
    end
  end
  local iscached2 = environment.cache.iscached
  local game3 = environment.game
  local packResults2 = packResults
  local getService = game3.GetService
  local packResults2Result = packResults2(getService(game3, "CollectionService"))
  local unpackResults2 = unpackResults
  local resultCount = packResults2Result.n
  if iscached2(unpackResults2(packResults2Result, 1, resultCount)) then
    return
  end
  reportResult(false, "cache.iscached", "Returned false for a cached instance")
  if not captured3["cache.iscached"] then
    return
  end
  failureFlag[1] = true
  return
end
