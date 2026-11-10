local reportResult, failureMap, failureFlag, packResults, unpackResults, environment
reportResult, failureMap, failureFlag, packResults, unpackResults, environment = ...
return function(argument)
  local callback, functionhash, value, callback2, value2, value3, value4, value5, value6, value7, value8, getgc2, value9, pairs2, value11, value14, value15, values, unpackResults2, item, resultCount, environment2, callbackResult
  
  function argument(argument)
    return
  end
  
  function callback2(argument)
    return
  end
  
  values = {}
  values[1] = nil
  
  function callback(argument)
    return
  end
  
  values[1] = callback
  callback = environment.getfunctionhash(argument)
  functionhash = environment.getfunctionhash(callback2)
  callback2 = environment.getfunctionhash
  argument = callback2(values[1])
  if callback ~= functionhash then
    callback2 = true
  else
    callback2 = false
  end
  if not callback2 then
    if callback ~= argument then
      callback2 = true
    else
      callback2 = false
    end
  end
  if not callback2 then
    if functionhash ~= argument then
      callback2 = true
    else
      callback2 = false
    end
  end
  if callback2 then
    reportResult(false, "getfunctionhash", "Same functions shouldn't have different hashes")
    if failureMap.getfunctionhash then
      failureFlag[1] = true
    end
  end
  callback2 = nil
  argument = nil
  value2 = nil
  value3 = nil
  value4 = nil
  value5 = nil
  callback = nil
  functionhash = nil
  value = nil
  pairs2 = environment.pairs
  value14 = pairs2
  environment2 = environment
  getgc2 = environment2.getgc
  values = packResults(getgc2())
  value15 = values
  unpackResults2 = unpackResults
  resultCount = values.n
  callbackResult = (function(a_native_fixed_result_call_1, ...)
    return {
      a_native_fixed_result_call_1(...)
    }
  end)(pairs2, unpackResults2(values, 1, resultCount))
  values = callbackResult[1]
  unpackResults2 = callbackResult[2]
  item = callbackResult[3]
  value6 = values
  value7 = unpackResults2
  value8 = item
  value9 = item
  while true do
    value14, value15 = value6(value7, value9)
    getgc2 = value14
    value8 = value15
    value9 = nil
    if value14 == nil then
      value9 = true
    else
      value9 = false
    end
    if value9 then
      break
    end
    value9 = getgc2
    value11 = value8
    value14 = environment.type(value8)
    pairs2 = value14
    if value14 == "function" then
      pairs2 = true
    else
      pairs2 = false
    end
    if pairs2 then
      value14 = environment.debug.info(value11, "n")
      pairs2 = value14
      if value14 == "bimbumbumbambam" then
        pairs2 = true
      else
        pairs2 = false
      end
    end
    if pairs2 then
      callback2 = value11
    end
    value14 = environment.type(value11)
    pairs2 = value14
    if value14 == "function" then
      pairs2 = true
    else
      pairs2 = false
    end
    if pairs2 then
      value14 = environment.debug.info(value11, "n")
      pairs2 = value14
      if value14 == "syrupsyrupsyrup" then
        pairs2 = true
      else
        pairs2 = false
      end
    end
    if pairs2 then
      argument = value11
    end
    values = environment.type(value11)
    pairs2 = values
    if values == "function" then
      pairs2 = true
    else
      pairs2 = false
    end
    if pairs2 then
      value14 = environment.debug.info(value11, "n")
      pairs2 = value14
      if value14 == "peepbooop" then
        pairs2 = true
      else
        pairs2 = false
      end
    end
    if pairs2 then
      value2 = value11
    end
    value14 = environment.type(value11)
    pairs2 = value14
    if value14 == "function" then
      pairs2 = true
    else
      pairs2 = false
    end
    if pairs2 then
      value14 = environment.debug.info(value11, "n")
      pairs2 = value14
      if value14 == "boopbeep" then
        pairs2 = true
      else
        pairs2 = false
      end
    end
    if pairs2 then
      value3 = value11
    end
    value14 = environment.type(value11)
    pairs2 = value14
    if value14 == "function" then
      pairs2 = true
    else
      pairs2 = false
    end
    if pairs2 then
      value14 = environment.debug.info(value11, "n")
      pairs2 = value14
      if value14 == "coolfunc" then
        pairs2 = true
      else
        pairs2 = false
      end
    end
    if pairs2 then
      value4 = value11
    end
    value14 = environment.type(value11)
    pairs2 = value14
    if value14 == "function" then
      pairs2 = true
    else
      pairs2 = false
    end
    if pairs2 then
      value14 = environment.debug.info(value11, "n")
      pairs2 = value14
      if value14 == "coolfunc2" then
        pairs2 = true
      else
        pairs2 = false
      end
    end
    if pairs2 then
      value5 = value11
    end
    getgc2 = environment.type
    value15 = value11
    value14 = getgc2(value11)
    pairs2 = value14
    getgc2 = "function"
    if value14 == "function" then
      pairs2 = true
    else
      pairs2 = false
    end
    if pairs2 then
      getgc2 = environment.debug.info
      value15 = value11
      value14 = getgc2(value11, "n")
      pairs2 = value14
      if value14 == "coolfunc3" then
        pairs2 = true
      else
        pairs2 = false
      end
    end
    if pairs2 then
      callback = value11
    end
    values = environment.type(value11)
    pairs2 = values
    getgc2 = "function"
    if values == "function" then
      pairs2 = true
    else
      pairs2 = false
    end
    if pairs2 then
      getgc2 = environment.debug.info
      value15 = value11
      value14 = getgc2(value11, "n")
      pairs2 = value14
      if value14 == "coolfunc4" then
        pairs2 = true
      else
        pairs2 = false
      end
    end
    if pairs2 then
      functionhash = value11
    end
    environment2 = environment
    values = environment2.type(value11)
    pairs2 = values
    getgc2 = "function"
    if values == "function" then
      pairs2 = true
    else
      pairs2 = false
    end
    if pairs2 then
      environment2 = environment
      getgc2 = environment2.debug.info
      value15 = value11
      value14 = getgc2(value11, "n")
      pairs2 = value14
      getgc2 = "coolfunc5"
      if value14 == "coolfunc5" then
        pairs2 = true
      else
        pairs2 = false
      end
    end
    if pairs2 then
      value = value11
    end
  end
  if not callback2 or not argument then
    reportResult(false, "getfunctionhash", "Failed to retrieve needed functions in order to test")
    if failureMap.getfunctionhash then
      failureFlag[1] = true
    end
  end
  values = environment.getfunctionhash(callback2)
  pairs2 = values
  value14 = environment.getfunctionhash(argument)
  getgc2 = value14
  if values == value14 then
    pairs2 = true
  else
    pairs2 = false
  end
  if pairs2 then
    reportResult(false, "getfunctionhash", "Variadic arguments should influence the hash")
    pairs2 = failureMap
    getgc2 = "getfunctionhash"
    if pairs2.getfunctionhash then
      failureFlag[1] = true
    end
  end
  
  function pairs2(argument)
    return "ffa"
  end
  
  values = {}
  values[1] = getgc2
  
  function value8(argument)
    return "ffa"
  end
  
  values[1] = value8
  value8 = environment.getfunctionhash(pairs2)
  if value8 ~= environment.getfunctionhash(values[1]) then
    value8 = true
  else
    value8 = false
  end
  if value8 then
    reportResult(false, "getfunctionhash", "Functions' hash should differ due to no instruction difference")
    if failureMap.getfunctionhash then
      failureFlag[1] = true
    end
  end
  value8 = environment.getfunctionhash(value2)
  if value8 == environment.getfunctionhash(value3) then
    value8 = true
  else
    value8 = false
  end
  if value8 then
    reportResult(false, "getfunctionhash", "Different constants should not have the same hash[1]")
    if failureMap.getfunctionhash then
      failureFlag[1] = true
    end
  end
  value14 = environment.getfunctionhash(value4)
  value8 = value14
  if value14 == environment.getfunctionhash(value5) then
    value8 = true
  else
    value8 = false
  end
  if value8 then
    reportResult(false, "getfunctionhash", "Different constants should not have the same hash[2]")
    if failureMap.getfunctionhash then
      failureFlag[1] = true
    end
  end
  value8 = environment.getfunctionhash(callback)
  if value8 == environment.getfunctionhash(functionhash) then
    value8 = true
  else
    value8 = false
  end
  if value8 then
    reportResult(false, "getfunctionhash", "Different instructions should not have the same hash")
    if failureMap.getfunctionhash then
      failureFlag[1] = true
    end
  end
  value8 = environment.getfunctionhash(callback)
  if value8 ~= environment.getfunctionhash(value) then
    value8 = true
  else
    value8 = false
  end
  if not value8 then
    return
  end
  reportResult(false, "getfunctionhash", "Same instructions should have the same hash")
  if not failureMap.getfunctionhash then
    return
  end
  failureFlag[1] = true
  return
end
