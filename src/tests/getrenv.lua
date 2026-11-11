local reportResult, failureMap, failureFlag, random, warningLogger, expectedGlobals, failureDetails, environment = ...

return function()
	local function reportFailure(message)
		reportResult(false, "getrenv", message)
		if failureMap.getrenv then
			failureFlag[1] = true
		end
	end

	local globalCount = 0
	local wrongGlobalCount = false
	if not environment.getrenv()._G then
		reportFailure("Missing _G key")
	end
	for _ in environment.pairs(environment.getrenv()._G) do
		globalCount += 1
	end
	if globalCount ~= 963 then
		reportFailure("Wrong _G count")
		wrongGlobalCount = true
	end

	-- Hammers getrenv() with junk keys, four rounds per iteration.
	local function probeJunkKeys()
		for _ = 120, random(120, 450) do
			for _ = 1, 4 do
				local _ = environment.getrenv()["\213\169\234\167\133\234\157\154"]
				local _ = environment.getrenv()[" \234\153\174\234\167\133 "]
				local _ = environment.getrenv()["\234\167\133 \225\147\154\225\152\143\225\151\162\234\167\133 "]
				local _ =
					environment.getrenv()["\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133\234\167\133"]
				local _ = environment.getrenv().DockWidget
				local _ = environment.getrenv()[environment.string.rep("lI", 90)]
			end
		end
	end
	local function probeJunkKeysTwice()
		environment.task.spawn(probeJunkKeys)
		probeJunkKeys()
	end
	environment.task.delay(random(0.1, 0.4), probeJunkKeysTwice)
	probeJunkKeys()

	local renvWarnEnv = environment.getfenv(environment.getrenv().warn)
	local genvWarnEnv = environment.getfenv(environment.getgenv().warn)
	local loggerEnv = environment.getfenv(warningLogger)
	probeJunkKeys()

	local environmentMismatch = renvWarnEnv == nil
		or genvWarnEnv == nil
		or loggerEnv == nil
		or renvWarnEnv ~= genvWarnEnv
		or genvWarnEnv ~= loggerEnv
		or renvWarnEnv ~= loggerEnv
		or environment.getrenv().warn == nil
		or environment.getrenv().print == nil
	if environmentMismatch then
		reportFailure(
			"Let it go bro, please... \240\159\146\148\240\159\146\148\240\159\146\148 32 halalitos 3\204\182\204\134\204\133\204\139\204\131\205\132\205\157\205\130\205\138\205\145\204\133\204\133\204\145\204\131\205\128\204\138\204\144\204\128\204\135\204\128\204\155\204\132\204\147\204\139\204\129\205\145\204\138\204\145\204\191\205\141\205\153\204\178\204\171\204\169\204\185\205\153\204\188\205\147\204\187\204\175\204\176\204\170\205\136\204\159\204\1692\204\180\205\128\205\155\204\134\204\128\204\137\205\156 \204\181\204\155\204\148\205\130\204\145\204\143\204\189\205\134\204\189\205\140\205\139\204\191\205\145\205\130\204\141\205\139\204\139\204\129\204\138\204\142\204\128\205\160\205\132\204\128\205\131\205\138\204\152\204\174\204\188\204\169\204\164\204\152\204\166\205\153\204\159\204\151\204\164\204\172\204\168\204\178\204\175\205\136\205\136\204\179\204\170\205\135\205\156\204\157\205\133\204\150\204\167\204\165\205\154\204\152\205\149\204\169\205\150\204\186\205\150h\204\183\205\144\205\130\204\131\205\155\205\134\205\157\204\140\204\134\204\139\204\144\204\131\205\151\205\131\204\144\204\132\204\130\205\157\204\141\204\149\205\132\205\157\205\131\204\137\204\154\205\129\205\130\205\140\204\139\204\190\204\147\204\144\204\172\204\153\204\157\204\151\205\141\205\142\204\173\204\152\204\187\205\148\204\159\204\186\204\174\204\153\204\187\204\164\204\170\205\149\204\179\204\168\204\177\204\178\204\162\204\156\205\147\204\163\204\178a\204\184\204\142\205\129\204\149\204\155\205\132\205\130\204\148\204\154\204\143\204\136\205\128\205\132\205\132\204\190\204\128\205\140\204\149\204\155\204\133\205\145\204\129\205\138\204\143\204\142\204\155\205\149\204\168\204\152\205\150\204\160l\204\180\204\140\204\141\205\132\204\129\204\138\204\128\204\145\204\158\205\156\204\169\204\173\204\188\204\166\204\188\204\170\204\151\204\177\204\157\205\135\204\158\205\141\204\158\204\151\205\148\204\168\204\156\205\141\204\188\205\149\204\158\205\141\205\133\205\136\205\136\204\151\204\176\204\165\204\169\204\159\204\165\204\178\204\163\205\137\204\174\205\133a\204\182\204\147\204\142\204\155\205\130\204\149\205\152\204\142\204\140\205\138\204\149\204\129\205\130\204\135\205\157\204\133\205\157\205\129\205\144\205\151\204\140\205\131\204\140\204\130\204\135\205\139\205\152\204\189\205\129\204\141\204\191\205\128\205\134\204\138\204\143\204\134\205\151\204\129\204\129\205\138\204\143\204\131\204\141\204\190\205\152\204\140\205\134\204\155\204\174\204\171\205\156\204\153\204\179\205\141\204\157\205\141\204\166\204\158\204\174\204\162\205\137\204\173\204\165\204\185\204\157\204\157\204\178\205\142\204\173l\204\182\205\144\205\155\204\154\205\129\205\132\204\141\205\160\204\191\205\134\204\133\204\133\204\140\205\139\204\140\205\139\205\128\204\139\204\139\204\148\205\145\204\134\205\138\204\146\204\138\204\135\204\144\204\149\205\139\204\128\204\134\204\129\205\139\205\131\205\145\204\132\204\128\204\144\204\133\204\141\204\131\204\185\204\172\204\153\204\166\204\175\204\159\205\135\204\157\205\156\204\163\205\148\204\153\204\163\205\148\204\170\205\137\205\133\204\178\204\178\204\179\204\158\204\179i\204\180\204\191\204\143\204\138\204\141\204\135\205\138\204\133\205\138\204\128\204\131\204\189\204\155\205\157\205\152\205\155\204\136\204\129\205\134\205\152\205\139\205\151\205\138\204\133\205\152\204\190\204\189\204\189\204\130\205\144\204\133\205\146\204\136\204\129\205\139\204\143\205\146\205\138\204\133\205\132\205\129\204\155\205\145\205\145\204\134\205\130\204\145\204\190\205\140\204\165\205\136\204\166\204\179\204\168\205\154\204\177\205\156\205\156\205\149\204\173\204\156\204\187\204\164\204\167\205\154\204\161\204\163\204\185\205\150\204\185\204\166\204\188\204\188\204\163\205\142\204\153\205\133\204\167\205\137\204\166\204\170\204\188\204\174\205\149\204\177\204\158\204\175\205\148\204\156\205\150\204\173\204\159\205\136\204\160\205\135t\204\180\204\138\205\152\204\131\205\138\204\190\205\155\204\191\204\132\204\135\204\147\204\139\204\148\205\160\204\144\204\190\204\135\204\130\205\145\205\132\205\128\204\138\205\145\204\133\205\145\204\137\204\130\205\132\204\135\204\134\205\132\204\133\204\134\205\130\204\145\205\131\205\131\205\141\204\170\205\136\205\147\204\169\204\179\204\185\205\153\204\153\205\149\204\153\204\171\204\176\205\147\205\147\204\165\204\171\204\178\204\169\205\148\204\158\205\150\204\185\204\157\204\188\204\159\204\152\205\150\205\137\204\170o\204\180\204\141\205\140\205\146\205\145\205\139\205\144\204\130\204\154\205\129\204\155\205\160\205\157\204\131\205\151\204\138\205\146\204\129\204\145\205\129\205\151\204\129\204\154\205\160\204\179s\204\184\205\157\204\143\205\132\204\128\204\146\204\133\204\132\205\134\205\144\204\128\205\129\204\141\204\138\205\160\204\171\204\169\205\141\204\173\205\149\204\179\204\152\204\153\204\187\205\148\204\158"
		)
	end
	probeJunkKeys()

	local renv = environment.getrenv()
	local renvGlobalsName = environment.tostring(environment.getrenv()._G)
	if renvGlobalsName ~= environment.game.workspace.FreakyBox.e.Head.CollisionGroup then
		reportFailure("REAL _G moment \240\159\145\145\240\159\140\185[1]")
	elseif environment.getrenv()._G["g\208\181m"] ~= "\226\128\158" then
		reportFailure("REAL _G moment \240\159\145\145\240\159\140\185[2]")
	end

	if not environment.getrenv().shared["ok\208\181m"] then
		reportFailure("Failed to find a .shared value")
	end
	if environment.getrenv().shared.wow and environment.getrenv().shared.wow == ",m" then
		reportFailure("Shouldn't push values across different VMs")
	end

	local typeMismatch = false
	local renvDump = "\n"
	for _, expectedGlobal in environment.pairs(expectedGlobals) do
		local value = renv[expectedGlobal.name]
		local matches = value and environment.typeof(value) == expectedGlobal.expected
		local valueType = environment.typeof(value)
		local line = expectedGlobal.name .. " -> " .. valueType .. " : " .. environment.tostring(value)
		if not matches then
			line ..= "[ MISMATCH. type should be " .. expectedGlobal.expected .. ", got: " .. environment.typeof(value) .. " ] "
			reportFailure("Value/type mismatch")
			typeMismatch = true
		end
		renvDump ..= line .. "\n"
	end

	if typeMismatch then
		failureDetails.getrenv = environment.string.format(
			"\r\n\r\n\t\t\t\t\t\tThe value or types of members inside getrenv() returned a mismatch. The executor likely fakes their getrenv.\r\n\t\t\t\t\t\t\r\n\t\t\t\t\t\tgetrenv() output:\r\n\r\n\t\t\t\t\t\t%s\r\n\t\t\t\t\t\t\r\n\t\t\t\t\t",
			renvDump
		)
	end
	if wrongGlobalCount then
		failureDetails.getrenv = environment.string.format(
			"\r\n\t\t\t\t\t\r\n\t\t\t\t\t\tThe member count of getrenv()._G mismatched.\r\n\t\t\t\t\t\t\r\n\t\t\t\t\t\tExpected count: 963\r\n\r\n\t\t\t\t\t\tRetrieved count: %s\r\n\r\n\t\t\t\t\t",
			globalCount
		)
	end
end
