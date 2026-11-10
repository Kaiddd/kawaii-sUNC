local captured1, reportResult, packResults, unpackResults, environment
captured1, reportResult, packResults, unpackResults, environment = ...
return function(argument)
  local tostringResult22, tostringResult4
  argument = captured1.__OBJECT_EXISTS
  if argument ~= false then
    argument = false
  else
    argument = true
  end
  if argument then
    reportResult(false, "Drawing.new", "Couldn't retrieve the correct existence of the drawing[2]")
  end
  local renderproperty = environment.getrenderproperty(captured1, "Color")
  local tostringResult = environment.tostring(renderproperty)
  tostringResult4 = tostringResult
  if tostringResult == "1, 1, 0" then
    tostringResult4 = false
  else
    tostringResult4 = true
  end
  if tostringResult4 then
    reportResult(false, "getrenderproperty", "Output couldn't match expected Drawing's property")
  end
  local setrenderproperty2 = environment.setrenderproperty
  local captured12 = captured1
  local fromRGB2 = environment.Color3.fromRGB
  local results = packResults(fromRGB2(255, 0, 0))
  local unpackResults2 = unpackResults
  local resultCount = results.n
  setrenderproperty2(captured12, "Color", unpackResults2(results, 1, resultCount))
  local color = captured1.Color
  local tostringResult2 = environment.tostring(color)
  tostringResult22 = tostringResult2
  if tostringResult2 == "1, 0, 0" then
    tostringResult22 = false
  else
    tostringResult22 = true
  end
  if tostringResult22 then
    reportResult(false, "setrenderproperty", "Failed to set the render's color property")
  end
  local renderproperty2 = environment.getrenderproperty(captured1, "Color")
  local tostringResult3 = environment.tostring(renderproperty2)
  argument = tostringResult3
  if tostringResult3 == "1, 0, 0" then
    argument = false
  else
    argument = true
  end
  if argument then
    reportResult(false, "getrenderproperty", "Output couldn't match new Drawing's color property")
  end
  environment.cleardrawcache()
  environment.task.wait(0.067)
  argument = captured1.__OBJECT_EXISTS
  if argument ~= true then
    argument = false
  else
    argument = true
  end
  if not argument then
    return
  end
  reportResult(false, "cleardrawcache", "The object exists after clearing the cache")
  return
end
