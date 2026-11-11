local reportResult, checkpointLogger, environment = ...

return function()
	local sizPart = environment.Instance.new("Part")
	environment.setscriptable(sizPart, "siz", true)
	local function readSiz()
		local _ = sizPart.siz
		reportResult(false, "setscriptable", "Shouldn't be able to access siz")
	end
	local function logError(message, extra)
		checkpointLogger(message, extra)
	end
	environment.xpcall(readSiz, logError)

	-- Poll every frame for up to 6.25 seconds (the original polled every 0.25 seconds, 25 times).
	local scriptablePart = environment.Instance.new("Part")
	local deadline = environment.os.clock() + 6.25
	environment.setscriptable(scriptablePart, "formFactorRaw", true)
	local timedOut = false
	while not environment.isscriptable(scriptablePart, "formFactorRaw") do
		if environment.os.clock() >= deadline then
			timedOut = true
			break
		end
		environment.task.wait()
	end

	if timedOut then
		reportResult(false, "setscriptable", "Couldn't determine whether the property was set scriptable (Timed out)")
	end

	local function readFormFactorRaw()
		if environment.tostring(scriptablePart.formFactorRaw) ~= "Enum.FormFactor.Brick" then
			environment.error("")
		end
	end
	local function onReadFailed(message, extra)
		checkpointLogger(message, extra)
		reportResult(false, "setscriptable", "Wasn't able to index a hidden property after setting scriptable")
	end
	environment.xpcall(readFormFactorRaw, onReadFailed)

	local unscriptablePart = environment.Instance.new("Part")
	environment.setscriptable(unscriptablePart, "formFactorRaw", false)
	local function readUnscriptable()
		local _ = unscriptablePart.formFactorRaw
		reportResult(false, "setscriptable", "Was able to index a hidden property after setting scriptable")
	end
	local function ignoreError() end
	environment.xpcall(readUnscriptable, ignoreError)
end
