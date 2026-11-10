local captured1, packResults, unpackResults, environment
captured1, packResults, unpackResults, environment = ...
return function(argument)
  local captured12 = captured1
  local value = environment.type
  local getthreadidentity2 = environment.getthreadidentity
  local results = packResults(getthreadidentity2())
  local unpackResults2 = unpackResults
  local resultCount = results.n
  if value(unpackResults2(results, 1, resultCount)) == "number" then
    captured12(true, "getthreadidentity", "Did not return a number")
    return
  end
  captured12(false, "getthreadidentity", "Did not return a number")
  return
end
