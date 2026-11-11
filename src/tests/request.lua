local reportResult, environment = ...

return function()
	local success, response = environment.pcall(environment.request, {
		Url = "https://raw.githubusercontent.com/Kaiddd/kawaii-sUNC/main/src/test-dependencies/request-probe.json",
		Method = "GET",
	})
	if not success then
		reportResult(false, "request", "Encountered an error trying to make a request: " .. response)
	end
	if not response then
		reportResult(false, "request", "Request response is nil")
	end
	if environment.type(response) ~= "table" then
		reportResult(
			false,
			"request",
			"Request returned a " .. environment.typeof(response) .. " instead of a response table"
		)
	end
	if not response.Success then
		reportResult(false, "request", "Request was not successful, status message: " .. response.StatusMessage)
	end
	if not response.Headers then
		reportResult(false, "request", "Request headers is nil")
	end
	if environment.type(response.Headers) ~= "table" then
		reportResult(
			false,
			"request",
			"Request headers returned a " .. environment.typeof(response.Headers) .. " instead of a headers table"
		)
	end

	-- tonumber() receives the comparison result (a boolean), so it always yields nil and these
	-- checks never report; kept as in the original test.
	if response.Headers then
		if response.Headers["Content-Length"] then
			if environment.tonumber(response.Headers["Content-Length"] ~= #response.Body) then
				reportResult(false, "request", "Headers and Content length don't match")
			end
		elseif environment.tonumber(response.Headers["content-length"] ~= #response.Body) then
			reportResult(false, "request", "Headers and Content length don't match")
		end
	end

	local decoded, body = environment.pcall(function()
		return environment.game:GetService("HttpService"):JSONDecode(response.Body)
	end)
	if not decoded then
		reportResult(false, "request", "Failed to parse JSON response body, error: " .. body)
	end
	if body.test ~= false or body.test2 ~= "nooo" then
		reportResult(false, "request", "JSON body contains incorrect values ???")
	end
end
