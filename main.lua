--[[
	Kawaii-sUNC entry point:

		loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaiddd/kawaii-sUNC/main/main.lua"))()

	An alternative `fetchSource(path) -> source` function may be passed as the first argument
	(e.g. for offline runs); by default modules are fetched from the GitHub repository.
	All modules are downloaded concurrently, then compiled in a fixed order: metadata, the test
	factories, program, runtime.
]]

local BASE_URL = "https://raw.githubusercontent.com/Kaiddd/kawaii-sUNC/main/"
local MAX_CONCURRENT_DOWNLOADS = 16

local fetchSource = (...) or function(path)
	return game:HttpGet(BASE_URL .. path)
end

-- Test modules, in the order the program runs them.
local TEST_NAMES = {
	"cache.invalidate",
	"cache.iscached",
	"cache.replace",
	"getcallbackvalue",
	"getscriptclosure",
	"cloneref",
	"compareinstances",
	"getrenv",
	"firesignal",
	"base64encode",
	"base64decode",
	"lz4compress",
	"lz4decompress",
	"getgc",
	"getgenv",
	"getloadedmodules",
	"setrawmetatable",
	"getrunningscripts",
	"getscripts",
	"getscriptfromthread",
	"getsenv",
	"debug.getproto",
	"debug.getconstant",
	"debug.getupvalue",
	"debug.setupvalue",
	"debug.getprotos",
	"debug.getupvalues",
	"debug.getstack",
	"debug.getinfo",
	"debug.getconstants",
	"debug.setconstant",
	"getfunctionhash",
	"filtergc",
	"replicatesignal",
	"hookfunction",
	"clonefunction",
	"restorefunction",
	"iscclosure",
	"isexecutorclosure",
	"firetouchinterest",
	"islclosure",
	"newcclosure",
	"getscripthash",
	"setreadonly",
	"request",
	"fireclickdetector",
	"fireproximityprompt",
	"getconnections",
	"gethiddenproperty",
	"sethiddenproperty",
	"getinstances",
	"getnilinstances",
	"setscriptable",
	"isscriptable",
	"isreadonly",
	"setthreadidentity",
	"getthreadidentity",
	"gethui",
	"getscriptbytecode",
	"getcustomasset",
	"WebSocket.connect",
	"isrenderobj",
	"isrenderobj-2",
	"getrenderproperty",
	"Drawing.new",
	"identifyexecutor",
}

local function testPath(name)
	return "src/tests/" .. name .. ".lua"
end

local modulePaths = { "src/metadata.lua" }
for _, name in ipairs(TEST_NAMES) do
	table.insert(modulePaths, testPath(name))
end
table.insert(modulePaths, "src/program.lua")
table.insert(modulePaths, "src/runtime.lua")

-- Download every module up front; one request at a time took most of the start-up time.
local downloads = {} -- path -> { ok, sourceOrError }
local nextDownload = 1
local workerCount = math.min(MAX_CONCURRENT_DOWNLOADS, #modulePaths)
local finishedWorkers = 0
local function downloadWorker()
	while nextDownload <= #modulePaths do
		local path = modulePaths[nextDownload]
		nextDownload += 1
		downloads[path] = { pcall(fetchSource, path) }
	end
	finishedWorkers += 1
end
for _ = 1, workerCount do
	task.spawn(downloadWorker)
end
while finishedWorkers < workerCount do
	task.wait()
end

local function loadModule(path)
	local ok, source = table.unpack(downloads[path])
	if not ok then
		error(source, 0)
	end
	local chunk, err = loadstring(source, "@" .. path)
	return assert(chunk, err)
end

local metadata = loadModule("src/metadata.lua")()

local testFactories = {}
for _, name in ipairs(TEST_NAMES) do
	testFactories[name] = loadModule(testPath(name))
end

metadata.__testFactories = testFactories
metadata.__programFactory = loadModule("src/program.lua")

return loadModule("src/runtime.lua")(metadata)
