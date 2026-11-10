local reportResult, failureMap, failureFlag, packResults, unpackResults, hostFactories, environment
reportResult, failureMap, failureFlag, packResults, unpackResults, hostFactories, environment = ...
return function(argument)
  local clonerefResult4, game2, cloneref2, typeofResult, itemResult2, rawequal2Result, result22, lol22, value13, environment2
  if not environment.compareinstances then
    reportResult(false, "cloneref", "compareinstances is needed in order to test")
    if failureMap.cloneref then
      failureFlag[1] = true
    end
  end
  environment.Instance.new("Folder", environment.workspace).Name = "lol"
  environment.task.wait()
  local workspace2 = environment.cloneref(environment.game).workspace
  local findFirstChild = workspace2.FindFirstChild
  value13 = "lol"
  if not findFirstChild(workspace2, "lol") then
    reportResult(false, "cloneref", "Couldn't retrieve an existing member of the reference")
    if failureMap.cloneref then
      failureFlag[1] = true
    end
  end
  local lol2 = environment.workspace.lol
  lol22 = lol2
  lol2:Destroy()
  local clonerefResult = environment.cloneref(environment.game)
  clonerefResult4 = clonerefResult
  typeofResult = environment.typeof(clonerefResult)
  argument = environment.typeof
  game2 = environment.game
  if typeofResult ~= argument(game2) then
    typeofResult = true
  else
    typeofResult = false
  end
  if not typeofResult then
    typeofResult = environment.type(clonerefResult4)
    local value6 = environment.type
    game2 = environment.game
    if typeofResult ~= value6(game2) then
      typeofResult = true
    else
      typeofResult = false
    end
  end
  if typeofResult then
    reportResult(false, "cloneref", "Reference should have the same type as the original")
    if failureMap.cloneref then
      local failureFlag4 = failureFlag
      failureFlag4[1] = true
    end
  end
  cloneref2 = environment.cloneref
  local result = cloneref2(environment.game)
  local result2 = result
  argument = environment.game
  if result == argument then
    cloneref2 = true
  else
    cloneref2 = false
  end
  if cloneref2 then
    local reportResult2 = reportResult
    game2 = false
    reportResult2(false, "cloneref", "The reference should be different compared to the original")
    if failureMap.cloneref then
      local failureFlag3 = failureFlag
      failureFlag3[1] = true
    end
  end
  local rawequal2 = environment.rawequal
  result22 = result2
  typeofResult = environment.game
  rawequal2Result = rawequal2(result22, typeofResult)
  local value = rawequal2Result
  if rawequal2Result then
    game2 = reportResult
    local value2 = game2
    local value3 = false
    local value4 = false
    clonerefResult4 = "cloneref"
    local value5 = "The reference should not be the same under rawequal"
    game2(false, "cloneref", "The reference should not be the same under rawequal")
    if failureMap.cloneref then
      local failureFlag2 = failureFlag
      failureFlag2[1] = true
    end
  end
  argument = not value
  if argument then
    game2 = environment.rawequal
    local values4 = {}
    result22 = values4
    clonerefResult4 = {}
    local result3 = game2(values4, clonerefResult4)
    argument = result3
    if not result3 then
      local rawequal5 = environment.rawequal
      local newproxyResult2 = environment.newproxy(true)
      local values5 = {}
      argument = rawequal5(newproxyResult2, values5)
    end
    if not argument then
      local rawequal4 = environment.rawequal
      local newproxy3 = environment.newproxy
      local newproxy3Result = newproxy3(true)
      local newproxy4 = environment.newproxy
      local results2 = packResults(newproxy4(false))
      local unpackResults3 = unpackResults
      local resultCount2 = results2.n
      local rawequal4Result = rawequal4(newproxy3Result, unpackResults3(results2, 1, resultCount2))
      argument = rawequal4Result
    end
    if not argument then
      local rawequal3 = environment.rawequal
      local newproxyResult = environment.newproxy()
      local newproxy2 = environment.newproxy
      local results = packResults(newproxy2())
      local unpackResults2 = unpackResults
      local resultCount = results.n
      argument = rawequal3(newproxyResult, unpackResults2(results, 1, resultCount))
    end
    if argument then
      reportResult(false, "cloneref", "The reference should not be the same under rawequal")
      if failureMap.cloneref then
        failureFlag[1] = true
      end
    end
  end
  local clonerefResult2 = environment.cloneref(environment.game)
  local clonerefResult22 = clonerefResult2
  local clonerefResult3 = environment.cloneref(clonerefResult2.workspace)
  local clonerefResult32 = clonerefResult3
  local compareinstancesResult = environment.compareinstances(clonerefResult22, clonerefResult3)
  typeofResult = compareinstancesResult
  if compareinstancesResult then
    reportResult(false, "cloneref", "compareinstances approved invalid references")
    typeofResult = failureMap.cloneref
    if typeofResult then
      typeofResult = true
      failureFlag[1] = true
    end
  end
  if clonerefResult22 == clonerefResult32 then
    typeofResult = true
  else
    typeofResult = false
  end
  if not typeofResult then
    typeofResult = clonerefResult32.Parent
    if typeofResult == clonerefResult22 then
      typeofResult = true
    else
      typeofResult = false
    end
  end
  if typeofResult then
    reportResult(false, "cloneref", "Invalid references should not equal[1]")
    if failureMap.cloneref then
      failureFlag[1] = true
    end
  end
  local rawequalResult = environment.rawequal(clonerefResult22, clonerefResult32)
  typeofResult = rawequalResult
  if not rawequalResult then
    typeofResult = environment.rawequal(clonerefResult22, clonerefResult32.Parent)
  end
  if typeofResult then
    reportResult(false, "cloneref", "Invalid references should not equal[2]")
    if failureMap.cloneref then
      failureFlag[1] = true
    end
  end
  environment2 = environment
  typeofResult = environment2.workspace.tsatsatsatsa.Massless
  clonerefResult4 = true
  if typeofResult == true then
    typeofResult = true
  else
    typeofResult = false
  end
  if typeofResult then
    typeofResult = 488
    repeat
      environment.task.wait()
      typeofResult = typeofResult - 1
      environment2 = environment
      clonerefResult4 = environment2.workspace.tsatsatsatsa.Massless
      if clonerefResult4 == false then
        clonerefResult4 = true
      else
        clonerefResult4 = false
      end
      if not clonerefResult4 then
        if typeofResult <= 0 then
          clonerefResult4 = true
        else
          clonerefResult4 = false
        end
      end
    until clonerefResult4
    environment2 = environment
    clonerefResult4 = environment2.workspace.tsatsatsatsa.Massless
    if clonerefResult4 == true then
      clonerefResult4 = true
    else
      clonerefResult4 = false
    end
    if clonerefResult4 then
      reportResult(false, "cloneref", "Failed to use cloneref without being detected.")
      clonerefResult4 = failureMap.cloneref
      if clonerefResult4 then
        clonerefResult4 = true
        failureFlag[1] = true
      end
    end
  end
  local values = {}
  values[1] = clonerefResult4
  local values2 = values
  values[1] = nil
  local item = hostFactories[1]
  local values3 = {}
  values3[1] = values2
  local itemResult = item(values3)
  itemResult2 = itemResult
  itemResult()
  typeofResult = 300
  repeat
    environment.task.wait()
    typeofResult = typeofResult - 1
    environment2 = environment
    itemResult2 = environment2.workspace.tsatsatsatsa.Massless
    if itemResult2 == true then
      itemResult2 = true
    else
      itemResult2 = false
    end
    if not itemResult2 then
      if typeofResult <= 0 then
        itemResult2 = true
      else
        itemResult2 = false
      end
    end
  until itemResult2
  itemResult2 = environment.workspace.tsatsatsatsa.Massless
  if itemResult2 == true then
    itemResult2 = true
  else
    itemResult2 = false
  end
  if not itemResult2 then
    values2[1] = nil
    environment.workspace.tsatsatsatsa.Massless = false
    return
  end
  reportResult(false, "cloneref", "Failed to use cloneref without being detected")
  if not failureMap.cloneref then
    values2[1] = nil
    environment.workspace.tsatsatsatsa.Massless = false
    return
  end
  failureFlag[1] = true
  values2[1] = nil
  environment.workspace.tsatsatsatsa.Massless = false
  return
end
