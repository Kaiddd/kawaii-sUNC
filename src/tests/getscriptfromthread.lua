local reportResult, failureMap, failureFlag, packResults, unpackResults, environment
reportResult, failureMap, failureFlag, packResults, unpackResults, environment = ...
return function(argument)
  local attribute, value4, value5, value6, value7, value32, result, value33, value10, environment2, environment3
  local replicatedStorage = environment.game.ReplicatedStorage
  local waitForChildResult = replicatedStorage:WaitForChild("\"degloved\" *speed shocked gif*")
  attribute = waitForChildResult:GetAttribute("goatis_vs_spaghetti_stood_no_chance")
  environment3 = environment
  local getreg2 = environment3.getreg
  result, value33, value10 = getreg2()
  value5 = result
  value4 = value33
  value6 = value10
  argument = result
  value7 = value10
  environment2 = environment
  if environment2.type(result) == "table" then
    argument = environment2.next
    value4 = value5
    value7 = nil
  end
  while true do
    result, value33 = argument(value4, value7)
    local value2 = result
    local value3 = value33
    value7 = nil
    if result == nil then
      value7 = true
    else
      value7 = false
    end
    if value7 then
      break
    end
    value7 = value2
    value32 = value3
    environment3 = environment
    value6 = environment3.tostring
    value33 = value3
    result = value6(value3)
    value5 = result
    if result == attribute then
      value5 = true
    else
      value5 = false
    end
    if value5 then
      attribute = value32
    end
  end
  value6 = environment.getscriptfromthread
  value5 = not value6(attribute)
  if not value5 then
    local scriptfromthread = environment.getscriptfromthread(attribute)
    value5 = scriptfromthread.ClassName
    local value = "Script"
    if value5 ~= "Script" then
      value5 = true
    else
      value5 = false
    end
  end
  if value5 then
    local reportResult2 = reportResult
    local getscriptfromthread2 = environment.getscriptfromthread
    local results = packResults(getscriptfromthread2(attribute))
    local unpackResults2 = unpackResults
    local resultCount = results.n
    reportResult2(false, "getscriptfromthread", "Retrieved an invalid object: ", unpackResults2(results, 1, resultCount))
    if failureMap.getscriptfromthread then
      failureFlag[1] = true
    end
  end
  value5 = environment.getscriptfromthread(attribute).Name
  local game2 = environment.game
  if value5 == "seebau" .. game2:GetService("ReplicatedStorage").Folder.Folder.Folder.Folder.Folder.Folder["is this my life?..."].Value then
    value5 = true
  else
    value5 = false
  end
  if value5 then
    return
  end
  reportResult(false, "getscriptfromthread", "Failed to retrieve a destroyed script instance with its `Script` global set to junk.")
  if not failureMap.getscriptfromthread then
    return
  end
  failureFlag[1] = true
  return
end
