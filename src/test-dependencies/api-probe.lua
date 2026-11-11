--!nolint
--!nocheck

placeholder = {}
local p = {}

function AsCon(condition, testName, reason)
	if not condition then
		if not p[testName] then
			placeholder[testName] = reason
			p[testName] = true
			return condition, testName, reason
		end
	else
		p[""] = ""
		placeholder[testName] = true
		return condition, testName
	end
end

if getgenv().sUNCDebug["printcheckpoints"] then
	print("Getting depencencies[0]")
end

task.wait()

if getgenv().sUNCDebug["printcheckpoints"] then
	print("Getting depencencies[1]")
end
task.wait()
local nnn = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaiddd/kawaii-sUNC/main/src/test-dependencies/dependency-2.lua"))()
if getgenv().sUNCDebug["printcheckpoints"] then
	print("Getting depencencies[2]")
end
task.wait()
local mmm = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaiddd/kawaii-sUNC/main/src/test-dependencies/dependency-3.lua"))()
if getgenv().sUNCDebug["printcheckpoints"] then
	print("Got depencencies?")
end
task.wait(0.005)

if debug.getproto then
	local a, b = pcall(function()
		local m
		local function v()
			local function insider()
				local nnn =
					loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaiddd/kawaii-sUNC/main/src/test-dependencies/dependency-2.lua"))()
				m = nnn
				return nnn
			end
		end

		v()
		local a = debug.getproto(v, 1, true)
		if a[1]() ~= m then
			AsCon(4 < 3, "debug.getproto", "Didn't return the correct value from the proto")
		end

		local lok = debug.getproto(v, 1, true)
		if lok[1] ~= nil then
			if lok[1]() == true or lok[1]() == "true" then
				AsCon(4 < 3, "debug.getproto", "Good job trying to fake getproto 🤑(true, indeed)")
			end
		end

		local function func()
			local function proto()
				return "hi"
			end
			return proto
		end

		local real = func()
		local lol = debug.getproto(func, 1, true)[1]
		if real ~= lol then
			AsCon(4 < 3, "debug.getproto", "Returned proto shouldn't differ")
		end
	end)

	if not a then
		AsCon(4 < 3, "debug.getproto", b)
	end
else
	AsCon(4 < 3, "debug.getproto", "function is nil")
end

if placeholder["debug.getproto"] == nil then
	AsCon(4<3, "debug.getproto", "neutral")
end

if getgenv().sUNCDebug["printcheckpoints"] then
	print("Past getproto[i]")
end

task.wait(getgenv().sUNCDebug["delaybetweentests"] or 0)

if getrawmetatable then
	local a,b = pcall(function()
		local dummy = {}
		local dummy1 = {}
		setmetatable(dummy, { __metatable = dummy1 })
		if getrawmetatable(dummy) == dummy1 then
			AsCon(4 < 3, "getrawmetatable", "Me when I getmetatable super real and pro 👍👍")
		end

		local metatable = {}
		local object = setmetatable({}, metatable)
		local mt = getrawmetatable(workspace.CurrentCamera)

		if mt == nil or mt == "nil" then
			AsCon(4 < 3, "getrawmetatable", "Couldn't retrieve the raw metatable")
		else
			if mt.__mod or mt.__sub or mt.__idiv or mt.__lt or mt.__le or mt.__pow or mt.__concat then
				AsCon(4 < 3, "getrawmetatable", "So many options. Thank you, dear executor💔🙏")
			else
				local bloop = false
				local originalNewIndex = getrawmetatable(game).__newindex
				setreadonly(getrawmetatable(game), false)

				getrawmetatable(game).__newindex = function(self, index, value)
					if index == "FieldOfView" then
						bloop = true
					end
					return originalNewIndex(self, index, value)
				end

				workspace.Camera.FieldOfView = 70
				getrawmetatable(game).__newindex = originalNewIndex
				setreadonly(getrawmetatable(game), true)
				if bloop == false then
					AsCon(
						4 < 3,
						"getrawmetatable",
						"Didn't return the needed value (might be an attempt to fake getrawmetatable)"
					)
				end

				if not pcall(getrawmetatable, "") then
					AsCon(4 < 3, "getrawmetatable", "Failed to get the rawmetatable of a string")
				end

				if not pcall(getrawmetatable, Vector3.zero) then
					AsCon(4 < 3, "getrawmetatable", "Failed to get the rawmetatable of vector3")
				end
			end
		end
	end)
	if not a then
		AsCon(4<3, "getrawmetatable", b)
	end
	if placeholder["getrawmetatable"] == nil then
		AsCon(3 < 4, "getrawmetatable")
	end
else
	AsCon(4 < 3, "getrawmetatable", "function is nil")
end

if getgenv().sUNCDebug["printcheckpoints"] then
	print("Past getrmetatable")
end

task.wait(getgenv().sUNCDebug["delaybetweentests"] or 0)

local a, b = pcall(function()
	if hookmetamethod then
		local kuur = false
		local ogcall
		local popo, moopu = pcall(function()
			local callingscript = "none"
			local n = 18
			ogcall = hookmetamethod(game, "__index", function(...)
				kuur = true
				if callingscript ~= "CameraModule" then
					callingscript = tostring(getcallingscript())
				end
				return ogcall(...)
			end)

			repeat
				n = n - 1
				task.wait(0.1)
			until tostring(callingscript) == "CameraModule" or n <= 0

			if getgenv().sUNCDebug["printcheckpoints"] then
				print(callingscript, " cscript")
			end

			if n <= 0 and callingscript ~= "CameraModule" then
				AsCon(4 < 3, "getcallingscript", "Couldn't retrieve the needed value")
			else
				AsCon(3 < 4, "getcallingscript", "")
			end

			game:GetService("Lighting")

			if kuur == false then
				AsCon(4 < 3, "hookmetamethod", "Couldn't hook the metamethod")
			elseif kuur == true then
				AsCon(3 < 4, "hookmetamethod", "")
			end
		end)

		if not popo then
			AsCon(4 < 3, "hookmetamethod", b)
		else
			hookmetamethod(game, "__index", ogcall)
		end
	end
end)

if not a then
	AsCon(4 < 3, "hookmetamethod", b)
end

if getgenv().sUNCDebug["printcheckpoints"] then
	print("Past hookmetamethod/getcallingscript")
end

task.wait(getgenv().sUNCDebug["delaybetweentests"] or 0)

if getnamecallmethod then
	local a, b = pcall(function()
		if placeholder["hookmetamethod"] == false then
			AsCon(4 < 3, "getnamecallmethod", "Can't verify due to 'hookmetamethod' not working")
		end
		local o
		local a
		local b
		b = hookmetamethod(game, "__namecall", function(...)
			if not a then
				a = getnamecallmethod()
			end
			return b(...)
		end)

		game:IsA("Part")
		if a == "GetService" then
			AsCon(4 < 3, "getnamecallmethod", "Getting the service, gangy, hold on 🙏🔥")
		end
		if a ~= "IsA" then
			AsCon(4 < 3, "getnamecallmethod", "Couldn't get the namecallmethod")
		end
	end)

	if not a then
		AsCon(4 < 3, "getnamecallmethod", b)
	else
		if b then
			hookmetamethod(game, "__namecall", b)
		end
	end
else
	AsCon(4 < 3, "getnamecallmethod", "function is nil")
end

if placeholder["getnamecallmethod"] == nil then
	AsCon(3 < 4, "getnamecallmethod", "")
end

if getgenv().sUNCDebug["printcheckpoints"] then
	print("Past getnamecallmethod")
end

task.wait(getgenv().sUNCDebug["delaybetweentests"] or 0)

local what_the_sus = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaiddd/kawaii-sUNC/main/src/test-dependencies/dependency-2.lua"))()

if getgenv().sUNCDebug["printcheckpoints"] then
	print(",")
end

local a,b = pcall(function()
	if not debug.getstack then AsCon(4<3, "debug.setstack", "'debug.getstack' is needed in order to test") end
	local function BUBONIC() return "RUUN" end
	local m = debug.getstack(1)
	-- table.foreach(m, print)
end)

if not a then
	AsCon(4<3, "debug.setstack", b)
end

if placeholder["debug.setstack"] == nil then
	AsCon(4<3, "debug.setstack", "neutral")
end

if getgenv().sUNCDebug["printcheckpoints"] then
	print("Past debug.setstack[1]")
end

task.wait(getgenv().sUNCDebug["delaybetweentests"] or 0)

local a, b = pcall(function()
	if checkcaller then
		if placeholder["hookmetamethod"] ~= false then
			local old
			local good
			local uhh
			local self
            local index
			local newindex
			-- ts false negative is pmoing me so i switched to newindex
			old = hookmetamethod(game, "__newindex", function(...)
				self,index,newindex = ...
				if good == nil then
					good = checkcaller()
					if good == true and getgenv().sUNCDebug["printcheckpoints"] then
						uhh = getcallingscript()
					end
				end
				return old(...)
			end)
			task.wait(0.07)
			hookmetamethod(game, "__newindex", old)
			if good then
                print("Checkcaller DEBUG:", uhh, self, index, newindex)
				AsCon(4 < 3, "checkcaller", "Very true, very pro return true checkcaller 👀🔥💲💯")
			end
		else
			AsCon(4 < 3, "checkcaller", "Can't test due to 'hookmetamethod' not working")
		end
	else
		AsCon(4 < 3, "checkcaller", "function is nil")
	end
end)

if getgenv().sUNCDebug["printcheckpoints"] then
	print("Past checkcaller[1]")
end

task.wait(getgenv().sUNCDebug["delaybetweentests"] or 0)

local a, b = pcall(function()
	if hookfunction then
		local old
		local realmoment = nil
		local executed = false
		local somethingself
		local index
		old = hookfunction(getrawmetatable(game).__index, function(...)
			if not executed then
				somethingself, index = ...
				realmoment = checkcaller()
				executed = true
			end
			return old(...)
		end)
		local a = 10
		repeat
			a -= 1
			task.wait(0.1)
		until executed and not realmoment or a <= 0
		hookfunction(getrawmetatable(game).__index, old)
		if realmoment then
			if getgenv().sUNCDebug["printcheckpoints"] then
				print("Checkcaller DEBUG:", somethingself, index)
			end
			AsCon(4 < 3, "checkcaller", "Very true, very pro return true checkcaller \xf0\x9f\x91\x80 [2]")
		end
		--------------------------------------------------------------------------------------
		
		if getgenv().sUNCDebug["printcheckpoints"] then
			print("Past section1CC")
		end

		local old
		local realmoment = nil
		local executed = false
		old = hookfunction(getrawmetatable(game).__index, function(...)
			if not executed then
				realmoment = checkcaller()
				executed = true
			end
			return old(...)
		end)
		local _ = game.Players
		local a = 10
		repeat
			a -= 1
			task.wait(0.1)
		until executed or a <= 0
		hookfunction(getrawmetatable(game).__index, old)
		if not realmoment then
			AsCon(4 < 3, "checkcaller", "Couldn't retrieve true when calling from executor")
		end
	else
		AsCon(4<3, "checkcaller", "hookfunction is needed in order to test")
	end
	--------------------------------------------------------------------------------------

	if getgenv().sUNCDebug["printcheckpoints"] then
		print("Past section2CC")
	end

	if not checkcaller() then
		AsCon(4 < 3, "checkcaller", "Returned false when executed in the main thread")
	end

	if not coroutine.wrap(function()
		return checkcaller()
	end)() then
		AsCon(4 < 3, "checkcaller", "Returned false when executed in an exec-made thread[1]")
	end

	if not select(
		2,
		coroutine.resume(task.spawn(function()
			task.wait()
			return checkcaller()
		end))
	) then
		AsCon(4 < 3, "checkcaller", "Returned false when executed in an exec-made thread[2]")
	end

	if not getthreadidentity then
		AsCon(4<3, "checkcaller", "getthreadidentity is needed in order to test")
	end

	if not setthreadidentity or not getthreadidentity then
		AsCon(4<3, "checkcaller", "setthreadidentity/getthreadidentity is needed in order to test")
	end

	local decisive = false
	local oldidentity = getthreadidentity()
	for _, v in { -0, 0, 8, math.huge } do
		setthreadidentity(v)
		decisive = decisive or not checkcaller()
	end
	if decisive then
		AsCon(4 < 3, "checkcaller", "Didn't return true regardless of thread's identity")
	end
	setthreadidentity(oldidentity)
end)

if not a then
	AsCon(4 < 3, "checkcaller", b)
end

if placeholder["checkcaller"] == nil then
	AsCon(3 < 4, "checkcaller", "")
end

if getgenv().sUNCDebug["printcheckpoints"] then
	print("Past checkcaller[2]")
end

task.wait(getgenv().sUNCDebug["delaybetweentests"] or 0)

local a, b = pcall(function()
	local boom = 3
	local ookok = "real"
	local potatopride = function(...)
		boom = "ookok"
		ookok = "boom"
		return ookok
	end

	local info = debug.getinfo(potatopride)
	if info.nups ~= 2 then
		AsCon(4 < 3, "debug.getinfo", "Didn't return the correct value for 'nups' ")
	end
end)

if not a then
	AsCon(4 < 3, "debug.getinfo", b)
end

if placeholder["debug.getinfo"] == nil then
	AsCon(4<3, "debug.getinfo", "neutral")
end

task.wait(getgenv().sUNCDebug["delaybetweentests"] or 0)

local a,b = pcall(function()
	if filtergc then
		local function boomsonice2() return "YOU", "PMO", "ME" end
		local mm = filtergc('function', { Name = "boomsonice2", IgnoreExecutor = false })
		local fnd = false; local fnc
		for i,v in pairs(mm) do
			if v == boomsonice2 then
				fnd = true
				fnc = v
			end
		end

		if not fnd or not fnc then
			AsCon(4<3, "filtergc", "[IgnoreExec] Couldn't find an executor function while 'IgnoreExecutor' is set to false")
		end


		local function aaandsuspicious() local mmm = 0; mmm += 3  local sus = 0; sus += 1 game.Players.Lovre:PMO() end
		local mm = filtergc("function", {Constants = {"Lovre", "PMO", 1, 3}, IgnoreExecutor = false})
		local fnd = false
		for i,v in pairs(mm) do
			if v == aaandsuspicious then
				fnd = true
			end
		end
		if not fnd then
			AsCon(4<3, "filtergc", "[CONSTANTS] Failed to find a function with wanted constants")
		end


		local up1 = 0
		local up2 = 5
		local up3 = 22
		local function wowcoolsus() up1+=1; up2+=2; up3 += 0 return "Brah" end
		local mm = filtergc("function", {Upvalues = {5, 0, 22}, IgnoreExecutor = false})
		local fnd = false
		local fnc
		for i,v in pairs(mm) do
			if v == wowcoolsus then
				fnd = true
				fnc = v
			end
		end
		if not fnd then
			AsCon(4<3, "filtergc", "[UPVALS] Returned function didn't match with expected")
		end
		fnc()
		if up1 ~= 1 or up2 ~= 7 or up3 ~= 22 then
			AsCon(4<3, "filtergc", "[UPVALS] Return function had an incorrect behavior[3]")
		end

		local waw = false
		local newthing = function() waw = true return "Limbo" end
		local hash = getfunctionhash(newthing)
		local mm = filtergc("function", {Hash = hash, IgnoreExecutor = false})
		local fnd = false; local fnc
		for i,v in pairs(mm) do
			if getfunctionhash(v) == hash then
				if v == newthing then
					fnd = true
					fnc = v
				end
			end
		end
		if not fnc then
			AsCon(4<3, "filtergc", "[HASH] Couldn't find the expected function")
		end
		if not fnd then
			AsCon(4<3, "filtergc", "[HASH] Returned function's hash didn't match back with original")
		end

		fnc()
		task.wait(0.005)
		if waw == false then
			AsCon(4<3, "filtergc", "[HASH] Returned function had an incorrect behavior[2]")
		end


		local function boomsonice() end
		boomsonice()
		local mm = filtergc('function', {})
		for i, v in pairs(mm) do
			if v == boomsonice then
				AsCon(4<3, "filtergc", '[IgnoreExec] IgnoreExecutor should be true by default')
				break
			end
		end
	else
		AsCon(4<3, "filtergc", "function is nil")
	end
end)

if not a then
	AsCon(4<3, "filtergc", b)
end

if placeholder["filtergc"] == nil then
	AsCon(4<3, "filtergc", "neutral")
end

return placeholder
