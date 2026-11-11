local reportResult, failureMap, failureFlag, failedTests, _packResults, _unpackResults, environment = ...

return function()
	if not environment.debug.info then
		reportResult(false, "newcclosure", "debug.info is needed in order to test")
		if failureMap.newcclosure then
			failureFlag[1] = true
		end
	end
	if not environment.clonefunction or failedTests.clonefunction then
		reportResult(false, "newcclosure", "Can't test due to 'clonefunction' not working reliably")
		if failureMap.newcclosure then
			failureFlag[1] = true
		end
	end

	local function returnsWow(_)
		return "wow"
	end
	local wrappedWow = environment.newcclosure(returnsWow)
	if returnsWow() ~= wrappedWow() then
		reportResult(false, "newcclosure", "Closure didn't return the same value as original")
		if failureMap.newcclosure then
			failureFlag[1] = true
		end
	end
	if returnsWow == wrappedWow then
		reportResult(false, "newcclosure", "Closures should differ")
		if failureMap.newcclosure then
			failureFlag[1] = true
		end
	end

	local function getRunningThread(_)
		return environment.coroutine.running()
	end
	if environment.newcclosure(getRunningThread)() ~= environment.coroutine.running() then
		reportResult(false, "newcclosure", "Bad implementation of the function, not made in C")
		if failureMap.newcclosure then
			failureFlag[1] = true
		end
	end

	-- A C closure has no line information
	local function emptyFunction(_) end
	local wrappedEmpty = environment.newcclosure(emptyFunction)
	if environment.tostring(environment.debug.info(wrappedEmpty, "l")) ~= "-1" then
		reportResult(
			false,
			"newcclosure",
			"REAL newcclosure WHAT!!! REAL ILEMENTATION \240\159\146\178\240\159\146\178\240\159\146\178 \240\159\152\130\240\159\152\130\240\159\152\130\240\159\164\163 \240\159\135\178\240\159\135\169#\204\182\204\142\204\144\204\136\205\144\204\128\205\140\204\140\205\132\205\152\204\155\204\189\204\191\204\137\204\148\204\178\205\135\204\186\205\141\205\142\204\187\204\163\204\179\204\152\205\154\205\137\204\162\204\163M\204\182\204\149\204\147\204\141\204\132\205\135\204\169\204\157\204\186\205\141\204\173\204\160\205\147\204\157\204\188\205\141\205\154a\204\182\204\189\205\144\205\145\205\157\205\131\204\142\205\131\204\191\204\143\204\145\204\145\204\190\205\142\204\178\204\160\205\135\205\137\204\160\204\157\205\141\204\171\204\177\204\151\204\172\204\178i\204\181\205\139\204\141\205\140\204\190\205\130\204\171\204\152\205\133\205\136\205\133\205\154\205\133\205\141\204\185\204\163\205\153a\204\181\204\131\205\155\204\128\204\149\205\131\204\131\204\188\205\147\205\153\204\165\204\166S\204\180\204\142\204\128\205\146\205\132\205\160\204\142\204\149\205\132\204\149\205\128\205\132\205\129\204\163\205\135\204\152\204\179a\204\184\204\148\205\129\204\130\205\139\204\130\204\189\204\128\205\146\205\132\204\143\205\136n\204\180\205\157\205\130\205\128\205\145\204\133\204\146\204\190\204\138\204\132\204\142\205\139\205\151\204\130\204\137\205\132\204\157d\204\183\205\151\204\142\205\151\204\142\205\157\204\140\205\140\204\129\204\190\204\132\204\189\204\145\204\164\205\147\205\150\204\168\204\179\205\153\204\187\204\166\204\188u\204\180\204\132\204\190\204\132\204\140\204\154\204\160\204\161\240\159\152\130S\240\159\152\130a\240\159\152\130n\240\159\152\130d\240\159\152\130u\240\159\135\178\240\159\135\169\240\159\152\130\240\159\152\130\240\159\152\130\240\159\152\130"
		)
		if failureMap.newcclosure then
			failureFlag[1] = true
		end
	end

	-- Yielding through a wrapped Lua function
	environment.task.spawn(function()
		local function echo(value, _)
			environment.task.wait()
			return value
		end
		if environment.newcclosure(echo)("meow") ~= "meow" then
			reportResult(false, "newcclosure", "Poor/no yielding implementation[1]")
			if failureMap.newcclosure then
				failureFlag[1] = true
			end
		end
	end)
	environment.task.wait()

	local yieldSucceeded = environment.pcall(function()
		local function echo(value, _)
			environment.task.wait()
			return value
		end
		environment.newcclosure(echo)("rela")
	end)
	if not yieldSucceeded then
		reportResult(false, "newcclosure", "Poor/no yielding implementation[2]")
		if failureMap.newcclosure then
			failureFlag[1] = true
		end
	end

	local errorCallReturned = false
	environment.task.spawn(function()
		environment.pcall(
			environment.newcclosure(environment.error),
			"attempt to yield across metamethod/C-call boundary"
		)
		errorCallReturned = true
	end)
	environment.task.wait()
	if not errorCallReturned then
		reportResult(false, "newcclosure", "Poor/no yielding implementation[3]")
		if failureMap.newcclosure then
			failureFlag[1] = true
		end
	end

	-- Every argument must come back unchanged through the C closure
	local roundTripValues = {
		"pmo",
		environment.game,
		environment.DateTime.now(),
		environment.Vector3.new(0, 10, 0),
		environment.RaycastParams.new(),
		environment.UDim2.new(),
		environment.buffer.create(55),
		environment.Faces.new(environment.Enum.NormalId.Front),
		environment.Instance.new("BindableEvent").Event,
	}
	local function packArguments(...)
		local _ = ...
		return environment.table.pack(...)
	end
	local roundTripFailed, roundTripError = false, nil
	for _ = 1, 50 do
		local wrapped = environment.newcclosure(packArguments)
		local ok, packed = environment.pcall(function()
			return wrapped(environment.table.unpack(roundTripValues))
		end)
		if not ok then
			roundTripFailed, roundTripError = true, packed
			break
		end
		local mismatch = false
		for key, value in environment.pairs(packed) do
			if key ~= "n" and roundTripValues[key] ~= value then
				mismatch = true
				break
			end
		end
		if mismatch then
			reportResult(false, "newcclosure", "Argument return mismatch[1]")
			if failureMap.newcclosure then
				failureFlag[1] = true
			end
		end
	end
	if roundTripFailed then
		reportResult(false, "newcclosure", roundTripError)
		if failureMap.newcclosure then
			failureFlag[1] = true
		end
	end

	-- Same checks again, wrapping clonefunction copies
	environment.task.spawn(function()
		local function echo(value, _)
			environment.task.wait()
			return value
		end
		if environment.newcclosure(environment.clonefunction(echo))("meow") ~= "meow" then
			reportResult(false, "newcclosure", "Poor/no yielding implementation[4]")
			if failureMap.newcclosure then
				failureFlag[1] = true
			end
		end
	end)
	environment.task.wait()

	local clonedYieldSucceeded = environment.pcall(function()
		local function echo(value, _)
			environment.task.wait()
			return value
		end
		environment.newcclosure(environment.clonefunction(echo))("rela")
	end)
	if not clonedYieldSucceeded then
		reportResult(false, "newcclosure", "Poor/no yielding implementation[5]")
		if failureMap.newcclosure then
			failureFlag[1] = true
		end
	end

	local clonedErrorCallReturned = false
	environment.task.spawn(function()
		environment.pcall(
			environment.newcclosure(environment.clonefunction(environment.error)),
			"attempt to yield across metamethod/C-call boundary"
		)
		clonedErrorCallReturned = true
	end)
	environment.task.wait()
	if not clonedErrorCallReturned then
		reportResult(false, "newcclosure", "Poor/no yielding implementation[6]")
		if failureMap.newcclosure then
			failureFlag[1] = true
		end
	end

	local clonedRoundTripValues = {
		"pmo",
		environment.game,
		environment.DateTime.now(),
		environment.Vector3.new(0, 10, 0),
		environment.RaycastParams.new(),
		environment.UDim2.new(),
		environment.buffer.create(55),
		environment.Faces.new(environment.Enum.NormalId.Front),
		environment.Instance.new("BindableEvent").Event,
	}
	local function packClonedArguments(...)
		local _ = ...
		return environment.table.pack(...)
	end
	local clonedRoundTripFailed, clonedRoundTripError = false, nil
	for _ = 1, 50 do
		local wrapped = environment.newcclosure(environment.clonefunction(packClonedArguments))
		local ok, packed = environment.pcall(function()
			return wrapped(environment.table.unpack(clonedRoundTripValues))
		end)
		if not ok then
			clonedRoundTripFailed, clonedRoundTripError = true, packed
			break
		end
		local mismatch = false
		for key, value in environment.pairs(packed) do
			if key ~= "n" and clonedRoundTripValues[key] ~= value then
				mismatch = true
				break
			end
		end
		if mismatch then
			reportResult(false, "newcclosure", "Argument return mismatch[2]")
			if failureMap.newcclosure then
				failureFlag[1] = true
			end
		end
	end
	if clonedRoundTripFailed then
		reportResult(false, "newcclosure", clonedRoundTripError)
		if failureMap.newcclosure then
			failureFlag[1] = true
		end
	end
end
