local reportResult, environment
reportResult, environment = ...
return function(argument)
  local value7, value8, value9, value11, value32, value42, result, item2, value16, environment2, value21
  local values = {}
  values.source = "string"
  values.short_src = "string"
  values.func = "function"
  values.what = "string"
  values.currentline = "number"
  values.nups = "number"
  values.numparams = "number"
  values.is_vararg = "number"
  value7 = "real"
  local values2 = {}
  values2[1] = nil
  local values22 = values2
  values2[1] = "real"
  do
    local value23
    value23 = values22
    
    function value7(...)
      return (function(argument)
        environment.boom = "ookok"
        value23[1] = "boom"
        return value23[1]
      end)(...)
    end
  end
  local info = environment.debug.getinfo(value7)
  environment2 = environment
  local pairs2 = environment2.pairs
  result, item2, value16 = pairs2(values)
  local value = result
  value9 = item2
  value8 = value16
  local value2 = item2
  value11 = value16
  while true do
    result, item2 = value(value2, value11)
    local value3 = result
    local value4 = item2
    value11 = nil
    if result == nil then
      value11 = true
    else
      value11 = false
    end
    if value11 then
      break
    end
    value11 = value3
    value32 = value3
    value42 = value4
    value8 = info[value3]
    if value8 == nil then
      value8 = true
    else
      value8 = false
    end
    if value8 then
      local reportResult2 = reportResult
      value21 = "Did not return a table with a '" .. value32 .. "' field"
      reportResult2(false, "debug.getinfo", value21)
    end
    environment2 = environment
    value9 = environment2.type
    local item = info[value32]
    item2 = item
    result = value9(item)
    value8 = result
    if result ~= value42 then
      value8 = true
    else
      value8 = false
    end
    if value8 then
      result = reportResult
      item2 = false
      environment2 = environment
      local value5 = value42 .. " (got " .. environment2.type(info[value32]) .. ")"
      value42 = value5
      local value6 = value32 .. " as a " .. value5
      value9 = value6
      value21 = "Did not return a table with " .. value6
      value8 = value21
      result(false, "debug.getinfo", value21)
    end
  end
  value8 = info.what
  if value8 ~= "Lua" then
    value8 = true
  else
    value8 = false
  end
  if value8 then
    reportResult(false, "debug.getinfo", "Didn't return a valid `what` field [2]")
  end
  value8 = info.is_vararg
  if value8 > 1 then
    value8 = true
  else
    value8 = false
  end
  if value8 then
    reportResult(false, "debug.getinfo", "Impossible field value for 'is_vararg' ")
  end
  value8 = info.is_vararg
  if value8 == 0 then
    value8 = true
  else
    value8 = false
  end
  if value8 then
    reportResult(false, "debug.getinfo", "Didn't return the correct value for 'is_vararg' ")
  end
  local funcResult = info.func()
  value8 = funcResult
  if funcResult ~= "boom" then
    value8 = true
  else
    value8 = false
  end
  if not value8 then
    return
  end
  reportResult(false, "debug.getinfo", "Didn't return the correct value from 'func' ")
  return
end
