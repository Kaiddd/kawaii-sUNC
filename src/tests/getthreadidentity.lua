local reportResult, _packResults, _unpackResults, environment = ...

return function()
	if environment.type(environment.getthreadidentity()) == "number" then
		reportResult(true, "getthreadidentity", "Did not return a number")
		return
	end
	reportResult(false, "getthreadidentity", "Did not return a number")
end
