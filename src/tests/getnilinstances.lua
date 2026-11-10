local reportResult, failureMap, failureFlag, packResults, unpackResults, environment
reportResult, failureMap, failureFlag, packResults, unpackResults, environment = ...
return function(argument)
  local value3, item32, pairs2, value6, value9, results3
  environment.getnilinstances()
  argument = false
  pairs2 = environment.pairs
  value9 = pairs2
  local getnilinstances2 = environment.getnilinstances
  local results = packResults(getnilinstances2())
  results3 = results
  local unpackResults2 = unpackResults
  local resultCount = results.n
  local callbackResult = (function(a_native_fixed_result_call_1, ...)
    return {
      a_native_fixed_result_call_1(...)
    }
  end)(pairs2, unpackResults2(results, 1, resultCount))
  local item = callbackResult[1]
  local item2 = callbackResult[2]
  local item3 = callbackResult[3]
  local item4 = item
  local item22 = item2
  item32 = item3
  while true do
    value9, results3 = item4(item22, item32)
    item32 = value9
    local value2 = results3
    value6 = nil
    if value9 == nil then
      value6 = true
    else
      value6 = false
    end
    if value6 then
      break
    end
    value6 = value2
    pairs2 = value2.Parent
    if pairs2 ~= nil then
      pairs2 = true
    else
      pairs2 = false
    end
    if pairs2 then
      argument = true
    end
  end
  if argument then
    reportResult(false, "getnilinstances", "Fetched a non-nil instance")
    if failureMap.getnilinstances then
      failureFlag[1] = true
    end
  end
  environment.Instance.new("Part").Name = ","
  value3 = false
  argument = environment.pairs
  value9 = argument
  pairs2 = environment.getnilinstances
  local results2 = packResults(pairs2())
  results3 = results2
  local unpackResults3 = unpackResults
  local resultCount2 = results2.n
  local callbackResult2 = (function(a_native_fixed_result_call_1, ...)
    return {
      a_native_fixed_result_call_1(...)
    }
  end)(argument, unpackResults3(results2, 1, resultCount2))
  local item5 = callbackResult2[1]
  local item6 = callbackResult2[2]
  local item7 = callbackResult2[3]
  local item52 = item5
  local item62 = item6
  item32 = item7
  while true do
    value9, results3 = item52(item62, item32)
    item32 = value9
    local value = results3
    value6 = nil
    if value9 == nil then
      value6 = true
    else
      value6 = false
    end
    if value6 then
      break
    end
    value6 = value
    argument = value.Name
    pairs2 = ","
    if argument == "," then
      argument = true
    else
      argument = false
    end
    if argument then
      value3 = true
    end
  end
  if value3 then
    return
  end
  reportResult(false, "getnilinstances", "Couldn't fetch a nil instance")
  if not failureMap.getnilinstances then
    return
  end
  failureFlag[1] = true
  return
end
