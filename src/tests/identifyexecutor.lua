local reportResult, environment = ...

return function()
	local executorName = environment.identifyexecutor()
	local isString = environment.type(executorName) == "string"
	reportResult(isString, "identifyexecutor", "Didn't return the name as a string")
end
