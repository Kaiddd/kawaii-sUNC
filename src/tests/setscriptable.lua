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

	local scriptablePart = environment.Instance.new("Part")
	local attemptsLeft = 25
	environment.setscriptable(scriptablePart, "formFactorRaw", true)
	repeat
		environment.task.wait(0.25)
		attemptsLeft -= 1
	until environment.isscriptable(scriptablePart, "formFactorRaw") or attemptsLeft <= 0

	if attemptsLeft <= 0 then
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
