local reportResult, failureMap, failureFlag, _packResults, _unpackResults, environment = ...

return function()
	local function reportFailure(message)
		reportResult(false, "debug.getprotos", message)
		if failureMap["debug.getprotos"] then
			failureFlag[1] = true
		end
	end

	if not environment.getscriptclosure then
		reportFailure("getscriptclosure is needed in order to test")
	end

	local wowScript = environment.game:GetService("ReplicatedFirst")["Wow?"]
	local wowClosure = environment.getscriptclosure(wowScript)
	local wowProtoCount = 0
	for _ in environment.pairs(environment.debug.getprotos(wowClosure)) do
		wowProtoCount += 1
	end

	local hookScript = environment.game:GetService("ReplicatedFirst").sunchookfuncthing
	local hookClosure = environment.getscriptclosure(hookScript)
	local hookProtoCount = 0
	for _ in environment.pairs(environment.debug.getprotos(hookClosure)) do
		hookProtoCount += 1
	end

	if wowProtoCount + hookProtoCount ~= 8 then
		reportFailure("Invalid script's proto count")
	end

	local gameFunction = nil
	for _, value in environment.pairs(environment.getgc()) do
		if environment.type(value) == "function" and environment.debug.info(value, "n") == "forgives_flushed" then
			gameFunction = value
		end
	end

	local inactiveProto = environment.debug.getprotos(gameFunction)[1]
	if not inactiveProto then
		reportFailure("Failed to retrieve a proto from a game function")
	end

	local function callInactiveProto()
		if inactiveProto() == "blablabla" then
			reportFailure("Inactive protos should not be callable")
		end
	end
	environment.pcall(callInactiveProto)
end
