local reportResult, environment
reportResult, environment = ...
return function(argument)
  local result2, headers2, value2Result, value14
  local pcall2 = environment.pcall
  local request2 = environment.request
  local values = {}
  values.Url = "https://api.rubis.app/v2/scrap/eupJy408XkzQdshz/raw"
  values.Method = "GET"
  value2Result, value14 = pcall2(request2, values)
  argument = value2Result
  local value = value14
  if not value2Result then
    local reportResult6 = reportResult
    local value10 = "Encountered an error trying to make a request: " .. value
    local value102 = value10
    reportResult6(false, "request", value10)
  end
  if not value then
    local reportResult5 = reportResult
    local value9 = "Request response is nil"
    reportResult5(false, "request", "Request response is nil")
  end
  local result = environment.type(value)
  result2 = result
  argument = "table"
  if result == "table" then
    result2 = false
  else
    result2 = true
  end
  if result2 then
    local reportResult4 = reportResult
    local typeofResult = environment.typeof(value)
    local value7 = " instead of a response table"
    local value8 = "Request returned a " .. typeofResult .. " instead of a response table"
    reportResult4(false, "request", value8)
  end
  if not value.Success then
    local reportResult3 = reportResult
    local value6 = "Request was not successful, status message: " .. value.StatusMessage
    reportResult3(false, "request", value6)
  end
  if not value.Headers then
    reportResult(false, "request", "Request headers is nil")
  end
  local value2 = environment.type
  headers2 = value.Headers
  value2Result = value2(headers2)
  result2 = value2Result
  argument = "table"
  if value2Result == "table" then
    result2 = false
  else
    result2 = true
  end
  if result2 then
    value2Result = reportResult
    local typeof2 = environment.typeof
    argument = value.Headers
    local value5 = typeof2(argument) .. " instead of a headers table"
    headers2 = value5
    value2Result(false, "request", "Request headers returned a " .. value5)
  end
  result2 = value.Headers
  if result2 then
    local headers = value.Headers
    argument = "Content-Length"
    result2 = headers["Content-Length"]
    if result2 then
      argument = environment.tonumber
      local value4 = argument
      headers2 = value.Headers["Content-Length"]
      if headers2 == #value.Body then
        headers2 = false
      else
        headers2 = true
      end
      value2Result = value4(headers2)
      result2 = value2Result
      if value2Result then
        local reportResult2 = reportResult
        local reportResult22 = reportResult2
        headers2 = false
        result2 = "request"
        reportResult2(false, "request", "Headers and Content length don't match")
      end
    else
      local tonumber2 = environment.tonumber
      headers2 = value.Headers["content-length"]
      if headers2 == #value.Body then
        headers2 = false
      else
        headers2 = true
      end
      local tonumber2Result = tonumber2(headers2)
      result2 = tonumber2Result
      if tonumber2Result then
        reportResult(false, "request", "Headers and Content length don't match")
      end
    end
  end
  local pcall3 = environment.pcall
  do
    local value23
    value23 = value
    
    function result2(argument)
      local game2 = environment.game
      local httpService = game2:GetService("HttpService")
      return httpService:JSONDecode(value23.Body)
    end
  end
  value2Result, value14 = pcall3(result2)
  local value3 = value14
  if not value2Result then
    reportResult(false, "request", "Failed to parse JSON response body, error: " .. value3)
  end
  headers2 = value3.test
  if headers2 == false then
    headers2 = false
  else
    headers2 = true
  end
  if headers2 then
  else
    headers2 = value3.test2
    if headers2 == "nooo" then
      headers2 = false
    else
      headers2 = true
    end
  end
  if not headers2 then
    return
  end
  reportResult(false, "request", "JSON body contains incorrect values ???")
  return
end
