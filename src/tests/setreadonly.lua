local reportResult, environment
reportResult, environment = ...
return function(argument)
  local value3
  argument = {}
  argument.success = false
  environment.table.freeze(argument)
  if not environment.table.isfrozen(argument) then
    reportResult(false, "setreadonly", "chopped af \240\159\148\165\240\159\148\165\240\159\148\165\240\159\148\165")
  end
  environment.setreadonly(argument, false)
  value3 = true
  argument.success = true
  if not argument.success then
    local reportResult2 = reportResult
    argument = "Failed to set the value in the frozen table"
    reportResult2(false, "setreadonly", "Failed to set the value in the frozen table")
  end
  local values = {}
  values[1] = 5
  environment.table.freeze(values)
  local pcall2 = environment.pcall
  do
    local value12
    value12 = values
    
    function argument(argument)
      value12[1] = true
      return
    end
  end
  if not pcall2(argument) then
    return
  end
  reportResult(false, "setreadonly", "I like my UNC not faked, bruh \240\159\146\166")
  return
end
