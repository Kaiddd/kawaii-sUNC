--[[
	sUNC entry point:

		loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaiddd/kawaii-sUNC/main/main.lua"))()

	An alternative `fetchSource(path) -> source` function may be passed as the first argument
	(e.g. for offline runs); by default modules are fetched from the GitHub repository.
	Modules are fetched in a fixed order: metadata, the test factories, program, runtime.
]]

local BASE_URL = "https://raw.githubusercontent.com/Kaiddd/kawaii-sUNC/main/"

local fetchSource = (...) or function(path)
	return game:HttpGet(BASE_URL .. path)
end

local function loadModule(path)
	local chunk, err = loadstring(fetchSource(path), "@" .. path)
	return assert(chunk, err)
end

local metadata = loadModule("src/metadata.lua")()

local testFactories = {
	["cache.invalidate"] = loadModule("src/tests/cache.invalidate.lua"),
	["cache.iscached"] = loadModule("src/tests/cache.iscached.lua"),
	["cache.replace"] = loadModule("src/tests/cache.replace.lua"),
	getcallbackvalue = loadModule("src/tests/getcallbackvalue.lua"),
	getscriptclosure = loadModule("src/tests/getscriptclosure.lua"),
	cloneref = loadModule("src/tests/cloneref.lua"),
	compareinstances = loadModule("src/tests/compareinstances.lua"),
	getrenv = loadModule("src/tests/getrenv.lua"),
	firesignal = loadModule("src/tests/firesignal.lua"),
	base64encode = loadModule("src/tests/base64encode.lua"),
	base64decode = loadModule("src/tests/base64decode.lua"),
	lz4compress = loadModule("src/tests/lz4compress.lua"),
	lz4decompress = loadModule("src/tests/lz4decompress.lua"),
	getgc = loadModule("src/tests/getgc.lua"),
	getgenv = loadModule("src/tests/getgenv.lua"),
	getloadedmodules = loadModule("src/tests/getloadedmodules.lua"),
	setrawmetatable = loadModule("src/tests/setrawmetatable.lua"),
	getrunningscripts = loadModule("src/tests/getrunningscripts.lua"),
	getscripts = loadModule("src/tests/getscripts.lua"),
	getscriptfromthread = loadModule("src/tests/getscriptfromthread.lua"),
	getsenv = loadModule("src/tests/getsenv.lua"),
	["debug.getproto"] = loadModule("src/tests/debug.getproto.lua"),
	["debug.getconstant"] = loadModule("src/tests/debug.getconstant.lua"),
	["debug.getupvalue"] = loadModule("src/tests/debug.getupvalue.lua"),
	["debug.setupvalue"] = loadModule("src/tests/debug.setupvalue.lua"),
	["debug.getprotos"] = loadModule("src/tests/debug.getprotos.lua"),
	["debug.getupvalues"] = loadModule("src/tests/debug.getupvalues.lua"),
	["debug.getstack"] = loadModule("src/tests/debug.getstack.lua"),
	["debug.getinfo"] = loadModule("src/tests/debug.getinfo.lua"),
	["debug.getconstants"] = loadModule("src/tests/debug.getconstants.lua"),
	["debug.setconstant"] = loadModule("src/tests/debug.setconstant.lua"),
	getfunctionhash = loadModule("src/tests/getfunctionhash.lua"),
	filtergc = loadModule("src/tests/filtergc.lua"),
	replicatesignal = loadModule("src/tests/replicatesignal.lua"),
	hookfunction = loadModule("src/tests/hookfunction.lua"),
	clonefunction = loadModule("src/tests/clonefunction.lua"),
	restorefunction = loadModule("src/tests/restorefunction.lua"),
	iscclosure = loadModule("src/tests/iscclosure.lua"),
	isexecutorclosure = loadModule("src/tests/isexecutorclosure.lua"),
	firetouchinterest = loadModule("src/tests/firetouchinterest.lua"),
	islclosure = loadModule("src/tests/islclosure.lua"),
	newcclosure = loadModule("src/tests/newcclosure.lua"),
	getscripthash = loadModule("src/tests/getscripthash.lua"),
	setreadonly = loadModule("src/tests/setreadonly.lua"),
	request = loadModule("src/tests/request.lua"),
	fireclickdetector = loadModule("src/tests/fireclickdetector.lua"),
	fireproximityprompt = loadModule("src/tests/fireproximityprompt.lua"),
	getconnections = loadModule("src/tests/getconnections.lua"),
	gethiddenproperty = loadModule("src/tests/gethiddenproperty.lua"),
	sethiddenproperty = loadModule("src/tests/sethiddenproperty.lua"),
	getinstances = loadModule("src/tests/getinstances.lua"),
	getnilinstances = loadModule("src/tests/getnilinstances.lua"),
	setscriptable = loadModule("src/tests/setscriptable.lua"),
	isscriptable = loadModule("src/tests/isscriptable.lua"),
	isreadonly = loadModule("src/tests/isreadonly.lua"),
	setthreadidentity = loadModule("src/tests/setthreadidentity.lua"),
	getthreadidentity = loadModule("src/tests/getthreadidentity.lua"),
	gethui = loadModule("src/tests/gethui.lua"),
	getscriptbytecode = loadModule("src/tests/getscriptbytecode.lua"),
	getcustomasset = loadModule("src/tests/getcustomasset.lua"),
	["WebSocket.connect"] = loadModule("src/tests/WebSocket.connect.lua"),
	isrenderobj = loadModule("src/tests/isrenderobj.lua"),
	["isrenderobj-2"] = loadModule("src/tests/isrenderobj-2.lua"),
	getrenderproperty = loadModule("src/tests/getrenderproperty.lua"),
	["Drawing.new"] = loadModule("src/tests/Drawing.new.lua"),
	identifyexecutor = loadModule("src/tests/identifyexecutor.lua"),
}

metadata.__testFactories = testFactories
metadata.__programFactory = loadModule("src/program.lua")

return loadModule("src/runtime.lua")(metadata)
