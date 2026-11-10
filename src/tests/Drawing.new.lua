local reportResult, packResults, unpackResults, environment
reportResult, packResults, unpackResults, environment = ...
return function(argument)
  local new2 = environment.Drawing.new
  local newproxy2 = environment.newproxy
  local results = packResults(newproxy2(true))
  local unpackResults2 = unpackResults
  local resultCount = results.n
  if not new2(unpackResults2(results, 1, resultCount)) then
    return
  end
  reportResult(false, "Drawing.new", "Allowed an invalid drawing to be made from improper argument")
  return
end
