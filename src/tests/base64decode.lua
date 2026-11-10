local captured1, captured2, reportResult, environment
captured1, captured2, reportResult, environment = ...
return function(argument)
  local base64decodeResult = environment.base64decode(captured1)
  captured2[1] = base64decodeResult
  if environment.string.find(captured2[1], "compatible_brands") then
    return
  end
  reportResult(false, "base64decode", "Couldn't find the needed value inside the output")
  return
end
