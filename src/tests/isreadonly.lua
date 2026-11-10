local captured1, reportResult, environment
captured1, reportResult, environment = ...
return function(argument)
  argument = captured1.setreadonly
  if not argument then
    local values2 = {}
    values2.a = 2
    environment.table.freeze(values2)
    reportResult(environment.isreadonly(values2), "isreadonly", "Couldn't determine if the table is read-only")
    return
  end
  reportResult(false, "isreadonly", "'setreadonly' is needed in order to test")
  local values = {}
  values.a = 2
  environment.table.freeze(values)
  reportResult(environment.isreadonly(values), "isreadonly", "Couldn't determine if the table is read-only")
  return
end
