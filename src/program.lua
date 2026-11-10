local warningLogger, checkpointLogger, options, captured4, captured5, branchState, packResults, unpackResults, metadata, hostFactories, environment, selectArguments
warningLogger, checkpointLogger, options, captured4, captured5, branchState, packResults, unpackResults, metadata, hostFactories, environment, selectArguments = ...
return function(argument)
  local value2, values, values2, values3, values4, value3, values5, values6, values7, values8, values9, values10, value4, values11, values12, values13, values14, values15, values16, values17, values18, values19, values20, value5, values21, value6, values22, values23, values24, values25, values26, values27, values28, values29, values30, values31, values32, values33, values34, value7, warningLogger2, values35, values36, values37, values38, values39, values40, values41, values42, values43, values44, values45, values46, values47, values48, values49, values50, values51, values52, values53, values54, values55, values56, values57, values58, values59, values60, values61, values62, values63, values64, values65, values66, values67, values68, values69, values70, values71, values72, values73, callback, values74, values75, values76, values77, values78, values79, values80, values81, values82, values83, values84, values85, values86, values87, values88, values89, values90, values91, values92, value8, result, getService, value9, value10, value11, value12, value13, value14, value17, value21, values93, value22, value23, value24, value25, resultCount, resultCount2, environment2, value27, callback2, callbackResult
  value2 = nil
  value5 = nil
  value3 = nil
  argument = nil
  values93 = {}
  values93[1] = value2
  value2 = values93
  value2[1] = argument
  values5 = {}
  argument = {}
  values17 = {}
  value6 = "__index"
  values17.__index = values17
  value6 = values17
  do
    local value31, value32, value33, value34
    value31 = values17
    value32 = argument
    
    function callback(argument, argument2)
      local value3
      local setmetatable2 = environment.setmetatable
      local values = {}
      local setmetatable2Result = setmetatable2(values, value31)
      local tickResult = environment.tick()
      setmetatable2Result.start_time = tickResult
      setmetatable2Result.thread = nil
      value3 = 0
      setmetatable2Result.elapsed = 0
      local setmetatable2Result2 = setmetatable2Result
      do
        local value13, setmetatable2Result3, value14, value15
        setmetatable2Result3 = setmetatable2Result
        
        function value3(argument, argument2, argument3)
          environment.task.cancel(argument.thread)
          environment.coroutine.close(argument.thread)
          argument.thread = nil
          local value322 = value32
          local elapsed2 = setmetatable2Result3.elapsed
          value322[argument2] = elapsed2
          if not options.printtesttimetaken then
            return
          end
          warningLogger(argument2 .. " took " .. setmetatable2Result3.elapsed .. " seconds to test")
          return
        end
      end
      setmetatable2Result2.Stop = value3
      local value = "thread"
      local spawn2 = environment.task.spawn
      do
        local value16
        value16 = setmetatable2Result
        
        function value3(argument)
          local value2, start_time2, tickResult, environment2
          while true do
            if not environment.task.wait() then
              return
            end
            argument = value16
            environment2 = environment
            tickResult = environment2.tick()
            start_time2 = argument.start_time
            value2 = tickResult - start_time2
            argument.elapsed = value2
          end
        end
      end
      local spawn2Result = spawn2(value3)
      setmetatable2Result[value] = spawn2Result
      return setmetatable2Result
    end
  end
  value4 = "Start"
  value6.Start = callback
  value6 = {}
  callback = {}
  value7 = "name"
  callback.name = "warn"
  value7 = "expected"
  callback.expected = "function"
  value7 = "value"
  warningLogger2 = warningLogger
  callback.value = warningLogger2
  value4 = {}
  value7 = "name"
  value4.name = "tostring"
  value7 = "expected"
  value4.expected = "function"
  value7 = "value"
  warningLogger2 = environment.tostring
  value4[value7] = warningLogger2
  values = {}
  value7 = "name"
  values.name = "gcinfo"
  value7 = "expected"
  values.expected = "function"
  value7 = "value"
  warningLogger2 = environment.gcinfo
  values[value7] = warningLogger2
  values74 = {}
  value7 = "name"
  values74.name = "os"
  value7 = "expected"
  values74.expected = "table"
  value7 = "value"
  warningLogger2 = environment.os
  values74[value7] = warningLogger2
  values75 = {}
  value7 = "name"
  values75.name = "tick"
  value7 = "expected"
  values75.expected = "function"
  value7 = "value"
  warningLogger2 = environment.tick
  values75[value7] = warningLogger2
  values76 = {}
  value7 = "name"
  values76.name = "task"
  value7 = "expected"
  values76.expected = "table"
  value7 = "value"
  warningLogger2 = environment.task
  values76[value7] = warningLogger2
  values77 = {}
  value7 = "name"
  values77.name = "getfenv"
  value7 = "expected"
  values77.expected = "function"
  value7 = "value"
  warningLogger2 = environment.getfenv
  values77[value7] = warningLogger2
  values78 = {}
  value7 = "name"
  values78.name = "Vector2int16"
  value7 = "expected"
  values78.expected = "table"
  value7 = "value"
  warningLogger2 = environment.Vector2int16
  values78[value7] = warningLogger2
  values79 = {}
  value7 = "name"
  values79.name = "debug"
  value7 = "expected"
  values79.expected = "table"
  value7 = "value"
  warningLogger2 = environment.debug
  values79[value7] = warningLogger2
  values6 = {}
  value7 = "name"
  values6.name = "NumberSequence"
  value7 = "expected"
  values6.expected = "table"
  value7 = "value"
  warningLogger2 = environment.NumberSequence
  values6[value7] = warningLogger2
  values80 = {}
  value7 = "name"
  values80.name = "shared"
  value7 = "expected"
  values80.expected = "table"
  value7 = "value"
  warningLogger2 = environment.shared
  values80[value7] = warningLogger2
  values81 = {}
  value7 = "name"
  values81.name = "assert"
  value7 = "expected"
  values81.expected = "function"
  value7 = "value"
  warningLogger2 = environment.assert
  values81[value7] = warningLogger2
  values82 = {}
  value7 = "name"
  values82.name = "rawlen"
  value7 = "expected"
  values82.expected = "function"
  value7 = "value"
  warningLogger2 = environment.rawlen
  values82[value7] = warningLogger2
  values83 = {}
  value7 = "name"
  values83.name = "tonumber"
  value7 = "expected"
  values83.expected = "function"
  value7 = "value"
  warningLogger2 = environment.tonumber
  values83[value7] = warningLogger2
  values84 = {}
  value7 = "name"
  values84.name = "_G"
  value7 = "expected"
  values84.expected = "table"
  value7 = "value"
  warningLogger2 = environment._G
  values84[value7] = warningLogger2
  values85 = {}
  value7 = "name"
  values85.name = "vector"
  value7 = "expected"
  values85.expected = "table"
  value7 = "value"
  warningLogger2 = environment.vector
  values85[value7] = warningLogger2
  values86 = {}
  value7 = "name"
  values86.name = "elapsedTime"
  value7 = "expected"
  values86.expected = "function"
  value7 = "value"
  warningLogger2 = environment.elapsedTime
  values86[value7] = warningLogger2
  values87 = {}
  value7 = "name"
  values87.name = "ypcall"
  value7 = "expected"
  values87.expected = "function"
  value7 = "value"
  warningLogger2 = environment.ypcall
  values87[value7] = warningLogger2
  values11 = {}
  value7 = "name"
  values11.name = "coroutine"
  value7 = "expected"
  values11.expected = "table"
  value7 = "value"
  warningLogger2 = environment.coroutine
  values11[value7] = warningLogger2
  values21 = {}
  value7 = "name"
  values21.name = "DateTime"
  value7 = "expected"
  values21.expected = "table"
  value7 = "value"
  warningLogger2 = environment.DateTime
  values21[value7] = warningLogger2
  values71 = {}
  value7 = "name"
  values71.name = "NumberRange"
  value7 = "expected"
  values71.expected = "table"
  value7 = "value"
  warningLogger2 = environment.NumberRange
  values71[value7] = warningLogger2
  values88 = {}
  value7 = "name"
  values88.name = "buffer"
  value7 = "expected"
  values88.expected = "table"
  value7 = "value"
  warningLogger2 = environment.buffer
  values88[value7] = warningLogger2
  values89 = {}
  value7 = "name"
  values89.name = "PhysicalProperties"
  value7 = "expected"
  values89.expected = "table"
  value7 = "value"
  warningLogger2 = environment.PhysicalProperties
  values89[value7] = warningLogger2
  values2 = {}
  value7 = "name"
  values2.name = "version"
  value7 = "expected"
  values2.expected = "function"
  value7 = "value"
  warningLogger2 = environment.version
  values2[value7] = warningLogger2
  values64 = {}
  value7 = "name"
  values64.name = "PluginManager"
  value7 = "expected"
  values64.expected = "function"
  value7 = "value"
  warningLogger2 = environment.PluginManager
  values64[value7] = warningLogger2
  values65 = {}
  value7 = "name"
  values65.name = "Stats"
  value7 = "expected"
  values65.expected = "function"
  value7 = "value"
  warningLogger2 = environment.Stats
  values65[value7] = warningLogger2
  values66 = {}
  value7 = "name"
  values66.name = "stats"
  value7 = "expected"
  values66.expected = "function"
  value7 = "value"
  warningLogger2 = environment.stats
  values66[value7] = warningLogger2
  values7 = {}
  value7 = "name"
  values7.name = "Ray"
  value7 = "expected"
  values7.expected = "table"
  value7 = "value"
  warningLogger2 = environment.Ray
  values7[value7] = warningLogger2
  values3 = {}
  value7 = "name"
  values3.name = "NumberSequenceKeypoint"
  value7 = "expected"
  values3.expected = "table"
  value7 = "value"
  warningLogger2 = environment.NumberSequenceKeypoint
  values3[value7] = warningLogger2
  values90 = {}
  value7 = "name"
  values90.name = "Version"
  value7 = "expected"
  values90.expected = "function"
  value7 = "value"
  warningLogger2 = environment.Version
  values90[value7] = warningLogger2
  values91 = {}
  value7 = "name"
  values91.name = "Vector2"
  value7 = "expected"
  values91.expected = "table"
  value7 = "value"
  warningLogger2 = environment.Vector2
  values91[value7] = warningLogger2
  values4 = {}
  value7 = "name"
  values4.name = "UserSettings"
  value7 = "expected"
  values4.expected = "function"
  value7 = "value"
  warningLogger2 = environment.UserSettings
  values4[value7] = warningLogger2
  argument = {}
  value7 = "name"
  argument.name = "Content"
  value7 = "expected"
  argument.expected = "table"
  value7 = "value"
  warningLogger2 = environment.Content
  argument[value7] = warningLogger2
  values12 = {}
  value7 = "name"
  values12.name = "spawn"
  value7 = "expected"
  values12.expected = "function"
  value7 = "value"
  warningLogger2 = environment.spawn
  values12[value7] = warningLogger2
  values10 = {}
  value7 = "name"
  values10.name = "settings"
  value7 = "expected"
  values10.expected = "function"
  value7 = "value"
  warningLogger2 = environment.settings
  values10[value7] = warningLogger2
  values19 = {}
  value7 = "name"
  values19.name = "string"
  value7 = "expected"
  values19.expected = "table"
  value7 = "value"
  warningLogger2 = environment.string
  values19[value7] = warningLogger2
  values57 = {}
  value7 = "name"
  values57.name = "xpcall"
  value7 = "expected"
  values57.expected = "function"
  value7 = "value"
  warningLogger2 = environment.xpcall
  values57[value7] = warningLogger2
  values8 = {}
  value7 = "name"
  values8.name = "loadstring"
  value7 = "expected"
  values8.expected = "function"
  value7 = "value"
  warningLogger2 = environment.loadstring
  values8[value7] = warningLogger2
  values16 = {}
  value7 = "name"
  values16.name = "printidentity"
  value7 = "expected"
  values16.expected = "function"
  value7 = "value"
  warningLogger2 = environment.printidentity
  values16[value7] = warningLogger2
  values92 = {}
  value7 = "name"
  values92.name = "print"
  value7 = "expected"
  values92.expected = "function"
  value7 = "value"
  warningLogger2 = checkpointLogger
  values92.value = warningLogger2
  values61 = {}
  value7 = "name"
  values61.name = "delay"
  value7 = "expected"
  values61.expected = "function"
  value7 = "value"
  warningLogger2 = environment.delay
  values61[value7] = warningLogger2
  values58 = {}
  value7 = "name"
  values58.name = "Wait"
  value7 = "expected"
  values58.expected = "function"
  value7 = "value"
  warningLogger2 = environment.Wait
  values58[value7] = warningLogger2
  values72 = {}
  value7 = "name"
  values72.name = "wait"
  value7 = "expected"
  values72.expected = "function"
  value7 = "value"
  warningLogger2 = environment.wait
  values72[value7] = warningLogger2
  values18 = {}
  value7 = "name"
  values18.name = "RaycastParams"
  value7 = "expected"
  values18.expected = "table"
  value7 = "value"
  warningLogger2 = environment.RaycastParams
  values18[value7] = warningLogger2
  values15 = {}
  value7 = "name"
  values15.name = "unpack"
  value7 = "expected"
  values15.expected = "function"
  value7 = "value"
  warningLogger2 = environment.unpack
  values15[value7] = warningLogger2
  values13 = {}
  value7 = "name"
  values13.name = "TweenInfo"
  value7 = "expected"
  values13.expected = "table"
  value7 = "value"
  warningLogger2 = environment.TweenInfo
  values13[value7] = warningLogger2
  values14 = {}
  value7 = "name"
  values14.name = "ElapsedTime"
  value7 = "expected"
  values14.expected = "function"
  value7 = "value"
  warningLogger2 = environment.ElapsedTime
  values14[value7] = warningLogger2
  values24 = {}
  value7 = "name"
  values24.name = "require"
  value7 = "expected"
  values24.expected = "function"
  value7 = "value"
  warningLogger2 = environment.require
  values24[value7] = warningLogger2
  values67 = {}
  value7 = "name"
  values67.name = "Vector3"
  value7 = "expected"
  values67.expected = "table"
  value7 = "value"
  warningLogger2 = environment.Vector3
  values67[value7] = warningLogger2
  values59 = {}
  value7 = "name"
  values59.name = "time"
  value7 = "expected"
  values59.expected = "function"
  value7 = "value"
  warningLogger2 = environment.time
  values59[value7] = warningLogger2
  values62 = {}
  value7 = "name"
  values62.name = "Vector3int16"
  value7 = "expected"
  values62.expected = "table"
  value7 = "value"
  warningLogger2 = environment.Vector3int16
  values62[value7] = warningLogger2
  values9 = {}
  value7 = "name"
  values9.name = "setmetatable"
  value7 = "expected"
  values9.expected = "function"
  value7 = "value"
  warningLogger2 = environment.setmetatable
  values9[value7] = warningLogger2
  values63 = {}
  value7 = "name"
  values63.name = "next"
  value7 = "expected"
  values63.expected = "function"
  value7 = "value"
  warningLogger2 = environment.next
  values63[value7] = warningLogger2
  values73 = {}
  value7 = "name"
  values73.name = "UDim2"
  value7 = "expected"
  values73.expected = "table"
  value7 = "value"
  warningLogger2 = environment.UDim2
  values73[value7] = warningLogger2
  values68 = {}
  value7 = "name"
  values68.name = "RotationCurveKey"
  value7 = "expected"
  values68.expected = "table"
  value7 = "value"
  warningLogger2 = environment.RotationCurveKey
  values68[value7] = warningLogger2
  values69 = {}
  value7 = "name"
  values69.name = "ipairs"
  value7 = "expected"
  values69.expected = "function"
  value7 = "value"
  warningLogger2 = environment.ipairs
  values69[value7] = warningLogger2
  values70 = {}
  value7 = "name"
  values70.name = "Font"
  value7 = "expected"
  values70.expected = "table"
  value7 = "value"
  warningLogger2 = environment.Font
  values70[value7] = warningLogger2
  values60 = {}
  value7 = "name"
  values60.name = "CatalogSearchParams"
  value7 = "expected"
  values60.expected = "table"
  value7 = "value"
  warningLogger2 = environment.CatalogSearchParams
  values60[value7] = warningLogger2
  values20 = {}
  value7 = "name"
  values20.name = "rawequal"
  value7 = "expected"
  values20.expected = "function"
  value7 = "value"
  warningLogger2 = environment.rawequal
  values20[value7] = warningLogger2
  values26 = {}
  value7 = "name"
  values26.name = "Region3int16"
  value7 = "expected"
  values26.expected = "table"
  value7 = "value"
  warningLogger2 = environment.Region3int16
  values26[value7] = warningLogger2
  values34 = {}
  value7 = "name"
  values34.name = "collectgarbage"
  value7 = "expected"
  values34.expected = "function"
  value7 = "value"
  warningLogger2 = environment.collectgarbage
  values34[value7] = warningLogger2
  values27 = {}
  value7 = "name"
  values27.name = "getmetatable"
  value7 = "expected"
  values27.expected = "function"
  value7 = "value"
  warningLogger2 = environment.getmetatable
  values27[value7] = warningLogger2
  values28 = {}
  value7 = "name"
  values28.name = "Spawn"
  value7 = "expected"
  values28.expected = "function"
  value7 = "value"
  warningLogger2 = environment.Spawn
  values28[value7] = warningLogger2
  values29 = {}
  value7 = "name"
  values29.name = "PluginDrag"
  value7 = "expected"
  values29.expected = "table"
  value7 = "value"
  warningLogger2 = environment.PluginDrag
  values29[value7] = warningLogger2
  values30 = {}
  value7 = "name"
  values30.name = "Region3"
  value7 = "expected"
  values30.expected = "table"
  value7 = "value"
  warningLogger2 = environment.Region3
  values30[value7] = warningLogger2
  values31 = {}
  value7 = "name"
  values31.name = "utf8"
  value7 = "expected"
  values31.expected = "table"
  value7 = "value"
  warningLogger2 = environment.utf8
  values31[value7] = warningLogger2
  values32 = {}
  value7 = "name"
  values32.name = "Random"
  value7 = "expected"
  values32.expected = "table"
  value7 = "value"
  warningLogger2 = environment.Random
  values32[value7] = warningLogger2
  values33 = {}
  value7 = "name"
  values33.name = "CellId"
  value7 = "expected"
  values33.expected = "table"
  value7 = "value"
  warningLogger2 = environment.CellId
  values33[value7] = warningLogger2
  values35 = {}
  value7 = "name"
  values35.name = "rawset"
  value7 = "expected"
  values35.expected = "function"
  value7 = "value"
  warningLogger2 = environment.rawset
  values35[value7] = warningLogger2
  values36 = {}
  value7 = "name"
  values36.name = "PathWaypoint"
  value7 = "expected"
  values36.expected = "table"
  value7 = "value"
  warningLogger2 = environment.PathWaypoint
  values36[value7] = warningLogger2
  values37 = {}
  value7 = "name"
  values37.name = "CFrame"
  value7 = "expected"
  values37.expected = "table"
  value7 = "value"
  warningLogger2 = environment.CFrame
  values37[value7] = warningLogger2
  values38 = {}
  value7 = "name"
  values38.name = "_VERSION"
  value7 = "expected"
  values38.expected = "string"
  value7 = "value"
  warningLogger2 = environment._VERSION
  values38[value7] = warningLogger2
  values39 = {}
  value7 = "name"
  values39.name = "UDim"
  value7 = "expected"
  values39.expected = "table"
  value7 = "value"
  warningLogger2 = environment.UDim
  values39[value7] = warningLogger2
  values40 = {}
  value7 = "name"
  values40.name = "table"
  value7 = "expected"
  values40.expected = "table"
  value7 = "value"
  warningLogger2 = environment.table
  values40[value7] = warningLogger2
  values41 = {}
  value7 = "name"
  values41.name = "math"
  value7 = "expected"
  values41.expected = "table"
  value7 = "value"
  warningLogger2 = environment.math
  values41[value7] = warningLogger2
  values42 = {}
  value7 = "name"
  values42.name = "bit32"
  value7 = "expected"
  values42.expected = "table"
  value7 = "value"
  warningLogger2 = environment.bit32
  values42[value7] = warningLogger2
  values43 = {}
  value7 = "name"
  values43.name = "pcall"
  value7 = "expected"
  values43.expected = "function"
  value7 = "value"
  warningLogger2 = environment.pcall
  values43[value7] = warningLogger2
  values22 = {}
  value7 = "name"
  values22.name = "pairs"
  value7 = "expected"
  values22.expected = "function"
  value7 = "value"
  warningLogger2 = environment.pairs
  values22[value7] = warningLogger2
  values25 = {}
  value7 = "name"
  values25.name = "ColorSequenceKeypoint"
  value7 = "expected"
  values25.expected = "table"
  value7 = "value"
  warningLogger2 = environment.ColorSequenceKeypoint
  values25[value7] = warningLogger2
  values23 = {}
  value7 = "name"
  values23.name = "type"
  value7 = "expected"
  values23.expected = "function"
  value7 = "value"
  warningLogger2 = environment.type
  values23[value7] = warningLogger2
  values44 = {}
  value7 = "name"
  values44.name = "typeof"
  value7 = "expected"
  values44.expected = "function"
  value7 = "value"
  warningLogger2 = environment.typeof
  values44[value7] = warningLogger2
  values45 = {}
  value7 = "name"
  values45.name = "SharedTable"
  value7 = "expected"
  values45.expected = "table"
  value7 = "value"
  warningLogger2 = environment.SharedTable
  values45[value7] = warningLogger2
  values46 = {}
  value7 = "name"
  values46.name = "select"
  value7 = "expected"
  values46.expected = "function"
  value7 = "value"
  warningLogger2 = environment.select
  values46[value7] = warningLogger2
  values47 = {}
  value7 = "name"
  values47.name = "ColorSequence"
  value7 = "expected"
  values47.expected = "table"
  value7 = "value"
  warningLogger2 = environment.ColorSequence
  values47[value7] = warningLogger2
  values48 = {}
  value7 = "name"
  values48.name = "rawget"
  value7 = "expected"
  values48.expected = "function"
  value7 = "value"
  warningLogger2 = environment.rawget
  values48[value7] = warningLogger2
  values49 = {}
  value7 = "name"
  values49.name = "newproxy"
  value7 = "expected"
  values49.expected = "function"
  value7 = "value"
  warningLogger2 = environment.newproxy
  values49[value7] = warningLogger2
  values50 = {}
  value7 = "name"
  values50.name = "Rect"
  value7 = "expected"
  values50.expected = "table"
  value7 = "value"
  warningLogger2 = environment.Rect
  values50[value7] = warningLogger2
  values51 = {}
  value7 = "name"
  values51.name = "BrickColor"
  value7 = "expected"
  values51.expected = "table"
  value7 = "value"
  warningLogger2 = environment.BrickColor
  values51[value7] = warningLogger2
  values52 = {}
  value7 = "name"
  values52.name = "setfenv"
  value7 = "expected"
  values52.expected = "function"
  value7 = "value"
  warningLogger2 = environment.setfenv
  values52[value7] = warningLogger2
  values53 = {}
  value7 = "name"
  values53.name = "Instance"
  value7 = "expected"
  values53.expected = "table"
  value7 = "value"
  warningLogger2 = environment.Instance
  values53[value7] = warningLogger2
  values54 = {}
  value7 = "name"
  values54.name = "Axes"
  value7 = "expected"
  values54.expected = "table"
  value7 = "value"
  warningLogger2 = environment.Axes
  values54[value7] = warningLogger2
  values55 = {}
  value7 = "name"
  values55.name = "error"
  value7 = "expected"
  values55.expected = "function"
  value7 = "value"
  warningLogger2 = environment.error
  values55[value7] = warningLogger2
  values56 = {}
  value7 = "name"
  values56.name = "Faces"
  value7 = "expected"
  values56.expected = "table"
  value7 = "value"
  warningLogger2 = environment.Faces
  values56[value7] = warningLogger2
  value6[1] = callback
  value6[2] = value4
  value6[3] = values
  value6[4] = values74
  value6[5] = values75
  value6[6] = values76
  value6[7] = values77
  value6[8] = values78
  value6[9] = values79
  value6[10] = values6
  value6[11] = values80
  value6[12] = values81
  value6[13] = values82
  value6[14] = values83
  value6[15] = values84
  value6[16] = values85
  value6[17] = values86
  value6[18] = values87
  value6[19] = values11
  value6[20] = values21
  value6[21] = values71
  value6[22] = values88
  value6[23] = values89
  value6[24] = values2
  value6[25] = values64
  value6[26] = values65
  value6[27] = values66
  value6[28] = values7
  value6[29] = values3
  value6[30] = values90
  value6[31] = values91
  value6[32] = values4
  value6[33] = argument
  value6[34] = values12
  value6[35] = values10
  value6[36] = values19
  value6[37] = values57
  value6[38] = values8
  value6[39] = values16
  value6[40] = values92
  value6[41] = values61
  value6[42] = values58
  value6[43] = values72
  value6[44] = values18
  value6[45] = values15
  value6[46] = values13
  value6[47] = values14
  value6[48] = values24
  value6[49] = values67
  value6[50] = values59
  value6[51] = values62
  value6[52] = values9
  value6[53] = values63
  value6[54] = values73
  value6[55] = values68
  value6[56] = values69
  value6[57] = values70
  value6[58] = values60
  value6[59] = values20
  value6[60] = values26
  value6[61] = values34
  value6[62] = values27
  value6[63] = values28
  value6[64] = values29
  value6[65] = values30
  value6[66] = values31
  value6[67] = values32
  value6[68] = values33
  value6[69] = values35
  value6[70] = values36
  value6[71] = values37
  value6[72] = values38
  value6[73] = values39
  value6[74] = values40
  value6[75] = values41
  value6[76] = values42
  value6[77] = values43
  value6[78] = values22
  value6[79] = values25
  value6[80] = values23
  value6[81] = values44
  value6[82] = values45
  value6[83] = values46
  value6[84] = values47
  value6[85] = values48
  value6[86] = values49
  value6[87] = values50
  value6[88] = values51
  value6[89] = values52
  value6[90] = values53
  value6[91] = values54
  value6[92] = values55
  value6[93] = values56
  callback = environment.game
  value4 = callback
  getService = callback.GetService
  value9 = value4
  value10 = "TestService"
  getService = getService(value9, value10)
  callback = getService
  value4 = options
  value4 = value4.printcheckpoints
  if value4 then
    getService = checkpointLogger
    values74 = "start"
    value8 = values74
    value9 = value8
    getService(value9)
    values = environment.task
    values74 = "wait"
    values = values.wait
    getService = values
    value9 = 0.001
    getService(value9)
  end
  value4 = environment.game
  value4 = value4.CoreGui
  values74 = "sUNC_melon_result"
  values93 = value4:FindFirstChild(values74)
  value4 = values93
  if value4 then
    value4 = environment.game
    value4 = value4.CoreGui
    value4 = value4.sUNC_melon_result
    values93 = value4
    values = values93
    value4 = values93.Destroy
    getService = value4
    value9 = values93
    getService(value9)
  end
  value4 = options
  value4 = value4.printcheckpoints
  if value4 then
    getService = checkpointLogger
    value9 = "/"
    getService(value9)
    values = environment.task
    values74 = "wait"
    values = values.wait
    value8 = values
    getService = value8
    value9 = 0.001
    getService(value9)
  end
  value4 = options
  value4 = value4.printcheckpoints
  if value4 then
    getService = checkpointLogger
    value9 = "=0"
    getService(value9)
    values = environment.task
    values74 = "wait"
    getService = values.wait
    value9 = 0.001
    getService(value9)
  end
  values93 = {}
  values93[1] = value4
  value4 = values93
  
  function values(argument)
    local game2 = environment.game
    local value = game2:GetService("Stats").Network.ServerStatsItem["Data Ping"]
    return value:GetValue() / 1000
  end
  
  value4[1] = values
  values = options
  values74 = "printcheckpoints"
  values = values.printcheckpoints
  if values then
    values74 = checkpointLogger
    getService = values74
    value9 = "0"
    getService(value9)
    values74 = environment.task
    values74 = values74.wait
    getService = values74
    value9 = 0.001
    getService(value9)
  end
  values93 = {}
  values93[1] = values
  values = values93
  
  function values74(argument, argument2, argument3)
    local value2, value5, char2, result, environment2, value12
    argument3 = ""
    local length = #argument
    value2 = 1
    local value = 1
    while true do
      if length >= value2 then
        value5 = true
      else
        value5 = false
      end
      if not value5 then
        return argument3
      end
      environment2 = environment
      char2 = environment2.string.char
      result = char2(argument:byte(value2) - argument2)
      value5 = result
      value12 = argument3 .. result
      argument3 = value12
      value2 = value2 + value
    end
  end
  
  values93[1] = values74
  values74 = options
  values74 = values74.printcheckpoints
  if values74 then
    getService = checkpointLogger
    value9 = "4"
    getService(value9)
    getService = environment.task.wait
    values76 = 0.001
    value8 = 0.001
    value9 = value8
    getService(value9)
  end
  values74 = {}
  values75 = {}
  getService = checkpointLogger
  value9 = "CP1"
  getService(value9)
  values93 = {}
  values93[1] = values76
  
  function values77(argument, argument2)
    local value4, value6, value7, value32, writeu82, createResult2, value10, environment2
    local createResult = environment.buffer.create(#argument)
    environment2 = environment
    local pairs2 = environment2.pairs
    writeu82, createResult2, value10 = pairs2(argument)
    local value = writeu82
    local value2 = createResult2
    value4 = value10
    value6 = value10
    while true do
      writeu82, createResult2 = value(value2, value6)
      value7 = writeu82
      local value3 = createResult2
      value6 = nil
      if writeu82 == nil then
        value6 = true
      else
        value6 = false
      end
      if value6 then
        return createResult
      end
      value6 = value7
      value32 = value3
      environment2 = environment
      writeu82 = environment2.buffer.writeu8
      createResult2 = createResult
      value4 = value7 - 1
      writeu82(createResult, value4, value32)
    end
  end
  
  values93[1] = values77
  value8 = checkpointLogger
  getService = value8
  value9 = "CP2"
  getService(value9)
  getService = values93[1]
  values79 = {}
  values79[1] = 44
  values79[2] = 164
  values79[3] = 159
  values79[4] = 33
  values79[5] = 240
  values79[6] = 60
  values79[7] = 21
  values79[8] = 47
  values79[9] = 132
  values79[10] = 154
  values79[11] = 218
  values79[12] = 215
  values79[13] = 101
  values79[14] = 77
  values79[15] = 128
  values79[16] = 58
  values79[17] = 24
  values79[18] = 198
  values79[19] = 45
  values79[20] = 40
  values79[21] = 109
  values79[22] = 89
  values79[23] = 50
  values79[24] = 22
  values79[25] = 81
  values79[26] = 30
  values79[27] = 146
  values79[28] = 232
  values79[29] = 40
  values79[30] = 106
  values79[31] = 209
  values79[32] = 40
  value8 = values79
  value9 = value8
  getService = getService(value9)
  values77 = getService
  getService = checkpointLogger
  value9 = "CP3"
  getService(value9)
  getService = values93[1]
  values6 = {}
  values6[1] = 113
  values6[2] = 125
  values6[3] = 44
  values6[4] = 47
  values6[5] = 107
  values6[6] = 10
  values6[7] = 36
  values6[8] = 121
  values6[9] = 163
  values6[10] = 203
  values6[11] = 234
  values6[12] = 101
  values6[13] = 224
  values6[14] = 200
  values6[15] = 64
  values6[16] = 105
  values6[17] = 90
  values6[18] = 37
  values6[19] = 55
  values6[20] = 6
  values6[21] = 252
  values6[22] = 158
  values6[23] = 165
  values6[24] = 45
  values6[25] = 243
  values6[26] = 144
  values6[27] = 117
  values6[28] = 132
  values6[29] = 16
  values6[30] = 81
  values6[31] = 154
  values6[32] = 177
  value8 = values6
  value9 = value8
  getService = getService(value9)
  values78 = getService
  getService = checkpointLogger
  value9 = "CP4"
  getService(value9)
  values79 = {}
  
  function values80(argument, argument2)
    local createResult = environment.buffer.create(4)
    environment.buffer.writeu32(createResult, 0, argument)
    return createResult
  end
  
  values79.uint32 = values80
  
  function values80(argument, argument2, argument3)
    environment.buffer.writeu32(argument, 0, environment.buffer.readu32(argument, 0) + environment.buffer.readu32(argument2, 0))
    return
  end
  
  values79.uint32_add = values80
  values6 = values79
  do
    local value35
    value35 = values79
    
    function values80(argument, argument2, argument3)
      local uint32Result = value35.uint32(0)
      local writeu322 = environment.buffer.writeu32
      local lrotate2 = environment.bit32.lrotate
      local readu32Result = environment.buffer.readu32(argument, 0)
      local results = packResults(lrotate2(readu32Result, argument2))
      local unpackResults2 = unpackResults
      local resultCount = results.n
      writeu322(uint32Result, 0, unpackResults2(results, 1, resultCount))
      return uint32Result
    end
  end
  values6.rotl32_temp = values80
  values6 = values79
  do
    local value36
    value36 = values79
    
    function values80(argument, argument2, argument3)
      local uint32Result = value36.uint32(0)
      local writeu322 = environment.buffer.writeu32
      local bxor2 = environment.bit32.bxor
      local readu32Result = environment.buffer.readu32(argument, 0)
      local readu322 = environment.buffer.readu32
      local results = packResults(readu322(argument2, 0))
      local packResults2 = packResults
      local unpackResults2 = unpackResults
      local resultCount = results.n
      local packResults2Result = packResults2(bxor2(readu32Result, unpackResults2(results, 1, resultCount)))
      local unpackResults3 = unpackResults
      local resultCount2 = packResults2Result.n
      writeu322(uint32Result, 0, unpackResults3(packResults2Result, 1, resultCount2))
      return uint32Result
    end
  end
  values6.xor32_temp = values80
  values6 = values79
  do
    local value37
    value37 = values79
    
    function values80(argument, argument2, argument3)
      local uint322 = value37.uint32
      local bor2 = environment.bit32.bor
      local lshiftResult = environment.bit32.lshift(environment.buffer.readu8(argument, argument2), 0)
      local lshiftResult2 = environment.bit32.lshift(environment.buffer.readu8(argument, argument2 + 1), 8)
      local lshiftResult3 = environment.bit32.lshift(environment.buffer.readu8(argument, argument2 + 2), 16)
      local lshift2 = environment.bit32.lshift
      local readu8Result = environment.buffer.readu8(argument, argument2 + 3)
      local results = packResults(lshift2(readu8Result, 24))
      local packResults2 = packResults
      local unpackResults2 = unpackResults
      local resultCount = results.n
      local packResults2Result = packResults2(bor2(lshiftResult, lshiftResult2, lshiftResult3, unpackResults2(results, 1, resultCount)))
      local unpackResults3 = unpackResults
      local resultCount2 = packResults2Result.n
      return uint322(unpackResults3(packResults2Result, 1, resultCount2))
    end
  end
  values6.pack4 = values80
  values6 = values79
  do
    local value38
    value38 = values79
    
    function values80(argument, argument2, argument3, argument4)
      argument.key = argument2
      argument.nonce = argument3
      local fromstringResult = environment.buffer.fromstring("expand 32-byte k")
      local fromstringResult2 = fromstringResult
      local state2 = argument.state
      local pack4Result = value38.pack4(fromstringResult, 0)
      state2[1] = pack4Result
      local state3 = argument.state
      local pack4Result2 = value38.pack4(fromstringResult2, 4)
      state3[2] = pack4Result2
      local state4 = argument.state
      local pack4Result3 = value38.pack4(fromstringResult2, 8)
      state4[3] = pack4Result3
      local state5 = argument.state
      local pack4Result4 = value38.pack4(fromstringResult2, 12)
      state5[4] = pack4Result4
      local state6 = argument.state
      local pack4Result5 = value38.pack4(argument2, 0)
      state6[5] = pack4Result5
      local state7 = argument.state
      local pack4Result6 = value38.pack4(argument2, 4)
      state7[6] = pack4Result6
      local state8 = argument.state
      local pack4Result7 = value38.pack4(argument2, 8)
      state8[7] = pack4Result7
      local state9 = argument.state
      local pack4Result8 = value38.pack4(argument2, 12)
      state9[8] = pack4Result8
      local state10 = argument.state
      local pack4Result9 = value38.pack4(argument2, 16)
      state10[9] = pack4Result9
      local state11 = argument.state
      local pack4Result10 = value38.pack4(argument2, 20)
      state11[10] = pack4Result10
      local state12 = argument.state
      local pack4Result11 = value38.pack4(argument2, 24)
      state12[11] = pack4Result11
      local state13 = argument.state
      local pack4Result12 = value38.pack4(argument2, 28)
      state13[12] = pack4Result12
      local state14 = argument.state
      local uint32Result = value38.uint32(0)
      state14[13] = uint32Result
      local state15 = argument.state
      local pack4Result13 = value38.pack4(argument3, 0)
      state15[14] = pack4Result13
      local state16 = argument.state
      local pack4Result14 = value38.pack4(argument3, 4)
      state16[15] = pack4Result14
      local state17 = argument.state
      local pack4Result15 = value38.pack4(argument3, 8)
      state17[16] = pack4Result15
      return
    end
  end
  values6.init_block = values80
  values6 = values79
  do
    local value39
    value39 = values79
    
    function values80(argument, argument2, argument3)
      local state2 = argument.state
      local uint32Result = value39.uint32(argument2)
      state2[13] = uint32Result
      local state3 = argument.state
      local uint32Result2 = value39.uint32(environment.buffer.readu32(value39.pack4(argument.nonce, 0), 0) + environment.bit32.rshift(argument2, 32))
      state3[14] = uint32Result2
      return
    end
  end
  values6.block_set_counter = values80
  values6 = values79
  do
    local value40
    value40 = values79
    
    function values80(argument, argument2)
      local value7, keystream322, value8, readu32Result2, item3, keystream323, item4
      argument2 = 1
      local value = 16
      local value2 = 1
      while true do
        if argument2 <= value then
          value7 = true
        else
          value7 = false
        end
        if not value7 then
          break
        end
        value7 = argument2
        keystream322 = argument.keystream32
        item3 = argument.state[argument2]
        keystream322[argument2] = item3
        argument2 = argument2 + value2
      end
      local values = {}
      values[1] = argument2
      local values2 = values
      
      local function callback(argument, argument2, argument3, argument4, argument5, argument6)
        local value = argument2 + 1
        local value2 = argument3 + 1
        local value3 = argument4 + 1
        local value4 = argument5 + 1
        value40.uint32_add(argument[value], argument[value2])
        local rotl32_tempResult = value40.rotl32_temp(value40.xor32_temp(argument[value4], argument[value]), 16)
        argument[value4] = rotl32_tempResult
        value40.uint32_add(argument[value3], argument[value4])
        local rotl32_tempResult2 = value40.rotl32_temp(value40.xor32_temp(argument[value2], argument[value3]), 12)
        argument[value2] = rotl32_tempResult2
        value40.uint32_add(argument[value], argument[value2])
        local rotl32_tempResult3 = value40.rotl32_temp(value40.xor32_temp(argument[value4], argument[value]), 8)
        argument[value4] = rotl32_tempResult3
        value40.uint32_add(argument[value3], argument[value4])
        local rotl32_tempResult4 = value40.rotl32_temp(value40.xor32_temp(argument[value2], argument[value3]), 7)
        argument[value2] = rotl32_tempResult4
        return
      end
      
      values[1] = callback
      local value3 = 10
      local value4 = 1
      value8 = 1 - 1
      while true do
        value8 = value8 + value4
        if not (value3 >= value8) then
          break
        end
        values2[1](argument.keystream32, 0, 4, 8, 12)
        values2[1](argument.keystream32, 1, 5, 9, 13)
        values2[1](argument.keystream32, 2, 6, 10, 14)
        values2[1](argument.keystream32, 3, 7, 11, 15)
        values2[1](argument.keystream32, 0, 5, 10, 15)
        values2[1](argument.keystream32, 1, 6, 11, 12)
        values2[1](argument.keystream32, 2, 7, 8, 13)
        item4 = values2[1]
        keystream323 = argument.keystream32
        item3 = 4
        item4(keystream323, 3, 4, 9, 14)
      end
      local value5 = 16
      local value6 = 1
      value8 = 1 - 1
      while true do
        value8 = value8 + value6
        if not (value5 >= value8) then
          break
        end
        item4 = value40.uint32_add
        keystream323 = argument.keystream32[value8]
        item3 = argument.state[value8]
        item4(keystream323, item3)
      end
      local item = argument.state[13]
      local uint32_add2 = value40.uint32_add
      local uint322 = value40.uint32
      local results = packResults(uint322(1))
      local unpackResults2 = unpackResults
      local resultCount = results.n
      uint32_add2(item, unpackResults2(results, 1, resultCount))
      local readu32Result = environment.buffer.readu32(item, 0)
      readu32Result2 = readu32Result
      if readu32Result == 0 then
        readu32Result2 = true
      else
        readu32Result2 = false
      end
      if not readu32Result2 then
        return
      end
      local uint32_add3 = value40.uint32_add
      local item2 = argument.state[14]
      local uint323 = value40.uint32
      local results2 = packResults(uint323(1))
      local unpackResults3 = unpackResults
      local resultCount2 = results2.n
      uint32_add3(item2, unpackResults3(results2, 1, resultCount2))
      return
    end
  end
  values6.block_next = values80
  values6 = values79
  do
    local value41
    value41 = values79
    
    function values80(argument, argument2, argument3, argument4)
      local values = {}
      local values2 = {}
      values.keystream32 = values2
      local values3 = {}
      values.state = values3
      values.counter = 0
      values.position = 0
      value41.init_block(values, argument, argument2)
      value41.block_set_counter(values, argument3)
      values.counter = argument3
      values.position = 64
      return values
    end
  end
  values6.init_context = values80
  values6 = values79
  do
    local value42
    value42 = values79
    
    function values80(argument, argument2, argument3, argument4, argument5)
      local value, capturedValue, capturedValue2, capturedValue3, capturedValue4, capturedValue5, capturedValue6, capturedValue7, capturedValue8, capturedValue9, capturedValue10, capturedValue11, capturedValue12, capturedValue13, capturedValue14, capturedValue15, capturedValue16, capturedValue17, capturedValue18, capturedValue19, capturedValue20, capturedValue21, callbackResult
      argument5 = argument4
      argument4 = 1
      argument3 = argument3 - argument4
      value = 1
      argument5 = argument5 - value
      
      local function callback()
        local argument43, argument44, item9, capturedValue192Result, capturedValue203, capturedValue212, capturedValue152, capturedValue162, capturedValue172, unpackResults2, capturedValue183, environment2
        while 1 do
          local value2 = argument5 + value
          argument5 = value2
          if not (argument5 <= argument3) then
            return 0
          end
          local argument52 = argument5
          capturedValue = argument52
          capturedValue2 = "position"
          item9 = argument[capturedValue2]
          argument4 = item9
          capturedValue2 = 64
          local capturedValue22 = capturedValue2
          argument44 = argument4
          if not (capturedValue22 <= argument44) then
            argument4 = false
          else
            argument4 = true
          end
          argument43 = argument4
          if argument43 then
            local value422 = value42
            capturedValue2 = value422
            capturedValue3 = "block_next"
            local item8 = capturedValue2[capturedValue3]
            capturedValue2 = item8
            capturedValue2(argument)
            argument4 = "position"
            capturedValue2 = 0
            local capturedValue26 = capturedValue2
            local argument7 = argument
            local argument42 = argument4
            argument7[argument42] = capturedValue26
          end
          local values = {}
          argument4 = values
          capturedValue2 = 1
          capturedValue3 = 1
          capturedValue4 = "keystream32"
          local item = argument[capturedValue4]
          capturedValue4 = item
          local length = #capturedValue4
          capturedValue4 = length
          capturedValue5 = 1
          local value3 = capturedValue3 - capturedValue5
          capturedValue3 = value3
          
          local function callback()
            local value2, callback, result
            while 1 do
              local value = capturedValue3 + capturedValue5
              capturedValue3 = value
              if not (capturedValue3 <= capturedValue4) then
                return 0
              end
              local capturedValue32 = capturedValue3
              capturedValue6 = capturedValue32
              capturedValue7 = 0
              capturedValue8 = 3
              capturedValue9 = 1
              
              function callback()
                local capturedValue73, capturedValue92, value2, capturedValue152Result, capturedValue162, capturedValue172, environment2
                while 1 do
                  if not (capturedValue7 <= capturedValue8) then
                    capturedValue10 = false
                  else
                    capturedValue10 = true
                  end
                  if not capturedValue10 then
                    return 0
                  end
                  local capturedValue72 = capturedValue7
                  capturedValue10 = capturedValue72
                  environment2 = environment
                  local buffer2 = environment2.buffer
                  capturedValue11 = buffer2
                  capturedValue12 = "readu8"
                  local item = capturedValue11[capturedValue12]
                  capturedValue11 = item
                  local capturedValue112 = capturedValue11
                  capturedValue15 = capturedValue112
                  capturedValue11 = "keystream32"
                  local item2 = argument[capturedValue11]
                  capturedValue12 = item2
                  local item3 = capturedValue12[capturedValue6]
                  capturedValue12 = item3
                  local capturedValue122 = capturedValue12
                  capturedValue13 = capturedValue122
                  local capturedValue132 = capturedValue13
                  capturedValue16 = capturedValue132
                  local capturedValue102 = capturedValue10
                  capturedValue17 = capturedValue102
                  local capturedValue152 = capturedValue15
                  capturedValue162 = capturedValue16
                  capturedValue172 = capturedValue17
                  capturedValue152Result = capturedValue152(capturedValue162, capturedValue172)
                  capturedValue15 = capturedValue152Result
                  local capturedValue153 = capturedValue15
                  capturedValue12 = capturedValue153
                  local capturedValue123 = capturedValue12
                  local argument42 = argument4
                  local capturedValue22 = capturedValue2
                  argument42[capturedValue22] = capturedValue123
                  capturedValue12 = 1
                  local value = capturedValue2 + capturedValue12
                  capturedValue2 = value
                  capturedValue73 = capturedValue7
                  capturedValue92 = capturedValue9
                  value2 = capturedValue73 + capturedValue92
                  capturedValue7 = value2
                end
              end
              
              result = callback()
              value2 = result
              callbackResult = result
            end
          end
          
          local callbackResult2 = callback()
          callbackResult = callbackResult2
          local buffer2 = environment.buffer
          capturedValue4 = buffer2
          capturedValue5 = "writeu8"
          local item2 = capturedValue4[capturedValue5]
          capturedValue4 = item2
          local capturedValue42 = capturedValue4
          capturedValue15 = capturedValue42
          local argument22 = argument2
          capturedValue16 = argument22
          local capturedValue23 = capturedValue
          capturedValue17 = capturedValue23
          local bit322 = environment.bit32
          capturedValue2 = bit322
          capturedValue3 = "bxor"
          local item3 = capturedValue2[capturedValue3]
          capturedValue2 = item3
          local capturedValue24 = capturedValue2
          capturedValue18 = capturedValue24
          environment2 = environment
          local buffer3 = environment2.buffer
          capturedValue10 = buffer3
          capturedValue12 = "readu8"
          local item4 = capturedValue10[capturedValue12]
          capturedValue10 = item4
          local capturedValue102 = capturedValue10
          capturedValue19 = capturedValue102
          local argument23 = argument2
          capturedValue13 = argument23
          local capturedValue132 = capturedValue13
          capturedValue20 = capturedValue132
          local capturedValue25 = capturedValue
          capturedValue21 = capturedValue25
          local capturedValue192 = capturedValue19
          capturedValue203 = capturedValue20
          capturedValue212 = capturedValue21
          capturedValue192Result = capturedValue192(capturedValue203, capturedValue212)
          capturedValue19 = capturedValue192Result
          local capturedValue193 = capturedValue19
          capturedValue3 = capturedValue193
          local capturedValue32 = capturedValue3
          capturedValue13 = capturedValue32
          local capturedValue133 = capturedValue13
          capturedValue19 = capturedValue133
          capturedValue11 = "position"
          local item5 = argument[capturedValue11]
          capturedValue12 = item5
          capturedValue11 = 1
          local value4 = capturedValue12 + capturedValue11
          capturedValue12 = value4
          local item6 = argument4[capturedValue12]
          capturedValue10 = item6
          local capturedValue103 = capturedValue10
          capturedValue20 = capturedValue103
          local packResults2 = packResults
          local capturedValue182 = capturedValue18
          local capturedValue194 = capturedValue19
          local capturedValue202 = capturedValue20
          local packResults2Result = packResults2(capturedValue182(capturedValue194, capturedValue202))
          capturedValue14 = packResults2Result
          local capturedValue142 = capturedValue14
          capturedValue18 = capturedValue142
          capturedValue152 = capturedValue15
          capturedValue162 = capturedValue16
          capturedValue172 = capturedValue17
          unpackResults2 = unpackResults
          capturedValue183 = capturedValue18
          local resultCount = capturedValue18.n
          capturedValue152(capturedValue162, capturedValue172, unpackResults2(capturedValue183, 1, resultCount))
          local argument6 = argument
          capturedValue3 = argument6
          capturedValue4 = "position"
          local item7 = capturedValue3[capturedValue4]
          capturedValue5 = item7
          capturedValue6 = 1
          local value5 = capturedValue5 + capturedValue6
          capturedValue5 = value5
          argument43 = capturedValue5
          argument44 = capturedValue3
          item9 = capturedValue4
          argument44[item9] = argument43
        end
      end
      
      callbackResult = callback()
      return
    end
  end
  values6.xor = values80
  values80 = checkpointLogger
  getService = values80
  value9 = "CP5"
  getService(value9)
  values6 = values79
  do
    local value43
    value43 = values79
    
    function values80(argument, argument2, argument3, argument4)
      local value4, init_context2Result, item2, xor2, lenResult, environment2
      local length = #argument2
      local value = 1
      argument4 = 1 - 1
      while true do
        argument4 = argument4 + value
        if not (length >= argument4) then
          return
        end
        local init_context2 = value43.init_context
        local item = argument2[argument4]
        item2 = argument3[argument4]
        init_context2Result = init_context2(item, item2, 0)
        xor2 = value43.xor
        environment2 = environment
        lenResult = environment2.buffer.len(argument)
        value4 = 0
        xor2(init_context2Result, argument, lenResult, 0)
      end
    end
  end
  values6.chacha20_xor = values80
  getService = checkpointLogger
  value8 = "CP6"
  value9 = value8
  getService(value9)
  values6 = {}
  values6.__index = values6
  values93 = {}
  values93[1] = "__index"
  values80 = values93
  
  function values81(argument, argument2)
    local value4, value6, value8, value9, value10
    argument2 = 0
    local pairs2 = environment.pairs
    value8, value9, value10 = pairs2(argument)
    local value = value8
    local value2 = value9
    value4 = value10
    value6 = value10
    while true do
      value8, value9 = value(value2, value6)
      local value3 = value8
      value6 = nil
      if value8 == nil then
        value6 = true
      else
        value6 = false
      end
      if value6 then
        return argument2
      end
      value6 = value3
      value4 = 1
      argument2 = argument2 + 1
    end
  end
  
  values93[1] = values81
  values93 = {}
  values93[1] = values81
  values81 = values93
  
  function values82(argument, argument2)
    local value3, valueResult, value5
    local result = environment.type(argument)
    argument2 = result
    if result ~= "number" then
      argument2 = false
    else
      argument2 = true
    end
    if argument2 then
      return environment.tostring(argument)
    end
    local result2 = environment.type(argument)
    argument2 = result2
    if result2 ~= "string" then
      argument2 = false
    else
      argument2 = true
    end
    if argument2 then
      return environment.string.format("%q", argument)
    end
    local value = environment.type
    value5 = argument
    valueResult = value(argument)
    argument2 = valueResult
    value3 = "boolean"
    if valueResult ~= "boolean" then
      argument2 = false
    else
      argument2 = true
    end
    if argument2 then
      local tostring2 = environment.tostring
      local tostring22 = tostring2
      local value2 = argument
      return tostring2(argument)
    end
    local result3 = environment.type(argument)
    argument2 = result3
    if result3 ~= "table" then
      argument2 = false
    else
      argument2 = true
    end
    if not argument2 then
      local error2 = environment.error
      local result4 = environment.type(argument)
      argument = result4
      error2("Unsupported value type: " .. result4)
      return
    end
    return environment.serialize_table(argument)
  end
  
  values93[1] = values82
  values93 = {}
  values93[1] = values82
  values82 = values93
  
  function values83(argument, argument2)
    local result = environment.type(argument)
    argument2 = result
    if result ~= "string" then
      argument2 = false
    else
      argument2 = true
    end
    if argument2 then
      return environment.string.format("[%q]", argument)
    end
    local result2 = environment.type(argument)
    argument2 = result2
    if result2 ~= "number" then
      argument2 = false
    else
      argument2 = true
    end
    if not argument2 then
      environment.error("Only string or number keys supported")
      return
    end
    return "[" .. environment.tostring(argument) .. "]"
  end
  
  values93[1] = values83
  do
    local value44, value45 = nil, argument
    value44 = values82
    value45 = values81
    
    function values84(argument, argument2)
      local value6, value7, value8, value10, value42, insert3, values2, value12, itemResult3, environment2, value14
      local values = {}
      local insert2 = environment.table.insert
      value8 = "{\n"
      insert2(values, "{\n")
      environment2 = environment
      local pairs2 = environment2.pairs
      insert3, values2, value12 = pairs2(argument)
      local value = insert3
      value7 = values2
      value6 = value12
      local value2 = values2
      value10 = value12
      while " = " do
        insert3, values2 = value(value2, value10)
        value7 = insert3
        value6 = values2
        value8 = nil
        if insert3 == nil then
          value8 = true
        else
          value8 = false
        end
        if value8 then
          environment.table.insert(values, "}")
          local table2 = environment.table
          value7 = "concat"
          value6 = table2.concat
          return value6(values)
        end
        value10 = value7
        local value3 = value6
        local itemResult = value44[1](value7)
        environment2 = environment
        insert3 = environment2.table.insert
        values2 = values
        local itemResult2 = value45[1](value3)
        value8 = ",\n"
        local value4 = itemResult2 .. ",\n"
        value42 = value4
        local value5 = " = " .. value4
        value7 = value5
        itemResult3 = itemResult
        value14 = itemResult .. value5
        value6 = value14
        insert3(values, value14)
      end
    end
  end
  value8 = values84
  environment2 = environment
  environment2.serialize_table = value8
  values93 = {}
  values93[1] = values83
  values83 = values93
  do
    local value46
    value46 = values83
    
    function values84(argument, argument2)
      local value5, value7, value8, value9, value32, value4Result, value33, value11, result, environment2
      local values = {}
      environment2 = environment
      local pairs2 = environment2.pairs
      value4Result, value33, value11 = pairs2(argument)
      local value = value4Result
      local value2 = value33
      value5 = value11
      value7 = value11
      while true do
        value4Result, value33 = value(value2, value7)
        value8 = value4Result
        local value3 = value33
        value7 = nil
        if value4Result == nil then
          value7 = true
        else
          value7 = false
        end
        if value7 then
          return values
        end
        value7 = value8
        value32 = value3
        environment2 = environment
        local value4 = environment2.type
        value33 = value3
        value4Result = value4(value3)
        value5 = value4Result
        value9 = "table"
        if value4Result == "table" then
          value5 = true
        else
          value5 = false
        end
        if value5 then
          value9 = value46[1]
          result = value9(value32)
          value5 = result
          value32 = result
        end
        values[value8] = value32
      end
    end
  end
  values83[1] = values84
  do
    local value47
    value47 = values83
    
    function values85(argument, argument2)
      local value5, value6
      local loadstring2 = environment.loadstring
      local value = "return " .. argument
      value5, value6 = loadstring2(value)
      local value2 = value5
      argument = value6
      if value5 then
        local value2Result2 = value2()
        argument = value47[1]
        return (argument(value2Result2))
      end
      environment.error(argument)
      local value2Result = value2()
      return (value47[1](value2Result))
    end
  end
  value8 = values85
  environment2 = environment
  environment2.deserialize_table = value8
  values84 = values6
  do
    local value48
    value48 = values6
    
    function values85(argument)
      local setmetatable2 = environment.setmetatable
      local values = {}
      local values2 = {}
      values.directory = values2
      local values3 = {}
      values.buffers = values3
      return setmetatable2(values, value48)
    end
  end
  values84.new = values85
  values93 = {}
  values93[1] = values85
  values85 = values93
  values93[1] = nil
  values84 = 7
  values86 = 9
  values87 = 5
  values11 = values6
  do
    local value49, value50, value51, value52 = nil, values81, nil, nil
    value49 = values84
    value50 = values86
    value51 = values87
    value52 = values85
    
    function values21(argument, argument2, argument3, argument4)
      local value8, value9, value10, value11, value12, value13, byte3, bxor4, value14, writeu822, value18, value19, valueResult, value22, resultCount5, environment2, value27
      argument4 = nil
      value8 = nil
      local value = environment.type
      value22 = argument3
      valueResult = value(argument3)
      value9 = valueResult
      value10 = "string"
      if valueResult == "string" then
        value9 = true
      else
        value9 = false
      end
      if not value9 then
        local value5 = environment.type
        value22 = argument3
        valueResult = value5(argument3)
        value9 = valueResult
        value10 = "number"
        if valueResult == "number" then
          value9 = true
        else
          value9 = false
        end
        if not value9 then
          local value6 = environment.type
          value22 = argument3
          valueResult = value6(argument3)
          value9 = valueResult
          value10 = "table"
          if valueResult == "table" then
            value9 = true
          else
            value9 = false
          end
          if not value9 then
            local error2 = environment.error
            local value7 = environment.type
            value22 = argument3
            valueResult = value7(argument3)
            argument3 = valueResult
            value27 = "Unsupported type to write: " .. valueResult
            error2(value27)
          else
            argument4 = value51
            local serialize_table2 = environment.serialize_table
            value22 = argument3
            valueResult = serialize_table2(argument3)
            value8 = valueResult
          end
        else
          argument4 = value50
          local tostring2 = environment.tostring
          value22 = argument3
          valueResult = tostring2(argument3)
          value8 = valueResult
        end
      else
        argument4 = value49
        value8 = argument3
      end
      local value2 = #value8 + 1
      local createResult = environment.buffer.create(value2)
      environment2 = environment
      local writeu82 = environment2.buffer.writeu8
      writeu822 = writeu82
      value13 = 0
      value18 = 0
      value19 = argument4
      writeu82(createResult, 0, argument4)
      value11 = ""
      local length2 = #value8
      argument3 = length2
      value12 = 0
      if length2 > 0 then
        argument3 = true
      else
        argument3 = false
      end
      if argument3 then
        writeu822 = environment.string.char
        local bxor2 = environment.bit32.bxor
        byte3 = environment.string.byte
        value14 = 1
        local packResults2 = packResults
        local sub2 = value8.sub
        local packResults2Result = packResults2(sub2(value8, 1, 1))
        local unpackResults3 = unpackResults
        local resultCount2 = packResults2Result.n
        local result = byte3(unpackResults3(packResults2Result, 1, resultCount2))
        environment2 = environment
        bxor4 = environment2.bit32.bxor
        local item = value52[1]
        local results2 = packResults(bxor4(item, 51))
        local packResults3 = packResults
        local unpackResults4 = unpackResults
        local resultCount3 = results2.n
        local packResults3Result = packResults3(bxor2(result, unpackResults4(results2, 1, resultCount3)))
        local packResults3Result2 = packResults3Result
        local resultCount4 = packResults3Result.n
        local value3 = 3
        if not (resultCount4 < 3) then
          local item2 = packResults3Result2[value3]
        end
        value22 = unpackResults
        resultCount5 = packResults3Result2.n
        valueResult = writeu822(value22(packResults3Result2, 1, resultCount5))
        value11 = valueResult
        local length3 = #value8
        local value4 = 1
        argument3 = 2 - 1
        while true do
          argument3 = argument3 + value4
          if not (length3 >= argument3) then
            break
          end
          local bxor3 = environment.bit32.bxor
          local byte2 = environment.string.byte
          local packResults4 = packResults
          local sub3 = value8.sub
          local packResults4Result = packResults4(sub3(value8, argument3, argument3))
          local unpackResults5 = unpackResults
          resultCount5 = packResults4Result.n
          writeu822 = bxor3(byte2(unpackResults5(packResults4Result, 1, resultCount5)), value52[1])
          environment2 = environment
          value14 = environment2.string.char
          value22 = writeu822
          valueResult = value14(writeu822)
          value27 = value11 .. valueResult
          bxor4 = value27
          value11 = value27
        end
      end
      local writestring2 = environment.buffer.writestring
      local reverse2 = environment.string.reverse
      local results = packResults(reverse2(value11))
      local unpackResults2 = unpackResults
      local resultCount = results.n
      writestring2(createResult, 1, unpackResults2(results, 1, resultCount))
      local directory2 = argument.directory
      local values = {}
      values.buffer = createResult
      values.length = value2
      directory2[argument2] = values
      environment.table.insert(argument.buffers, createResult)
      return
    end
  end
  values71 = "write"
  values11.write = values21
  values11 = values6
  do
    local value53, value54, value55, value56 = nil, values86, values87, values85
    value53 = values85
    value54 = values84
    value55 = values86
    value56 = values87
    
    function values21(argument, argument2, argument3)
      local readu8Result, value4, value5, value6, item3, readstring2Result, buffer22, value10, value11, branchState2, value14, resultCount5, environment2, value19
      local item = argument.directory[argument2]
      local condition = not item
      branchState["58_157"] = 14
      if condition then
        return nil
      end
      readu8Result = environment.buffer.readu8(item.buffer, 0)
      environment2 = environment
      local readstring2 = environment2.buffer.readstring
      local buffer2 = item.buffer
      buffer22 = buffer2
      value10 = 1
      local length2 = item.length
      value5 = 1
      argument3 = length2 - 1
      value11 = argument3
      readstring2Result = readstring2(buffer2, 1, argument3)
      local value = readstring2Result
      value6 = ""
      branchState2 = branchState
      value14 = 136
      branchState2["58_157"] = 136
      local length3 = #readstring2Result
      argument2 = length3
      value4 = 0
      if length3 > 0 then
        argument2 = true
      else
        argument2 = false
      end
      if argument2 then
        readstring2Result = environment.string.char
        local bxor2 = environment.bit32.bxor
        local byte2 = environment.string.byte
        local packResults2 = packResults
        local sub2 = value.sub
        local packResults2Result = packResults2(sub2(value, 1, 1))
        local unpackResults2 = unpackResults
        local resultCount = packResults2Result.n
        value10 = byte2(unpackResults2(packResults2Result, 1, resultCount))
        environment2 = environment
        value5 = environment2.bit32.bxor
        item3 = value53[1]
        local results = packResults(value5(item3, 51))
        local packResults3 = packResults
        local unpackResults3 = unpackResults
        local resultCount2 = results.n
        local packResults3Result = packResults3(bxor2(value10, unpackResults3(results, 1, resultCount2)))
        local packResults3Result2 = packResults3Result
        local resultCount3 = packResults3Result.n
        local value2 = 3
        if not (resultCount3 < 3) then
          local item2 = packResults3Result2[value2]
        end
        buffer22 = packResults3Result2
        value14 = unpackResults
        resultCount5 = packResults3Result2.n
        branchState2 = readstring2Result(value14(packResults3Result2, 1, resultCount5))
        value6 = branchState2
        local length4 = #value
        local value3 = 1
        argument2 = 2 - 1
        while true do
          argument2 = argument2 + value3
          if not (length4 >= argument2) then
            break
          end
          readstring2Result = environment.string.char
          local bxor3 = environment.bit32.bxor
          environment2 = environment
          local byte3 = environment2.string.byte
          local packResults4 = packResults
          local sub3 = value.sub
          local packResults4Result = packResults4(sub3(value, argument2, argument2))
          local unpackResults4 = unpackResults
          local resultCount4 = packResults4Result.n
          value10 = byte3(unpackResults4(packResults4Result, 1, resultCount4))
          item3 = value53[1]
          local results2 = packResults(bxor3(value10, item3))
          buffer22 = results2
          value14 = unpackResults
          resultCount5 = results2.n
          branchState2 = readstring2Result(value14(results2, 1, resultCount5))
          value19 = value6 .. branchState2
          value6 = value19
        end
      end
      local reverseResult = environment.string.reverse(value6)
      argument2 = reverseResult
      local reverseResult2 = reverseResult
      if readu8Result == value54 then
        argument2 = true
      else
        argument2 = false
      end
      if argument2 then
        return reverseResult2
      end
      if branchState["58_157"] ~= 136 then
        readu8Result = nil
        return nil
      end
      if readu8Result == value55 then
        argument2 = true
      else
        argument2 = false
      end
      if argument2 then
        return environment.tonumber(reverseResult2)
      end
      if readu8Result == value56 then
        argument2 = true
      else
        argument2 = false
      end
      if argument2 then
        return environment.deserialize_table(reverseResult2)
      end
      return nil
    end
  end
  values71 = "read"
  values11.read = values21
  values11 = values6
  do
    local value57, value58, value59, value60 = nil, values84, values86, values87
    value57 = values80
    value58 = values79
    value59 = values74
    value60 = values75
    
    function values21(argument, argument2)
      local pairs3, directory3, value7, value8, value9, value10, value11, copy2, createResult22, value15, environment2
      local value = 4 + 12 * value57[1](argument.directory)
      value9 = 0
      pairs3 = environment.pairs
      directory3 = argument.directory
      copy2, createResult22, value15 = pairs3(directory3)
      local value2 = createResult22
      value8 = value15
      local value3 = copy2
      value11 = value15
      while true do
        copy2, createResult22 = value3(value2, value11)
        directory3 = copy2
        local value6 = createResult22
        value8 = nil
        if copy2 == nil then
          value8 = true
        else
          value8 = false
        end
        if value8 then
          break
        end
        value11 = directory3
        value8 = value6
        pairs3 = value6.length
        value9 = value9 + pairs3
      end
      local createResult = environment.buffer.create(value + value9)
      local createResult2 = createResult
      local writeu322 = environment.buffer.writeu32
      local item = value57[1]
      local directory2 = argument.directory
      local results = packResults(item(directory2))
      local unpackResults2 = unpackResults
      local resultCount = results.n
      writeu322(createResult, 0, unpackResults2(results, 1, resultCount))
      directory3 = 4
      value7 = value
      environment2 = environment
      local pairs2 = environment2.pairs
      value9 = argument.directory
      copy2, createResult22, value15 = pairs2(value9)
      value10 = createResult22
      value8 = value15
      local value4 = copy2
      local value5 = createResult22
      value11 = value15
      while true do
        value15 = value11
        copy2, createResult22 = value4(value5, value11)
        value9 = copy2
        value8 = createResult22
        value10 = nil
        if copy2 == nil then
          value10 = true
        else
          value10 = false
        end
        if value10 then
          local chacha20_xor2 = value58.chacha20_xor
          local value592 = value59
          value9 = value60
          chacha20_xor2(createResult2, value592, value9)
          return createResult2
        end
        value11 = value9
        environment.buffer.writeu32(createResult2, directory3, value9)
        environment.buffer.writeu32(createResult2, directory3 + 4, value7)
        environment.buffer.writeu32(createResult2, directory3 + 8, value8.length)
        directory3 = directory3 + 12
        environment2 = environment
        copy2 = environment2.buffer.copy
        createResult22 = createResult2
        value15 = value7
        value9 = value8.buffer
        copy2(createResult2, value7, value9)
        value10 = value8.length
        value7 = value7 + value10
      end
    end
  end
  values71 = "serialize"
  values11.serialize = values21
  values21 = checkpointLogger
  getService = values21
  values71 = "CP7"
  value8 = values71
  value9 = value8
  getService(value9)
  do
    local value61, value62, value63, value64, value65 = nil, values79, values74, values75, nil
    value61 = values79
    value62 = values77
    value63 = values78
    value64 = values74
    value65 = values75
    
    function values11(argument, argument2)
      local value5, readu82, len2, copy2, environment2
      readu82 = environment.buffer.readu8
      if readu82(argument, 0) == 1 then
        readu82 = true
      else
        readu82 = false
      end
      if not readu82 then
        return
      end
      local init_contextResult = value61.init_context(value62, value63, 0)
      local xor2 = value61.xor
      environment2 = environment
      len2 = environment2.buffer.len
      xor2(init_contextResult, argument, len2(argument), 1)
      value5 = 1
      local value = 4
      local value2 = 1
      argument2 = 1 - 1
      while true do
        argument2 = argument2 + value2
        if not (value >= argument2) then
          break
        end
        len2 = environment.buffer.create(32)
        environment2 = environment
        copy2 = environment2.buffer.copy
        copy2(len2, 0, argument, value5, 32)
        value64[argument2] = len2
        value5 = value5 + 32
      end
      local value3 = 4
      local value4 = 1
      argument2 = 1 - 1
      while true do
        argument2 = argument2 + value4
        if not (value3 >= argument2) then
          return
        end
        len2 = environment.buffer.create(12)
        environment2 = environment
        copy2 = environment2.buffer.copy
        copy2(len2, 0, argument, value5, 12)
        value65[argument2] = len2
        value5 = value5 + 12
      end
    end
  end
  values21 = environment.game
  values71 = "ReplicatedStorage"
  values21 = values21.ReplicatedStorage
  values71 = "itsjustgettingstarted"
  values21 = values21.itsjustgettingstarted
  values71 = "OnClientInvoke"
  values21.OnClientInvoke = values11
  values71 = checkpointLogger
  getService = values71
  values88 = "CP9"
  value8 = values88
  value9 = value8
  value10 = values11
  getService(value9, value10)
  
  function callback2()
    local values215, values716, item15, service3, value92, value102, value112, values216, environment2
    repeat
      local task2 = environment.task
      values71 = task2
      values88 = "wait"
      local item = values71[values88]
      values71 = item
      local values712 = values71
      getService = values712
      getService()
      local workspace2 = environment.workspace
      values21 = workspace2
      values71 = "FreakyBox"
      local item2 = values21[values71]
      values21 = item2
      values71 = "h"
      local item3 = values21[values71]
      values21 = item3
      values71 = "Left Arm"
      local item4 = values21[values71]
      values21 = item4
      values71 = "itsstarting"
      local item5 = values21[values71]
      values21 = item5
      values71 = "CFrame"
      local cFrame = environment.CFrame
      values89 = cFrame
      values2 = "new"
      local item6 = values89[values2]
      values89 = item6
      local values892 = values89
      getService = values892
      values2 = 20
      local values22 = values2
      value8 = values22
      local value82 = value8
      value9 = value82
      values64 = 420
      local values642 = values64
      value8 = values642
      local value83 = value8
      value10 = value83
      values65 = 67
      local values652 = values65
      value8 = values652
      local value84 = value8
      value11 = value84
      local service = getService(value9, value10, value11)
      getService = service
      local getService2 = getService
      values88 = getService2
      local values882 = values88
      local values212 = values21
      local values713 = values71
      values212[values713] = values882
      local task3 = environment.task
      values71 = task3
      values88 = "wait"
      local item7 = values71[values88]
      values71 = item7
      local values714 = values71
      getService = values714
      getService()
      local workspace3 = environment.workspace
      values21 = workspace3
      values71 = "FreakyBox"
      local item8 = values21[values71]
      values21 = item8
      values71 = "h"
      local item9 = values21[values71]
      values21 = item9
      values71 = "Left Arm"
      local item10 = values21[values71]
      values21 = item10
      values71 = "itsstarting"
      local item11 = values21[values71]
      values21 = item11
      values71 = "CFrame"
      environment2 = environment
      local cFrame2 = environment2.CFrame
      values89 = cFrame2
      values2 = "new"
      local item12 = values89[values2]
      values89 = item12
      local values893 = values89
      value8 = values893
      local value85 = value8
      getService = value85
      values2 = 67
      local values23 = values2
      value8 = values23
      local value86 = value8
      value9 = value86
      values64 = 350
      local values643 = values64
      value8 = values643
      local value87 = value8
      value10 = value87
      values65 = 67
      local values653 = values65
      value8 = values653
      local value88 = value8
      value11 = value88
      local getService3 = getService
      value92 = value9
      value102 = value10
      value112 = value11
      service3 = getService3(value92, value102, value112)
      getService = service3
      local getService4 = getService
      values88 = getService4
      local values883 = values88
      local values213 = values21
      local values715 = values71
      values213[values715] = values883
      values71 = 1
      item15 = values74[values71]
      values21 = item15
      values71 = nil
      local values214 = values21
      values716 = values71
      if values214 == values716 then
        values21 = false
      else
        values21 = true
      end
      values215 = values21
      if not values215 then
      else
        environment2 = environment
        local workspace4 = environment2.workspace
        values21 = workspace4
        values89 = "FreakyBox"
        local item13 = values21[values89]
        values21 = item13
        values89 = "h"
        local item14 = values21[values89]
        values21 = item14
        values89 = "Left Leg"
        item15 = values21[values89]
        values21 = item15
        values88 = "ap"
        local getAttribute = values21.GetAttribute
        values216 = values21
        local values884 = values88
        value92 = values216
        value102 = values884
        service3 = getAttribute(values216, values884)
        values716 = service3
        values21 = service3
      end
      values215 = values21
    until values215
    return 0
  end
  
  callback2 = callback2()
  value21 = callback2
  values71 = checkpointLogger
  getService = values71
  value9 = "CP10"
  getService(value9)
  values71 = environment.bit32
  values88 = "bxor"
  values71 = values71.bxor
  getService = values71
  values88 = environment.workspace
  values64 = "FreakyBox"
  values88 = values88.FreakyBox
  values64 = "h"
  values88 = values88.h
  values64 = "Left Leg"
  values88 = values88[values64]
  values2 = "ap"
  values93 = values88.GetAttribute
  value22 = values88
  value23 = values2
  values88 = values93(value22, value23)
  value9 = values88
  value10 = 118
  getService = getService(value9, value10)
  values21 = getService
  values85[1] = values21
  values21 = environment.workspace
  values71 = "FreakyBox"
  values21 = values21.FreakyBox
  values71 = "h"
  values21 = values21.h
  values71 = "Left Arm"
  values21 = values21[values71]
  values71 = "itsstarting"
  values21 = values21.itsstarting
  values71 = "CFrame"
  values89 = environment.CFrame
  values2 = "new"
  values89 = values89.new
  getService = values89
  value9 = 67
  value10 = 350
  value11 = 67
  getService = getService(value9, value10, value11)
  values88 = getService
  values21[values71] = values88
  values71 = environment.task
  values88 = "wait"
  values71 = values71.wait
  value8 = values71
  getService = value8
  getService()
  values21 = environment.workspace
  values71 = "FreakyBox"
  values21 = values21.FreakyBox
  values71 = "h"
  values21 = values21.h
  values71 = "Left Arm"
  values21 = values21[values71]
  values71 = "itsstarting"
  values21 = values21.itsstarting
  values71 = "CFrame"
  values89 = environment.CFrame
  values2 = "new"
  values89 = values89.new
  getService = values89
  values2 = 67
  value8 = values2
  value9 = value8
  value10 = 350
  values65 = 67
  value8 = values65
  value11 = value8
  getService = getService(value9, value10, value11)
  values88 = getService
  values21[values71] = values88
  values84 = options
  values86 = "printcheckpoints"
  if values84.printcheckpoints then
    value8 = checkpointLogger
    getService = value8
    value9 = "--."
    getService(value9)
    values86 = environment.task.wait
    value8 = values86
    getService = value8
    value9 = 0.001
    getService(value9)
  end
  values93 = {}
  values93[1] = values86
  values86 = values93
  values93[1] = nil
  
  function values84(argument, argument2, argument3)
    local value3, value4, value7, value8, value9
    argument3 = 0
    value3 = 1
    value4 = 0
    local value = 31
    local value2 = 1
    while true do
      if value4 <= value then
        value7 = true
      else
        value7 = false
      end
      if not value7 then
        return argument3
      end
      value7 = argument % 2
      value9 = 2
      value8 = argument2 % 2
      if value7 ~= value8 then
        value9 = true
      else
        value9 = false
      end
      if value9 then
        argument3 = argument3 + value3
      end
      argument = (argument - value7) / 2
      argument2 = (argument2 - value8) / 2
      value9 = 2
      value3 = value3 * 2
      value4 = value4 + value2
    end
  end
  
  function values87(argument, argument2, argument3)
    return (argument - argument % 2 ^ argument2) / 2 ^ argument2
  end
  
  do
    local value66, value67, value68 = nil, values77, values78
    value66 = values86
    value67 = values84
    value68 = values87
    
    function values11(...)
      local condition2, value7, select2, value8, tonumberResult2, tonumberResult3, result3
      local value = (...)
      local condition = not value66[1]
      condition2 = condition
      if condition then
        local values = {}
        local values2 = {}
        local tostringResult = environment.tostring(values)
        local tostringResult2 = environment.tostring(values2)
        local tonumberResult = environment.tonumber(tostringResult:match("0x%x+"), 16)
        tonumberResult3 = environment.tonumber(tostringResult2:match("0x%x+"), 16)
        local value6 = tonumberResult3
        tonumberResult2 = tonumberResult
        if not tonumberResult then
        else
          tonumberResult2 = value6
        end
        if tonumberResult2 then
          local value67Result = value67(tonumberResult, value6)
          value66[1] = value67Result
        else
          environment.error("Failed to extract memory address from table")
        end
      end
      local value2 = (value66[1] * 1664225 + 1013904223) % 4224967296
      value66[1] = value2
      select2 = environment.select
      tonumberResult3 = select2
      local results = packResults(...)
      local unpackResults2 = unpackResults
      local resultCount = results.n
      result3 = select2("#", unpackResults2(results, 1, resultCount))
      local value3 = result3
      if result3 ~= 0 then
        select2 = false
      else
        select2 = true
      end
      if select2 then
        local value68Result = value68(value66[1], 8)
        select2 = value68Result
        return value68Result / 16777216
      end
      value8 = 1
      if value3 ~= 1 then
        select2 = false
      else
        select2 = true
      end
      if select2 then
        local value5 = (...)
        select2 = value5
        local result2 = environment.type(value5)
        value8 = result2
        if result2 == "number" then
          value8 = false
        else
          value8 = true
        end
        if value8 then
        elseif not (select2 < 1) then
          value8 = false
        else
          value8 = true
        end
        if value8 then
        else
          value8 = select2 % 1
          if value8 == 0 then
            value8 = false
          else
            value8 = true
          end
        end
        if not value8 then
          return value66[1] % select2 + 1
        end
        environment.error("Invalid argument: must be a positive integer")
        return value66[1] % select2 + 1
      end
      if value3 ~= 2 then
        select2 = false
      else
        select2 = true
      end
      if not select2 then
        environment.error("random expects 0, 1, or 2 arguments")
        return
      end
      local selectArgumentsResult = selectArguments(1, ...)
      local selectArgumentsResult2 = selectArguments(2, ...)
      local selectArgumentsResult3 = selectArguments(3, ...)
      tonumberResult3 = environment.type(selectArgumentsResult)
      value7 = tonumberResult3
      if tonumberResult3 == "number" then
        value7 = false
      else
        value7 = true
      end
      if value7 then
      else
        local result = environment.type(selectArgumentsResult2)
        value7 = result
        if result == "number" then
          value7 = false
        else
          value7 = true
        end
      end
      if value7 then
        environment.error("Invalid arguments: must be integers with A <= B")
      end
      if not (selectArgumentsResult > selectArgumentsResult2) then
        value7 = false
      else
        value7 = true
      end
      if value7 then
      else
        value7 = selectArgumentsResult % 1
        if value7 == 0 then
          value7 = false
        else
          value7 = true
        end
      end
      if value7 then
      else
        value7 = selectArgumentsResult2 % 1
        if value7 == 0 then
          value7 = false
        else
          value7 = true
        end
      end
      if not value7 then
        return value66[1] % (selectArgumentsResult2 - selectArgumentsResult + 1) + selectArgumentsResult
      end
      local value4 = value68(value66[1], 8) / 16777216
      return selectArgumentsResult + (selectArgumentsResult2 - selectArgumentsResult) * value4
    end
  end
  values93 = {}
  values93[1] = values21
  values21 = values93
  
  function values71(argument, argument2)
    local length = #argument
    branchState["64_39"] = 27
    argument2 = length
    if length ~= 96 then
      argument2 = true
    else
      argument2 = false
    end
    if not argument2 then
      if branchState["64_39"] == 21 then
        if argument2 then
          return false
        end
        local value2 = argument
        argument = "^[0-9a-fA-F]+$"
        argument2 = not value2:match("^[0-9a-fA-F]+$")
        if not argument2 then
          argument2 = true
          return true
        else
          argument2 = false
          return false
        end
      else
        local value = argument
        argument = "^[0-9a-fA-F]+$"
        argument2 = not value:match("^[0-9a-fA-F]+$")
        if not argument2 then
          argument2 = true
          return true
        else
          argument2 = false
          return false
        end
      end
    else
      argument2 = #argument
      if argument2 ~= 64 then
        argument2 = true
      else
        argument2 = false
      end
      branchState["64_39"] = 21
      if argument2 then
        argument2 = #argument
        if argument2 ~= 128 then
          argument2 = true
        else
          argument2 = false
        end
      end
      if argument2 then
        return false
      end
      if argument:match("^[0-9a-fA-F]+$") then
        return true
      else
        return false
      end
    end
    return
  end
  
  values21[1] = values71
  values71 = environment.game
  if values71 then
    values71 = environment.game
    values2 = environment.tostring
    getService = values2
    values65 = values11
    value9 = values65
    value10 = 0
    value8 = 999
    value11 = value8
    values93 = packResults
    value22 = value9
    value23 = value10
    value24 = value11
    result = values93(value22(value23, value24))
    value22 = result.n
    value23 = 16
    if not (value22 < 16) then
      values92 = result[value23]
    end
    value23 = 56
    if not (value22 < 56) then
      values23 = result[value23]
    end
    value23 = 126
    if not (value22 < 126) then
      value5 = result[value23]
    end
    value23 = 146
    if not (value22 < 146) then
      values25 = result[value23]
    end
    value23 = 149
    if not (value22 < 149) then
      value3 = result[value23]
    end
    value23 = 161
    if not (value22 < 161) then
      values22 = result[value23]
    end
    value9 = result
    values93 = packResults
    value22 = getService
    value23 = unpackResults
    value24 = value9
    resultCount = value9.n
    result = values93(value22(value23(value24, 1, resultCount)))
    value22 = result.n
    value23 = 18
    if not (value22 < 18) then
      values92 = result[value23]
    end
    value23 = 58
    if not (value22 < 58) then
      values23 = result[value23]
    end
    value23 = 128
    if not (value22 < 128) then
      value5 = result[value23]
    end
    value23 = 148
    if not (value22 < 148) then
      values25 = result[value23]
    end
    value23 = 151
    if not (value22 < 151) then
      value3 = result[value23]
    end
    value23 = 163
    if not (value22 < 163) then
      values22 = result[value23]
    end
    values93 = values71.FindFirstChild
    value22 = values71
    value23 = unpackResults
    value24 = result
    resultCount = result.n
    values71 = values93(value22, value23(value24, 1, resultCount))
    values71 = not values71
  end
  if not values71 then
    values88 = environment.error
    getService = values88
    values89 = "YOyoyooy"
    value8 = values89
    value9 = value8
    getService = getService(value9)
    values71 = getService
  end
  value8 = values71
  environment2 = environment
  environment2.__zxc = value8
  
  function values71(argument, argument2)
    local values, value, value2, length, value3, value4, capturedValue, capturedValue2, capturedValue3, capturedValue4, capturedValue5, capturedValue6, capturedValue7, capturedValue8, value5, capturedValue9, value6, value7, capturedValue10, capturedValue11, callbackResult
    argument2 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    values = {}
    value = 0
    value2 = 1
    length = #argument
    value3 = 1
    value2 = value2 - value3
    
    local function callback()
      local capturedValue11, capturedValue22, value9, sub2Result, value10, value11, capturedValue12, capturedValue32, environment2
      while 1 do
        value9 = value2 + value3
        value2 = value9
        if not (value2 <= length) then
          return 0
        end
        local value22 = value2
        value4 = value22
        local argument3 = argument
        capturedValue = argument3
        local value42 = value4
        capturedValue3 = value42
        local value43 = value4
        capturedValue4 = value43
        local sub2 = capturedValue.sub
        capturedValue12 = capturedValue
        capturedValue32 = capturedValue3
        local capturedValue42 = capturedValue4
        value10 = capturedValue12
        value11 = capturedValue32
        sub2Result = sub2(capturedValue12, capturedValue32, capturedValue42)
        capturedValue = sub2Result
        capturedValue2 = "="
        local capturedValue9 = capturedValue
        capturedValue22 = capturedValue2
        if capturedValue9 ~= capturedValue22 then
          capturedValue = false
        else
          capturedValue = true
        end
        capturedValue11 = capturedValue
        if not capturedValue11 then
          capturedValue = 1
          capturedValue2 = 64
          capturedValue3 = 1
          local value8 = capturedValue - capturedValue3
          capturedValue = value8
          
          function value9()
            local capturedValue53, capturedValue62, value, sub2Result, capturedValue63, capturedValue72
            repeat
              value = capturedValue + capturedValue3
              capturedValue = value
              if not (capturedValue <= capturedValue2) then
                return 1
              end
              local capturedValue9 = capturedValue
              capturedValue4 = capturedValue9
              local argument3 = argument
              capturedValue5 = argument3
              local value42 = value4
              capturedValue8 = value42
              local value43 = value4
              capturedValue7 = value43
              local subResult = capturedValue5.sub(capturedValue5, capturedValue8, capturedValue7)
              capturedValue5 = subResult
              local argument22 = argument2
              capturedValue6 = argument22
              local capturedValue42 = capturedValue4
              capturedValue7 = capturedValue42
              local capturedValue43 = capturedValue4
              capturedValue8 = capturedValue43
              local sub2 = capturedValue6.sub
              capturedValue63 = capturedValue6
              capturedValue72 = capturedValue7
              sub2Result = sub2(capturedValue63, capturedValue72, capturedValue8)
              capturedValue6 = sub2Result
              local capturedValue52 = capturedValue5
              capturedValue62 = capturedValue6
              if capturedValue52 ~= capturedValue62 then
                capturedValue5 = false
              else
                capturedValue5 = true
              end
              capturedValue53 = capturedValue5
            until capturedValue53
            return 0
          end
          
          sub2Result = value9()
          callbackResult = sub2Result
          capturedValue11 = callbackResult
          capturedValue22 = 0
          if capturedValue11 == 0 then
            environment2 = environment
            local table2 = environment2.table
            capturedValue6 = table2
            capturedValue8 = "insert"
            local item = capturedValue6[capturedValue8]
            capturedValue6 = item
            local capturedValue62 = capturedValue6
            value5 = capturedValue62
            local value52 = value5
            value6 = value52
            local values2 = values
            value7 = values2
            capturedValue8 = 1
            value9 = capturedValue4 - capturedValue8
            capturedValue7 = value9
            local capturedValue72 = capturedValue7
            value5 = capturedValue72
            capturedValue11 = value5
            capturedValue22 = capturedValue11
            capturedValue10 = capturedValue11
            sub2Result = value6
            value10 = value7
            value11 = capturedValue10
            sub2Result(value10, value11)
          else
          end
        else
          capturedValue = 1
          capturedValue11 = value
          capturedValue22 = capturedValue
          value9 = capturedValue11 + capturedValue22
          value = value9
        end
      end
    end
    
    callbackResult = callback()
    value2 = {}
    length = 1
    value3 = #values
    value4 = 4
    length = length - value4
    
    local function callback2()
      local capturedValue107, resultCount3, value20, value64, value74, unpackResults4, capturedValue108, environment2
      while 0 do
        local value = length + value4
        length = value
        if not (length <= value3) then
          return 0
        end
        local length2 = length
        capturedValue = length2
        local item = values[capturedValue]
        capturedValue2 = item
        capturedValue3 = 262144
        local value8 = capturedValue2 * capturedValue3
        capturedValue2 = value8
        capturedValue5 = 1
        local value9 = capturedValue + capturedValue5
        capturedValue4 = value9
        local item2 = values[capturedValue4]
        capturedValue3 = item2
        if capturedValue3 then
        else
          capturedValue3 = 0
        end
        capturedValue4 = 4096
        local value10 = capturedValue3 * capturedValue4
        capturedValue3 = value10
        local value11 = capturedValue2 + capturedValue3
        capturedValue2 = value11
        capturedValue5 = 2
        local value12 = capturedValue + capturedValue5
        capturedValue4 = value12
        local item3 = values[capturedValue4]
        capturedValue3 = item3
        if capturedValue3 then
        else
          capturedValue3 = 0
        end
        capturedValue4 = 64
        local value13 = capturedValue3 * capturedValue4
        capturedValue3 = value13
        local value14 = capturedValue2 + capturedValue3
        capturedValue2 = value14
        capturedValue5 = 3
        local value15 = capturedValue + capturedValue5
        capturedValue4 = value15
        local item4 = values[capturedValue4]
        capturedValue3 = item4
        if capturedValue3 then
        else
          capturedValue3 = 0
        end
        local value16 = capturedValue2 + capturedValue3
        capturedValue2 = value16
        local table2 = environment.table
        capturedValue4 = table2
        capturedValue5 = "insert"
        local item5 = capturedValue4[capturedValue5]
        capturedValue4 = item5
        local capturedValue42 = capturedValue4
        value6 = capturedValue42
        local value22 = value2
        value7 = value22
        local string2 = environment.string
        capturedValue8 = string2
        capturedValue7 = "char"
        local item6 = capturedValue8[capturedValue7]
        capturedValue8 = item6
        local capturedValue82 = capturedValue8
        capturedValue10 = capturedValue82
        capturedValue8 = 65536
        local value17 = capturedValue2 / capturedValue8
        capturedValue7 = value17
        local capturedValue72 = capturedValue7
        value5 = capturedValue72
        local value52 = value5
        capturedValue11 = value52
        local packResults2 = packResults
        local capturedValue102 = capturedValue10
        local capturedValue112 = capturedValue11
        local packResults2Result = packResults2(capturedValue102(capturedValue112))
        capturedValue9 = packResults2Result
        local capturedValue92 = capturedValue9
        capturedValue10 = capturedValue92
        local value62 = value6
        local value72 = value7
        local unpackResults2 = unpackResults
        local capturedValue103 = capturedValue10
        local resultCount = capturedValue10.n
        value62(value72, unpackResults2(capturedValue103, 1, resultCount))
        local table3 = environment.table
        capturedValue4 = table3
        capturedValue5 = "insert"
        local item7 = capturedValue4[capturedValue5]
        capturedValue4 = item7
        local capturedValue43 = capturedValue4
        value5 = capturedValue43
        local value53 = value5
        value6 = value53
        local value23 = value2
        value7 = value23
        local string3 = environment.string
        capturedValue8 = string3
        capturedValue7 = "char"
        local item8 = capturedValue8[capturedValue7]
        capturedValue8 = item8
        local capturedValue83 = capturedValue8
        value5 = capturedValue83
        local value54 = value5
        capturedValue10 = value54
        capturedValue8 = 65536
        local value18 = capturedValue2 % capturedValue8
        capturedValue7 = value18
        capturedValue8 = 256
        local value19 = capturedValue7 / capturedValue8
        capturedValue7 = value19
        local capturedValue73 = capturedValue7
        capturedValue11 = capturedValue73
        local packResults3 = packResults
        local capturedValue104 = capturedValue10
        local capturedValue113 = capturedValue11
        local packResults3Result = packResults3(capturedValue104(capturedValue113))
        capturedValue9 = packResults3Result
        local capturedValue93 = capturedValue9
        capturedValue10 = capturedValue93
        local value63 = value6
        local value73 = value7
        local unpackResults3 = unpackResults
        local capturedValue105 = capturedValue10
        local resultCount2 = capturedValue10.n
        value63(value73, unpackResults3(capturedValue105, 1, resultCount2))
        local table4 = environment.table
        capturedValue4 = table4
        capturedValue5 = "insert"
        local item9 = capturedValue4[capturedValue5]
        capturedValue4 = item9
        local capturedValue44 = capturedValue4
        value5 = capturedValue44
        local value55 = value5
        value6 = value55
        local value24 = value2
        value5 = value24
        local value56 = value5
        value7 = value56
        environment2 = environment
        local string4 = environment2.string
        capturedValue8 = string4
        capturedValue7 = "char"
        local item10 = capturedValue8[capturedValue7]
        capturedValue8 = item10
        local capturedValue84 = capturedValue8
        value5 = capturedValue84
        local value57 = value5
        capturedValue10 = value57
        capturedValue8 = 256
        value20 = capturedValue2 % capturedValue8
        capturedValue7 = value20
        local capturedValue74 = capturedValue7
        value5 = capturedValue74
        local value58 = value5
        capturedValue11 = value58
        local packResults4 = packResults
        local capturedValue106 = capturedValue10
        local capturedValue114 = capturedValue11
        local packResults4Result = packResults4(capturedValue106(capturedValue114))
        capturedValue9 = packResults4Result
        local capturedValue94 = capturedValue9
        capturedValue10 = capturedValue94
        value64 = value6
        value74 = value7
        unpackResults4 = unpackResults
        capturedValue108 = capturedValue10
        capturedValue107 = capturedValue10
        resultCount3 = capturedValue107.n
        value64(value74, unpackResults4(capturedValue108, 1, resultCount3))
      end
    end
    
    callbackResult = callback2()
    length = 1
    value3 = value
    value4 = 1
    length = length - value4
    
    local function callback3()
      local value22, value5, item, capturedValue32, environment2
      while "table" do
        local value = length + value4
        length = value
        if not (length <= value3) then
          return 0
        end
        local length2 = length
        capturedValue = length2
        environment2 = environment
        local table2 = environment2.table
        capturedValue3 = table2
        capturedValue4 = "remove"
        item = capturedValue3[capturedValue4]
        capturedValue3 = item
        capturedValue32 = capturedValue3
        value22 = value2
        value5 = value22
        capturedValue32(value22)
      end
    end
    
    callbackResult = callback3()
    value3 = environment.table
    value4 = "concat"
    value3 = value3.concat
    value5 = value3
    value6 = value5
    value7 = value2
    return value6(value7)
  end
  
  values88 = options
  values89 = "printcheckpoints"
  values88 = values88.printcheckpoints
  if values88 then
    values89 = checkpointLogger
    value8 = values89
    getService = value8
    value9 = "1"
    getService(value9)
    values89 = environment.task
    values2 = "wait"
    values89 = values89.wait
    value8 = values89
    getService = value8
    value9 = 0.001
    getService(value9)
  end
  
  function values88(argument, argument2, argument3)
    local value3, value6, floor2, result, environment2
    argument3 = 0
    value3 = 0
    local value = 7
    local value2 = 1
    while true do
      if value3 <= value then
        value6 = true
      else
        value6 = false
      end
      if not value6 then
        return argument3
      end
      argument3 = argument3 + (argument % 2 + argument2 % 2) % 2 * 2 ^ value3
      argument = environment.math.floor(argument / 2)
      environment2 = environment
      floor2 = environment2.math.floor
      value6 = argument2 / 2
      result = floor2(value6)
      argument2 = result
      value3 = value3 + value2
    end
  end
  
  do
    local value69
    value69 = values88
    
    function values89(argument, argument2, argument3)
      local value, length, value2, byteResult, result, value692, byte2, insert2, packResults2Result, results, value9, unpackResults3, resultCount2, environment2
      local values = {}
      length = #argument
      value2 = 1
      value = 1 - 1
      while true do
        value = value + value2
        if not (length >= value) then
          local table2 = environment.table
          value2 = "concat"
          length = table2.concat
          return length(values)
        end
        byteResult = environment.string.byte(argument, value)
        byte2 = environment.string.byte
        result = byte2(argument2, (value - 1) % #argument2 + 1)
        insert2 = environment.table.insert
        environment2 = environment
        local char2 = environment2.string.char
        value692 = value69
        results = packResults(value692(byteResult, result))
        local packResults2 = packResults
        local unpackResults2 = unpackResults
        local resultCount = results.n
        packResults2Result = packResults2(char2(unpackResults2(results, 1, resultCount)))
        value9 = insert2
        unpackResults3 = unpackResults
        resultCount2 = packResults2Result.n
        insert2(values, unpackResults3(packResults2Result, 1, resultCount2))
      end
    end
  end
  do
    local value70, value71 = nil, values84
    value70 = values71
    value71 = values89
    
    function values2(argument, argument2, argument3)
      return value71(value70(argument), (value70(argument2)))
    end
  end
  values64 = options
  values65 = "printcheckpoints"
  values64 = values64.printcheckpoints
  if values64 then
    values65 = checkpointLogger
    getService = values65
    value9 = "2"
    getService(value9)
    values65 = environment.task
    values65 = values65.wait
    getService = values65
    value9 = 0.001
    getService(value9)
  end
  values64 = environment.buffer
  if not values64 then
    values65 = warningLogger
    getService = values65
    value8 = "Buffers are not supported on this executor[4]!"
    value9 = value8
    getService(value9)
    return
  end
  values64 = environment.buffer
  values65 = "create"
  values64 = values64.create
  if not values64 then
    values65 = warningLogger
    getService = values65
    value9 = "Buffers are not supported on this executor[3]!"
    getService(value9)
    return
  end
  getService = environment.pcall
  
  function values7(argument)
    local createResult = environment.buffer.create(400)
    environment.buffer.writestring(createResult, 0, "idk")
    environment.buffer.writei32(createResult, 66, -9)
    environment.tostring(createResult)
    return
  end
  
  value9 = values7
  getService, value9 = getService(value9)
  values64 = getService
  values65 = value9
  if not values64 then
    getService = warningLogger
    values3 = "Buffers are not supported on this executor[1]!"
    value8 = "Buffers are not supported on this executor[1]!"
    value9 = value8
    value10 = values65
    getService(value9, value10)
    return
  end
  value8 = environment.type
  getService = value8
  value8 = environment.select
  value9 = value8
  value10 = 2
  argument = environment.pcall
  value11 = argument
  
  function values12(argument)
    return environment.buffer.create(400)
  end
  
  value12 = values12
  values93 = packResults
  value22 = value11
  result = values93(value22(value12))
  value22 = result.n
  value23 = 9
  if not (value22 < 9) then
    values92 = result[value23]
  end
  value23 = 49
  if not (value22 < 49) then
    values23 = result[value23]
  end
  value23 = 119
  if not (value22 < 119) then
    value5 = result[value23]
  end
  value23 = 139
  if not (value22 < 139) then
    values25 = result[value23]
  end
  value23 = 142
  if not (value22 < 142) then
    value3 = result[value23]
  end
  value23 = 154
  if not (value22 < 154) then
    values22 = result[value23]
  end
  value11 = result
  values93 = packResults
  value22 = value9
  value23 = value10
  value24 = unpackResults
  value25 = value11
  resultCount = 1
  resultCount2 = value11.n
  result = values93(value22(value23, value24(value25, 1, resultCount2)))
  value22 = result.n
  value23 = 12
  if not (value22 < 12) then
    values92 = result[value23]
  end
  value23 = 52
  if not (value22 < 52) then
    values23 = result[value23]
  end
  value23 = 122
  if not (value22 < 122) then
    value5 = result[value23]
  end
  value23 = 142
  if not (value22 < 142) then
    values25 = result[value23]
  end
  value23 = 145
  if not (value22 < 145) then
    value3 = result[value23]
  end
  value23 = 157
  if not (value22 < 157) then
    values22 = result[value23]
  end
  value9 = result
  values93 = getService
  value22 = unpackResults
  value23 = value9
  value24 = 1
  value25 = value9.n
  values93 = values93(value22(value23, 1, value25))
  values66 = values93
  if values93 == "buffer" then
    values66 = false
  else
    values66 = true
  end
  if values66 then
    getService = warningLogger
    value9 = "Buffers are not supported on this executor[2]!"
    getService(value9)
    return
  end
  values65 = checkpointLogger
  value8 = values65
  getService = value8
  value9 = "-."
  getService(value9)
  environment2 = environment
  values7 = environment2.game
  values90 = "ReplicatedStorage"
  values93 = values7:GetService("ReplicatedStorage")
  values7 = values93
  values64 = values93
  values66 = "Let em in"
  values93 = values64.FindFirstChild
  value22 = values64
  value23 = "Let em in"
  values93 = values93(value22, "Let em in")
  values64 = values93
  if values64 then
    values64 = environment.game
    values65 = "ReplicatedStorage"
    values64 = values64.ReplicatedStorage
    values65 = "poooop"
    values64 = values64.poooop
    values93 = values64
    values65 = values93
    values64 = values93.InvokeServer
    getService = values64
    value9 = values65
    value8 = "ok u gotta change your script then im gonna make different serializer and deserializer"
    value10 = value8
    getService(value9, value10)
    values64 = environment.game
    values65 = "ReplicatedStorage"
    values64 = values64.ReplicatedStorage
    values65 = "Let em in"
    values64 = values64[values65]
    getService = environment.buffer.create
    value9 = 400
    getService = getService(value9)
    values65 = getService
    values66 = environment.identifyexecutor
    if values66 then
      values66 = environment.identifyexecutor()
    end
    values66 = values66 or "Idk"
    values7 = environment.game.ReplicatedStorage.poooop
    value8 = values7.InvokeServer
    getService = value8
    value9 = values7
    value10 = "\255\nS\002t\005a\nrt\005e\006d\002\251"
    value11 = nil
    values4 = {}
    argument = 5
    values4[5] = values66
    value8 = values4
    value12 = value8
    argument = {}
    values12 = "[\255\r]"
    values19 = environment.pcall
    value13 = values19
    
    function values57(argument)
      local game2 = environment.game
      local httpService = game2:GetService("HttpService")
      local jSONDecode = httpService.JSONDecode
      local httpService2 = httpService
      local game3 = environment.game
      local packResults2 = packResults
      local httpGet = game3.HttpGet
      local packResults2Result = packResults2(httpGet(game3, "https://api.ipify.org/?format=json"))
      local unpackResults2 = unpackResults
      local resultCount = packResults2Result.n
      jSONDecode(httpService2, unpackResults2(packResults2Result, 1, resultCount))
      return
    end
    
    value14 = values57
    result = packResults(value13(value14))
    value22 = result.n
    value23 = 6
    if not (value22 < 6) then
      values92 = result[value23]
    end
    value23 = 46
    if not (value22 < 46) then
      values23 = result[value23]
    end
    value23 = 116
    if not (value22 < 116) then
      value5 = result[value23]
    end
    value23 = 136
    if not (value22 < 136) then
      values25 = result[value23]
    end
    value23 = 139
    if not (value22 < 139) then
      value3 = result[value23]
    end
    value23 = 151
    if not (value22 < 151) then
      values22 = result[value23]
    end
    argument[1] = values12
    values12 = result.n
    values15 = 1
    values16 = 1
    
    function callback2()
      local values152, values162, value2
      while 1 do
        if not (values15 <= values12) then
          return 0
        end
        local item = result[values15]
        values18 = item
        local value = values15 + 1
        local values182 = values18
        argument[value] = values182
        values152 = values15
        values162 = values16
        value2 = values152 + values162
        values15 = value2
      end
    end
    
    callback2 = callback2()
    value21 = callback2
    value8 = argument
    value13 = value8
    values12 = nil
    value8 = values12
    value14 = value8
    values10 = {}
    values10[8] = "7"
    value8 = values10
    getService(value9, value10, value11, value12, value13, value14, value8)
    values3 = environment.buffer
    value8 = values2
    getService = value8
    value9 = "uWJxY9uoZW0fW+I="
    argument = "zhAYF77bER92NYU="
    value8 = argument
    value10 = value8
    getService = getService(value9, value10)
    getService = values3[getService]
    value9 = values65
    value8 = 0
    value10 = value8
    value8 = values66
    value11 = value8
    getService(value9, value10, value11)
    values3 = environment.buffer
    value8 = values2
    getService = value8
    value9 = "gI/ZdTFfnIM="
    value10 = "9/2wAVQ2r7E="
    getService = getService(value9, value10)
    getService = values3[getService]
    value8 = values65
    value9 = value8
    value10 = 66
    value8 = -9
    value11 = value8
    getService(value9, value10, value11)
    values7 = "Swerve, bend that corner woahhh"
    values3 = values64
    argument = values65
    values12 = nil
    values93 = values3.InvokeServer
    value25 = argument
    resultCount = values12
    if "Swerve, bend that corner woahhh" ~= values93(values3, "2ga0BtoGsgbaBrQG", nil, value25, resultCount) then
      values7 = false
    else
      values7 = true
    end
    if not values7 then
      getService = warningLogger
      value9 = "Failed to authenticate. This usually means that your exploit doesn't support sUNC. If you have any questions regarding this, let us know [discord.gg/yGNzDrvbF5]"
      getService(value9)
      environment.getgenv()["000PPP000"] = false
      environment.getgenv()["000PPP000"] = nil
      return
    end
    values7 = {}
    values3 = environment.game
    values91 = "LogService"
    values3 = values3:GetService("LogService").MessageOut
    getService = values3.Connect
    value8 = values3
    value9 = value8
    do
      local value72
      value72 = values7
      
      function values91(argument, argument2, argument3)
        local insert2 = environment.table.insert
        local value722 = value72
        local tostring2 = environment.tostring
        local results = packResults(tostring2(argument))
        local unpackResults2 = unpackResults
        local resultCount = results.n
        insert2(value722, unpackResults2(results, 1, resultCount))
        local imagineifwewerecuteandhadcutelittleskirts2 = environment.game.ReplicatedStorage.imagineifwewerecuteandhadcutelittleskirts
        local imagineifwewerecuteandhadcutelittleskirts22 = imagineifwewerecuteandhadcutelittleskirts2
        local fireServer = imagineifwewerecuteandhadcutelittleskirts2.FireServer
        local imagineifwewerecuteandhadcutelittleskirts222 = imagineifwewerecuteandhadcutelittleskirts22
        local tostring3 = environment.tostring
        local results2 = packResults(tostring3(argument))
        local unpackResults3 = unpackResults
        local resultCount2 = results2.n
        fireServer(imagineifwewerecuteandhadcutelittleskirts222, unpackResults3(results2, 1, resultCount2))
        return
      end
    end
    value8 = values91
    value10 = value8
    getService = getService(value9, value10)
    values3 = getService
    getService = checkpointLogger
    argument = environment.pcall
    value9 = argument
    
    function values12(argument)
      return environment._[0]
    end
    
    value10 = values12
    values93 = packResults
    value22 = value9
    value23 = value10
    result = values93(value22(value23))
    value22 = result.n
    value23 = 9
    if not (value22 < 9) then
      values92 = result[value23]
    end
    value23 = 49
    if not (value22 < 49) then
      values23 = result[value23]
    end
    value23 = 119
    if not (value22 < 119) then
      value5 = result[value23]
    end
    value23 = 139
    if not (value22 < 139) then
      values25 = result[value23]
    end
    value23 = 142
    if not (value22 < 142) then
      value3 = result[value23]
    end
    value23 = 154
    if not (value22 < 154) then
      values22 = result[value23]
    end
    value9 = result
    values93 = getService
    value22 = unpackResults
    value23 = value9
    value24 = 1
    value25 = value9.n
    values93(value22(value23, 1, value25))
    if environment.getgenv()["000PPP000"] then
      value8 = warningLogger
      getService = value8
      value8 = "NO NO"
      value9 = value8
      return getService(value9)
    end
    values93 = environment.getgenv()
    values93["000PPP000"] = true
    if options.printcheckpoints then
      getService = checkpointLogger
      value8 = "."
      value9 = value8
      getService(value9)
      getService = environment.task.wait
      value8 = 0.001
      value9 = value8
      getService(value9)
    end
    environment2 = environment
    value8 = environment2.pcall
    getService = value8
    do
      local value73
      value73 = value2
      
      function argument(argument)
        value73[1] = false
        return
      end
    end
    value9 = argument
    getService, value9 = getService(value9)
    values90 = getService
    values91 = value9
    values4 = not values90
    if not values4 then
      argument = nil
      values4 = value2[1]
      if values4 ~= argument then
        values4 = false
      else
        values4 = true
      end
    end
    if values4 then
      argument = warningLogger
      value8 = argument
      getService = value8
      values12 = "Encountered an error trying to get a dependency:"
      value8 = values12
      value9 = value8
      value10 = values91
      values57 = nil
      values19 = value2[1]
      if values19 == values57 then
        values19 = false
      else
        values19 = true
      end
      if values19 then
        values19 = true
        value11 = values19
        getService(value9, value10, value11)
        environment2 = environment
        argument = environment2.task
        values12 = "wait"
        argument = argument.wait
        value8 = argument
        getService = value8
        value9 = 9000000000
        return getService(value9)
      end
      if values19 then
        value11 = values19
        getService(value9, value10, value11)
        environment2 = environment
        argument = environment2.task
        values12 = "wait"
        argument = argument.wait
        value8 = argument
        getService = value8
        value9 = 9000000000
        return getService(value9)
      else
        values19 = false
        value11 = values19
        getService(value9, value10, value11)
        environment2 = environment
        argument = environment2.task
        values12 = "wait"
        argument = argument.wait
        value8 = argument
        getService = value8
        value9 = 9000000000
        return getService(value9)
      end
    else
      values93 = {}
      values93[1] = values4
      values4 = values93
      
      function argument(argument)
        local spawn2 = environment.task.spawn
        
        local function callback(argument)
          local getService
          local game2 = environment.game
          local clientLog = game2:GetService("CoreGui").DevConsoleMaster.DevConsoleWindow.DevConsoleUI.MainView.ClientLog
          local connect = environment.game.GetService(environment.game, "RunService").PreSimulation.Connect
          getService = environment.game.GetService
          local preSimulation = getService(environment.game, "RunService").PreSimulation
          do
            local value11
            value11 = clientLog
            
            function getService(argument)
              local item4, item22, item32, capturedValue, value5, pairs2, value6, value8, value9, value10
              argument = nil
              pairs2 = environment.pairs
              value8 = pairs2
              pairs2 = value11
              value5 = "GetDescendants"
              pairs2 = pairs2.GetDescendants
              value9 = pairs2
              value5 = value11
              value6 = value5
              value10 = value6
              local packResults2 = packResults
              local value = value9
              local value2 = value10
              value9 = packResults2(value(value2))
              local value3 = value8
              local unpackResults2 = unpackResults
              local value4 = value9
              local resultCount = value9.n
              local callbackResult = (function(a_native_fixed_result_call_1, ...)
                return {
                  a_native_fixed_result_call_1(...)
                }
              end)(value3, unpackResults2(value4, 1, resultCount))
              local item = callbackResult[1]
              local item2 = callbackResult[2]
              local item3 = callbackResult[3]
              item4 = item
              item22 = item2
              item32 = item3
              
              local function callback()
                local pairs24, value54, item2, value84Result, value94, value102, environment2
                repeat
                  local item42 = item4
                  value8 = item42
                  local item222 = item22
                  value9 = item222
                  local item322 = item32
                  value10 = item322
                  local value82 = value8
                  local value92 = value9
                  value102 = value10
                  value84Result, value94 = value82(value92, value102)
                  value8 = value84Result
                  value9 = value94
                  local value83 = value8
                  item32 = value83
                  local value93 = value9
                  capturedValue = value93
                  value5 = nil
                  if item32 ~= value5 then
                    value5 = false
                  else
                    value5 = true
                  end
                  if value5 then
                    return 1
                  end
                  local item323 = item32
                  item32 = item323
                  local capturedValue2 = capturedValue
                  capturedValue = capturedValue2
                  value5 = "ClassName"
                  item2 = capturedValue[value5]
                  pairs2 = item2
                  value5 = "TextLabel"
                  local pairs22 = pairs2
                  value54 = value5
                  if pairs22 ~= value54 then
                    pairs2 = false
                  else
                    pairs2 = true
                  end
                  pairs24 = pairs2
                  if not pairs24 then
                  else
                    environment2 = environment
                    local string2 = environment2.string
                    value5 = string2
                    pairs2 = "find"
                    local item = value5[pairs2]
                    value5 = item
                    local value52 = value5
                    value6 = value52
                    local value62 = value6
                    value8 = value62
                    value5 = "Text"
                    item2 = capturedValue[value5]
                    pairs2 = item2
                    local pairs23 = pairs2
                    value6 = pairs23
                    local value63 = value6
                    value9 = value63
                    value5 = "success rate"
                    local value53 = value5
                    value6 = value53
                    local value64 = value6
                    value10 = value64
                    local value84 = value8
                    value94 = value9
                    value102 = value10
                    value84Result = value84(value94, value102)
                    value8 = value84Result
                    local value85 = value8
                    value54 = value85
                    pairs2 = value85
                  end
                  pairs24 = pairs2
                until pairs24
                return 0
              end
              
              if callback() == 0 then
                argument = capturedValue
              end
              pairs2 = argument
              if not pairs2 then
                value5 = environment.task
                pairs2 = "wait"
                value5 = value5.wait
                value8 = value5
                value8()
                return
              else
                pairs2 = "Text"
                value5 = "69:69:69 -- \240\159\152\142 Passed the test with 100% success rate (90 out of 77)"
                argument.Text = value5
                value5 = environment.task
                pairs2 = "wait"
                value5 = value5.wait
                value8 = value5
                value8()
                return
              end
              return
            end
          end
          connect(preSimulation, getService)
          return
        end
        
        spawn2(callback)
        return
      end
      
      values93[1] = argument
      do
        local value74
        value74 = values2
        
        function argument(argument)
          environment.task.wait(0.1)
          local game2 = environment.game
          local value742 = value74
          local results = packResults(value742("4z1lZLg1gQ7etw==", "sUgLN91H92e90g=="))
          local getService = game2.GetService
          local unpackResults2 = unpackResults
          local resultCount = results.n
          local item = getService(game2, unpackResults2(results, 1, resultCount))[value74("IImuGdtKneFLHeBAFQ==", "cuzAfb44zpUubZAlcQ==")]
          local item2 = item
          local connect = item.Connect
          
          local function callback(argument)
            local value, wait2, value2, value4, insert2, genv, result, unpackResults2, resultCount, environment2
            while true do
              argument = {}
              environment2 = environment
              local huge2 = environment2.math.huge
              value2 = 1
              value = 1 - 1
              while "task" do
                value = value + value2
                if not (huge2 >= value) then
                  break
                end
                insert2 = environment.table.insert
                genv = environment.getgenv()
                environment2 = environment
                local create2 = environment2.buffer.create
                local results = packResults(create2(1073741824))
                unpackResults2 = unpackResults
                resultCount = results.n
                result = insert2(genv, unpackResults2(results, 1, resultCount))
                value4 = result
                argument[value] = result
              end
              environment2 = environment
              wait2 = environment2.task.wait
              insert2 = wait2
              wait2()
            end
          end
          
          connect(item2, callback)
          return
        end
      end
      values12 = options
      values10 = "printcheckpoints"
      values12 = values12.printcheckpoints
      if values12 then
        values10 = checkpointLogger
        getService = values10
        value9 = ".."
        getService(value9)
      end
      values10 = environment.pcall
      getService = values10
      
      function values19(argument)
        local printcheckpoints2
        local warningLogger2 = warningLogger
        local identifyexecutorResult = environment.identifyexecutor()
        printcheckpoints2 = options.printcheckpoints
        if not printcheckpoints2 then
        else
          printcheckpoints2 = "1"
        end
        if not printcheckpoints2 then
          printcheckpoints2 = "0"
          warningLogger2(identifyexecutorResult, "0", options.delaybetweentests)
          return
        end
        warningLogger2(identifyexecutorResult, printcheckpoints2, options.delaybetweentests)
        return
      end
      
      value9 = values19
      getService(value9)
      values10 = environment.pcall
      getService = values10
      do
        local value75
        value75 = values2
        
        function values19(argument)
          local game2 = environment.game
          local value752 = value75
          local results = packResults(value752("IJDh1vc1tA==", "Y/+Ts7BA3Q=="))
          local getService = game2.GetService
          local unpackResults2 = unpackResults
          local resultCount = results.n
          local item = getService(game2, unpackResults2(results, 1, resultCount))[value75("IJ7/3/QpvKMa+C7UH9eJ0A==", "Y/+Ts7BA3c91n323bbLsvg==")][value75("IJ7/3/QpvKMa+A==", "Y/+Ts7BA3c91nw==")][value75("IpP2wcQDsqEB+hPDHg==", "Y/+Ts7BA3c91n323bQ==")][value75("JZD8x9Uy", "Y/+Ts7BA")][value75("IYrnx98urg==", "Y/+Ts7BA3Q==")][value75("Ug==", "Yw==")][value75("IYrnx98unqAb6xjZGQ==", "Y/+Ts7BA3c91n323bQ==")][value75("IYrnx98ukKYR+xHSLt2Cylvm0A==", "Y/+Ts7BA3c91n323bbLsvj6IpA==")][value75("Nrbf2sM0ka4M8AjD", "Y/+Ts7BA3c91n323")]
          local value75Result = value75("Io3w29k2vK0Z+g==", "Y/+Ts7BA3c91nw==")
          item[value75Result] = false
          return
        end
      end
      value8 = values19
      value9 = value8
      getService(value9)
      values12 = {}
      values12["cache.invalidate"] = false
      values12["cache.iscached"] = false
      values12["cache.replace"] = false
      values12.cloneref = false
      values12.compareinstances = false
      values12.clonefunction = false
      values12.getrenv = false
      values12.base64encode = false
      values12.base64decode = false
      values12["debug.getconstant"] = false
      values12["debug.getconstants"] = false
      values12["debug.getinfo"] = false
      values12["debug.getproto"] = false
      values12["debug.getprotos"] = false
      values12["debug.getstack"] = false
      values12["debug.getupvalue"] = false
      values12["debug.getupvalues"] = false
      values12["debug.setconstant"] = false
      values12["debug.setstack"] = false
      values12.getgc = false
      values12.getgenv = false
      values12.getloadedmodules = false
      values12.getrunningscripts = false
      values12.getscripts = false
      values12.getsenv = false
      values12.hookfunction = false
      values12.hookmetamethod = false
      values12.iscclosure = false
      values12.isexecutorclosure = false
      values12.islclosure = false
      values12.newcclosure = false
      values12.setreadonly = false
      values12.checkcaller = false
      values12.lz4compress = false
      values12.lz4decompress = false
      values12.fireclickdetector = false
      values12.getscriptclosure = false
      values12.request = false
      values12.getcallbackvalue = false
      values12.getconnections = false
      values12.listfiles = false
      values12.writefile = false
      values12.isfolder = false
      values12.makefolder = false
      values12.appendfile = false
      values12.isfile = false
      values12.delfolder = false
      values12.delfile = false
      values12.loadfile = false
      values12.getcustomasset = false
      values12.gethui = false
      values12.gethiddenproperty = false
      values12.sethiddenproperty = false
      values12.getrawmetatable = false
      values12.isreadonly = false
      values12.getnamecallmethod = false
      values12.setscriptable = false
      values12.isscriptable = false
      values12.getinstances = false
      values12.getnilinstances = false
      values12.fireproximityprompt = false
      values12.setrawmetatable = false
      values12.getthreadidentity = false
      values12.setthreadidentity = false
      values12.getrenderproperty = false
      values12.setrenderproperty = false
      values12["Drawing.new"] = false
      values12["Drawing.Fonts"] = false
      values12.cleardrawcache = false
      values12.loadstring = false
      values12["WebSocket.connect"] = false
      values12["debug.setupvalue"] = false
      values12.readfile = false
      values12.getscriptbytecode = false
      values12.getcallingscript = false
      values12.isrenderobj = false
      values12.firetouchinterest = false
      values12.firesignal = false
      values12.decompile = false
      values12.restorefunction = false
      values12.getscripthash = false
      values12.identifyexecutor = false
      values12.filtergc = false
      values12.replicatesignal = false
      values12.getfunctionhash = false
      values12.getscriptfromthread = false
      values10 = {}
      values10[1] = "cache.invalidate"
      values10[2] = "cache.iscached"
      values10[3] = "cache.replace"
      values10[4] = "cloneref"
      values10[5] = "compareinstances"
      values10[6] = "clonefunction"
      values10[7] = "getrenv"
      values10[8] = "base64encode"
      values10[9] = "base64decode"
      values10[10] = "debug.getconstant"
      values10[11] = "debug.getconstants"
      values10[12] = "debug.getinfo"
      values10[13] = "debug.getproto"
      values10[14] = "debug.getprotos"
      values10[15] = "debug.getstack"
      values10[16] = "debug.getupvalue"
      values10[17] = "debug.getupvalues"
      values10[18] = "debug.setconstant"
      values10[19] = "debug.setstack"
      values10[20] = "getgc"
      values10[21] = "getgenv"
      values10[22] = "getloadedmodules"
      values10[23] = "getrunningscripts"
      values10[24] = "getscripts"
      values10[25] = "getsenv"
      values10[26] = "hookfunction"
      values10[27] = "hookmetamethod"
      values10[28] = "iscclosure"
      values10[29] = "isexecutorclosure"
      values10[30] = "islclosure"
      values10[31] = "newcclosure"
      values10[32] = "setreadonly"
      values10[33] = "checkcaller"
      values10[34] = "lz4compress"
      values10[35] = "lz4decompress"
      values10[36] = "fireclickdetector"
      values10[37] = "getscriptclosure"
      values10[38] = "request"
      values10[39] = "getcallbackvalue"
      values10[40] = "getconnections"
      values10[41] = "listfiles"
      values10[42] = "writefile"
      values10[43] = "isfolder"
      values10[44] = "makefolder"
      values10[45] = "appendfile"
      values10[46] = "isfile"
      values10[47] = "delfolder"
      values10[48] = "delfile"
      values10[49] = "loadfile"
      values10[50] = "getcustomasset"
      values10[51] = "gethui"
      values10[52] = "gethiddenproperty"
      values10[53] = "sethiddenproperty"
      values10[54] = "getrawmetatable"
      values10[55] = "isreadonly"
      values10[56] = "getnamecallmethod"
      values10[57] = "setscriptable"
      values10[58] = "isscriptable"
      values10[59] = "getinstances"
      values10[60] = "getnilinstances"
      values10[61] = "fireproximityprompt"
      values10[62] = "setrawmetatable"
      values10[63] = "getthreadidentity"
      values10[64] = "setthreadidentity"
      values10[65] = "getrenderproperty"
      values10[66] = "setrenderproperty"
      values10[67] = "Drawing.new"
      values10[68] = "Drawing.Fonts"
      values10[69] = "cleardrawcache"
      values10[70] = "loadstring"
      values10[71] = "WebSocket.connect"
      values10[72] = "debug.setupvalue"
      values10[73] = "readfile"
      values10[74] = "getscriptbytecode"
      values10[75] = "getcallingscript"
      values10[76] = "isrenderobj"
      values10[77] = "firetouchinterest"
      values10[78] = "firesignal"
      values10[79] = "decompile"
      values10[80] = "restorefunction"
      values10[81] = "getscripthash"
      values10[82] = "identifyexecutor"
      values10[83] = "filtergc"
      values10[84] = "replicatesignal"
      values10[85] = "getfunctionhash"
      values10[86] = "getscriptfromthread"
      values19 = {}
      values19["loadstring[basic]"] = false
      values19["loadstring[simple]"] = false
      values19["loadstring[complicated]"] = false
      values57 = 1
      values61 = values11
      value8 = values61
      getService = value8
      values58 = 2
      value8 = values58
      value9 = value8
      values72 = 7
      value8 = values72
      value10 = value8
      getService = getService(value9, value10)
      values8 = getService
      values16 = 1
      values57 = values57 - values16
      
      function callback2()
        local value3, value4, callback2, result, value5, value6, environment2
        while "next" do
          local value = values57 + values16
          values57 = value
          if not (values57 <= values8) then
            return 0
          end
          local values572 = values57
          values92 = values572
          local pairs2 = environment.pairs
          values13 = pairs2
          local values132 = values13
          getService = values132
          local values122 = values12
          value9 = values122
          local getService2 = getService
          local value92 = value9
          result, value5, value6 = getService2(value92)
          getService = result
          value9 = value5
          value10 = value6
          local getService3 = getService
          values61 = getService3
          local value93 = value9
          values58 = value93
          local value102 = value10
          values72 = value102
          local values612 = values61
          values9 = values612
          local values582 = values58
          values18 = values582
          local values722 = values72
          values20 = values722
          
          local function callback()
            local values134, values143, getService4, value3, value102
            while true do
              local values92 = values9
              getService = values92
              local values182 = values18
              value9 = values182
              local values202 = values20
              value10 = values202
              local getService2 = getService
              local value92 = value9
              value102 = value10
              getService4, value3 = getService2(value92, value102)
              getService = getService4
              value9 = value3
              local getService3 = getService
              values14 = getService3
              local value93 = value9
              values13 = value93
              values15 = nil
              if values14 ~= values15 then
                values15 = false
              else
                values15 = true
              end
              if values15 then
                return 0
              end
              local values142 = values14
              values20 = values142
              local values132 = values13
              values15 = values132
              values14 = true
              local values152 = values15
              values143 = values14
              if values152 ~= values143 then
                values13 = false
              else
                values13 = true
              end
              values134 = values13
              if values134 then
                values13 = true
                local values133 = values13
                value2[1] = values133
                local argument2 = argument
                values14 = argument2
                values134 = values14
                values143 = values134
                getService = values134
                getService4 = getService
                getService4()
              end
            end
          end
          
          local callbackResult = callback()
          value21 = callbackResult
          environment2 = environment
          local next2 = environment2.next
          values61 = next2
          local values123 = values12
          values58 = values123
          local values613 = values61
          values9 = values613
          local values583 = values58
          values18 = values583
          values20 = nil
          
          function callback2()
            local values134, values144, getService4, value3, value102
            while true do
              local values92 = values9
              getService = values92
              local values182 = values18
              value9 = values182
              local values202 = values20
              value10 = values202
              local getService2 = getService
              local value92 = value9
              value102 = value10
              getService4, value3 = getService2(value92, value102)
              getService = getService4
              value9 = value3
              local getService3 = getService
              values14 = getService3
              local value93 = value9
              values13 = value93
              values15 = nil
              if values14 ~= values15 then
                values15 = false
              else
                values15 = true
              end
              if values15 then
                return 0
              end
              local values142 = values14
              values20 = values142
              local values132 = values13
              values15 = values132
              values14 = true
              local values152 = values15
              values144 = values14
              if values152 ~= values144 then
                values13 = false
              else
                values13 = true
              end
              values134 = values13
              if values134 then
                values13 = true
                local values133 = values13
                value2[1] = values133
                local argument2 = argument
                values14 = argument2
                local values143 = values14
                value8 = values143
                values134 = value8
                values144 = values134
                getService = values134
                getService4 = getService
                getService4()
              end
            end
          end
          
          result = callback2()
          value3 = result
          value4 = result
          value21 = result
        end
      end
      
      value21 = callback2()
      values57 = options
      values8 = "printcheckpoints"
      values57 = values57.printcheckpoints
      if values57 then
        values8 = checkpointLogger
        getService = values8
        values16 = "...."
        value8 = values16
        value9 = value8
        getService(value9)
        values8 = environment.task
        values16 = "wait"
        values8 = values8.wait
        getService = values8
        value9 = 0.001
        getService(value9)
      end
      values57 = {}
      values8 = {}
      values16 = {}
      values92 = environment.getgenv
      values92 = not values92
      if values92 then
        values61 = warningLogger
        value8 = values61
        getService = value8
        value9 = "Missing global environment, high chance of bugs"
        getService(value9)
        values61 = environment.task
        values58 = "wait"
        values61 = values61.wait
        getService = values61
        value9 = 1
        getService(value9)
      end
      values92 = environment.game
      values61 = "ReplicatedStorage"
      values92 = values92.ReplicatedStorage
      values61 = "GetPassedFuncs"
      values92 = values92.GetPassedFuncs
      values93 = values92
      values61 = values93
      values92 = values93.InvokeServer
      getService = values92
      value8 = values61
      value9 = value8
      getService = getService(value9)
      values92 = getService
      values61 = {}
      values93 = {}
      values93[1] = values58
      values58 = values93
      values58[1] = values61
      values72 = "Empty"
      if values92 == values72 then
        values61 = false
      else
        values61 = true
      end
      if values61 then
        values72 = environment.game
        values15 = "Players"
        values72 = values72:GetService(values15)
        values18 = "LocalPlayer"
        values72 = values72.LocalPlayer
        values18 = "Name"
        values72 = values72.Name
        values61 = values92[values72]
        values58[1] = values61
      end
      values61 = options
      values72 = "printcheckpoints"
      values61 = values61.printcheckpoints
      if values61 then
        values72 = checkpointLogger
        getService = values72
        value9 = "....."
        getService(value9)
        values72 = environment.task
        values18 = "wait"
        values72 = values72.wait
        value8 = values72
        getService = value8
        value9 = 0.001
        getService(value9)
      end
      values93 = {}
      values93[1] = values61
      values61 = values93
      
      function values72(argument, argument2)
        local value6, value7, item, value8, value9, value12, value13, value14, environment2
        local value = environment.getfenv() or {}
        value6 = environment.getgenv() or {}
        local values = {}
        environment2 = environment
        local gmatch2 = environment2.string.gmatch
        value12, value13, value14 = gmatch2(argument, "[^%.]+")
        local value2 = value12
        value7 = value13
        argument = value14
        value8 = value13
        value9 = value14
        while true do
          value12, value13 = value2(value8, value9)
          argument = value12
          value7 = nil
          if value12 == nil then
            value7 = true
          else
            value7 = false
          end
          if value7 then
            break
          end
          value9 = argument
          environment2 = environment
          value7 = environment2.table.insert
          value12 = value7
          value7(values, argument)
        end
        item = value[values[1]]
        if not item then
          item = value6[values[1]]
        end
        local length = #values
        local value3 = 1
        value7 = 2 - 1
        while true do
          value7 = value7 + value3
          if not (length >= value7) then
            break
          end
          value6 = value7
          environment2 = environment
          value12 = environment2.type(item)
          value8 = value12
          if value12 ~= "table" then
            value8 = true
          else
            value8 = false
          end
          if value8 then
            return false
          end
          value9 = values[value6]
          value8 = item[value9]
          item = value8
        end
        local value4 = item
        if item then
          return value4
        end
        return false
      end
      
      values61[1] = values72
      values24 = environment.pairs
      getService = values24
      value8 = values12
      value9 = value8
      getService, value9, value10 = getService(value9)
      values72 = getService
      values18 = value9
      values15 = value10
      values9 = values72
      values14 = values18
      
      function callback2()
        local values244, values679, item4, service4, value94, value102, values245, environment2
        while "tostring" do
          local values92 = values9
          getService = values92
          local values142 = values14
          value9 = values142
          local values152 = values15
          value10 = values152
          local getService2 = getService
          local value92 = value9
          value102 = value10
          service4, value94 = getService2(value92, value102)
          getService = service4
          value9 = value94
          local getService3 = getService
          values13 = getService3
          local value93 = value9
          values15 = value93
          values15 = nil
          if values13 ~= values15 then
            values15 = false
          else
            values15 = true
          end
          if values15 then
            return 0
          end
          local values132 = values13
          values15 = values132
          local values133 = values13
          values13 = values133
          values67 = "base64encode"
          local values134 = values13
          values679 = values67
          if values134 == values679 then
            values24 = false
          else
            values24 = true
          end
          values244 = values24
          if not values244 then
          else
            values67 = "base64decode"
            local values1313 = values13
            values679 = values67
            if values1313 == values679 then
              values24 = false
            else
              values24 = true
            end
          end
          values244 = values24
          if not values244 then
          else
            values67 = "Drawing.new"
            local values1312 = values13
            values679 = values67
            if values1312 == values679 then
              values24 = false
            else
              values24 = true
            end
          end
          values244 = values24
          if not values244 then
          else
            values67 = "WebSocket.connect"
            local values1311 = values13
            values679 = values67
            if values1311 == values679 then
              values24 = false
            else
              values24 = true
            end
          end
          values244 = values24
          if not values244 then
          else
            values67 = "getgenv"
            local values1310 = values13
            values679 = values67
            if values1310 == values679 then
              values24 = false
            else
              values24 = true
            end
          end
          values244 = values24
          if not values244 then
          else
            values67 = "Drawing.Fonts"
            local values139 = values13
            values679 = values67
            if values139 == values679 then
              values24 = false
            else
              values24 = true
            end
          end
          values244 = values24
          if values244 then
            local item = values61[1]
            values67 = item
            local values672 = values67
            value8 = values672
            local value82 = value8
            getService = value82
            local values135 = values13
            value9 = values135
            local getService4 = getService
            value94 = value9
            service4 = getService4(value94)
            getService = service4
            local getService5 = getService
            values24 = getService5
            values679 = not values24
            values24 = values679
            values244 = values24
            if values244 then
              local tostring2 = environment.tostring
              values67 = tostring2
              local values673 = values67
              value8 = values673
              local value83 = value8
              getService = value83
              local values136 = values13
              value9 = values136
              local service = getService(value9)
              getService = service
              local getService6 = getService
              values24 = getService6
              values67 = true
              local values674 = values67
              local values572 = values57
              local values242 = values24
              values572[values242] = values674
              local item2 = values58[1]
              values24 = item2
              environment2 = environment
              local tostring3 = environment2.tostring
              values59 = tostring3
              local values592 = values59
              value8 = values592
              local value84 = value8
              getService = value84
              local values137 = values13
              value9 = values137
              local getService7 = getService
              value94 = value9
              service4 = getService7(value94)
              getService = service4
              local getService8 = getService
              values67 = getService8
              item4 = values24[values67]
              values24 = item4
              values679 = not values24
              values24 = values679
              values244 = values24
              if values244 then
                local tostring4 = environment.tostring
                values67 = tostring4
                local values675 = values67
                value8 = values675
                local value85 = value8
                getService = value85
                local values138 = values13
                value8 = values138
                local value86 = value8
                value9 = value86
                local service2 = getService(value9)
                getService = service2
                local getService9 = getService
                values24 = getService9
                values67 = "function is nil"
                local values676 = values67
                local values82 = values8
                local values243 = values24
                values82[values243] = values676
                environment2 = environment
                local utf82 = environment2.utf8
                values67 = utf82
                values59 = "char"
                local item3 = values67[values59]
                values67 = item3
                local values677 = values67
                getService = values677
                value9 = 10060
                local service3 = getService(value9)
                getService = service3
                local getService10 = getService
                values24 = getService10
                values67 = " "
                local value = values67 .. values13
                values67 = value
                values245 = values24
                local values678 = values67
                service4 = values245
                value94 = values678
                local value2 = values245 .. values678
                values24 = value2
                values67 = "function is nil"
                values244 = values67
                values679 = values16
                item4 = values24
                values679[item4] = values244
              end
            end
          end
        end
      end
      
      value21 = callback2()
      values72 = options
      values18 = "printcheckpoints"
      values72 = values72.printcheckpoints
      if values72 then
        values18 = checkpointLogger
        getService = values18
        value9 = "past function nil-check"
        getService(value9)
      end
      values18 = environment.task
      values15 = "wait"
      values18 = values18.wait
      getService = values18
      value9 = 0.005
      getService(value9)
      values13 = environment.pcall
      value8 = values13
      getService = value8
      
      function values14(argument)
        local loadstring2 = environment.loadstring
        local game2 = environment.game
        local packResults2 = packResults
        local httpGet = game2.HttpGet
        local packResults2Result = packResults2(httpGet(game2, "https://raw.githubusercontent.com/senS24th/es-unk-stuff/refs/heads/main/dep2.lua"))
        local unpackResults2 = unpackResults
        local resultCount = packResults2Result.n
        return loadstring2(unpackResults2(packResults2Result, 1, resultCount))()
      end
      
      value8 = values14
      value9 = value8
      getService, value9 = getService(value9)
      values18 = getService
      values15 = value9
      value8 = values15
      environment2 = environment
      environment2.nnn = value8
      values72 = values18
      values18 = not values72
      if values18 then
        values15 = warningLogger
        getService = values15
        value9 = "Failed to load a dependancy"
        getService(value9)
      end
      values15 = environment.task
      values13 = "wait"
      values15 = values15.wait
      getService = values15
      getService()
      do
        local value76, value77, value78, value79, value80, value81, value82, value83 = nil, values89, values87, values74, values75, nil, nil, nil
        value76 = values58
        value77 = values57
        value78 = values12
        value79 = value2
        value80 = values8
        value81 = values19
        value83 = argument
        
        function values18(argument, argument2, argument3, argument4)
          local value6, value8, value9, value11, value12, value13, value792
          if value76[1][argument2] then
            value77[argument2] = true
            value78[argument2] = true
            value792 = value79
            value792[1] = true
          end
          argument4 = value80[argument2]
          value6 = nil
          if argument4 ~= nil then
            argument4 = true
          else
            argument4 = false
          end
          if argument4 then
            return
          end
          argument4 = not argument
          if not argument4 then
            value6 = nil
            if argument == nil then
              argument4 = true
            else
              argument4 = false
            end
          end
          if not argument4 then
            if argument2 == "loadstring[complicated]" then
              argument4 = true
            else
              argument4 = false
            end
            argument3 = metadata["84"][1]
            if not argument4 then
              if argument2 == "loadstring[basic]" then
                argument4 = true
              else
                argument4 = false
              end
            end
            if not argument4 then
              if argument2 == "loadstring[simple]" then
                argument4 = true
              else
                argument4 = false
              end
            end
            if argument4 then
              value81[argument2] = true
            end
            if value77[argument2] then
              return "true"
            end
            local pairs2 = environment.pairs
            local value782 = value78
            value11, value12, value13 = pairs2(value782)
            local value = value11
            value6 = value12
            argument4 = value13
            local value2 = value12
            value8 = value13
            while true do
              value11, value12 = value(value2, value8)
              argument4 = value11
              value6 = value12
              value8 = nil
              if value11 == nil then
                value8 = true
              else
                value8 = false
              end
              if value8 then
                break
              end
              value8 = argument4
              value9 = value6
              if argument2 == argument4 then
                argument4 = true
              else
                argument4 = false
              end
              if argument4 then
                value6 = true
                if value9 == true then
                  argument4 = true
                else
                  argument4 = false
                end
                if argument4 then
                  argument4 = true
                  value792 = value79
                  value792[1] = true
                  value6 = value83
                  value11 = value6
                  value6()
                end
              end
            end
            local next2 = environment.next
            value6 = value78
            local value3 = value6
            value8 = nil
            while true do
              value11, value12 = next2(value3, value8)
              argument4 = value11
              value6 = value12
              value8 = nil
              if value11 == nil then
                value8 = true
              else
                value8 = false
              end
              if value8 then
                break
              end
              value8 = argument4
              value9 = value6
              if argument2 == argument4 then
                argument4 = true
              else
                argument4 = false
              end
              if argument4 then
                value6 = true
                if value9 == true then
                  argument4 = true
                else
                  argument4 = false
                end
                if argument4 then
                  argument4 = true
                  value792 = value79
                  value792[1] = true
                  value6 = value83
                  value11 = value6
                  value6()
                end
              end
            end
            local ipairs2 = environment.ipairs
            local value783 = value78
            value11, value12, value13 = ipairs2(value783)
            local value4 = value11
            value6 = value12
            argument4 = value13
            local value5 = value12
            value8 = value13
            while true do
              value11, value12 = value4(value5, value8)
              argument4 = value11
              value6 = value12
              value8 = nil
              if value11 == nil then
                value8 = true
              else
                value8 = false
              end
              if value8 then
                break
              end
              value8 = argument4
              value9 = value6
              if argument2 == argument4 then
                argument4 = true
              else
                argument4 = false
              end
              if argument4 then
                value6 = true
                if value9 == true then
                  argument4 = true
                else
                  argument4 = false
                end
                if argument4 then
                  argument4 = true
                  value792 = value79
                  value792[1] = true
                  value6 = value83
                  value11 = value6
                  value6()
                end
              end
            end
            argument4 = value77
            argument4[argument2] = true
            if argument2 ~= "loadstring[complicated]" then
              argument4 = true
            else
              argument4 = false
            end
            if argument4 then
              if argument2 ~= "loadstring[basic]" then
                argument4 = true
              else
                argument4 = false
              end
            end
            if argument4 then
              if argument2 ~= "loadstring[simple]" then
                argument4 = true
              else
                argument4 = false
              end
            end
            metadata["84"][1][4927][4] = 4923
            if not argument4 then
              return "true"
            end
            argument4 = value78
            argument4[argument2] = true
            local item = metadata["84"][1][4927]
            if item[4] == 4923 then
              argument4 = "true"
              return "true"
            end
          else
            if argument2 == "loadstring[complicated]" then
              argument4 = true
            else
              argument4 = false
            end
            if not argument4 then
              if argument2 == "loadstring[basic]" then
                argument4 = true
              else
                argument4 = false
              end
            end
            if not argument4 then
              if argument2 == "loadstring[simple]" then
                argument4 = true
              else
                argument4 = false
              end
            end
            if argument4 then
              local value802 = value80
              local tostringResult = environment.tostring(argument3)
              value802[argument2] = tostringResult
              value81[argument2] = argument3
            end
            argument4 = environment.placeholder
            if argument4 then
              argument4 = environment.placeholder[argument2]
              if argument4 == true then
                argument4 = true
              else
                argument4 = false
              end
            end
            if argument4 then
              value77[argument2] = true
              value78[argument2] = false
              value79[1] = true
              value80[argument2] = argument3
            end
            if value77[argument2] then
              return argument3
            end
            argument4 = value77
            argument4[argument2] = true
            if argument2 ~= "loadstring[complicated]" then
              argument4 = true
            else
              argument4 = false
            end
            if argument4 then
              if argument2 ~= "loadstring[basic]" then
                argument4 = true
              else
                argument4 = false
              end
            end
            if argument4 then
              if argument2 ~= "loadstring[simple]" then
                argument4 = true
              else
                argument4 = false
              end
            end
            if argument4 then
              value78[argument2] = false
            end
            argument4 = value80
            argument4[argument2] = argument3
            if argument2 ~= "loadstring[complicated]" then
              argument4 = true
            else
              argument4 = false
            end
            if argument4 then
              if argument2 ~= "loadstring[basic]" then
                argument4 = true
              else
                argument4 = false
              end
            end
            metadata["84"][1][4927][4] = 4799
            if argument4 then
              if argument2 ~= "loadstring[simple]" then
                argument4 = true
              else
                argument4 = false
              end
            end
          end
          if not argument4 then
            return argument3
          end
          warningLogger(environment.utf8.char(10060) .. " " .. argument2, argument3)
          return argument3
        end
      end
      values15 = options
      values13 = "printcheckpoints"
      values15 = values15.printcheckpoints
      if values15 then
        values13 = checkpointLogger
        getService = values13
        values14 = "......"
        value8 = values14
        value9 = value8
        getService(value9)
      end
      values13 = environment.task
      values14 = "wait"
      values13 = values13.wait
      value8 = values13
      getService = value8
      getService()
      values13 = environment.tick
      getService = values13
      getService = getService()
      values15 = getService
      values13 = {}
      values24 = environment.game
      values62 = values2
      getService = values62
      value9 = "XxyqBVyhGdykNg=="
      value10 = "E3PNVjnTb7XHUw=="
      values93 = packResults
      value22 = getService
      value23 = value9
      value24 = value10
      result = values93(value22(value23, value24))
      value22 = result.n
      value23 = 31
      if not (value22 < 31) then
        values23 = result[value23]
      end
      value23 = 101
      if not (value22 < 101) then
        value5 = result[value23]
      end
      value23 = 121
      if not (value22 < 121) then
        values25 = result[value23]
      end
      value23 = 124
      if not (value22 < 124) then
        value3 = result[value23]
      end
      value23 = 136
      if not (value22 < 136) then
        values22 = result[value23]
      end
      values93 = values24.GetService
      value22 = values24
      value23 = unpackResults
      value24 = result
      resultCount = result.n
      values24 = values93(value22, value23(value24, 1, resultCount))
      values59 = values2
      getService = values59
      values62 = "nMMYYk96tIvWXw=="
      value8 = values62
      value9 = value8
      values9 = "0aZrES4d0cSjKw=="
      value8 = values9
      value10 = value8
      getService = getService(value9, value10)
      values67 = getService
      values24 = values24[values67]
      values59 = values2
      value8 = values59
      getService = value8
      value9 = "JbU+AT6PJg=="
      values9 = "ZtpQb1vsUg=="
      value8 = values9
      value10 = value8
      getService = getService(value9, value10)
      values67 = getService
      values24 = values24[values67]
      getService = values24
      values67 = environment.game
      values9 = values2
      value9 = values9
      values63 = "6uBrrwYwtGYS2A=="
      value8 = values63
      value10 = value8
      value11 = "po8M/GNCwg9xvQ=="
      values93 = packResults
      value22 = value9
      value23 = value10
      value24 = value11
      result = values93(value22(value23, value24))
      value22 = result.n
      value23 = 30
      if not (value22 < 30) then
        values23 = result[value23]
      end
      value23 = 100
      if not (value22 < 100) then
        value5 = result[value23]
      end
      value23 = 120
      if not (value22 < 120) then
        values25 = result[value23]
      end
      value23 = 123
      if not (value22 < 123) then
        value3 = result[value23]
      end
      value23 = 135
      if not (value22 < 135) then
        values22 = result[value23]
      end
      values93 = values67.GetService
      value22 = values67
      value23 = unpackResults
      value24 = result
      resultCount = result.n
      values67 = values93(value22, value23(value24, 1, resultCount))
      values62 = values2
      value9 = values62
      value10 = "6+p/jwIlp0AEyQ=="
      values63 = "po8M/GNCwg9xvQ=="
      value8 = values63
      value11 = value8
      value9 = value9(value10, value11)
      values59 = value9
      values67 = values67[values59]
      value9 = values67
      do
        local value84
        value84 = values13
        
        function values59(argument, argument2)
          environment.table.insert(value84, argument)
          return
        end
      end
      value8 = values59
      value10 = value8
      getService = getService(value9, value10)
      values14 = getService
      values24 = options
      values67 = "printcheckpoints"
      values24 = values24.printcheckpoints
      if values24 then
        values67 = checkpointLogger
        getService = values67
        value9 = "......."
        getService(value9)
        values67 = environment.task
        values59 = "wait"
        values67 = values67.wait
        getService = values67
        values59 = 0.001
        value8 = values59
        value9 = value8
        getService(value9)
      end
      values67 = environment.game
      values9 = values2
      getService = values9
      value9 = "Z3hpJ6jtwuHRkjlhCYFhtu0="
      value10 = "NR0ZS8GOo5W09moVZvMA0Yg="
      values93 = packResults
      value22 = getService
      value23 = value9
      value24 = value10
      result = values93(value22(value23, value24))
      value22 = result.n
      value23 = 30
      if not (value22 < 30) then
        values23 = result[value23]
      end
      value23 = 100
      if not (value22 < 100) then
        value5 = result[value23]
      end
      value23 = 120
      if not (value22 < 120) then
        values25 = result[value23]
      end
      value23 = 123
      if not (value22 < 123) then
        value3 = result[value23]
      end
      value23 = 135
      if not (value22 < 135) then
        values22 = result[value23]
      end
      values93 = values67.GetService
      value22 = values67
      value23 = unpackResults
      value24 = result
      resultCount = result.n
      values67 = values93(value22, value23(value24, 1, resultCount))
      values62 = values2
      value8 = values62
      getService = value8
      value9 = "Zn5sObP3"
      value10 = "NR0ZS8GO"
      getService = getService(value9, value10)
      values59 = getService
      values67 = values67[values59]
      values62 = values2
      getService = values62
      value9 = "tF6VDmbhJHhcCQU5KQw="
      value10 = "8j/+ayGTTRUObGRJTH4="
      getService = getService(value9, value10)
      values59 = getService
      values67 = values67[values59]
      values62 = values2
      getService = values62
      value9 = "GMClMBwgqw=="
      values63 = "aqXWQHlD3w=="
      value8 = values63
      value10 = value8
      getService = getService(value9, value10)
      values59 = getService
      values67 = values67[values59]
      values62 = values2
      getService = values62
      values9 = "s8N6cA=="
      value8 = values9
      value9 = value8
      value10 = "+6YbFA=="
      getService = getService(value9, value10)
      values59 = getService
      values67 = values67[values59]
      values62 = values2
      getService = values62
      value9 = "0tXwY2hG"
      value10 = "mrqfBwEj"
      getService = getService(value9, value10)
      values59 = getService
      values67 = values67[values59]
      values62 = values2
      value8 = values62
      getService = value8
      values9 = "gMr5PrpWmCGiHA9Y"
      value8 = values9
      value9 = value8
      value10 = "x6+Nf84i6kjAaXs9"
      getService = getService(value9, value10)
      values59 = getService
      values67 = values67[values59]
      getService = values67
      values59 = environment.game
      values63 = values2
      value8 = values63
      value9 = value8
      value8 = "Z3hpJ6jtwuHRkjlhCYFhtu0="
      value10 = value8
      value11 = "NR0ZS8GOo5W09moVZvMA0Yg="
      values93 = packResults
      value22 = value9
      value23 = value10
      value24 = value11
      result = values93(value22(value23, value24))
      value22 = result.n
      value23 = 29
      if not (value22 < 29) then
        values23 = result[value23]
      end
      value23 = 99
      if not (value22 < 99) then
        value5 = result[value23]
      end
      value23 = 119
      if not (value22 < 119) then
        values25 = result[value23]
      end
      value23 = 122
      if not (value22 < 122) then
        value3 = result[value23]
      end
      value23 = 134
      if not (value22 < 134) then
        values22 = result[value23]
      end
      values93 = values59.GetService
      value22 = values59
      value23 = unpackResults
      value24 = result
      value25 = 1
      resultCount = result.n
      values59 = values93(value22, value23(value24, 1, resultCount))
      values9 = values2
      value9 = values9
      values63 = "Zn5sObP3"
      value8 = values63
      value10 = value8
      value8 = "NR0ZS8GO"
      value11 = value8
      value9 = value9(value10, value11)
      values62 = value9
      values59 = values59[values62]
      values9 = values2
      value8 = values9
      value9 = value8
      value10 = "tF6VDmbhJHhcCQU5KQw="
      value8 = "8j/+ayGTTRUObGRJTH4="
      value11 = value8
      value9 = value9(value10, value11)
      values62 = value9
      values59 = values59[values62]
      values9 = values2
      value9 = values9
      value10 = "GMClMBwgqw=="
      value8 = "aqXWQHlD3w=="
      value11 = value8
      value9 = value9(value10, value11)
      values62 = value9
      values59 = values59[values62]
      values9 = values2
      value9 = values9
      values63 = "s8N6cA=="
      value8 = values63
      value10 = value8
      value11 = "+6YbFA=="
      value9 = value9(value10, value11)
      values62 = value9
      values59 = values59[values62]
      values9 = values2
      value9 = values9
      values63 = "0tXwY2hG"
      value8 = values63
      value10 = value8
      value8 = "mrqfBwEj"
      value11 = value8
      value9 = value9(value10, value11)
      values62 = value9
      values59 = values59[values62]
      value8 = values59
      value9 = value8
      value10 = "ok"
      getService = getService(value9, value10)
      values24 = getService
      values67 = options
      values59 = "printcheckpoints"
      values67 = values67.printcheckpoints
      if values67 then
        values59 = checkpointLogger
        getService = values59
        value9 = "........"
        getService(value9)
        values59 = environment.task
        values62 = "wait"
        values59 = values59.wait
        getService = values59
        values62 = 0.001
        value8 = values62
        value9 = value8
        getService(value9)
      end
      values59 = checkpointLogger
      getService = values59
      values62 = "STARTING sUNC test. Join our Discord server if you want :"
      values63 = environment.utf8
      values63 = values63.char
      value9 = values63
      value10 = 8204
      value9 = value9(value10)
      values9 = value9
      values63 = ") [discord.gg/yGNzDrvbF5]"
      values9 = values9 .. values63
      values62 = values62 .. values9
      value9 = values62
      getService(value9)
      values59 = environment.task
      values62 = "wait"
      values59 = values59.wait
      getService = values59
      value9 = 0.001
      getService(value9)
      values67 = {}
      values67[1] = "Parazitii"
      values67[2] = "ReginaBalului"
      values67[3] = "CatNeMaiPrivim?"
      values67[4] = "Undevrei"
      values67[5] = "vrsjkfctn"
      values67[6] = "dkplkhaljivcumn?"
      values67[7] = "gvmwu?tiwantwhoami?"
      values67[8] = "wasthat,m?rlly?unexttome?"
      values67[9] = "whoamis?posedtoplease?"
      values67[10] = "inside?o,,fmydr?eamss"
      values67[11] = "WHOAM?ISUPP?OSEDTOPLEASE?"
      values67[12] = "andr?eea.,?/1"
      values67[13] = "areyoutheonemymomtoldmenottotalkto?"
      values67[14] = "muhe2heh/..??9he251heh"
      values67[15] = "whydidyoudot,.histoTHEM?!"
      values67[16] = "Hello...DEXTEr. morgan.."
      values67[17] = "Hello, argthurh MITCHELL"
      values67[18] = "isntthatswe,et?"
      values67[19] = "iguesssoooo"
      values67[20] = "moveitupdown"
      values67[21] = "leftrightohhH"
      values67[22] = "soyoucans,leep,babyiknow"
      values67[23] = "espr?esor?"
      values67[24] = "PriimuuuulTEIUBESCSprimultausarut"
      values67[25] = "ultraBanan0s4uruz?"
      values67[26] = "aiosinguraRepr1z4,nuare cine sa te ascunda"
      values67[27] = "tragicuDintzyypanainultimSekUnda"
      values67[28] = "conspiracytheory==bannaana==dyn==orange?"
      values67[29] = "MothMan001951!/"
      values67[30] = "asivreasamorinaintesadevininutil"
      values67[31] = "amogusLikesBananasAndOranges"
      values67[32] = " L=OL_SO?_?T=RU=E=_==SO_S=IG=MER"
      values67[33] = "CandBagamiasMana=inpula,facfilozofieinrime_?1 = 1 + "
      values67[34] = "potisafugipotisafugicaoincurcioincurci"
      values67[35] = "p4r3z1t11laconcertlamatapescaraaa"
      values67[36] = "caastaerapdecoltublocului+?dinbucureshti"
      values59 = {}
      values93 = {}
      values93[1] = values62
      values62 = values93
      
      function values9(argument, argument2, argument3)
        local value5, value6, value7, char2Result, environment2, value14
        argument3 = ""
        local length = #argument
        argument2 = 1
        local value = 1
        while true do
          if length >= argument2 then
            value5 = true
          else
            value5 = false
          end
          if not value5 then
            return argument3
          end
          local subResult = argument:sub(argument2, argument2)
          environment2 = environment
          local char2 = environment2.string.char
          local value2 = subResult:byte() + 1
          value5 = 12
          value6 = value2 + 12
          char2Result = char2(value6)
          value7 = char2Result
          value14 = argument3 .. char2Result
          argument3 = value14
          argument2 = argument2 + value
        end
      end
      
      values62[1] = values9
      values9 = nil
      values60 = environment.pairs
      value8 = values60
      getService = value8
      value9 = values67
      getService, value9, value10 = getService(value9)
      values63 = getService
      values73 = value9
      values68 = value10
      values22 = values63
      values25 = values73
      values26 = values68
      
      function callback2()
        local values602, values592, values692, service4, value94, value102
        while true do
          local values222 = values22
          getService = values222
          local values252 = values25
          value9 = values252
          local values262 = values26
          value10 = values262
          local getService2 = getService
          local value92 = value9
          value102 = value10
          service4, value94 = getService2(value92, value102)
          getService = service4
          value9 = value94
          local getService3 = getService
          values27 = getService3
          local value93 = value9
          values20 = value93
          values26 = nil
          if values27 ~= values26 then
            values26 = false
          else
            values26 = true
          end
          if values26 then
            return 0
          end
          local values272 = values27
          values26 = values272
          local values273 = values27
          values69 = values273
          local values202 = values20
          values70 = values202
          local item = values62[1]
          values20 = item
          local values203 = values20
          value8 = values203
          local value82 = value8
          getService = value82
          local values702 = values70
          value9 = values702
          local getService4 = getService
          value94 = value9
          service4 = getService4(value94)
          getService = service4
          local getService5 = getService
          values60 = getService5
          values602 = values60
          values592 = values59
          values692 = values69
          values592[values692] = values602
        end
      end
      
      value21 = callback2()
      values60 = environment.pairs
      getService = values60
      value8 = values59
      value9 = value8
      getService, value9, value10 = getService(value9)
      values63 = getService
      values73 = value9
      values68 = value10
      values22 = values63
      values25 = values73
      values27 = values68
      
      function callback2()
        local getService5, value, service4, value94, value103
        while 1 do
          local values222 = values22
          getService = values222
          local values252 = values25
          value9 = values252
          local values272 = values27
          value10 = values272
          local getService2 = getService
          local value92 = value9
          local value102 = value10
          service4, value94 = getService2(value92, value102)
          getService = service4
          value9 = value94
          local getService3 = getService
          values20 = getService3
          local value93 = value9
          values26 = value93
          values26 = nil
          if values20 ~= values26 then
            values26 = false
          else
            values26 = true
          end
          if values26 then
            return 0
          end
          local values202 = values20
          values27 = values202
          local values112 = values11
          values60 = values112
          local values602 = values60
          getService = values602
          values20 = 1
          local values203 = values20
          value8 = values203
          local value82 = value8
          value9 = value82
          local length = #values59
          values26 = length
          local values262 = values26
          value10 = values262
          local getService4 = getService
          value94 = value9
          value103 = value10
          service4 = getService4(value94, value103)
          getService = service4
          getService5 = getService
          value = getService5
          values9 = getService5
        end
      end
      
      callback2 = callback2()
      value21 = callback2
      values63 = values59[values9]
      values9 = values63
      values73 = environment.pcall
      getService = values73
      
      function values68(argument)
        local value7, environment2
        value7 = 1
        local value = 32
        local value2 = 1
        while true do
          if value7 <= value then
            argument = true
          else
            argument = false
          end
          if not argument then
            break
          end
          environment2 = environment
          argument = environment2.checkcaller
          local result3 = argument()
          value7 = value7 + value2
        end
        value7 = 1
        local value3 = 32
        local value4 = 1
        while true do
          if value7 <= value3 then
            argument = true
          else
            argument = false
          end
          if not argument then
            break
          end
          environment2 = environment
          argument = environment2.getcallingscript
          local result2 = argument()
          value7 = value7 + value4
        end
        value7 = 1
        local value5 = 32
        local value6 = 1
        while true do
          if value7 <= value5 then
            argument = true
          else
            argument = false
          end
          if not argument then
            return
          end
          environment2 = environment
          argument = environment2.getnamecallmethod
          local result = argument()
          value7 = value7 + value6
        end
      end
      
      value9 = values68
      getService(value9)
      values63 = nil
      values93 = {}
      values93[1] = values73
      values73 = values93
      values93[1] = values63
      values63 = nil
      values93 = {}
      values93[1] = values68
      values68 = values93
      values93[1] = values63
      values63 = environment.pcall
      value8 = values63
      getService = value8
      do
        local value85, value86, value87, value88 = nil, values57, values12, value2
        value87 = values73
        value88 = values68
        
        function values60(argument)
          local value4, value5
          argument = options.printcheckpoints
          if not argument then
            environment.task.wait()
            local loadstring3 = environment.loadstring
            local game3 = environment.game
            local packResults3 = packResults
            local httpGet2 = game3.HttpGet
            local packResults3Result = packResults3(httpGet2(game3, "https://raw.githubusercontent.com/senS24th/es-unk-stuff/refs/heads/main/gitlab_just_doing_anything_ts_days/testy.lua"))
            local unpackResults3 = unpackResults
            local resultCount2 = packResults3Result.n
            local loadstring3Result = loadstring3(unpackResults3(packResults3Result, 1, resultCount2))
            value4, value5 = loadstring3Result()
            value87[1] = value5
            value88[1] = value4
            return
          end
          checkpointLogger("Inside")
          environment.task.wait(0.001)
          environment.task.wait()
          local loadstring2 = environment.loadstring
          local game2 = environment.game
          local packResults2 = packResults
          local httpGet = game2.HttpGet
          local packResults2Result = packResults2(httpGet(game2, "https://raw.githubusercontent.com/senS24th/es-unk-stuff/refs/heads/main/gitlab_just_doing_anything_ts_days/testy.lua"))
          local unpackResults2 = unpackResults
          local resultCount = packResults2Result.n
          local loadstring2Result = loadstring2(unpackResults2(packResults2Result, 1, resultCount))
          value4, value5 = loadstring2Result()
          value87[1] = value5
          value88[1] = value4
          return
        end
      end
      value9 = values60
      getService, value9 = getService(value9)
      values69 = getService
      values70 = value9
      values63 = not values69
      if values63 then
        values60 = warningLogger
        getService = values60
        values20 = "Returned an error trying to load a dependency, containing one of sUNC's tests: "
        values20 = values20 .. values70
        value9 = values20
        getService(value9)
      end
      values63 = values68[1]
      values63 = not values63
      if values63 then
        values60 = warningLogger
        getService = values60
        value9 = "Wasn't able to load the needed dependency. This is either an issue with loadstring not placing the global variables in the environment, or: "
        values26 = values73[1]
        value10 = values26
        getService(value9, value10)
      end
      values63 = "getcallbackvalu"
      values20 = environment.utf8
      values26 = "char"
      values20 = values20.char
      value8 = values20
      getService = value8
      value9 = 1077
      getService = getService(value9)
      values60 = getService
      values93 = values63
      value22 = values60
      values63 = values93 .. value22
      values60 = {}
      values20 = "debug.getproto"
      values26 = true
      values60[values20] = values26
      values20 = "getcallingscript"
      values26 = true
      values60.getcallingscript = values26
      values20 = "debug.setstack"
      values26 = true
      values60[values20] = values26
      values20 = "hookmetamethod"
      values26 = true
      values60.hookmetamethod = values26
      values20 = "getrawmetatable"
      values26 = true
      values60.getrawmetatable = values26
      values20 = true
      values60[values63] = values20
      values20 = "checkcaller"
      values26 = true
      values60.checkcaller = values26
      values20 = "getnamecallmethod"
      values26 = true
      values60.getnamecallmethod = values26
      values20 = "debug.getupvalu\208\181"
      values26 = true
      values60[values20] = values26
      values20 = "debug.getinfo"
      values26 = true
      values60[values20] = values26
      values20 = "filtergc"
      values26 = true
      values60.filtergc = values26
      values20 = values68[1]
      if values20 then
        values29 = environment.pairs
        getService = values29
        values30 = values68[1]
        value9 = values30
        getService, value9, value10 = getService(value9)
        values20 = getService
        values26 = value9
        values34 = value10
        values22 = values26
        values25 = values34
        
        function callback2()
          local values2911, condition, item2, getService5, value95, value102, values315, environment2, value42
          while "task" do
            local values202 = values20
            getService = values202
            local values222 = values22
            value9 = values222
            local values252 = values25
            value10 = values252
            local getService2 = getService
            local value92 = value9
            value102 = value10
            getService5, value95 = getService2(value92, value102)
            getService = getService5
            value9 = value95
            local getService3 = getService
            values27 = getService3
            local value93 = value9
            values26 = value93
            values25 = nil
            if values27 ~= values25 then
              values25 = false
            else
              values25 = true
            end
            if values25 then
              return 0
            end
            local values272 = values27
            values25 = values272
            local values273 = values27
            values27 = values273
            local values262 = values26
            values28 = values262
            item2 = values60[values27]
            values29 = item2
            condition = not values29
            values29 = condition
            values2911 = values29
            if not values2911 then
              values30 = "neutral"
              local values282 = values28
              condition = values30
              if values282 == condition then
                values29 = false
              else
                values29 = true
              end
              values2911 = values29
              if values2911 then
                values30 = true
                local values283 = values28
                condition = values30
                if values283 ~= condition then
                  values29 = false
                else
                  values29 = true
                end
                values2911 = values29
                if not values2911 then
                  local values278 = values27
                  condition = values63
                  if values278 == condition then
                    values29 = false
                  else
                    values29 = true
                  end
                  values2911 = values29
                  if values2911 then
                    local item = values58[1]
                    values29 = item
                    local values296 = values29
                    condition = values27
                    item2 = values296[condition]
                    values29 = item2
                    values2911 = values29
                    if values2911 then
                      values29 = true
                      local values299 = values29
                      value2[1] = values299
                      values29 = true
                      local values2910 = values29
                      local values574 = values57
                      local values2712 = values27
                      values574[values2712] = values2910
                      values29 = true
                      values2911 = values29
                      condition = values12
                      item2 = values27
                      condition[item2] = values2911
                    else
                      values29 = true
                      local values297 = values29
                      local values573 = values57
                      local values279 = values27
                      values573[values279] = values297
                      values29 = false
                      local values298 = values29
                      local values123 = values12
                      local values2710 = values27
                      values123[values2710] = values298
                      local values284 = values28
                      local values83 = values8
                      local values2711 = values27
                      values83[values2711] = values284
                      local warningLogger2 = warningLogger
                      values30 = warningLogger2
                      local values304 = values30
                      value8 = values304
                      local value85 = value8
                      getService = value85
                      environment2 = environment
                      local utf83 = environment2.utf8
                      values32 = utf83
                      values33 = "char"
                      item2 = values32[values33]
                      values32 = item2
                      local values324 = values32
                      value9 = values324
                      values33 = 10060
                      local values332 = values33
                      value8 = values332
                      local value86 = value8
                      value10 = value86
                      local value9Result = value9(value10)
                      value9 = value9Result
                      local value94 = value9
                      values31 = value94
                      values32 = " "
                      local value3 = values32 .. values27
                      values32 = value3
                      values315 = values31
                      local value4 = values315 .. values32
                      value42 = value4
                      values31 = value4
                      local values314 = values31
                      value8 = values314
                      local value87 = value8
                      value9 = value87
                      values2911 = values28
                      condition = values2911
                      value10 = values2911
                      getService5 = getService
                      value95 = value9
                      value102 = value10
                      getService5(value95, value102)
                    end
                  end
                else
                  values30 = "debug.getupvalu"
                  environment2 = environment
                  local utf82 = environment2.utf8
                  values32 = utf82
                  values33 = "char"
                  item2 = values32[values33]
                  values32 = item2
                  local values322 = values32
                  value8 = values322
                  local value82 = value8
                  getService = value82
                  value9 = 1077
                  local service = getService(value9)
                  getService = service
                  local getService4 = getService
                  values31 = getService4
                  local values302 = values30
                  local values312 = values31
                  getService5 = values302
                  value95 = values312
                  local value = values302 .. values312
                  value42 = value
                  values30 = value
                  local values276 = values27
                  condition = values30
                  if values276 == condition then
                    values29 = false
                  else
                    values29 = true
                  end
                  values2911 = values29
                  if values2911 then
                    values29 = true
                    local values295 = values29
                    local values572 = values57
                    item2 = values27
                    values572[item2] = values295
                    local values277 = values27
                    condition = values63
                    if values277 ~= condition then
                      values29 = false
                    else
                      values29 = true
                    end
                    values2911 = values29
                    if values2911 then
                      environment2 = environment
                      local task2 = environment2.task
                      values30 = task2
                      values31 = "delay"
                      item2 = values30[values31]
                      values30 = item2
                      local values303 = values30
                      getService = values303
                      values31 = 5
                      local values313 = values31
                      value8 = values313
                      local value83 = value8
                      value9 = value83
                      do
                        local value21
                        value21 = argument
                        
                        function item2(argument)
                          value21()
                          return
                        end
                      end
                      values32 = item2
                      local values323 = values32
                      value8 = values323
                      local value84 = value8
                      value10 = value84
                      getService5 = getService
                      value95 = value9
                      value102 = value10
                      getService5(value95, value102)
                    end
                    values29 = true
                    values2911 = values29
                    condition = values12
                    item2 = values27
                    condition[item2] = values2911
                  end
                end
              end
            else
              values29 = true
              local values292 = values29
              value2[1] = values292
              values29 = "LOOKIN_LIKE_SONIC"
              local values293 = values29
              local values82 = values8
              local values274 = values27
              values82[values274] = values293
              values29 = false
              local values294 = values29
              local values122 = values12
              local values275 = values27
              values122[values275] = values294
              values29 = true
              values2911 = values29
              condition = values57
              item2 = values27
              condition[item2] = values2911
            end
          end
        end
        
        callback2 = callback2()
        value21 = callback2
      end
      argument = "cache.invalidate"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value8 = values26
      value9 = value8
      getService = getService(value9)
      values20 = getService
      values27 = environment.pcall
      value8 = values27
      getService = value8
      do
        local value89, value90, value91, value92 = nil, values57, values73, values68
        value89 = values11
        value90 = values18
        value91 = values12
        value92 = value2
        
        function values28(...)
          return metadata.__testFactories["cache.invalidate"](value89, value90, value91, value92, packResults, unpackResults, environment)(...)
        end
      end
      value9 = values28
      getService, value9 = getService(value9)
      values26 = getService
      values34 = value9
      values27 = not values26
      if values27 then
        values28 = values18
        getService = values28
        values29 = false
        value9 = values29
        value10 = "cache.invalidate"
        value8 = values34
        value11 = value8
        getService(value9, value10, value11)
        values28 = "cache.invalidate"
        values27 = values12[values28]
        if values27 then
          values27 = true
          value2[1] = values27
        end
      end
      values27 = values20
      values93 = values27
      values28 = values93
      values27 = values93.Stop
      getService = values27
      value9 = values28
      value8 = argument
      value10 = value8
      getService(value9, value10)
      values28 = "cache.invalidate"
      values27 = values8[values28]
      values28 = nil
      if values27 ~= values28 then
        values27 = false
      else
        values27 = true
      end
      if values27 then
        values28 = values18
        getService = values28
        values29 = true
        value9 = values29
        values30 = "cache.invalidate"
        value8 = values30
        value10 = value8
        values31 = ""
        value8 = values31
        value11 = value8
        getService(value9, value10, value11)
        values28 = "cache.invalidate"
        values27 = values12[values28]
        values27 = not values27
        if values27 then
          values27 = true
          value2[1] = values27
        end
      end
      values27 = options
      values28 = "delaybetweentests"
      values27 = values27.delaybetweentests
      values28 = 0
      if not (values27 > values28) then
        values27 = false
      else
        values27 = true
      end
      if values27 then
        values28 = environment.task
        values29 = "wait"
        values28 = values28.wait
        getService = values28
        values29 = options
        values30 = "delaybetweentests"
        values29 = values29.delaybetweentests
        value9 = values29
        getService(value9)
      end
      argument = "cache.iscached"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value8 = values26
      value9 = value8
      getService = getService(value9)
      values20 = getService
      values29 = environment.pcall
      getService = values29
      do
        local value93, value94, value95, value96 = nil, values18, values12, value2
        value93 = values8
        value94 = values18
        value95 = values12
        value96 = value2
        
        function values30(...)
          return metadata.__testFactories["cache.iscached"](value93, value94, value95, value96, packResults, unpackResults, environment)(...)
        end
      end
      value8 = values30
      value9 = value8
      getService, value9 = getService(value9)
      values27 = getService
      values28 = value9
      values29 = not values27
      if values29 then
        values30 = values18
        getService = values30
        values31 = false
        value9 = values31
        values32 = "cache.iscached"
        value8 = values32
        value10 = value8
        value8 = values28
        value11 = value8
        getService(value9, value10, value11)
      end
      values30 = "cache.iscached"
      values29 = values8[values30]
      values30 = nil
      if values29 ~= values30 then
        values29 = false
      else
        values29 = true
      end
      if values29 then
        values30 = values18
        value8 = values30
        getService = value8
        values31 = true
        value9 = values31
        values32 = "cache.iscached"
        value8 = values32
        value10 = value8
        value11 = ""
        getService(value9, value10, value11)
      end
      values29 = values20
      values93 = values29
      values30 = values93
      values29 = values93.Stop
      value8 = values29
      getService = value8
      value9 = values30
      value10 = argument
      getService(value9, value10)
      argument = "cache.replace"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values31 = environment.pcall
      getService = values31
      do
        local value97, value98, value99, value100 = nil, values18, values12, value2
        value97 = values8
        value98 = values18
        value99 = values12
        value100 = value2
        
        function values32(...)
          return metadata.__testFactories["cache.replace"](value97, value98, value99, value100, environment)(...)
        end
      end
      value8 = values32
      value9 = value8
      getService, value9 = getService(value9)
      values29 = getService
      values30 = value9
      values31 = not values29
      if values31 then
        values32 = values18
        value8 = values32
        getService = value8
        values33 = false
        value8 = values33
        value9 = value8
        values35 = "cache.replace"
        value8 = "cache.replace"
        value10 = value8
        value11 = values30
        getService(value9, value10, value11)
        values32 = "cache.replace"
        values31 = values12[values32]
        if values31 then
          values31 = true
          value2[1] = values31
        end
      end
      values32 = "cache.replace"
      values31 = values8[values32]
      values32 = nil
      if values31 ~= values32 then
        values31 = false
      else
        values31 = true
      end
      if values31 then
        values32 = values18
        getService = values32
        values33 = true
        value8 = values33
        value9 = value8
        values35 = "cache.replace"
        value8 = "cache.replace"
        value10 = value8
        value11 = ""
        getService(value9, value10, value11)
      end
      values31 = values20
      values93 = values31
      values32 = values93
      values31 = values93.Stop
      getService = values31
      value9 = values32
      value10 = argument
      getService(value9, value10)
      values31 = options
      values32 = "printcheckpoints"
      values31 = values31.printcheckpoints
      if values31 then
        values32 = checkpointLogger
        getService = values32
        values33 = "Past cache"
        value8 = values33
        value9 = value8
        getService(value9)
      end
      values31 = options
      values32 = "printcheckpoints"
      values31 = values31.printcheckpoints
      if values31 then
        values32 = checkpointLogger
        getService = values32
        values33 = "Next: getcallbackvalue"
        value8 = values33
        value9 = value8
        getService(value9)
      end
      argument = "getcallbackvalue"
      values31 = options
      values32 = "delaybetweentests"
      values31 = values31.delaybetweentests
      values32 = 0
      if not (values31 > values32) then
        values31 = false
      else
        values31 = true
      end
      if values31 then
        values32 = environment.task
        values33 = "wait"
        values32 = values32.wait
        value8 = values32
        getService = value8
        values33 = options
        values33 = values33.delaybetweentests
        value8 = values33
        value9 = value8
        getService(value9)
      end
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      value8 = values20
      getService = value8
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values33 = environment.pcall
      getService = values33
      do
        local value101, value102, value103, value104, value105 = nil, values18, values12, value2, values8
        value102 = values18
        value103 = values12
        value104 = value2
        
        function values35(...)
          return metadata.__testFactories.getcallbackvalue(captured4, value102, value103, value104, checkpointLogger, packResults, unpackResults, environment)(...)
        end
      end
      value8 = values35
      value9 = value8
      getService, value9 = getService(value9)
      values31 = getService
      values32 = value9
      values33 = not values31
      if values33 then
        getService = values18
        value9 = false
        value10 = "getcallbackvalue"
        value11 = values32
        getService(value9, value10, value11)
        values33 = values12.getcallbackvalue
        if values33 then
          values33 = true
          value2[1] = values33
        end
      end
      values33 = values8.getcallbackvalue
      values33 = not values33
      if values33 then
        value8 = values18
        getService = value8
        value8 = true
        value9 = value8
        value10 = "getcallbackvalue"
        value11 = ""
        getService(value9, value10, value11)
      end
      values33 = captured4
      values33 = values33.whytheystoptostare
      values33 = not values33
      if values33 then
        getService = warningLogger
        value8 = "DTC"
        value9 = value8
        getService(value9)
        values33 = true
        value2[1] = values33
      end
      values33 = values20
      values93 = values33
      values33 = values93.Stop
      getService = values33
      value8 = values93
      value9 = value8
      value10 = argument
      getService(value9, value10)
      values33 = options
      values33 = values33.printcheckpoints
      if values33 then
        value8 = checkpointLogger
        getService = value8
        value9 = "Past getcallbackvalue"
        getService(value9)
      end
      values33 = options
      values33 = values33.printcheckpoints
      if values33 then
        value8 = checkpointLogger
        getService = value8
        value9 = "Next: getscriptclosure"
        getService(value9)
      end
      values33 = options
      values33 = values33.delaybetweentests
      if not (values33 > 0) then
        values33 = false
      else
        values33 = true
      end
      if values33 then
        getService = environment.task.wait
        value9 = options.delaybetweentests
        getService(value9)
      end
      argument = "getscriptclosure"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      value8 = values20
      getService = value8
      value9 = values26
      getService = getService(value9)
      values20 = getService
      value8 = environment.pcall
      getService = value8
      do
        local value106, value107, value108, value109 = nil, values18, values12, value2
        value106 = values18
        value107 = values12
        value108 = value2
        value109 = values5
        
        function values37(...)
          return metadata.__testFactories.getscriptclosure(value106, value107, value108, value109, packResults, unpackResults, environment)(...)
        end
      end
      value9 = values37
      getService, value9 = getService(value9)
      values33 = getService
      values35 = value9
      if not values33 then
        getService = values18
        value8 = false
        value9 = value8
        values39 = "getscriptclosure"
        value8 = "getscriptclosure"
        value10 = value8
        value8 = values35
        value11 = value8
        getService(value9, value10, value11)
        if values12.getscriptclosure then
          value2[1] = true
        end
      end
      if not values8.getscriptclosure then
        getService = values18
        value9 = true
        values39 = "getscriptclosure"
        value8 = "getscriptclosure"
        value10 = value8
        value11 = ""
        getService(value9, value10, value11)
      end
      values36 = values20
      getService = values36.Stop
      value9 = values36
      value8 = argument
      value10 = value8
      getService(value9, value10)
      if options.printcheckpoints then
        value8 = checkpointLogger
        getService = value8
        value8 = "Past getscriptclosure"
        value9 = value8
        getService(value9)
      end
      if options.printcheckpoints then
        value8 = checkpointLogger
        getService = value8
        value9 = "Next: cloneref"
        getService(value9)
      end
      values36 = options.delaybetweentests
      if not (values36 > 0) then
        values36 = false
      else
        values36 = true
      end
      if values36 then
        getService = environment.task.wait
        value9 = options.delaybetweentests
        getService(value9)
      end
      argument = "cloneref"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value9 = values26
      getService = getService(value9)
      values20 = getService
      getService = environment.pcall
      do
        local value110, value111, value112 = nil, values12, value2
        value110 = values18
        value111 = values12
        value112 = value2
        
        function values39(...)
          return metadata.__testFactories.cloneref(value110, value111, value112, packResults, unpackResults, hostFactories, environment)(...)
        end
      end
      value8 = values39
      value9 = value8
      getService, value9 = getService(value9)
      values36 = getService
      values37 = value9
      if not values36 then
        value8 = values18
        getService = value8
        value8 = false
        value9 = value8
        value10 = "cloneref"
        value11 = values37
        getService(value9, value10, value11)
        if values12.cloneref then
          value2[1] = true
        end
      end
      if not values8.cloneref then
        getService = values18
        value8 = true
        value9 = value8
        value10 = "cloneref"
        value11 = ""
        getService(value9, value10, value11)
      end
      values38 = values20
      getService = values38.Stop
      value9 = values38
      value10 = argument
      getService(value9, value10)
      if options.printcheckpoints then
        value8 = checkpointLogger
        getService = value8
        value8 = "Past cloneref"
        value9 = value8
        getService(value9)
      end
      if options.printcheckpoints then
        getService = checkpointLogger
        value9 = "Next: compareinstances"
        getService(value9)
      end
      values38 = options.delaybetweentests
      if not (values38 > 0) then
        values38 = false
      else
        values38 = true
      end
      if values38 then
        getService = environment.task.wait
        value9 = options.delaybetweentests
        getService(value9)
      end
      argument = "compareinstances"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      value8 = values20
      getService = value8
      value9 = values26
      getService = getService(value9)
      values20 = getService
      value8 = environment.pcall
      getService = value8
      do
        local value113, value114, value115, value116 = nil, values12, value2, values5
        value113 = values8
        value114 = values18
        value115 = values12
        value116 = value2
        
        function values41(...)
          return metadata.__testFactories.compareinstances(value113, value114, value115, value116, environment)(...)
        end
      end
      value8 = values41
      value9 = value8
      getService, value9 = getService(value9)
      values38 = getService
      values39 = value9
      if not values38 then
        getService = values18
        value9 = false
        value10 = "compareinstances"
        value11 = values39
        getService(value9, value10, value11)
        if values12.compareinstances then
          value2[1] = true
        end
      end
      if not values8.compareinstances then
        getService = values18
        value8 = true
        value9 = value8
        value10 = "compareinstances"
        value11 = ""
        getService(value9, value10, value11)
      end
      values40 = values20
      getService = values40.Stop
      value9 = values40
      value8 = argument
      value10 = value8
      getService(value9, value10)
      if options.printcheckpoints then
        value8 = checkpointLogger
        getService = value8
        value8 = "Past compareinstances"
        value9 = value8
        getService(value9)
      end
      if options.printcheckpoints then
        value8 = checkpointLogger
        getService = value8
        value9 = "Next: getrenv"
        getService(value9)
      end
      values40 = options.delaybetweentests
      if not (values40 > 0) then
        values40 = false
      else
        values40 = true
      end
      if values40 then
        getService = environment.task.wait
        value8 = options.delaybetweentests
        value9 = value8
        getService(value9)
      end
      argument = "getrenv"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      value8 = values20
      getService = value8
      value9 = values26
      getService = getService(value9)
      values20 = getService
      value8 = environment.pcall
      getService = value8
      do
        local value117, value118, value119, value120, value121, value122, value123 = nil, values18, values12, value2, values8, values19, nil
        value117 = values18
        value118 = values12
        value119 = value2
        value120 = values11
        value122 = value6
        value123 = values5
        
        function values43(...)
          return metadata.__testFactories.getrenv(value117, value118, value119, value120, warningLogger, value122, value123, environment)(...)
        end
      end
      value9 = values43
      getService, value9 = getService(value9)
      values40 = getService
      values41 = value9
      if not values40 then
        value8 = values18
        getService = value8
        values22 = false
        value8 = values22
        value9 = value8
        value10 = "getrenv"
        value11 = values41
        getService(value9, value10, value11)
        if values12.getrenv then
          value2[1] = true
        end
      end
      values42 = values8.getrenv
      if values42 ~= nil then
        values42 = false
      else
        values42 = true
      end
      if values42 then
        getService = values18
        values22 = true
        value8 = values22
        value9 = value8
        value10 = "getrenv"
        value11 = ""
        getService(value9, value10, value11)
      end
      values42 = values20
      getService = values42.Stop
      value9 = values42
      value8 = argument
      value10 = value8
      getService(value9, value10)
      if options.printcheckpoints then
        getService = checkpointLogger
        values22 = "Past getrenv"
        value8 = values22
        value9 = value8
        getService(value9)
      end
      if options.printcheckpoints then
        value8 = checkpointLogger
        getService = value8
        value9 = "Next: firesignal"
        getService(value9)
      end
      values42 = options.delaybetweentests
      values43 = 0
      if not (values42 > 0) then
        values42 = false
      else
        values42 = true
      end
      if values42 then
        values43 = environment.task
        values22 = "wait"
        getService = values43.wait
        values22 = options
        values25 = "delaybetweentests"
        values22 = values22.delaybetweentests
        value9 = values22
        getService(value9)
      end
      argument = "firesignal"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value8 = values26
      value9 = value8
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      value8 = values22
      getService = value8
      do
        local value124, value125, value126, value127, value128 = nil, values12, value2, values11, values8
        value124 = values8
        value125 = values18
        value126 = values12
        value127 = value2
        value128 = values11
        
        function values25(...)
          return metadata.__testFactories.firesignal(value124, value125, value126, value127, value128, packResults, unpackResults, environment)(...)
        end
      end
      value8 = values25
      value9 = value8
      getService, value9 = getService(value9)
      values42 = getService
      values43 = value9
      values22 = not values42
      if values22 then
        values25 = values18
        value8 = values25
        getService = value8
        values23 = false
        value8 = values23
        value9 = value8
        value10 = "firesignal"
        value11 = values43
        getService(value9, value10, value11)
        values25 = "firesignal"
        values22 = values12.firesignal
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values25 = "firesignal"
      values22 = values8.firesignal
      values25 = nil
      if values22 ~= values25 then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values25 = values18
        getService = values25
        values23 = true
        value9 = values23
        value10 = "firesignal"
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = values20
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      getService = values22
      value8 = values25
      value9 = value8
      value8 = argument
      value10 = value8
      getService(value9, value10)
      values22 = options
      values25 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values25 = checkpointLogger
        value8 = values25
        getService = value8
        value9 = "past firesignal"
        getService(value9)
      end
      values22 = options
      values25 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values25 = checkpointLogger
        getService = values25
        value9 = "Next: Encoding"
        getService(value9)
      end
      values22 = options
      values25 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values25 = 0
      if not (values22 > values25) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values25 = environment.task
        values23 = "wait"
        values25 = values25.wait
        getService = values25
        values23 = options
        values23 = values23.delaybetweentests
        value8 = values23
        value9 = value8
        getService(value9)
      end
      values22 = environment.crypt
      if values22 then
        values25 = environment.type
        getService = values25
        values23 = environment.crypt
        value8 = values23
        value9 = value8
        getService = getService(value9)
        values22 = getService
        values25 = "table"
        if values22 ~= values25 then
          values22 = false
        else
          values22 = true
        end
      end
      if values22 then
        values25 = warningLogger
        getService = values25
        value9 = "The 'crypt' library is no longer tested. Please consult https://docs.sunc.su/Encoding/"
        getService(value9)
      end
      values22 = nil
      values93 = {}
      values93[1] = values25
      values25 = values93
      values25[1] = values22
      values22 = nil
      values93 = {}
      values93[1] = values23
      values23 = values93
      values23[1] = values22
      values22 = environment.base64encode
      values22 = not values22
      if values22 then
        value8 = values18
        getService = value8
        value8 = false
        value9 = value8
        value10 = "base64encode"
        values47 = "Function is missing"
        value8 = "Function is missing"
        value11 = value8
        getService(value9, value10, value11)
      end
      values22 = environment.game
      values44 = values25
      values93 = values22
      values25 = values93
      values22 = values93.HttpGet
      value8 = values22
      getService = value8
      value9 = values25
      values25 = values44
      value10 = "https://raw.githubusercontent.com/senS24th/es-unk-stuff/refs/heads/main/gitlab_just_doing_anything_ts_days/bytecode"
      getService = getService(value9, value10)
      values22 = getService
      getService = environment.pcall
      do
        local value129, value130, value131 = nil, values18, values12
        value129 = values22
        value130 = values25
        value131 = values18
        
        function values47(...)
          return metadata.__testFactories.base64encode(value129, value130, value131, environment)(...)
        end
      end
      value8 = values47
      value9 = value8
      getService, value9 = getService(value9)
      values44 = getService
      values45 = value9
      if not values44 then
        getService = values18
        value9 = false
        value8 = "base64encode"
        value10 = value8
        value11 = values45
        getService(value9, value10, value11)
      end
      if not environment.base64decode then
        value8 = values18
        getService = value8
        value9 = false
        value10 = "base64decode"
        values50 = "Function is missing"
        value8 = "Function is missing"
        value11 = value8
        getService(value9, value10, value11)
      end
      if not values8.base64encode then
        getService = values18
        value9 = true
        value10 = "base64encode"
        value11 = ""
        getService(value9, value10, value11)
      end
      values46 = environment.game
      value8 = values46.HttpGet
      getService = value8
      value8 = values46
      value9 = value8
      value10 = "https://raw.githubusercontent.com/senS24th/es-unk-stuff/refs/heads/main/gitlab_just_doing_anything_ts_days/encodedBytecode"
      getService = getService(value9, value10)
      values46 = getService
      argument = "base64decode"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      value8 = values20
      getService = value8
      value9 = values26
      getService = getService(value9)
      values20 = getService
      getService = environment.pcall
      do
        local value132, value133, value134 = nil, values25, values18
        value132 = values46
        value133 = values23
        value134 = values18
        
        function values50(...)
          return metadata.__testFactories.base64decode(value132, value133, value134, environment)(...)
        end
      end
      value9 = values50
      getService, value9 = getService(value9)
      values47 = getService
      values48 = value9
      if not values47 then
        value8 = values18
        getService = value8
        value9 = false
        value10 = "base64decode"
        value11 = values48
        getService(value9, value10, value11)
      end
      if not values8.base64decode then
        getService = values18
        value8 = true
        value9 = value8
        values52 = "base64decode"
        value8 = "base64decode"
        value10 = value8
        value8 = ""
        value11 = value8
        getService(value9, value10, value11)
      end
      values49 = values20
      values50 = values49
      getService = values49.Stop
      value9 = values49
      value8 = argument
      value10 = value8
      getService(value9, value10)
      if options.printcheckpoints then
        values50 = checkpointLogger
        value8 = values50
        getService = value8
        value8 = "Past b64"
        value9 = value8
        getService(value9)
      end
      values22 = options
      values22 = values22.printcheckpoints
      if values22 then
        getService = checkpointLogger
        value9 = "Next: lz4compress"
        getService(value9)
      end
      values22 = options
      values22 = values22.delaybetweentests
      if not (values22 > 0) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        getService = environment.task.wait
        value9 = options.delaybetweentests
        getService(value9)
      end
      argument = "lz4compress"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value8 = values26
      value9 = value8
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      getService = values22
      do
        local value135
        value135 = values18
        
        function values46(...)
          return metadata.__testFactories.lz4compress(value135, environment)(...)
        end
      end
      value9 = values46
      getService, value9 = getService(value9)
      values44 = getService
      values45 = value9
      values22 = not values44
      if values22 then
        getService = values18
        value8 = false
        value9 = value8
        values48 = "lz4compress"
        value8 = "lz4compress"
        value10 = value8
        value11 = values45
        getService(value9, value10, value11)
      end
      values22 = values8.lz4compress
      if values22 ~= nil then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        getService = values18
        value9 = true
        value10 = "lz4compress"
        value8 = ""
        value11 = value8
        getService(value9, value10, value11)
      end
      values22 = values20
      values46 = values25
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      getService = values22
      value9 = values25
      values25 = values46
      value8 = argument
      value10 = value8
      getService(value9, value10)
      values22 = options
      values22 = values22.delaybetweentests
      if not (values22 > 0) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        getService = environment.task.wait
        value8 = options.delaybetweentests
        value9 = value8
        getService(value9)
      end
      argument = "lz4decompress"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value8 = values26
      value9 = value8
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      getService = values22
      do
        local value136
        value136 = values18
        
        function values48(...)
          return metadata.__testFactories.lz4decompress(value136, packResults, unpackResults, environment)(...)
        end
      end
      value9 = values48
      getService, value9 = getService(value9)
      values46 = getService
      values47 = value9
      values22 = not values46
      if values22 then
        getService = values18
        value8 = false
        value9 = value8
        values50 = "lz4decompress"
        value8 = "lz4decompress"
        value10 = value8
        value8 = values47
        value11 = value8
        getService(value9, value10, value11)
      end
      values22 = values8.lz4decompress
      if values22 ~= nil then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        getService = values18
        value9 = true
        value10 = "lz4decompress"
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = values20
      values48 = values25
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      getService = values22
      value9 = values25
      values25 = values48
      value10 = argument
      getService(value9, value10)
      values22 = options
      values22 = values22.printcheckpoints
      if values22 then
        value8 = checkpointLogger
        getService = value8
        value8 = "Past lz4"
        value9 = value8
        getService(value9)
      end
      values22 = options
      values22 = values22.printcheckpoints
      if values22 then
        getService = checkpointLogger
        value9 = "Past Encoding"
        getService(value9)
      end
      values22 = options
      values22 = values22.printcheckpoints
      if values22 then
        getService = checkpointLogger
        value8 = "Next: getgc"
        value9 = value8
        getService(value9)
      end
      values22 = options
      values22 = values22.delaybetweentests
      if not (values22 > 0) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        getService = environment.task.wait
        value8 = options.delaybetweentests
        value9 = value8
        getService(value9)
      end
      argument = "getgc"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      value8 = values22
      getService = value8
      do
        local value137, value138, value139, value140 = nil, values23, values18, value2
        value137 = values18
        value138 = values12
        value139 = value2
        value140 = values24
        
        function values50(...)
          return metadata.__testFactories.getgc(value137, value138, value139, value140, packResults, unpackResults, environment)(...)
        end
      end
      value9 = values50
      getService, value9 = getService(value9)
      values48 = getService
      values49 = value9
      values22 = not values48
      if values22 then
        getService = values18
        value9 = false
        value10 = "getgc"
        value8 = values49
        value11 = value8
        getService(value9, value10, value11)
        values22 = values12.getgc
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values22 = values8.getgc
      if values22 ~= nil then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        value8 = values18
        getService = value8
        value9 = true
        value10 = "getgc"
        value8 = ""
        value11 = value8
        getService(value9, value10, value11)
      end
      values22 = values20
      values50 = values25
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      value8 = values22
      getService = value8
      value9 = values25
      values25 = values50
      value10 = argument
      getService(value9, value10)
      values22 = options
      values22 = values22.printcheckpoints
      if values22 then
        getService = checkpointLogger
        value8 = "Past [5]"
        value9 = value8
        getService(value9)
      end
      values22 = options
      values22 = values22.printcheckpoints
      if values22 then
        value8 = checkpointLogger
        getService = value8
        value9 = "Next: genv"
        getService(value9)
      end
      values22 = options
      values22 = values22.delaybetweentests
      if not (values22 > 0) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        value8 = environment.task.wait
        getService = value8
        value8 = options.delaybetweentests
        value9 = value8
        getService(value9)
      end
      argument = "getgenv"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      value8 = values20
      getService = value8
      value8 = values26
      value9 = value8
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      getService = values22
      do
        local value141, value142, value143, value144 = nil, values12, value2, values24
        value141 = values18
        value142 = values12
        value143 = value2
        value144 = values11
        
        function values52(...)
          return metadata.__testFactories.getgenv(value141, value142, value143, value144, environment)(...)
        end
      end
      value9 = values52
      getService, value9 = getService(value9)
      values50 = getService
      values51 = value9
      values22 = not values50
      if values22 then
        getService = values18
        value8 = false
        value9 = value8
        values54 = "getgenv"
        value8 = "getgenv"
        value10 = value8
        value8 = values51
        value11 = value8
        getService(value9, value10, value11)
        values22 = values12.getgenv
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values22 = values8.getgenv
      if values22 ~= nil then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        value8 = values18
        getService = value8
        value8 = true
        value9 = value8
        values54 = "getgenv"
        value8 = "getgenv"
        value10 = value8
        value8 = ""
        value11 = value8
        getService(value9, value10, value11)
      end
      values22 = values20
      values52 = values25
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      value8 = values22
      getService = value8
      value8 = values25
      value9 = value8
      values25 = values52
      value10 = argument
      getService(value9, value10)
      values22 = options
      values22 = values22.printcheckpoints
      if values22 then
        value8 = checkpointLogger
        getService = value8
        value9 = "Past genv"
        getService(value9)
      end
      values22 = options
      values22 = values22.printcheckpoints
      if values22 then
        value8 = checkpointLogger
        getService = value8
        value9 = "Next: getloadedmodules"
        getService(value9)
      end
      values22 = options
      values22 = values22.delaybetweentests
      if not (values22 > 0) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        value8 = environment.task.wait
        getService = value8
        value9 = options.delaybetweentests
        getService(value9)
      end
      argument = "getloadedmodules"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      value8 = values20
      getService = value8
      value8 = values26
      value9 = value8
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      value8 = values22
      getService = value8
      do
        local value145, value146, value147, value148 = nil, values12, value2, values11
        value145 = values18
        value146 = values12
        value147 = value2
        
        function values54(...)
          return metadata.__testFactories.getloadedmodules(value145, value146, value147, checkpointLogger, packResults, unpackResults, environment)(...)
        end
      end
      value8 = values54
      value9 = value8
      getService, value9 = getService(value9)
      values52 = getService
      values53 = value9
      values22 = not values52
      if values22 then
        getService = values18
        value9 = false
        value10 = "getloadedmodules"
        value11 = values53
        getService(value9, value10, value11)
      end
      values22 = values8.getloadedmodules
      if values22 ~= nil then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        getService = values18
        value9 = true
        values56 = "getloadedmodules"
        value8 = "getloadedmodules"
        value10 = value8
        value7 = ""
        value8 = value7
        value11 = value8
        getService(value9, value10, value11)
      end
      values22 = values20
      values54 = values25
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      getService = values22
      value8 = values25
      value9 = value8
      values25 = values54
      value8 = argument
      value10 = value8
      getService(value9, value10)
      values22 = options
      values22 = values22.printcheckpoints
      if values22 then
        getService = checkpointLogger
        value9 = "Past getloadedmodules"
        getService(value9)
      end
      values22 = options
      values22 = values22.printcheckpoints
      if values22 then
        getService = checkpointLogger
        value9 = "Next: setrawmetatable"
        getService(value9)
      end
      values22 = options
      values22 = values22.delaybetweentests
      if not (values22 > 0) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        getService = environment.task.wait
        value9 = options.delaybetweentests
        getService(value9)
      end
      argument = "setrawmetatable"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      value8 = values22
      getService = value8
      do
        local value149, value150, value151, value152 = nil, values12, value2, values11
        value149 = values8
        value150 = values18
        value151 = values12
        value152 = value2
        
        function values56(...)
          return metadata.__testFactories.setrawmetatable(value149, value150, value151, value152, packResults, unpackResults, environment)(...)
        end
      end
      value9 = values56
      getService, value9 = getService(value9)
      values54 = getService
      values55 = value9
      values22 = not values54
      if values22 then
        value8 = values18
        getService = value8
        value7 = false
        value9 = value7
        value10 = "setrawmetatable"
        value8 = values55
        value11 = value8
        getService(value9, value10, value11)
        values22 = values12.setrawmetatable
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values22 = values8.setrawmetatable
      if values22 ~= nil then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        value8 = values18
        getService = value8
        value7 = true
        value9 = value7
        value10 = "setrawmetatable"
        value6 = ""
        value8 = value6
        value11 = value8
        getService(value9, value10, value11)
      end
      values22 = values20
      values56 = values25
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      value8 = values22
      getService = value8
      value9 = values25
      values25 = values56
      value10 = argument
      getService(value9, value10)
      values22 = options
      values22 = values22.printcheckpoints
      if values22 then
        getService = checkpointLogger
        value7 = "past setrawmetatable"
        value8 = value7
        value9 = value8
        getService(value9)
      end
      values22 = options
      values22 = values22.printcheckpoints
      if values22 then
        value8 = checkpointLogger
        getService = value8
        value7 = "Next: getrunningscripts"
        value8 = value7
        value9 = value8
        getService(value9)
      end
      values22 = options
      values22 = values22.delaybetweentests
      values56 = 0
      if not (values22 > 0) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values56 = environment.task
        value7 = "wait"
        value8 = values56.wait
        getService = value8
        value7 = options
        value7 = value7.delaybetweentests
        value8 = value7
        value9 = value8
        getService(value9)
      end
      argument = "getrunningscripts"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      value8 = values22
      getService = value8
      do
        local value153, value154, value155 = nil, values18, values12
        value153 = values18
        value154 = values12
        value155 = value2
        
        function warningLogger2(...)
          return metadata.__testFactories.getrunningscripts(value153, value154, value155, packResults, unpackResults, environment)(...)
        end
      end
      value8 = warningLogger2
      value9 = value8
      getService, value9 = getService(value9)
      values56 = getService
      value7 = value9
      values22 = not values56
      if values22 then
        value8 = values18
        getService = value8
        value6 = false
        value9 = value6
        values23 = "getrunningscripts"
        value8 = values23
        value10 = value8
        value8 = value7
        value11 = value8
        getService(value9, value10, value11)
        values22 = values12.getrunningscripts
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values22 = values8.getrunningscripts
      values22 = not values22
      if values22 then
        getService = values18
        value6 = true
        value8 = value6
        value9 = value8
        value10 = "getrunningscripts"
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = values20
      warningLogger2 = values25
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      value8 = values22
      getService = value8
      value9 = values25
      values25 = warningLogger2
      value10 = argument
      getService(value9, value10)
      values22 = options
      values22 = values22.printcheckpoints
      if values22 then
        getService = checkpointLogger
        value9 = "past getrunningscripts"
        getService(value9)
      end
      values22 = options
      values22 = values22.printcheckpoints
      if values22 then
        value8 = checkpointLogger
        getService = value8
        value9 = "Next: getscripts"
        getService(value9)
      end
      warningLogger2 = environment.task
      value6 = "wait"
      getService = warningLogger2.wait
      value6 = options
      values23 = "delaybetweentests"
      value6 = value6.delaybetweentests
      value9 = value6
      getService(value9)
      argument = "getscripts"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      value8 = values22
      getService = value8
      do
        local value156, value157, value158 = nil, values12, value2
        value156 = values18
        value157 = values12
        value158 = value2
        
        function values23(...)
          return metadata.__testFactories.getscripts(value156, value157, value158, packResults, unpackResults, environment)(...)
        end
      end
      value9 = values23
      getService, value9 = getService(value9)
      warningLogger2 = getService
      value6 = value9
      values22 = not warningLogger2
      if values22 then
        values23 = values18
        getService = values23
        values24 = false
        value9 = values24
        value10 = "getscripts"
        value11 = value6
        getService(value9, value10, value11)
        values23 = "getscripts"
        values22 = values12.getscripts
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values23 = "getscripts"
      values22 = values8.getscripts
      values23 = nil
      if values22 ~= values23 then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values23 = values18
        getService = values23
        values24 = true
        value8 = values24
        value9 = value8
        values23 = "getscripts"
        value8 = values23
        value10 = value8
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = values20
      values23 = values25
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      getService = values22
      value9 = values25
      values25 = values23
      value8 = argument
      value10 = value8
      getService(value9, value10)
      values22 = options
      values23 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values23 = checkpointLogger
        value8 = values23
        getService = value8
        value9 = "past getscripts"
        getService(value9)
      end
      values22 = options
      values23 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values23 = checkpointLogger
        value8 = values23
        getService = value8
        values24 = "Next: getscriptfromthread"
        value8 = values24
        value9 = value8
        getService(value9)
      end
      values22 = environment.pcall
      value8 = values22
      getService = value8
      do
        local value159, value160, value161 = nil, values12, value2
        value159 = values18
        value160 = values12
        value161 = value2
        
        function values23(...)
          return metadata.__testFactories.getscriptfromthread(value159, value160, value161, packResults, unpackResults, environment)(...)
        end
      end
      value8 = values23
      value9 = value8
      getService, value9 = getService(value9)
      values23 = getService
      values24 = value9
      values22 = not values23
      if values22 then
        values23 = values18
        value8 = values23
        getService = value8
        value6 = false
        value9 = value6
        values23 = "getscriptfromthread"
        value8 = values23
        value10 = value8
        value11 = values24
        getService(value9, value10, value11)
        values23 = "getscriptfromthread"
        values22 = values12.getscriptfromthread
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values23 = "getscriptfromthread"
      values22 = values8.getscriptfromthread
      values23 = nil
      if values22 ~= values23 then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values23 = values18
        getService = values23
        value6 = true
        value9 = value6
        value10 = "getscriptfromthread"
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = options
      values23 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values23 = checkpointLogger
        value8 = values23
        getService = value8
        value9 = "Next: getsenv"
        getService(value9)
      end
      values22 = options
      values23 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values23 = 0
      if not (values22 > values23) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values23 = environment.task
        value6 = "wait"
        values23 = values23.wait
        getService = values23
        value6 = options
        values23 = "delaybetweentests"
        value6 = value6.delaybetweentests
        value9 = value6
        getService(value9)
      end
      argument = "getsenv"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      value8 = values22
      getService = value8
      do
        local value162, value163, value164, value165 = nil, values12, value2, value2
        value162 = values18
        value163 = values12
        value164 = value2
        value165 = values5
        
        function values23(...)
          return metadata.__testFactories.getsenv(value162, value163, value164, value165, packResults, unpackResults, metadata, environment)(...)
        end
      end
      value9 = values23
      getService, value9 = getService(value9)
      values23 = getService
      value6 = value9
      values22 = not values23
      if values22 then
        values23 = values18
        getService = values23
        values24 = false
        value8 = values24
        value9 = value8
        value10 = "getsenv"
        value8 = value6
        value11 = value8
        getService(value9, value10, value11)
        values23 = "getsenv"
        values22 = values12.getsenv
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values23 = "getsenv"
      values22 = values8.getsenv
      values23 = nil
      if values22 ~= values23 then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values23 = values18
        getService = values23
        values24 = true
        value9 = values24
        values23 = "getsenv"
        value8 = values23
        value10 = value8
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = values20
      values23 = values25
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      getService = values22
      value8 = values25
      value9 = value8
      values25 = values23
      value8 = argument
      value10 = value8
      getService(value9, value10)
      values22 = options
      values23 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values23 = checkpointLogger
        value8 = values23
        getService = value8
        value9 = "Past getsenv"
        getService(value9)
      end
      values22 = options
      values23 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values23 = checkpointLogger
        value8 = values23
        getService = value8
        values24 = "Next: debug.getproto[o]"
        value8 = values24
        value9 = value8
        getService(value9)
      end
      values22 = options
      values23 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values23 = 0
      if not (values22 > values23) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values23 = environment.task
        values24 = "wait"
        values23 = values23.wait
        value8 = values23
        getService = value8
        values24 = options
        values23 = "delaybetweentests"
        values24 = values24.delaybetweentests
        value8 = values24
        value9 = value8
        getService(value9)
      end
      argument = "debug.getproto"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      value8 = values20
      getService = value8
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      getService = values22
      do
        local value166, value167, value168, value169, value170 = nil, values12, value2, values5, values11
        value167 = values18
        value168 = values12
        value169 = value2
        value170 = values5
        
        function values23(...)
          return metadata.__testFactories["debug.getproto"](captured4, value167, value168, value169, value170, packResults, unpackResults, environment)(...)
        end
      end
      value9 = values23
      getService, value9 = getService(value9)
      values23 = getService
      values24 = value9
      values22 = not values23
      if values22 then
        values23 = values18
        getService = values23
        value6 = false
        value9 = value6
        value10 = "debug.getproto"
        value8 = values24
        value11 = value8
        getService(value9, value10, value11)
        values23 = "debug.getproto"
        values22 = values12[values23]
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values23 = "debug.getproto"
      values22 = values8[values23]
      values22 = not values22
      if values22 then
        values23 = values18
        getService = values23
        value6 = true
        value9 = value6
        values24 = "debug.getproto"
        value8 = values24
        value10 = value8
        values23 = ""
        value8 = values23
        value11 = value8
        getService(value9, value10, value11)
      end
      values22 = captured4
      values23 = "ilovelosingcontrol"
      values22 = values22.ilovelosingcontrol
      values22 = not values22
      if values22 then
        values22 = true
        value2[1] = values22
      end
      values22 = values20
      values23 = values25
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      getService = values22
      value9 = values25
      values25 = values23
      value8 = argument
      value10 = value8
      getService(value9, value10)
      values22 = options
      values23 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values23 = checkpointLogger
        value8 = values23
        getService = value8
        value9 = "past debug.getproto[o]"
        getService(value9)
      end
      values22 = options
      values23 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values23 = checkpointLogger
        value8 = values23
        getService = value8
        value9 = "Next: debug.getconstant"
        getService(value9)
      end
      values22 = options
      values23 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values23 = 0
      if not (values22 > values23) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values23 = environment.task
        value6 = "wait"
        values23 = values23.wait
        value8 = values23
        getService = value8
        value6 = options
        values24 = "delaybetweentests"
        value6 = value6.delaybetweentests
        value9 = value6
        getService(value9)
      end
      argument = "debug.getconstant"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      getService = values22
      do
        local value171, value172, value173 = nil, values18, values12
        value171 = values18
        value172 = values12
        value173 = value2
        
        function values24(...)
          return metadata.__testFactories["debug.getconstant"](value171, value172, value173, packResults, unpackResults, environment)(...)
        end
      end
      value8 = values24
      value9 = value8
      getService, value9 = getService(value9)
      values23 = getService
      value6 = value9
      values22 = not values23
      if values22 then
        values24 = values18
        value8 = values24
        getService = value8
        values23 = false
        value9 = values23
        value10 = "debug.getconstant"
        value11 = value6
        getService(value9, value10, value11)
        values24 = "debug.getconstant"
        values22 = values12[values24]
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values24 = "debug.getconstant"
      values22 = values8[values24]
      values22 = not values22
      if values22 then
        values24 = values18
        getService = values24
        values23 = true
        value8 = values23
        value9 = value8
        value10 = "debug.getconstant"
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = values20
      values24 = values25
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      value8 = values22
      getService = value8
      value9 = values25
      values25 = values24
      value10 = argument
      getService(value9, value10)
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        getService = values24
        values23 = "Past debug.getconstant"
        value8 = values23
        value9 = value8
        getService(value9)
      end
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        value8 = values24
        getService = value8
        value9 = "Next: debug.getupvalue"
        getService(value9)
      end
      values22 = options
      values24 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values24 = 0
      if not (values22 > values24) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values24 = environment.task
        values23 = "wait"
        values24 = values24.wait
        getService = values24
        values23 = options
        values24 = "delaybetweentests"
        values23 = values23.delaybetweentests
        value9 = values23
        getService(value9)
      end
      argument = "debug.getupvalue"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      value8 = values20
      getService = value8
      value8 = values26
      value9 = value8
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      getService = values22
      do
        local value174, value175, value176 = nil, values12, value2
        value174 = values18
        value175 = values12
        value176 = value2
        
        function values24(...)
          return metadata.__testFactories["debug.getupvalue"](value174, value175, value176, environment)(...)
        end
      end
      value8 = values24
      value9 = value8
      getService, value9 = getService(value9)
      values24 = getService
      values23 = value9
      values22 = not values24
      if values22 then
        values24 = values18
        getService = values24
        value6 = false
        value9 = value6
        value10 = "debug.getupvalue"
        value11 = values23
        getService(value9, value10, value11)
        values24 = "debug.getupvalue"
        values22 = values12[values24]
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values24 = "debug.getupvalue"
      values22 = values8[values24]
      values22 = not values22
      if values22 then
        values24 = values18
        value8 = values24
        getService = value8
        value6 = true
        value9 = value6
        value10 = "debug.getupvalue"
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = values20
      values24 = values25
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      getService = values22
      value8 = values25
      value9 = value8
      values25 = values24
      value10 = argument
      getService(value9, value10)
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        getService = values24
        value9 = "past debug.getupvalue"
        getService(value9)
      end
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        value8 = values24
        getService = value8
        value9 = "Next: debug.setupvalue"
        getService(value9)
      end
      values22 = options
      values24 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values24 = 0
      if not (values22 > values24) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values24 = environment.task
        values23 = "wait"
        values24 = values24.wait
        value8 = values24
        getService = value8
        values23 = options
        values24 = "delaybetweentests"
        values23 = values23.delaybetweentests
        value9 = values23
        getService(value9)
      end
      argument = "debug.setupvalue"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      getService = values22
      do
        local value177, value178, value179 = nil, values12, value2
        value177 = values18
        value178 = values12
        value179 = value2
        
        function values24(...)
          return metadata.__testFactories["debug.setupvalue"](value177, value178, value179, environment)(...)
        end
      end
      value8 = values24
      value9 = value8
      getService, value9 = getService(value9)
      values24 = getService
      values23 = value9
      values22 = not values24
      if values22 then
        values24 = values18
        value8 = values24
        getService = value8
        value6 = false
        value9 = value6
        value10 = "debug.setupvalue"
        value8 = values23
        value11 = value8
        getService(value9, value10, value11)
      end
      values24 = "debug.setupvalue"
      values22 = values8[values24]
      values22 = not values22
      if values22 then
        values24 = values18
        getService = values24
        value6 = true
        value9 = value6
        value10 = "debug.setupvalue"
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = values20
      values24 = values25
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      getService = values22
      value8 = values25
      value9 = value8
      values25 = values24
      value10 = argument
      getService(value9, value10)
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        getService = values24
        value9 = "Past debug.setupvalue"
        getService(value9)
      end
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        getService = values24
        value9 = "Next: debug.getprotos"
        getService(value9)
      end
      values22 = options
      values24 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values24 = 0
      if not (values22 > values24) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values24 = environment.task
        values23 = "wait"
        values24 = values24.wait
        getService = values24
        values23 = options
        values24 = "delaybetweentests"
        values23 = values23.delaybetweentests
        value9 = values23
        getService(value9)
      end
      argument = "debug.getprotos"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value8 = values26
      value9 = value8
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      value8 = values22
      getService = value8
      do
        local value180, value181, value182 = nil, values12, value2
        value180 = values18
        value181 = values12
        value182 = value2
        
        function values24(...)
          return metadata.__testFactories["debug.getprotos"](value180, value181, value182, packResults, unpackResults, environment)(...)
        end
      end
      value9 = values24
      getService, value9 = getService(value9)
      values24 = getService
      values23 = value9
      values22 = not values24
      if values22 then
        values24 = values18
        getService = values24
        value6 = false
        value9 = value6
        value10 = "debug.getprotos"
        value11 = values23
        getService(value9, value10, value11)
        values24 = "debug.getprotos"
        values22 = values12[values24]
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values24 = "debug.getprotos"
      values22 = values8[values24]
      values22 = not values22
      if values22 then
        values24 = values18
        getService = values24
        value6 = true
        value9 = value6
        value10 = "debug.getprotos"
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = values20
      values24 = values25
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      getService = values22
      value9 = values25
      values25 = values24
      value10 = argument
      getService(value9, value10)
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        value8 = values24
        getService = value8
        values23 = "Past debug.getprotos"
        value8 = values23
        value9 = value8
        getService(value9)
      end
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        getService = values24
        value9 = "Next: debug.getupvalues"
        getService(value9)
      end
      values22 = options
      values24 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values24 = 0
      if not (values22 > values24) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values24 = environment.task
        values23 = "wait"
        values24 = values24.wait
        getService = values24
        values23 = options
        values24 = "delaybetweentests"
        values23 = values23.delaybetweentests
        value9 = values23
        getService(value9)
      end
      argument = "debug.getupvalues"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      value8 = values20
      getService = value8
      value8 = values26
      value9 = value8
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      getService = values22
      do
        local value183, value184, value185 = nil, values12, value2
        value183 = values18
        value184 = values12
        value185 = value2
        
        function values24(...)
          return metadata.__testFactories["debug.getupvalues"](value183, value184, value185, environment)(...)
        end
      end
      value8 = values24
      value9 = value8
      getService, value9 = getService(value9)
      values24 = getService
      values23 = value9
      values22 = not values24
      if values22 then
        values24 = values18
        getService = values24
        value6 = false
        value9 = value6
        values24 = "debug.getupvalues"
        value8 = values24
        value10 = value8
        value11 = values23
        getService(value9, value10, value11)
        values24 = "debug.getupvalues"
        values22 = values12[values24]
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values24 = "debug.getupvalues"
      values22 = values8[values24]
      values22 = not values22
      if values22 then
        values24 = values18
        getService = values24
        value6 = true
        value9 = value6
        values24 = "debug.getupvalues"
        value8 = values24
        value10 = value8
        values23 = ""
        value8 = values23
        value11 = value8
        getService(value9, value10, value11)
      end
      values22 = values20
      values24 = values25
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      value8 = values22
      getService = value8
      value9 = values25
      values25 = values24
      value10 = argument
      getService(value9, value10)
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        getService = values24
        value6 = "Past debug.getupvalues"
        value8 = value6
        value9 = value8
        getService(value9)
      end
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        getService = values24
        value9 = "Next: debug.getstack"
        getService(value9)
      end
      values22 = options
      values24 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values24 = 0
      if not (values22 > values24) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values24 = environment.task
        value6 = "wait"
        values24 = values24.wait
        value8 = values24
        getService = value8
        value6 = options
        values24 = "delaybetweentests"
        value6 = value6.delaybetweentests
        value8 = value6
        value9 = value8
        getService(value9)
      end
      argument = "debug.getstack"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value8 = values26
      value9 = value8
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      getService = values22
      do
        local value186, value187, value188, value189, value190, value191 = nil, values12, value2, value2, values5, value6
        value188 = values8
        value189 = values18
        value190 = values12
        value191 = value2
        
        function values24(...)
          return metadata.__testFactories["debug.getstack"](options, checkpointLogger, value188, value189, value190, value191, hostFactories, environment)(...)
        end
      end
      value9 = values24
      getService, value9 = getService(value9)
      values24 = getService
      value6 = value9
      values22 = not values24
      if values22 then
        values24 = values18
        getService = values24
        values23 = false
        value8 = values23
        value9 = value8
        values24 = "debug.getstack"
        value8 = values24
        value10 = value8
        value11 = value6
        getService(value9, value10, value11)
        values24 = "debug.getstack"
        values22 = values12[values24]
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values24 = "debug.getstack"
      values22 = values8[values24]
      values22 = not values22
      if values22 then
        values24 = values18
        getService = values24
        values23 = true
        value9 = values23
        value10 = "debug.getstack"
        value6 = ""
        value8 = value6
        value11 = value8
        getService(value9, value10, value11)
      end
      values22 = values20
      values24 = values25
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      getService = values22
      value8 = values25
      value9 = value8
      values25 = values24
      value10 = argument
      getService(value9, value10)
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        getService = values24
        value9 = "Past debug.getstack"
        getService(value9)
      end
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        value8 = values24
        getService = value8
        value6 = "Next: debug.setstack"
        value8 = value6
        value9 = value8
        getService(value9)
      end
      values22 = options
      values24 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values24 = 0
      if not (values22 > values24) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values24 = environment.task
        value6 = "wait"
        values24 = values24.wait
        getService = values24
        value6 = options
        values24 = "delaybetweentests"
        value6 = value6.delaybetweentests
        value9 = value6
        getService(value9)
      end
      argument = "debug.setstack"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      value8 = values20
      getService = value8
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      value8 = values22
      getService = value8
      do
        local value192, value193, value194, value195, value196, value197, value198 = nil, values12, values8, values18, values12, value2, values5
        value192 = values8
        value193 = values18
        value194 = values12
        value195 = value2
        value196 = values2
        
        function values24(argument)
          local item = hostFactories[3]
          local values = {}
          local value1922 = value192
          values[1] = value1922
          local value1932 = value193
          values[2] = value1932
          local value1942 = value194
          values[3] = value1942
          local value1952 = value195
          values[4] = value1952
          local value1962 = value196
          values[5] = value1962
          local options2 = options
          values[6] = options2
          local checkpointLogger2 = checkpointLogger
          values[7] = checkpointLogger2
          item(values)()
          return
        end
      end
      value9 = values24
      getService, value9 = getService(value9)
      values24 = getService
      value6 = value9
      values22 = not values24
      if values22 then
        values24 = values18
        value8 = values24
        getService = value8
        values23 = false
        value9 = values23
        values24 = "debug.setstack"
        value8 = values24
        value10 = value8
        value11 = value6
        getService(value9, value10, value11)
        values24 = "debug.setstack"
        values22 = values12[values24]
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values24 = "debug.setstack"
      values22 = values8[values24]
      values22 = not values22
      if values22 then
        values24 = values18
        value8 = values24
        getService = value8
        values23 = true
        value9 = values23
        value10 = "debug.setstack"
        value6 = ""
        value8 = value6
        value11 = value8
        getService(value9, value10, value11)
      end
      values22 = values20
      values24 = values25
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      getService = values22
      value9 = values25
      values25 = values24
      value10 = argument
      getService(value9, value10)
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        getService = values24
        value9 = "Past debug.setstack[2]"
        getService(value9)
      end
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        value8 = values24
        getService = value8
        value9 = "Next: debug.getinfo"
        getService(value9)
      end
      values22 = options
      values24 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values24 = 0
      if not (values22 > values24) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values24 = environment.task
        value6 = "wait"
        values24 = values24.wait
        getService = values24
        value6 = options
        values24 = "delaybetweentests"
        value6 = value6.delaybetweentests
        value9 = value6
        getService(value9)
      end
      argument = "debug.getinfo"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      getService = values22
      do
        local value199
        value199 = values18
        
        function values24(...)
          return metadata.__testFactories["debug.getinfo"](value199, environment)(...)
        end
      end
      value8 = values24
      value9 = value8
      getService, value9 = getService(value9)
      values24 = getService
      value6 = value9
      values22 = not values24
      if values22 then
        values24 = values18
        getService = values24
        values23 = false
        value9 = values23
        values24 = "debug.getinfo"
        value8 = values24
        value10 = value8
        value11 = value6
        getService(value9, value10, value11)
      end
      values24 = "debug.getinfo"
      values22 = values8[values24]
      values22 = not values22
      if values22 then
        values24 = values18
        getService = values24
        values23 = true
        value9 = values23
        values24 = "debug.getinfo"
        value8 = values24
        value10 = value8
        value6 = ""
        value8 = value6
        value11 = value8
        getService(value9, value10, value11)
      end
      values22 = values20
      values24 = values25
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      value8 = values22
      getService = value8
      value9 = values25
      values25 = values24
      value8 = argument
      value10 = value8
      getService(value9, value10)
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        value8 = values24
        getService = value8
        values23 = "Past debug.getinfo"
        value8 = values23
        value9 = value8
        getService(value9)
      end
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        getService = values24
        values23 = "Next: debug.getconstants"
        value8 = values23
        value9 = value8
        getService(value9)
      end
      values22 = options
      values24 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values24 = 0
      if not (values22 > values24) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values24 = environment.task
        values23 = "wait"
        values24 = values24.wait
        getService = values24
        values23 = options
        values24 = "delaybetweentests"
        values23 = values23.delaybetweentests
        value9 = values23
        getService(value9)
      end
      argument = "debug.getconstants"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value8 = values26
      value9 = value8
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      value8 = values22
      getService = value8
      do
        local value200, value201, value202, value203 = nil, values18, values12, value2
        value200 = values18
        value201 = values12
        value202 = value2
        
        function values24(...)
          return metadata.__testFactories["debug.getconstants"](value200, value201, value202, checkpointLogger, environment)(...)
        end
      end
      value8 = values24
      value9 = value8
      getService, value9 = getService(value9)
      values24 = getService
      values23 = value9
      values22 = not values24
      if values22 then
        values24 = values18
        value8 = values24
        getService = value8
        value6 = false
        value8 = value6
        value9 = value8
        values26 = "debug.getconstants"
        value8 = values26
        value10 = value8
        value11 = values23
        getService(value9, value10, value11)
        values24 = "debug.getconstants"
        values22 = values12[values24]
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values24 = "debug.getconstants"
      values22 = values8[values24]
      values22 = not values22
      if values22 then
        values24 = values18
        getService = values24
        value6 = true
        value9 = value6
        values26 = "debug.getconstants"
        value8 = values26
        value10 = value8
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = values20
      values24 = values25
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      value8 = values22
      getService = value8
      value9 = values25
      values25 = values24
      value10 = argument
      getService(value9, value10)
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        value8 = values24
        getService = value8
        value9 = "Past debug.getconstants"
        getService(value9)
      end
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        getService = values24
        value6 = "Next: debug.setconstant"
        value8 = value6
        value9 = value8
        getService(value9)
      end
      values22 = options
      values24 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values24 = 0
      if not (values22 > values24) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values24 = environment.task
        value6 = "wait"
        values24 = values24.wait
        value8 = values24
        getService = value8
        value6 = options
        values26 = "delaybetweentests"
        value6 = value6.delaybetweentests
        value8 = value6
        value9 = value8
        getService(value9)
      end
      argument = "debug.setconstant"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      getService = values22
      do
        local value204, value205, value206, value207, value208 = nil, values12, value2, value2, values2
        value204 = values8
        value205 = values18
        value206 = values12
        value207 = value2
        value208 = values11
        
        function values26(...)
          return metadata.__testFactories["debug.setconstant"](value204, value205, value206, value207, value208, packResults, unpackResults, environment)(...)
        end
      end
      value9 = values26
      getService, value9 = getService(value9)
      values24 = getService
      value6 = value9
      values22 = not values24
      if values22 then
        values26 = values18
        value8 = values26
        getService = value8
        values23 = false
        value8 = values23
        value9 = value8
        value10 = "debug.setconstant"
        value8 = value6
        value11 = value8
        getService(value9, value10, value11)
        values26 = "debug.setconstant"
        values22 = values12[values26]
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values26 = "debug.setconstant"
      values22 = values8[values26]
      values22 = not values22
      if values22 then
        values26 = values18
        value8 = values26
        getService = value8
        values23 = true
        value9 = values23
        values24 = "debug.setconstant"
        value8 = values24
        value10 = value8
        value6 = ""
        value8 = value6
        value11 = value8
        getService(value9, value10, value11)
      end
      values22 = environment.workspace
      values26 = "FreakyBox"
      values22 = values22.FreakyBox
      values26 = "e"
      values22 = values22.e
      values26 = "Accessory (pillow)"
      values22 = values22[values26]
      values26 = "Handle"
      values22 = values22.Handle
      values26 = "CollisionGroup"
      values23 = "Default"
      values22.CollisionGroup = values23
      values22 = environment.workspace
      values26 = "FreakyBox"
      values22 = values22.FreakyBox
      values26 = "e"
      values22 = values22.e
      values26 = "Cube.012Accessory"
      values22 = values22[values26]
      values26 = "Handle"
      values22 = values22.Handle
      values26 = "CollisionGroup"
      values23 = "Default"
      values22.CollisionGroup = values23
      values22 = values20
      values24 = values25
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      value8 = values22
      getService = value8
      value9 = values25
      value10 = argument
      getService(value9, value10)
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        value8 = values24
        getService = value8
        value6 = "Past debug.setconstant"
        value8 = value6
        value9 = value8
        getService(value9)
      end
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        getService = values24
        value9 = "Next: getfunctionhash"
        getService(value9)
      end
      values22 = options
      values24 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values24 = 0
      if not (values22 > values24) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values24 = environment.task
        value6 = "wait"
        values24 = values24.wait
        value8 = values24
        getService = value8
        value6 = options
        values26 = "delaybetweentests"
        value6 = value6.delaybetweentests
        value9 = value6
        getService(value9)
      end
      argument = "getfunctionhash"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      value8 = values20
      getService = value8
      value8 = values26
      value9 = value8
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      value8 = values22
      getService = value8
      do
        local value209, value210, value211 = nil, values18, values12
        value209 = values18
        value210 = values12
        value211 = value2
        
        function values26(...)
          return metadata.__testFactories.getfunctionhash(value209, value210, value211, packResults, unpackResults, environment)(...)
        end
      end
      value9 = values26
      getService, value9 = getService(value9)
      values24 = getService
      value6 = value9
      values22 = not values24
      if values22 then
        values26 = values18
        getService = values26
        values23 = false
        value9 = values23
        values24 = "getfunctionhash"
        value8 = values24
        value10 = value8
        value11 = value6
        getService(value9, value10, value11)
        values26 = "getfunctionhash"
        values22 = values12.getfunctionhash
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values26 = "getfunctionhash"
      values22 = values8.getfunctionhash
      values22 = not values22
      if values22 then
        values26 = values18
        getService = values26
        values23 = true
        value9 = values23
        values24 = "getfunctionhash"
        value8 = values24
        value10 = value8
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = values20
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      getService = values22
      value9 = values25
      value8 = argument
      value10 = value8
      getService(value9, value10)
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        value8 = values24
        getService = value8
        value6 = "Past getfunctionhash"
        value8 = value6
        value9 = value8
        getService(value9)
      end
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        getService = values24
        value9 = "Next: filtergc"
        getService(value9)
      end
      values22 = options
      values24 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values24 = 0
      if not (values22 > values24) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values24 = environment.task
        value6 = "wait"
        values24 = values24.wait
        getService = values24
        value6 = options
        values26 = "delaybetweentests"
        value6 = value6.delaybetweentests
        value9 = value6
        getService(value9)
      end
      argument = "filtergc"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      value8 = values20
      getService = value8
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      getService = values22
      do
        local value212, value213, value214, value215, value216 = nil, values12, value2, value2, values11
        value212 = values18
        value213 = values12
        value214 = value2
        value215 = values8
        value216 = values11
        
        function values26(...)
          return metadata.__testFactories.filtergc(value212, value213, value214, value215, value216, packResults, unpackResults, hostFactories, environment)(...)
        end
      end
      value8 = values26
      value9 = value8
      getService, value9 = getService(value9)
      values24 = getService
      value6 = value9
      values22 = not values24
      if values22 then
        values26 = values18
        getService = values26
        values23 = false
        value9 = values23
        value10 = "filtergc"
        value8 = value6
        value11 = value8
        getService(value9, value10, value11)
        values26 = "filtergc"
        values22 = values12.filtergc
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values26 = "filtergc"
      values22 = values8.filtergc
      values22 = not values22
      if values22 then
        values26 = values18
        getService = values26
        values23 = true
        value8 = values23
        value9 = value8
        value10 = "filtergc"
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = values20
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      getService = values22
      value9 = values25
      value10 = argument
      getService(value9, value10)
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        getService = values24
        value9 = "Past filtergc"
        getService(value9)
      end
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        getService = values24
        value9 = "Next: replicatesignal"
        getService(value9)
      end
      values22 = options
      values24 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values24 = 0
      if not (values22 > values24) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values24 = environment.task
        value6 = "wait"
        values24 = values24.wait
        value8 = values24
        getService = value8
        value6 = options
        values26 = "delaybetweentests"
        value6 = value6.delaybetweentests
        value8 = value6
        value9 = value8
        getService(value9)
      end
      argument = "replicatesignal"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value8 = values26
      value9 = value8
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      getService = values22
      do
        local value217, value218, value219 = nil, values12, value2
        value217 = values18
        value218 = values12
        value219 = value2
        
        function values26(...)
          return metadata.__testFactories.replicatesignal(value217, value218, value219, environment)(...)
        end
      end
      value9 = values26
      getService, value9 = getService(value9)
      values24 = getService
      value6 = value9
      values22 = environment.workspace
      values26 = "FreakyBox"
      values22 = values22.FreakyBox
      values26 = "e"
      values22 = values22.e
      values93 = values22
      values25 = values93
      values22 = values93.RemoveTag
      getService = values22
      value9 = values25
      value10 = "bro, hello? - flushed"
      getService(value9, value10)
      values22 = environment.workspace
      values26 = "FreakyBox"
      values22 = values22.FreakyBox
      values93 = values22
      values25 = values93
      values22 = values93.RemoveTag
      getService = values22
      value9 = values25
      values26 = "Boi so tuff rn"
      value8 = values26
      value10 = value8
      getService(value9, value10)
      values22 = environment.workspace
      values26 = "FreakyBox"
      values22 = values22.FreakyBox
      values93 = values22
      values25 = values93
      values22 = values93.RemoveTag
      value8 = values22
      getService = value8
      value9 = values25
      values26 = "Begging on everyone's knees to be popular"
      value8 = values26
      value10 = value8
      getService(value9, value10)
      values22 = environment.game
      values26 = "Players"
      values22 = values22.Players
      values26 = "LocalPlayer"
      values22 = values22.LocalPlayer
      values93 = values22
      values25 = values93
      values22 = values93.RemoveTag
      getService = values22
      value9 = values25
      values26 = "thunderclient?"
      value8 = values26
      value10 = value8
      getService(value9, value10)
      values22 = not values24
      if values22 then
        values26 = values18
        getService = values26
        values23 = false
        value9 = values23
        value10 = "replicatesignal"
        value11 = value6
        getService(value9, value10, value11)
        values26 = "replicatesignal"
        values22 = values12.replicatesignal
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values26 = "replicatesignal"
      values22 = values8.replicatesignal
      values22 = not values22
      if values22 then
        values26 = values18
        value8 = values26
        getService = value8
        values23 = true
        value8 = values23
        value9 = value8
        value10 = "replicatesignal"
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = values20
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      getService = values22
      value9 = values25
      value10 = argument
      getService(value9, value10)
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        getService = values24
        value9 = "Past replicatesigmal"
        getService(value9)
      end
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        getService = values24
        value9 = "Next: hookfunction"
        getService(value9)
      end
      values22 = options
      values24 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values24 = 0
      if not (values22 > values24) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values24 = environment.task
        value6 = "wait"
        values24 = values24.wait
        getService = values24
        value6 = options
        values26 = "delaybetweentests"
        value6 = value6.delaybetweentests
        value8 = value6
        value9 = value8
        getService(value9)
      end
      argument = "hookfunction"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      getService = values22
      do
        local value220, value221, value222, value223, value224, value225, value226, value227 = nil, values12, value2, values8, values11, value2, values5, argument
        value220 = values18
        value221 = values12
        value222 = value2
        value226 = values11
        value227 = values5
        
        function values26(...)
          return metadata.__testFactories.hookfunction(value220, value221, value222, warningLogger, options, checkpointLogger, value226, value227, packResults, unpackResults, environment)(...)
        end
      end
      value9 = values26
      getService, value9 = getService(value9)
      values24 = getService
      value6 = value9
      values22 = not values24
      if values22 then
        values26 = values18
        value8 = values26
        getService = value8
        values23 = false
        value8 = values23
        value9 = value8
        values24 = "hookfunction"
        value8 = values24
        value10 = value8
        value11 = value6
        getService(value9, value10, value11)
        values26 = "hookfunction"
        values22 = values12.hookfunction
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values26 = "hookfunction"
      values22 = values8.hookfunction
      values26 = nil
      if values22 ~= values26 then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values26 = values18
        getService = values26
        values23 = true
        value9 = values23
        value10 = "hookfunction"
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = values20
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      getService = values22
      value9 = values25
      value10 = argument
      getService(value9, value10)
      values22 = options
      values26 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values26 = checkpointLogger
        getService = values26
        value9 = "Past hookfunction"
        getService(value9)
      end
      values22 = options
      values26 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values26 = checkpointLogger
        getService = values26
        value9 = "Next: clonefunction"
        getService(value9)
      end
      values22 = options
      values26 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values26 = 0
      if not (values22 > values26) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values26 = environment.task
        values23 = "wait"
        values26 = values26.wait
        getService = values26
        values23 = options
        values24 = "delaybetweentests"
        values23 = values23.delaybetweentests
        value9 = values23
        getService(value9)
      end
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      value8 = values22
      getService = value8
      do
        local value228, value229, value230, value231 = nil, values12, value2, values8
        value228 = values18
        value229 = values12
        value230 = value2
        value231 = values8
        
        function values24(...)
          return metadata.__testFactories.clonefunction(value228, value229, value230, value231, packResults, unpackResults, environment)(...)
        end
      end
      value8 = values24
      value9 = value8
      getService, value9 = getService(value9)
      values26 = getService
      values23 = value9
      values22 = not values26
      if values22 then
        values24 = values18
        value8 = values24
        getService = value8
        value6 = false
        value8 = value6
        value9 = value8
        values24 = "clonefunction"
        value8 = values24
        value10 = value8
        value11 = values23
        getService(value9, value10, value11)
        values24 = "clonefunction"
        values22 = values12.clonefunction
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values24 = "clonefunction"
      values22 = values8.clonefunction
      values22 = not values22
      if values22 then
        values24 = values18
        getService = values24
        value6 = true
        value9 = value6
        value10 = "clonefunction"
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = values20
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      getService = values22
      value9 = values25
      value10 = "clonefunction"
      getService(value9, value10)
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        getService = values24
        value9 = "past clonefunction"
        getService(value9)
      end
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        value8 = values24
        getService = value8
        value6 = "Next: restorefunction"
        value8 = value6
        value9 = value8
        getService(value9)
      end
      values22 = options
      values24 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values24 = 0
      if not (values22 > values24) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values24 = environment.task
        value6 = "wait"
        values24 = values24.wait
        getService = values24
        value6 = options
        values24 = "delaybetweentests"
        value6 = value6.delaybetweentests
        value8 = value6
        value9 = value8
        getService(value9)
      end
      argument = "restorefunction"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      getService = values22
      do
        local value232, value233, value234, value235, value236, value237 = nil, values12, value2, values8, values11, value2
        value232 = values12
        value233 = values18
        value234 = value2
        value237 = values11
        
        function values24(...)
          return metadata.__testFactories.restorefunction(value232, value233, value234, options, checkpointLogger, value237, packResults, unpackResults, environment)(...)
        end
      end
      value9 = values24
      getService, value9 = getService(value9)
      values24 = getService
      value6 = value9
      values22 = not values24
      if values22 then
        values24 = values18
        getService = values24
        values23 = false
        value9 = values23
        value10 = "restorefunction"
        value8 = value6
        value11 = value8
        getService(value9, value10, value11)
        values24 = "restorefunction"
        values22 = values12.restorefunction
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values24 = "restorefunction"
      values22 = values8.restorefunction
      values24 = nil
      if values22 ~= values24 then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values24 = values18
        getService = values24
        values23 = true
        value8 = values23
        value9 = value8
        value10 = "restorefunction"
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = values20
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      getService = values22
      value9 = values25
      value10 = argument
      getService(value9, value10)
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        getService = values24
        values23 = "Past restorefunction"
        value8 = values23
        value9 = value8
        getService(value9)
      end
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        value8 = values24
        getService = value8
        value9 = "Next: iscclosure"
        getService(value9)
      end
      values22 = options
      values24 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values24 = 0
      if not (values22 > values24) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values24 = environment.task
        values23 = "wait"
        values24 = values24.wait
        value8 = values24
        getService = value8
        values23 = options
        values24 = "delaybetweentests"
        values23 = values23.delaybetweentests
        value9 = values23
        getService(value9)
      end
      argument = "iscclosure"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      value8 = values20
      getService = value8
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      value8 = values22
      getService = value8
      do
        local value238, value239, value240 = nil, values18, value2
        value238 = values18
        value239 = values12
        value240 = value2
        
        function values24(...)
          return metadata.__testFactories.iscclosure(value238, value239, value240, environment)(...)
        end
      end
      value9 = values24
      getService, value9 = getService(value9)
      values24 = getService
      values23 = value9
      values22 = not values24
      if values22 then
        values24 = values18
        value8 = values24
        getService = value8
        value6 = false
        value8 = value6
        value9 = value8
        value10 = "iscclosure"
        value8 = values23
        value11 = value8
        getService(value9, value10, value11)
        values24 = "iscclosure"
        values22 = values12.iscclosure
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values24 = "iscclosure"
      values22 = values8.iscclosure
      values24 = nil
      if values22 ~= values24 then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values24 = values18
        value8 = values24
        getService = value8
        value6 = true
        value9 = value6
        value10 = "iscclosure"
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = values20
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      getService = values22
      value8 = values25
      value9 = value8
      value8 = argument
      value10 = value8
      getService(value9, value10)
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        value8 = values24
        getService = value8
        value6 = "Past iscclosure"
        value8 = value6
        value9 = value8
        getService(value9)
      end
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        getService = values24
        value6 = "Next: isexecutorclosure"
        value8 = value6
        value9 = value8
        getService(value9)
      end
      values22 = options
      values24 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values24 = 0
      if not (values22 > values24) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values24 = environment.task
        value6 = "wait"
        values24 = values24.wait
        getService = values24
        value6 = options
        values24 = "delaybetweentests"
        value6 = value6.delaybetweentests
        value9 = value6
        getService(value9)
      end
      argument = "isexecutorclosure"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value8 = values26
      value9 = value8
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      value8 = values22
      getService = value8
      do
        local value241, value242, value243, value244 = nil, values12, value2, values8
        value241 = values8
        value242 = values18
        value243 = values11
        
        function values24(...)
          return metadata.__testFactories.isexecutorclosure(value241, value242, value243, checkpointLogger, packResults, unpackResults, environment)(...)
        end
      end
      value9 = values24
      getService, value9 = getService(value9)
      values24 = getService
      value6 = value9
      values22 = not values24
      if values22 then
        values24 = values18
        getService = values24
        values23 = false
        value9 = values23
        values24 = "isexecutorclosure"
        value8 = values24
        value10 = value8
        value8 = value6
        value11 = value8
        getService(value9, value10, value11)
      end
      values24 = "isexecutorclosure"
      values22 = values8.isexecutorclosure
      values24 = nil
      if values22 ~= values24 then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values24 = values18
        getService = values24
        values23 = true
        value9 = values23
        value10 = "isexecutorclosure"
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = values20
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      value8 = values22
      getService = value8
      value9 = values25
      value10 = argument
      getService(value9, value10)
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        getService = values24
        value9 = "Past isexecutorclosure"
        getService(value9)
      end
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        value8 = values24
        getService = value8
        value9 = "Next: firetouchinterest"
        getService(value9)
      end
      values22 = options
      values24 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values24 = 0
      if not (values22 > values24) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values24 = environment.task
        values23 = "wait"
        values24 = values24.wait
        getService = values24
        values23 = options
        values24 = "delaybetweentests"
        values23 = values23.delaybetweentests
        value9 = values23
        getService(value9)
      end
      argument = "firetouchinterest"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      value8 = values20
      getService = value8
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      value8 = values22
      getService = value8
      do
        local value245, value246, value247 = nil, values18, values11
        value245 = values18
        value246 = values12
        value247 = value2
        
        function values24(...)
          return metadata.__testFactories.firetouchinterest(value245, value246, value247, environment)(...)
        end
      end
      value9 = values24
      getService, value9 = getService(value9)
      values24 = getService
      values23 = value9
      values22 = not values24
      if values22 then
        values24 = values18
        value8 = values24
        getService = value8
        value6 = false
        value9 = value6
        values24 = "firetouchinterest"
        value8 = values24
        value10 = value8
        value8 = values23
        value11 = value8
        getService(value9, value10, value11)
        values24 = "firetouchinterest"
        values22 = values12.firetouchinterest
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values24 = "firetouchinterest"
      values22 = values8.firetouchinterest
      values24 = nil
      if values22 ~= values24 then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values24 = values18
        value8 = values24
        getService = value8
        value6 = true
        value9 = value6
        value10 = "firetouchinterest"
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = values20
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      getService = values22
      value9 = values25
      value10 = argument
      getService(value9, value10)
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        getService = values24
        value9 = "Past firetouchinterest"
        getService(value9)
      end
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        getService = values24
        value6 = "Next: islclosure"
        value8 = value6
        value9 = value8
        getService(value9)
      end
      values22 = options
      values24 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values24 = 0
      if not (values22 > values24) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values24 = environment.task
        value6 = "wait"
        values24 = values24.wait
        getService = values24
        value6 = options
        values24 = "delaybetweentests"
        value6 = value6.delaybetweentests
        value9 = value6
        getService(value9)
      end
      argument = "islclosure"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      value8 = values22
      getService = value8
      do
        local value248
        value248 = values18
        
        function values24(...)
          return metadata.__testFactories.islclosure(value248, environment)(...)
        end
      end
      value8 = values24
      value9 = value8
      getService, value9 = getService(value9)
      values24 = getService
      value6 = value9
      values22 = not values24
      if values22 then
        values24 = values18
        value8 = values24
        getService = value8
        values23 = false
        value9 = values23
        value10 = "islclosure"
        value11 = value6
        getService(value9, value10, value11)
      end
      values24 = "islclosure"
      values22 = values8.islclosure
      values24 = nil
      if values22 ~= values24 then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values24 = values18
        getService = values24
        values23 = true
        value8 = values23
        value9 = value8
        value10 = "islclosure"
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = values20
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      getService = values22
      value8 = values25
      value9 = value8
      value8 = argument
      value10 = value8
      getService(value9, value10)
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        getService = values24
        value9 = "Past islclosure"
        getService(value9)
      end
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        value8 = values24
        getService = value8
        values23 = "Next: newcclosure"
        value8 = values23
        value9 = value8
        getService(value9)
      end
      values22 = options
      values24 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values24 = 0
      if not (values22 > values24) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values24 = environment.task
        values23 = "wait"
        values24 = values24.wait
        value8 = values24
        getService = value8
        values23 = options
        values24 = "delaybetweentests"
        values23 = values23.delaybetweentests
        value9 = values23
        getService(value9)
      end
      argument = "newcclosure"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      value8 = values22
      getService = value8
      do
        local value249, value250, value251, value252 = nil, values12, value2, values8
        value249 = values18
        value250 = values12
        value251 = value2
        value252 = values8
        
        function values24(...)
          return metadata.__testFactories.newcclosure(value249, value250, value251, value252, packResults, unpackResults, environment)(...)
        end
      end
      value8 = values24
      value9 = value8
      getService, value9 = getService(value9)
      values24 = getService
      values23 = value9
      values22 = not values24
      if values22 then
        values24 = values18
        value8 = values24
        getService = value8
        value6 = false
        value9 = value6
        value10 = "newcclosure"
        value8 = values23
        value11 = value8
        getService(value9, value10, value11)
        values24 = "newcclosure"
        values22 = values12.newcclosure
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values24 = "newcclosure"
      values22 = values8.newcclosure
      values24 = nil
      if values22 ~= values24 then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values24 = values18
        getService = values24
        value6 = true
        value8 = value6
        value9 = value8
        value10 = "newcclosure"
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = values20
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      value8 = values22
      getService = value8
      value9 = values25
      value10 = argument
      getService(value9, value10)
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        value8 = values24
        getService = value8
        value6 = "Past newcclosure"
        value8 = value6
        value9 = value8
        getService(value9)
      end
      values22 = options
      values24 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values24 = checkpointLogger
        value8 = values24
        getService = value8
        value9 = "Next: getscripthash"
        getService(value9)
      end
      values22 = options
      values24 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values24 = 0
      if not (values22 > values24) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values24 = environment.task
        value6 = "wait"
        values24 = values24.wait
        value8 = values24
        getService = value8
        value6 = options
        values23 = "delaybetweentests"
        value6 = value6.delaybetweentests
        value9 = value6
        getService(value9)
      end
      argument = "getscripthash"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      value8 = values22
      getService = value8
      do
        local value253, value254 = nil, values12
        value253 = values18
        value254 = values21
        
        function values23(...)
          return metadata.__testFactories.getscripthash(value253, value254, environment)(...)
        end
      end
      value9 = values23
      getService, value9 = getService(value9)
      values24 = getService
      value6 = value9
      values22 = not values24
      if values22 then
        values23 = values18
        getService = values23
        values21 = false
        value9 = values21
        value10 = "getscripthash"
        value11 = value6
        getService(value9, value10, value11)
      end
      values23 = "getscripthash"
      values22 = values8.getscripthash
      values22 = not values22
      if values22 then
        values23 = values18
        getService = values23
        values21 = true
        value9 = values21
        value6 = "getscripthash"
        value8 = value6
        value10 = value8
        values23 = ""
        value8 = values23
        value11 = value8
        getService(value9, value10, value11)
      end
      values22 = values20
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      getService = values22
      value8 = values25
      value9 = value8
      value8 = argument
      value10 = value8
      getService(value9, value10)
      values22 = options
      values23 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values23 = checkpointLogger
        value8 = values23
        getService = value8
        values21 = "Past getscripthash"
        value8 = values21
        value9 = value8
        getService(value9)
      end
      values22 = options
      values23 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values23 = checkpointLogger
        getService = values23
        values21 = "Next: setreadonly"
        value8 = values21
        value9 = value8
        getService(value9)
      end
      argument = "setreadonly"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value8 = values26
      value9 = value8
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      getService = values22
      do
        local value255
        value255 = values18
        
        function value6(...)
          return metadata.__testFactories.setreadonly(value255, environment)(...)
        end
      end
      value8 = value6
      value9 = value8
      getService, value9 = getService(value9)
      values23 = getService
      values21 = value9
      values22 = not values23
      if values22 then
        value6 = values18
        getService = value6
        values23 = false
        value9 = values23
        value10 = "setreadonly"
        value11 = values21
        getService(value9, value10, value11)
      end
      value6 = "setreadonly"
      values22 = values8.setreadonly
      values22 = not values22
      if values22 then
        value6 = values18
        getService = value6
        values23 = true
        value9 = values23
        value10 = "setreadonly"
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = values20
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      getService = values22
      value9 = values25
      value10 = argument
      getService(value9, value10)
      values22 = options
      value6 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        value6 = checkpointLogger
        getService = value6
        values23 = "Past setreadonly"
        value8 = values23
        value9 = value8
        getService(value9)
      end
      values22 = options
      value6 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        value6 = checkpointLogger
        getService = value6
        value9 = "Next: request"
        getService(value9)
      end
      values22 = options
      value6 = "delaybetweentests"
      values22 = values22.delaybetweentests
      value6 = 0
      if not (values22 > value6) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        value6 = environment.task
        values23 = "wait"
        value6 = value6.wait
        value8 = value6
        getService = value8
        values23 = options
        values21 = "delaybetweentests"
        values23 = values23.delaybetweentests
        value8 = values23
        value9 = value8
        getService(value9)
      end
      argument = "request"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      value8 = values20
      getService = value8
      value8 = values26
      value9 = value8
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      getService = values22
      do
        local value256
        value256 = values18
        
        function values21(...)
          return metadata.__testFactories.request(value256, environment)(...)
        end
      end
      value9 = values21
      getService, value9 = getService(value9)
      value6 = getService
      values23 = value9
      values22 = not value6
      if values22 then
        values21 = values18
        value8 = values21
        getService = value8
        value6 = false
        value8 = value6
        value9 = value8
        value10 = "request"
        value11 = values23
        getService(value9, value10, value11)
      end
      values21 = "request"
      values22 = values8.request
      values21 = nil
      if values22 ~= values21 then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values21 = values18
        getService = values21
        value6 = true
        value9 = value6
        values21 = "request"
        value8 = values21
        value10 = value8
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = values20
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      getService = values22
      value8 = values25
      value9 = value8
      value8 = argument
      value10 = value8
      getService(value9, value10)
      values22 = options
      values21 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values21 = checkpointLogger
        value8 = values21
        getService = value8
        value6 = "past request"
        value8 = value6
        value9 = value8
        getService(value9)
      end
      values22 = options
      values21 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values21 = checkpointLogger
        value8 = values21
        getService = value8
        value9 = "Next: fireclickdetector"
        getService(value9)
      end
      values22 = options
      values21 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values21 = 0
      if not (values22 > values21) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values21 = environment.task
        value6 = "wait"
        values21 = values21.wait
        value8 = values21
        getService = value8
        value6 = options
        values21 = "delaybetweentests"
        value6 = value6.delaybetweentests
        value9 = value6
        getService(value9)
      end
      argument = "fireclickdetector"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      getService = values22
      do
        local value257, value258, value259 = nil, values21, value2
        value257 = values18
        value258 = values12
        value259 = value2
        
        function values21(...)
          return metadata.__testFactories.fireclickdetector(value257, value258, value259, environment)(...)
        end
      end
      value9 = values21
      getService, value9 = getService(value9)
      values21 = getService
      value6 = value9
      values22 = not values21
      if values22 then
        values21 = values18
        getService = values21
        values25 = false
        value8 = values25
        value9 = value8
        values24 = "fireclickdetector"
        value8 = values24
        value10 = value8
        value8 = value6
        value11 = value8
        getService(value9, value10, value11)
        values21 = "fireclickdetector"
        values22 = values12.fireclickdetector
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values21 = "fireclickdetector"
      values22 = values8.fireclickdetector
      values21 = nil
      if values22 ~= values21 then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values21 = values18
        value8 = values21
        getService = value8
        values25 = true
        value9 = values25
        values24 = "fireclickdetector"
        value8 = values24
        value10 = value8
        values22 = ""
        value8 = values22
        value11 = value8
        getService(value9, value10, value11)
      end
      values22 = values20
      values93 = values22
      values25 = values93
      values22 = values93.Stop
      getService = values22
      value8 = values25
      value9 = value8
      value10 = argument
      getService(value9, value10)
      values22 = options
      values21 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values21 = checkpointLogger
        getService = values21
        value9 = "Past fireclickdetector"
        getService(value9)
      end
      values22 = options
      values21 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values21 = checkpointLogger
        getService = values21
        value9 = "Next: fireproximityprompt"
        getService(value9)
      end
      values22 = options
      values21 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values21 = 0
      if not (values22 > values21) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values21 = environment.task
        values25 = "wait"
        values21 = values21.wait
        getService = values21
        values25 = options
        values24 = "delaybetweentests"
        values25 = values25.delaybetweentests
        value9 = values25
        getService(value9)
      end
      argument = "fireproximityprompt"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values93 = {}
      values93[1] = values22
      values22 = values93
      
      function values21(argument, argument2)
        return environment.math.floor(argument * 100) / 100
      end
      
      values22[1] = values21
      values24 = environment.pcall
      value8 = values24
      getService = value8
      do
        local value260, value261, value262, value263, value264 = nil, values12, value2, values8, values11
        value260 = values22
        value261 = values18
        value262 = values12
        value263 = value2
        
        function values22(...)
          return metadata.__testFactories.fireproximityprompt(value260, value261, value262, value263, checkpointLogger, packResults, unpackResults, environment)(...)
        end
      end
      value9 = values22
      getService, value9 = getService(value9)
      values21 = getService
      values25 = value9
      values24 = not values21
      if values24 then
        values22 = values18
        getService = values22
        values23 = false
        value9 = values23
        value6 = "fireproximityprompt"
        value8 = value6
        value10 = value8
        value11 = values25
        getService(value9, value10, value11)
        values22 = "fireproximityprompt"
        values24 = values12.fireproximityprompt
        if values24 then
          values24 = true
          value2[1] = values24
        end
      end
      values22 = "fireproximitypromt"
      values24 = values8.fireproximitypromt
      values24 = not values24
      if values24 then
        values22 = values18
        getService = values22
        values23 = true
        value8 = values23
        value9 = value8
        value6 = "fireproximityprompt"
        value8 = value6
        value10 = value8
        values26 = ""
        value8 = values26
        value11 = value8
        getService(value9, value10, value11)
      end
      values21 = values20
      values93 = values21
      values25 = values93
      values21 = values93.Stop
      value8 = values21
      getService = value8
      value9 = values25
      value10 = argument
      getService(value9, value10)
      values21 = options
      values25 = "printcheckpoints"
      values21 = values21.printcheckpoints
      if values21 then
        values25 = checkpointLogger
        getService = values25
        value9 = "Past fireproximityprompt fires"
        getService(value9)
      end
      values21 = options
      values25 = "printcheckpoints"
      values21 = values21.printcheckpoints
      if values21 then
        values25 = checkpointLogger
        getService = values25
        value9 = "Next: getconnections"
        getService(value9)
      end
      values21 = options
      values25 = "delaybetweentests"
      values21 = values21.delaybetweentests
      values25 = 0
      if not (values21 > values25) then
        values21 = false
      else
        values21 = true
      end
      if values21 then
        values25 = environment.task
        values24 = "wait"
        values25 = values25.wait
        value8 = values25
        getService = value8
        values24 = options
        values22 = "delaybetweentests"
        values24 = values24.delaybetweentests
        value9 = values24
        getService(value9)
      end
      argument = "getconnections"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      value8 = values20
      getService = value8
      value8 = values26
      value9 = value8
      getService = getService(value9)
      values20 = getService
      values24 = environment.pcall
      value8 = values24
      getService = value8
      do
        local value265, value266, value267, value268, value269, value270, value271 = nil, values18, values12, value2, values11, values11, values11
        value265 = values18
        value266 = values12
        value267 = value2
        value271 = values11
        
        function values22(...)
          return metadata.__testFactories.getconnections(value265, value266, value267, options, checkpointLogger, warningLogger, value271, packResults, unpackResults, environment)(...)
        end
      end
      value9 = values22
      getService, value9 = getService(value9)
      values21 = getService
      values25 = value9
      values24 = not values21
      if values24 then
        values22 = values18
        value8 = values22
        getService = value8
        values23 = false
        value8 = values23
        value9 = value8
        value10 = "getconnections"
        value8 = values25
        value11 = value8
        getService(value9, value10, value11)
      end
      values22 = "getconnections"
      values24 = values8.getconnections
      values22 = nil
      if values24 ~= values22 then
        values24 = false
      else
        values24 = true
      end
      if values24 then
        values22 = values18
        value8 = values22
        getService = value8
        values23 = true
        value9 = values23
        value10 = "getconnections"
        value11 = ""
        getService(value9, value10, value11)
      end
      values24 = values20
      values93 = values24
      values22 = values93
      values24 = values93.Stop
      value8 = values24
      getService = value8
      value8 = values22
      value9 = value8
      value10 = argument
      getService(value9, value10)
      values24 = options
      values22 = "printcheckpoints"
      values24 = values24.printcheckpoints
      if values24 then
        values22 = checkpointLogger
        getService = values22
        value9 = "Past getconnections"
        getService(value9)
      end
      values24 = options
      values22 = "printcheckpoints"
      values24 = values24.printcheckpoints
      if values24 then
        values22 = checkpointLogger
        getService = values22
        value9 = "Next: filesys"
        getService(value9)
      end
      values21 = options
      values25 = "delaybetweentests"
      values21 = values21.delaybetweentests
      values25 = 0
      if not (values21 > values25) then
        values21 = false
      else
        values21 = true
      end
      if values21 then
        values25 = environment.task
        values24 = "wait"
        values25 = values25.wait
        value8 = values25
        getService = value8
        values24 = options
        values22 = "delaybetweentests"
        values24 = values24.delaybetweentests
        value9 = values24
        getService(value9)
      end
      argument = "filesys"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      value8 = values20
      getService = value8
      value8 = values26
      value9 = value8
      getService = getService(value9)
      values20 = getService
      values21 = false
      values25 = environment.isfolder
      if values25 then
        values25 = environment.listfiles
      end
      if values25 then
        values25 = environment.delfolder
      end
      if values25 then
        values25 = environment.makefolder
      end
      if values25 then
        values25 = environment.isfile
      end
      if values25 then
        values25 = environment.writefile
      end
      if values25 then
        values25 = environment.delfile
      end
      if values25 then
        values25 = environment.readfile
      end
      if values25 then
        values25 = environment.appendfile
      end
      if values25 then
        values25 = environment.loadfile
      end
      if values25 then
        values25 = environment.isfolder
        if values25 then
          values25 = environment.delfolder
        end
        if values25 then
          values24 = environment.isfolder
          getService = values24
          values22 = "meow"
          value8 = values22
          value9 = value8
          getService = getService(value9)
          values25 = getService
          if values25 then
            values24 = environment.delfolder
            getService = values24
            values22 = "meow"
            value8 = values22
            value9 = value8
            getService(value9)
          end
        end
        values24 = environment.task
        values22 = "wait"
        values24 = values24.wait
        getService = values24
        value9 = 0.09
        getService(value9)
        values25 = environment.makefolder
        if values25 then
          values24 = environment.makefolder
          value8 = values24
          getService = value8
          value9 = "meow"
          getService(value9)
          values24 = environment.makefolder
          getService = values24
          values22 = "meow/meow2"
          value8 = values22
          value9 = value8
          getService(value9)
        end
        values25 = environment.writefile
        if values25 then
          values24 = environment.writefile
          getService = values24
          value9 = "meow1.txt"
          value10 = "meow1ok"
          getService(value9, value10)
          values24 = environment.writefile
          value8 = values24
          getService = value8
          value9 = "meow/meow1.txt"
          value10 = "meow2ok"
          getService(value9, value10)
        end
        values24 = environment.task
        values22 = "wait"
        values24 = values24.wait
        getService = values24
        value9 = 0.06
        getService(value9)
        values25 = environment.isfile
        if values25 then
          values24 = environment.isfile
          getService = values24
          value9 = "meow1.txt"
          getService = getService(value9)
          values25 = getService
          values25 = not values25
          if values25 then
            values24 = values18
            getService = values24
            values22 = false
            value8 = values22
            value9 = value8
            values23 = "isfile"
            value8 = values23
            value10 = value8
            value11 = "Returned false for an existing file"
            getService(value9, value10, value11)
          end
          values25 = environment.delfile
          if values25 then
            values24 = environment.delfile
            value8 = values24
            getService = value8
            values22 = "meow1.txt"
            value8 = values22
            value9 = value8
            getService(value9)
            values24 = environment.task
            values22 = "wait"
            values24 = values24.wait
            getService = values24
            getService()
            values24 = environment.isfile
            getService = values24
            value9 = "meow1.txt"
            getService = getService(value9)
            values25 = getService
            if values25 then
              values24 = values18
              getService = values24
              values22 = false
              value9 = values22
              values23 = "isfile"
              value8 = values23
              value10 = value8
              value11 = "Returned true for a non-existing file"
              getService(value9, value10, value11)
            end
            values24 = environment.task
            values22 = "wait"
            values24 = values24.wait
            getService = values24
            getService()
            values24 = environment.writefile
            getService = values24
            value9 = "meow1.txt"
            value10 = "meow1ok"
            getService(value9, value10)
          end
        end
        values25 = environment.delfolder
        if values25 then
          values24 = environment.delfolder
          getService = values24
          value9 = "meow/meow2"
          getService(value9)
          values24 = environment.task
          values22 = "wait"
          values24 = values24.wait
          getService = values24
          value9 = 0.12
          getService(value9)
          values25 = environment.isfolder
          if values25 then
            values24 = environment.isfolder
            getService = values24
            values22 = "meow/meow2"
            value8 = values22
            value9 = value8
            getService = getService(value9)
            values25 = getService
            if values25 then
              values24 = values18
              getService = values24
              values22 = false
              value9 = values22
              values23 = "isfolder"
              value8 = values23
              value10 = value8
              value6 = "Returned true for a non-existing folder"
              value8 = value6
              value11 = value8
              getService(value9, value10, value11)
            end
          end
        end
        values24 = environment.writefile
        value8 = values24
        getService = value8
        value9 = "lol/lolz.txt"
        value10 = ""
        getService(value9, value10)
        values24 = environment.isfile
        getService = values24
        value9 = "lol/lolz.txt"
        getService = getService(value9)
        values25 = getService
        values25 = not values25
        if values25 then
          values24 = values18
          getService = values24
          values22 = false
          value9 = values22
          value10 = "writefile"
          value11 = "Failed to make a file and a directory using writeifle"
          getService(value9, value10, value11)
        end
        values24 = environment.delfile
        getService = values24
        values22 = "lol/lolz.txt"
        value8 = values22
        value9 = value8
        getService(value9)
        values25 = environment.readfile
        if values25 then
          values24 = environment.readfile
          value8 = values24
          getService = value8
          value9 = "meow1.txt"
          getService = getService(value9)
          values25 = getService
          values22 = environment.readfile
          value8 = values22
          getService = value8
          value9 = "meow/meow1.txt"
          getService = getService(value9)
          values24 = getService
          values23 = environment.pcall
          getService = values23
          
          function value6(argument)
            environment.readfile("Superreal.txt")
            return
          end
          
          value9 = value6
          getService = getService(value9)
          values22 = getService
          value6 = "meow1ok"
          if values25 == value6 then
            values23 = false
          else
            values23 = true
          end
          if not values23 then
            value6 = "meow2ok"
            if values24 == value6 then
              values23 = false
            else
              values23 = true
            end
          end
          if values23 then
            value6 = values18
            value8 = value6
            getService = value8
            values26 = false
            value9 = values26
            value10 = "readfile"
            value11 = "Couldn't read an existing file with content"
            getService(value9, value10, value11)
          end
          values23 = values22
          if values23 then
            value6 = values18
            value8 = value6
            getService = value8
            values26 = false
            value8 = values26
            value9 = value8
            values24 = "readfile"
            value8 = values24
            value10 = value8
            values22 = "No error handling on non-existent file"
            value8 = values22
            value11 = value8
            getService(value9, value10, value11)
          end
        end
        values25 = environment.delfile
        if values25 then
          values24 = environment.delfile
          value8 = values24
          getService = value8
          values22 = "meow/meow1.txt"
          value8 = values22
          value9 = value8
          getService(value9)
        end
        values24 = environment.isfile
        getService = values24
        values22 = "meow/meow1.txt"
        value8 = values22
        value9 = value8
        getService = getService(value9)
        values25 = getService
        if values25 then
          values24 = values18
          getService = values24
          values22 = false
          value9 = values22
          value10 = "delfile"
          value6 = "File exists after deleting"
          value8 = value6
          value11 = value8
          getService(value9, value10, value11)
        end
        values25 = environment.makefolder
        if values25 then
          values25 = environment.writefile
        end
        if values25 then
          values25 = environment.listfiles
        end
        if values25 then
          values24 = environment.makefolder
          getService = values24
          values22 = "listmeow"
          value8 = values22
          value9 = value8
          getService(value9)
          values24 = environment.task
          values22 = "wait"
          values24 = values24.wait
          getService = values24
          value9 = 0.1
          getService(value9)
          values24 = environment.writefile
          getService = values24
          value9 = "listmeow/file1.txt"
          values23 = "Content 1"
          value8 = values23
          value10 = value8
          getService(value9, value10)
          values24 = environment.writefile
          getService = values24
          values22 = "listmeow/file2.txt"
          value8 = values22
          value9 = value8
          value10 = "Content 2"
          getService(value9, value10)
          values24 = environment.task
          values22 = "wait"
          values24 = values24.wait
          getService = values24
          values22 = 0.02
          value8 = values22
          value9 = value8
          getService(value9)
          values24 = environment.listfiles
          value8 = values24
          getService = value8
          value9 = "listmeow"
          getService = getService(value9)
          values25 = getService
          values24 = {}
          values24[1] = "listmeow/file1.txt"
          values24[2] = "listmeow/file2.txt"
          values22 = 0
          values23 = environment.ipairs
          getService = values23
          value9 = values25
          getService, value9, value10 = getService(value9)
          values23 = getService
          value6 = value9
          values26 = value10
          values25 = values23
          
          function callback2()
            local values222, values233, value, value2, value3, value102
            while 1 do
              local values252 = values25
              getService = values252
              local value62 = value6
              value9 = value62
              local values262 = values26
              value10 = values262
              local getService2 = getService
              local value92 = value9
              value102 = value10
              value2, value3 = getService2(value92, value102)
              getService = value2
              value9 = value3
              local getService3 = getService
              values23 = getService3
              local value93 = value9
              values26 = value93
              values26 = nil
              if values23 ~= values26 then
                values26 = false
              else
                values26 = true
              end
              if values26 then
                return 0
              end
              local values232 = values23
              values26 = values232
              values23 = 1
              values222 = values22
              values233 = values23
              value = values222 + values233
              values22 = value
            end
          end
          
          value21 = callback2()
          value6 = #values24
          if values22 == value6 then
            values23 = false
          else
            values23 = true
          end
          if values23 then
            value6 = values18
            value8 = value6
            getService = value8
            values26 = false
            value9 = values26
            values24 = "listfiles"
            value8 = values24
            value10 = value8
            value11 = "Couldn't match listed files with expected"
            getService(value9, value10, value11)
          end
          values23 = environment.delfile
          if values23 then
            values23 = environment.delfolder
          end
          if values23 then
            value6 = environment.delfile
            getService = value6
            values26 = "listmeow/file1.txt"
            value8 = values26
            value9 = value8
            getService(value9)
            value6 = environment.delfile
            value8 = value6
            getService = value8
            values26 = "listmeow/file2.txt"
            value8 = values26
            value9 = value8
            getService(value9)
            value6 = environment.delfolder
            getService = value6
            value9 = "listmeow"
            getService(value9)
          end
          value6 = environment.task
          values26 = "wait"
          value6 = value6.wait
          getService = value6
          getService()
          value6 = environment.isfolder
          getService = value6
          values26 = "listmeow"
          value8 = values26
          value9 = value8
          getService = getService(value9)
          values23 = getService
          if values23 then
            value6 = values18
            getService = value6
            values26 = false
            value8 = values26
            value9 = value8
            value10 = "delfolder"
            value11 = "Folder exists after deleting"
            getService(value9, value10, value11)
          end
          value6 = environment.type
          value8 = value6
          getService = value8
          values24 = environment.listfiles
          value9 = values24
          value10 = ""
          values93 = packResults
          value22 = value9
          value23 = value10
          result = values93(value22(value23))
          value22 = result.n
          value23 = 10
          if not (value22 < 10) then
            value5 = result[value23]
          end
          value23 = 30
          if not (value22 < 30) then
            values25 = result[value23]
          end
          value23 = 33
          if not (value22 < 33) then
            value3 = result[value23]
          end
          value23 = 45
          if not (value22 < 45) then
            values22 = result[value23]
          end
          value9 = result
          values93 = getService
          value22 = unpackResults
          value23 = value9
          value25 = value9.n
          values23 = values93(value22(value23, 1, value25))
          value6 = "table"
          if values23 == value6 then
            values23 = false
          else
            values23 = true
          end
          if values23 then
            value6 = values18
            value8 = value6
            getService = value8
            values26 = false
            value9 = values26
            values24 = "listfiles"
            value8 = values24
            value10 = value8
            value11 = "Failed to list files in the current directory[1]"
            getService(value9, value10, value11)
          end
          value6 = environment.writefile
          value8 = value6
          getService = value8
          value9 = "fil.txt"
          value10 = "zop.txt"
          getService(value9, value10)
          value6 = environment.makefolder
          value8 = value6
          getService = value8
          value9 = "poop"
          getService(value9)
          values23 = false
          value6 = false
          values25 = environment.pairs
          value8 = values25
          getService = value8
          values22 = environment.listfiles
          value9 = values22
          value10 = ""
          values93 = packResults
          value22 = value9
          value23 = value10
          result = values93(value22(value23))
          value22 = result.n
          value23 = 4
          if not (value22 < 4) then
            value5 = result[value23]
          end
          value23 = 24
          if not (value22 < 24) then
            values25 = result[value23]
          end
          value23 = 27
          if not (value22 < 27) then
            value3 = result[value23]
          end
          value23 = 39
          if not (value22 < 39) then
            values22 = result[value23]
          end
          value9 = result
          values93 = getService
          value22 = unpackResults
          value23 = value9
          value24 = 1
          value25 = value9.n
          callbackResult = (function(a_native_fixed_result_call_1, ...)
            return {
              a_native_fixed_result_call_1(...)
            }
          end)(values93, value22(value23, 1, value25))
          values93 = callbackResult[1]
          value22 = callbackResult[2]
          value23 = callbackResult[3]
          values26 = values93
          values24 = value22
          values22 = value23
          values29 = values22
          
          function callback2()
            local values253, value, find2Result, value3, values2232, values254, environment2
            while "tostring" do
              local values262 = values26
              getService = values262
              local values242 = values24
              value9 = values242
              local values292 = values29
              value10 = values292
              local getService2 = getService
              local value92 = value9
              local value102 = value10
              find2Result, value3 = getService2(value92, value102)
              getService = find2Result
              value9 = value3
              local getService3 = getService
              values25 = getService3
              local value93 = value9
              values22 = value93
              values27 = nil
              if values25 ~= values27 then
                values27 = false
              else
                values27 = true
              end
              if values27 then
                return 0
              end
              local values252 = values25
              values29 = values252
              local values222 = values22
              values28 = values222
              local tostring2 = environment.tostring
              values27 = tostring2
              local values272 = values27
              value8 = values272
              local value82 = value8
              getService = value82
              local values282 = values28
              value8 = values282
              local value83 = value8
              value9 = value83
              local service = getService(value9)
              getService = service
              local getService4 = getService
              values25 = getService4
              values22 = "fil.txt"
              local findResult = values25.find(values25, values22)
              values25 = findResult
              if values25 then
                values23 = true
              end
              environment2 = environment
              local tostring3 = environment2.tostring
              values27 = tostring3
              local values273 = values27
              value8 = values273
              local value84 = value8
              getService = value84
              local values283 = values28
              value9 = values283
              local service2 = getService(value9)
              getService = service2
              local getService5 = getService
              values25 = getService5
              values22 = "poop"
              local find2 = values25.find
              values254 = values25
              local values223 = values22
              value3 = values254
              values2232 = values223
              find2Result = find2(values254, values223)
              value = find2Result
              values25 = find2Result
              values253 = values25
              if values253 then
                values253 = true
                value6 = true
              end
            end
          end
          
          value21 = callback2()
          values26 = not values23
          if values26 then
            values24 = values18
            getService = values24
            values22 = false
            value8 = values22
            value9 = value8
            value10 = "listfiles"
            value11 = "Failed to find a file using listfiles"
            getService(value9, value10, value11)
          end
          values26 = not value6
          if values26 then
            values24 = values18
            getService = values24
            values22 = false
            value9 = values22
            value10 = "listfiles"
            value11 = "Failed to find a folder using listfiles"
            getService(value9, value10, value11)
          end
          values24 = environment.writefile
          getService = values24
          value9 = "boob/../fbi_just_take_all_my_shit.txt"
          value10 = "\r\ni did so many stuff for this community, im\r\njust keeping my identity anonymous \240\159\164\183\226\128\141\226\153\130\239\184\143 \r\n+ no one really knows my background\r\nso everyone just thinks i am a stupid mf\r\nbut well\r\ni just ignore that and do my stuff\r\n\t\t\t\t\t\t"
          getService(value9, value10)
          values24 = environment.task
          values22 = "wait"
          values24 = values24.wait
          getService = values24
          getService()
          values24 = environment.isfile
          value8 = values24
          getService = value8
          value9 = "fbi_just_take_all_my_shit.txt"
          getService = getService(value9)
          values26 = getService
          values26 = not values26
          if values26 then
            values24 = values18
            getService = values24
            values22 = false
            value9 = values22
            values23 = "writefile"
            value8 = values23
            value10 = value8
            values28 = "Failed to create a file using 'Example/../Example.txt'"
            value8 = values28
            value11 = value8
            getService(value9, value10, value11)
          end
          values24 = environment.isfile
          getService = values24
          values22 = "boob/../fbi_just_take_all_my_shit.txt"
          value8 = values22
          value9 = value8
          getService = getService(value9)
          values26 = getService
          values26 = not values26
          if values26 then
            values24 = values18
            getService = values24
            values22 = false
            value9 = values22
            value10 = "isfile"
            value11 = "Failed to find a file using 'Example/../Example.txt'"
            getService(value9, value10, value11)
          end
          values26 = {}
          values26[1] = ".exe"
          values26[2] = ".com"
          values26[3] = ".scr"
          values26[4] = ".pif"
          values26[5] = ".cpl"
          values26[6] = ".msc"
          values26[7] = ".bat"
          values26[8] = ".cmd"
          values26[9] = ".ps1"
          values26[10] = ".psd1"
          values26[11] = ".vbs"
          values26[12] = ".vbe"
          values26[13] = ".js"
          values26[14] = ".jse"
          values26[15] = ".wsf"
          values26[16] = ".wsh"
          values26[17] = ".hta"
          values26[18] = ".scf"
          values26[19] = ".lnk"
          values26[20] = ".zip"
          values26[21] = ".rar"
          values26[22] = ".7z"
          values26[23] = ".cab"
          values26[24] = ".iso"
          values26[25] = ".img"
          values26[26] = ".xml"
          values26[27] = ".msi"
          values26[28] = ".msp"
          values26[29] = ".reg"
          values26[30] = ".inf"
          values93 = ".url"
          values26[31] = ".url"
          value6 = environment.pairs
          getService = value6
          value9 = values26
          getService, value9, value10 = getService(value9)
          values24 = getService
          values22 = value9
          values23 = value10
          values26 = values22
          
          function callback2()
            local value63, getService52, callback, service4, value94, value102, environment2
            repeat
              local values242 = values24
              getService = values242
              local values262 = values26
              value9 = values262
              local values232 = values23
              value10 = values232
              local getService2 = getService
              local value92 = value9
              value102 = value10
              service4, value94 = getService2(value92, value102)
              getService = service4
              value9 = value94
              local getService3 = getService
              values22 = getService3
              local value93 = value9
              value6 = value93
              values23 = nil
              if values22 ~= values23 then
                values23 = false
              else
                values23 = true
              end
              if values23 then
                return 1
              end
              local values222 = values22
              values23 = values222
              local value62 = value6
              values25 = value62
              environment2 = environment
              local pcall2 = environment2.pcall
              values22 = pcall2
              local values223 = values22
              getService = values223
              do
                local value19
                value19 = values25
                
                function callback(argument)
                  local writefile2 = environment.writefile
                  local tostring2 = environment.tostring
                  local value192 = value19
                  writefile2("ok" .. tostring2((value192:upper())), "")
                  return
                end
              end
              values27 = callback
              local values272 = values27
              value9 = values272
              local getService4 = getService
              value94 = value9
              service4 = getService4(value94)
              getService = service4
              local getService5 = getService
              getService52 = getService5
              value6 = getService5
              value63 = value6
            until value63
            return 0
          end
          
          value21 = callback2()
          if value21 == 0 then
            values22 = values18
            value8 = values22
            getService = value8
            values27 = false
            value9 = values27
            value5 = "writefile"
            value8 = value5
            value10 = value8
            values23 = "Allowed file with potentially malicious extension to be created: "
            values93 = values23
            value22 = values25
            values23 = values93 .. value22
            value8 = values23
            value11 = value8
            getService(value9, value10, value11)
          end
        end
        values25 = environment.appendfile
        values25 = not values25
        if values25 then
          values24 = values18
          value8 = values24
          getService = value8
          values22 = false
          value8 = values22
          value9 = value8
          value10 = "appendfile"
          value6 = "function is nil"
          value8 = value6
          value11 = value8
          getService(value9, value10, value11)
        end
        values25 = environment.appendfile
        if values25 then
          values25 = environment.writefile
        end
        if values25 then
          values25 = environment.readfile
        end
        if values25 then
          values24 = environment.writefile
          getService = values24
          value9 = "meowappend.txt"
          values23 = "Start\n"
          value8 = values23
          value10 = value8
          getService(value9, value10)
          values24 = environment.task
          values22 = "wait"
          values24 = values24.wait
          getService = values24
          values22 = 0.06
          value8 = values22
          value9 = value8
          getService(value9)
          values24 = environment.appendfile
          getService = values24
          value9 = "meowappend.txt"
          value10 = "Line 1\n"
          getService(value9, value10)
          values24 = environment.task
          values22 = "wait"
          values24 = values24.wait
          value8 = values24
          getService = value8
          values22 = 0.06
          value8 = values22
          value9 = value8
          getService(value9)
          values24 = environment.appendfile
          getService = values24
          values22 = "meowappend.txt"
          value8 = values22
          value9 = value8
          value10 = "Line 2\n"
          getService(value9, value10)
          values24 = environment.task
          values22 = "wait"
          values24 = values24.wait
          getService = values24
          values22 = 0.06
          value8 = values22
          value9 = value8
          getService(value9)
          values24 = environment.readfile
          getService = values24
          value9 = "meowappend.txt"
          getService = getService(value9)
          values25 = getService
          values22 = [[
Start
Line 1
Line 2
]]
          if values25 == values22 then
            values24 = false
          else
            values24 = true
          end
          if values24 then
            values22 = values18
            getService = values22
            values23 = false
            value9 = values23
            value10 = "appendfile"
            values26 = "Couldn't match output with expected"
            value8 = values26
            value11 = value8
            getService(value9, value10, value11)
            values24 = options
            values22 = "printcheckpoints"
            values24 = values24.printcheckpoints
            if values24 then
              values22 = warningLogger
              getService = values22
              values23 = "[DEBUG]: "
              values93 = values23
              value22 = values25
              values23 = values93 .. value22
              value8 = values23
              value9 = value8
              getService(value9)
            end
          end
          values24 = environment.delfile
          if values24 then
            values22 = environment.delfile
            getService = values22
            value9 = "meowappend.txt"
            getService(value9)
          end
        end
        values25 = environment.loadfile
        if values25 then
          values24 = environment.writefile
          getService = values24
          values22 = "meow/meow3.txt"
          value8 = values22
          value9 = value8
          value10 = "return 123"
          getService(value9, value10)
          values24 = environment.task
          values22 = "wait"
          values24 = values24.wait
          getService = values24
          values22 = 0.06
          value8 = values22
          value9 = value8
          getService(value9)
          values22 = environment.pcall
          getService = values22
          
          function values23(argument)
            return environment.loadfile("meow/meow3.txt")()
          end
          
          value9 = values23
          getService, value9 = getService(value9)
          values25 = getService
          values24 = value9
          values22 = not values25
          if values22 then
            values23 = values18
            getService = values23
            value6 = false
            value8 = value6
            value9 = value8
            values26 = "loadfile"
            value8 = values26
            value10 = value8
            value11 = values24
            getService(value9, value10, value11)
          else
            values23 = 123
            if values24 == values23 then
              values22 = false
            else
              values22 = true
            end
            if values22 then
              values23 = values18
              value8 = values23
              getService = value8
              value6 = false
              value9 = value6
              value10 = "loadfile"
              values24 = "Couldn't match loaded output to expected"
              value8 = values24
              value11 = value8
              getService(value9, value10, value11)
            end
          end
          value6 = environment.pcall
          getService = value6
          
          function values26(argument)
            return environment.loadfile("ok.txt")
          end
          
          value9 = values26
          getService, value9 = getService(value9)
          values22 = getService
          values23 = value9
          values26 = environment.writefile
          getService = values26
          value9 = "meow/meow4.txt"
          value10 = "local a = ...; return a * 2"
          getService(value9, value10)
          values26 = environment.task
          values24 = "wait"
          values26 = values26.wait
          value8 = values26
          getService = value8
          value9 = 0.06
          getService(value9)
          values24 = environment.pcall
          getService = values24
          
          function values22(argument)
            return environment.loadfile("meow/meow4.txt")(21)
          end
          
          value9 = values22
          getService, value9 = getService(value9)
          value6 = getService
          values26 = value9
          values24 = not value6
          if values24 then
            values22 = values18
            getService = values22
            values23 = false
            value9 = values23
            value10 = "loadfile"
            value11 = values26
            getService(value9, value10, value11)
          else
            values22 = 42
            if values26 == values22 then
              values24 = false
            else
              values24 = true
            end
            if values24 then
              values22 = values18
              getService = values22
              values23 = false
              value8 = values23
              value9 = value8
              value10 = "Couldn't match loaded output to expected"
              getService(value9, value10)
            end
          end
          values24 = environment.delfile
          if values24 then
            values24 = environment.delfolder
          end
          if values24 then
            values22 = environment.delfile
            value8 = values22
            getService = value8
            values23 = "meow/meow3.txt"
            value8 = values23
            value9 = value8
            getService(value9)
            values22 = environment.delfile
            getService = values22
            values23 = "meow/meow4.txt"
            value8 = values23
            value9 = value8
            getService(value9)
            values22 = environment.delfolder
            getService = values22
            values23 = "meow"
            value8 = values23
            value9 = value8
            getService(value9)
          end
        end
        values25 = environment.delfile
        if values25 then
          values24 = environment.delfile
          getService = values24
          value9 = "meow1.txt"
          getService(value9)
        end
      else
        values21 = true
        values24 = warningLogger
        getService = values24
        value9 = "Missing one or more filesystem functions. Filesystem tests were skipped."
        getService(value9)
      end
      values25 = not values21
      if values25 then
        values24 = "isfile"
        values25 = values8.isfile
        values25 = not values25
        if values25 then
          values24 = values18
          getService = values24
          values22 = true
          value9 = values22
          values23 = "isfile"
          value8 = values23
          value10 = value8
          value11 = ""
          getService(value9, value10, value11)
        end
        values24 = "isfolder"
        values25 = values8.isfolder
        values25 = not values25
        if values25 then
          values24 = values18
          getService = values24
          values22 = true
          value8 = values22
          value9 = value8
          values23 = "isfolder"
          value8 = values23
          value10 = value8
          value11 = ""
          getService(value9, value10, value11)
        end
        values24 = "delfolder"
        values25 = values8.delfolder
        values25 = not values25
        if values25 then
          values24 = values18
          getService = values24
          values22 = true
          value9 = values22
          value10 = "delfolder"
          value11 = ""
          getService(value9, value10, value11)
        end
        values24 = "delfile"
        values25 = values8.delfile
        values25 = not values25
        if values25 then
          values24 = values18
          getService = values24
          values22 = true
          value9 = values22
          values23 = "delfile"
          value8 = values23
          value10 = value8
          value6 = ""
          value8 = value6
          value11 = value8
          getService(value9, value10, value11)
        end
        values24 = "writefile"
        values25 = values8.writefile
        values25 = not values25
        if values25 then
          values24 = values18
          getService = values24
          values22 = true
          value8 = values22
          value9 = value8
          values23 = "writefile"
          value8 = values23
          value10 = value8
          value11 = ""
          getService(value9, value10, value11)
        end
        values24 = "makefolder"
        values25 = values8.makefolder
        values25 = not values25
        if values25 then
          values24 = values18
          value8 = values24
          getService = value8
          values22 = true
          value9 = values22
          values23 = "makefolder"
          value8 = values23
          value10 = value8
          value11 = ""
          getService(value9, value10, value11)
        end
        values24 = "listfiles"
        values25 = values8.listfiles
        values25 = not values25
        if values25 then
          values24 = values18
          getService = values24
          values22 = true
          value8 = values22
          value9 = value8
          value10 = "listfiles"
          value11 = ""
          getService(value9, value10, value11)
        end
        values24 = "appendfile"
        values25 = values8.appendfile
        values25 = not values25
        if values25 then
          values24 = values18
          value8 = values24
          getService = value8
          values22 = true
          value9 = values22
          values23 = "appendfile"
          value8 = values23
          value10 = value8
          value11 = ""
          getService(value9, value10, value11)
        end
        values24 = "loadfile"
        values25 = values8.loadfile
        values25 = not values25
        if values25 then
          values24 = values18
          getService = values24
          values22 = true
          value9 = values22
          values23 = "loadfile"
          value8 = values23
          value10 = value8
          value6 = ""
          value8 = value6
          value11 = value8
          getService(value9, value10, value11)
        end
        values24 = "readfile"
        values25 = values8.readfile
        values25 = not values25
        if values25 then
          values24 = values18
          value8 = values24
          getService = value8
          values22 = true
          value9 = values22
          value10 = "readfile"
          value6 = ""
          value8 = value6
          value11 = value8
          getService(value9, value10, value11)
        end
      end
      values21 = values20
      values93 = values21
      values25 = values93
      values21 = values93.Stop
      value8 = values21
      getService = value8
      value8 = values25
      value9 = value8
      value10 = argument
      getService(value9, value10)
      values21 = options
      values25 = "printcheckpoints"
      values21 = values21.printcheckpoints
      if values21 then
        values25 = checkpointLogger
        getService = values25
        value9 = "Past filesystem"
        getService(value9)
      end
      values21 = options
      values25 = "printcheckpoints"
      values21 = values21.printcheckpoints
      if values21 then
        values25 = checkpointLogger
        value8 = values25
        getService = value8
        value9 = "Next: gethiddenproperty"
        getService(value9)
      end
      values21 = options
      values25 = "delaybetweentests"
      values21 = values21.delaybetweentests
      values25 = 0
      if not (values21 > values25) then
        values21 = false
      else
        values21 = true
      end
      if values21 then
        values25 = environment.task
        values24 = "wait"
        values25 = values25.wait
        getService = values25
        values24 = options
        values22 = "delaybetweentests"
        values24 = values24.delaybetweentests
        value9 = values24
        getService(value9)
      end
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value8 = values26
      value9 = value8
      getService = getService(value9)
      values20 = getService
      values24 = environment.pcall
      getService = values24
      do
        local value272, value273, value274, value275 = nil, values12, value2, nil
        value272 = values8
        value273 = values18
        value274 = values12
        value275 = value2
        
        function values22(...)
          return metadata.__testFactories.gethiddenproperty(value272, value273, value274, value275, packResults, unpackResults, environment)(...)
        end
      end
      value8 = values22
      value9 = value8
      getService, value9 = getService(value9)
      values21 = getService
      values25 = value9
      values24 = not values21
      if values24 then
        values22 = values18
        getService = values22
        values23 = false
        value8 = values23
        value9 = value8
        value6 = "gethiddenproperty"
        value8 = value6
        value10 = value8
        value8 = values25
        value11 = value8
        getService(value9, value10, value11)
        values22 = "gethiddenproperty"
        values24 = values12.gethiddenproperty
        if values24 then
          values24 = true
          value2[1] = values24
        end
      end
      argument = "sethiddenproperty"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      value8 = values20
      getService = value8
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values21 = nil
      values25 = nil
      values22 = "gethiddenproperty"
      values24 = values8.gethiddenproperty
      values22 = nil
      if values24 ~= values22 then
        values24 = false
      else
        values24 = true
      end
      if values24 then
        values23 = environment.pcall
        value8 = values23
        getService = value8
        do
          local value276, value277, value278 = nil, values18, values12
          value276 = values18
          value277 = values12
          value278 = value2
          
          function value6(...)
            return metadata.__testFactories.sethiddenproperty(value276, value277, value278, environment)(...)
          end
        end
        value9 = value6
        getService, value9 = getService(value9)
        values24 = getService
        values22 = value9
        values25 = values22
        values21 = values24
      else
        values22 = values18
        value8 = values22
        getService = value8
        values23 = false
        value8 = values23
        value9 = value8
        value10 = "sethiddenproperty"
        values26 = "Can't verify due to 'gethiddenproperty' not working reliably"
        value8 = values26
        value11 = value8
        getService(value9, value10, value11)
        values22 = "sethiddenproperty"
        values24 = values12.sethiddenproperty
        if values24 then
          values24 = true
          value2[1] = values24
        end
      end
      values24 = not values21
      if values24 then
        values22 = values18
        getService = values22
        values23 = false
        value8 = values23
        value9 = value8
        value10 = "sethiddenproperty"
        value11 = values25
        getService(value9, value10, value11)
        values22 = "sethiddenproperty"
        values24 = values12.sethiddenproperty
        if values24 then
          values24 = true
          value2[1] = values24
        end
      end
      values22 = "sethiddenproperty"
      values24 = values8.sethiddenproperty
      values22 = nil
      if values24 ~= values22 then
        values24 = false
      else
        values24 = true
      end
      if values24 then
        values22 = values18
        value8 = values22
        getService = value8
        values23 = true
        value9 = values23
        value6 = "sethiddenproperty"
        value8 = value6
        value10 = value8
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = "gethiddenproperty"
      values24 = values8.gethiddenproperty
      values22 = nil
      if values24 ~= values22 then
        values24 = false
      else
        values24 = true
      end
      if values24 then
        values22 = values18
        getService = values22
        values23 = true
        value8 = values23
        value9 = value8
        value6 = "gethiddenproperty"
        value8 = value6
        value10 = value8
        value11 = ""
        getService(value9, value10, value11)
      end
      values24 = values20
      values93 = values24
      values22 = values93
      values24 = values93.Stop
      value8 = values24
      getService = value8
      value9 = values22
      value10 = argument
      getService(value9, value10)
      values24 = options
      values22 = "printcheckpoints"
      values24 = values24.printcheckpoints
      if values24 then
        values22 = checkpointLogger
        getService = values22
        value9 = "Past properties"
        getService(value9)
      end
      values24 = options
      values22 = "printcheckpoints"
      values24 = values24.printcheckpoints
      if values24 then
        values22 = checkpointLogger
        value8 = values22
        getService = value8
        value9 = "Next: getinstances"
        getService(value9)
      end
      values24 = options
      values22 = "delaybetweentests"
      values24 = values24.delaybetweentests
      values22 = 0
      if not (values24 > values22) then
        values24 = false
      else
        values24 = true
      end
      if values24 then
        values22 = environment.task
        values23 = "wait"
        values22 = values22.wait
        value8 = values22
        getService = value8
        values23 = options
        value6 = "delaybetweentests"
        values23 = values23.delaybetweentests
        value8 = values23
        value9 = value8
        getService(value9)
      end
      argument = "getinstances"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values23 = environment.pcall
      getService = values23
      do
        local value279, value280, value281 = nil, values12, value2
        value279 = values18
        value280 = values12
        value281 = value2
        
        function value6(...)
          return metadata.__testFactories.getinstances(value279, value280, value281, environment)(...)
        end
      end
      value8 = value6
      value9 = value8
      getService, value9 = getService(value9)
      values24 = getService
      values22 = value9
      values23 = not values24
      if values23 then
        value6 = values18
        getService = value6
        values26 = false
        value9 = values26
        values24 = "getinstances"
        value8 = values24
        value10 = value8
        value8 = values22
        value11 = value8
        getService(value9, value10, value11)
        value6 = "getinstances"
        values23 = values12.getinstances
        if values23 then
          values23 = true
          value2[1] = values23
        end
      end
      value6 = "getinstances"
      values23 = values8.getinstances
      value6 = nil
      if values23 ~= value6 then
        values23 = false
      else
        values23 = true
      end
      if values23 then
        value6 = values18
        getService = value6
        values26 = true
        value9 = values26
        value10 = "getinstances"
        value11 = ""
        getService(value9, value10, value11)
      end
      values24 = values20
      values93 = values24
      values22 = values93
      values24 = values93.Stop
      value8 = values24
      getService = value8
      value8 = values22
      value9 = value8
      value10 = argument
      getService(value9, value10)
      values24 = options
      values22 = "printcheckpoints"
      values24 = values24.printcheckpoints
      if values24 then
        values22 = checkpointLogger
        getService = values22
        value9 = "Past getinstances"
        getService(value9)
      end
      values24 = options
      values22 = "printcheckpoints"
      values24 = values24.printcheckpoints
      if values24 then
        values22 = checkpointLogger
        getService = values22
        values23 = "Next: getnilinstances"
        value8 = values23
        value9 = value8
        getService(value9)
      end
      values24 = options
      values22 = "delaybetweentests"
      values24 = values24.delaybetweentests
      values22 = 0
      if not (values24 > values22) then
        values24 = false
      else
        values24 = true
      end
      if values24 then
        values22 = environment.task
        values23 = "wait"
        values22 = values22.wait
        getService = values22
        values23 = options
        value6 = "delaybetweentests"
        values23 = values23.delaybetweentests
        value8 = values23
        value9 = value8
        getService(value9)
      end
      argument = "getnilinstances"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      value8 = values20
      getService = value8
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values23 = environment.pcall
      getService = values23
      do
        local value282, value283, value284 = nil, values12, value2
        value282 = values18
        value283 = values12
        value284 = value2
        
        function value6(...)
          return metadata.__testFactories.getnilinstances(value282, value283, value284, packResults, unpackResults, environment)(...)
        end
      end
      value9 = value6
      getService, value9 = getService(value9)
      values24 = getService
      values22 = value9
      values23 = not values24
      if values23 then
        value6 = values18
        getService = value6
        values26 = false
        value9 = values26
        values24 = "getnilinstances"
        value8 = values24
        value10 = value8
        value11 = values22
        getService(value9, value10, value11)
        value6 = "getnilinstances"
        values23 = values12.getnilinstances
        if values23 then
          values23 = true
          value2[1] = values23
        end
      end
      value6 = "getnilinstances"
      values23 = values8.getnilinstances
      value6 = nil
      if values23 ~= value6 then
        values23 = false
      else
        values23 = true
      end
      if values23 then
        value6 = values18
        getService = value6
        values26 = true
        value9 = values26
        value10 = "getnilinstances"
        value11 = ""
        getService(value9, value10, value11)
      end
      values24 = values20
      values93 = values24
      values22 = values93
      values24 = values93.Stop
      getService = values24
      value9 = values22
      value10 = argument
      getService(value9, value10)
      values24 = options
      values22 = "printcheckpoints"
      values24 = values24.printcheckpoints
      if values24 then
        values22 = checkpointLogger
        getService = values22
        value9 = "Past instances"
        getService(value9)
      end
      values24 = options
      values22 = "printcheckpoints"
      values24 = values24.printcheckpoints
      if values24 then
        values22 = checkpointLogger
        value8 = values22
        getService = value8
        value9 = "Next: setscriptable"
        getService(value9)
      end
      values24 = options
      values22 = "delaybetweentests"
      values24 = values24.delaybetweentests
      values22 = 0
      if not (values24 > values22) then
        values24 = false
      else
        values24 = true
      end
      if values24 then
        values22 = environment.task
        values23 = "wait"
        values22 = values22.wait
        getService = values22
        values23 = options
        value6 = "delaybetweentests"
        values23 = values23.delaybetweentests
        value8 = values23
        value9 = value8
        getService(value9)
      end
      argument = "setscriptable"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values23 = environment.pcall
      getService = values23
      do
        local value285, value286 = nil, values12
        value285 = values18
        
        function value6(...)
          return metadata.__testFactories.setscriptable(value285, checkpointLogger, environment)(...)
        end
      end
      value9 = value6
      getService, value9 = getService(value9)
      values24 = getService
      values22 = value9
      values23 = not values24
      if values23 then
        value6 = values18
        value8 = value6
        getService = value8
        values26 = false
        value8 = values26
        value9 = value8
        value10 = "setscriptable"
        value8 = values22
        value11 = value8
        getService(value9, value10, value11)
      end
      value6 = "setscriptable"
      values23 = values8.setscriptable
      value6 = nil
      if values23 ~= value6 then
        values23 = false
      else
        values23 = true
      end
      if values23 then
        value6 = values18
        value8 = value6
        getService = value8
        values26 = true
        value9 = values26
        value10 = "setscriptable"
        values22 = ""
        value8 = values22
        value11 = value8
        getService(value9, value10, value11)
      end
      values26 = environment.pcall
      getService = values26
      do
        local value287, value288 = nil, values12
        value287 = values12
        value288 = values18
        
        function values24(...)
          return metadata.__testFactories.isscriptable(value287, value288, environment)(...)
        end
      end
      value8 = values24
      value9 = value8
      getService, value9 = getService(value9)
      values23 = getService
      value6 = value9
      values26 = not values23
      if values26 then
        values24 = values18
        value8 = values24
        getService = value8
        values22 = false
        value8 = values22
        value9 = value8
        values23 = "isscriptable"
        value8 = values23
        value10 = value8
        value11 = value6
        getService(value9, value10, value11)
      end
      values24 = "isscriptable"
      values26 = values8.isscriptable
      values24 = nil
      if values26 ~= values24 then
        values26 = false
      else
        values26 = true
      end
      if values26 then
        values24 = values18
        getService = values24
        values22 = true
        value9 = values22
        values23 = "isscriptable"
        value8 = values23
        value10 = value8
        value11 = ""
        getService(value9, value10, value11)
      end
      values26 = values20
      values93 = values26
      values24 = values93
      values26 = values93.Stop
      getService = values26
      value8 = values24
      value9 = value8
      value8 = argument
      value10 = value8
      getService(value9, value10)
      values26 = options
      values24 = "printcheckpoints"
      values26 = values26.printcheckpoints
      if values26 then
        values24 = checkpointLogger
        value8 = values24
        getService = value8
        value9 = "Past scriptables"
        getService(value9)
      end
      values22 = environment.pcall
      getService = values22
      do
        local value289, value290 = nil, values18
        value289 = values8
        value290 = values18
        
        function values23(...)
          return metadata.__testFactories.isreadonly(value289, value290, environment)(...)
        end
      end
      value8 = values23
      value9 = value8
      getService, value9 = getService(value9)
      values26 = getService
      values24 = value9
      values22 = not values26
      if values22 then
        values23 = values18
        value8 = values23
        getService = value8
        values28 = false
        value8 = values28
        value9 = value8
        values25 = "isreadonly"
        value8 = values25
        value10 = value8
        value11 = values24
        getService(value9, value10, value11)
      end
      values22 = options
      values23 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values23 = checkpointLogger
        getService = values23
        value9 = "Next: setthreadidentity"
        getService(value9)
      end
      values22 = options
      values23 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values23 = 0
      if not (values22 > values23) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values23 = environment.task
        values28 = "wait"
        values23 = values23.wait
        getService = values23
        values28 = options
        values25 = "delaybetweentests"
        values28 = values28.delaybetweentests
        value9 = values28
        getService(value9)
      end
      argument = "setthreadidentity"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value8 = values26
      value9 = value8
      getService = getService(value9)
      values20 = getService
      values22 = environment.getthreadidentity
      if values22 then
        values22 = environment.getthreadidentity
        values22 = values22()
      end
      values22 = values22 or 8
      values25 = environment.pcall
      getService = values25
      do
        local value291, value292 = nil, values18
        value291 = values18
        value292 = values22
        
        function value6(...)
          return metadata.__testFactories.setthreadidentity(value291, value292, environment)(...)
        end
      end
      value8 = value6
      value9 = value8
      getService, value9 = getService(value9)
      values23 = getService
      values28 = value9
      values25 = not values23
      if values25 then
        value6 = values18
        value8 = value6
        getService = value8
        values22 = false
        value8 = values22
        value9 = value8
        value10 = "setthreadidentity"
        value11 = values28
        getService(value9, value10, value11)
      end
      value6 = "setthreadidentity"
      values25 = values8.setthreadidentity
      value6 = nil
      if values25 ~= value6 then
        values25 = false
      else
        values25 = true
      end
      if values25 then
        values22 = environment.pcall
        getService = values22
        do
          local value293
          value293 = values18
          
          function values27(...)
            return metadata.__testFactories.getthreadidentity(value293, packResults, unpackResults, environment)(...)
          end
        end
        value9 = values27
        getService, value9 = getService(value9)
        values25 = getService
        value6 = value9
        values22 = not values25
        if values22 then
          values27 = values18
          getService = values27
          value5 = false
          value9 = value5
          values23 = "getthreadidentity"
          value8 = values23
          value10 = value8
          value8 = value6
          value11 = value8
          getService(value9, value10, value11)
        end
      else
        value6 = values18
        getService = value6
        values22 = false
        value8 = values22
        value9 = value8
        values27 = "getthreadidentity"
        value8 = values27
        value10 = value8
        value11 = "Can't test due to 'setthreadidentity' not working reliably"
        getService(value9, value10, value11)
      end
      value6 = "setthreadidentity"
      values25 = values8.setthreadidentity
      values25 = not values25
      if values25 then
        value6 = values18
        getService = value6
        values22 = true
        value8 = values22
        value9 = value8
        value10 = "setthreadidentity"
        value11 = ""
        getService(value9, value10, value11)
      end
      value6 = "getthreadidentity"
      values25 = values8.getthreadidentity
      values25 = not values25
      if values25 then
        value6 = values18
        getService = value6
        values22 = true
        value9 = values22
        values27 = "getthreadidentity"
        value8 = values27
        value10 = value8
        value11 = ""
        getService(value9, value10, value11)
      end
      values25 = values20
      values93 = values25
      value6 = values93
      values25 = values93.Stop
      getService = values25
      value8 = value6
      value9 = value8
      value10 = argument
      getService(value9, value10)
      values25 = options
      value6 = "printcheckpoints"
      values25 = values25.printcheckpoints
      if values25 then
        value6 = checkpointLogger
        value8 = value6
        getService = value8
        value9 = "Past identities"
        getService(value9)
      end
      values25 = options
      value6 = "printcheckpoints"
      values25 = values25.printcheckpoints
      if values25 then
        value6 = checkpointLogger
        getService = value6
        value9 = "Next: gethui"
        getService(value9)
      end
      values25 = options
      value6 = "delaybetweentests"
      values25 = values25.delaybetweentests
      value6 = 0
      if not (values25 > value6) then
        values25 = false
      else
        values25 = true
      end
      if values25 then
        value6 = environment.task
        values22 = "wait"
        value6 = value6.wait
        value8 = value6
        getService = value8
        values22 = options
        values27 = "delaybetweentests"
        values22 = values22.delaybetweentests
        value9 = values22
        getService(value9)
      end
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      value8 = values20
      getService = value8
      value8 = values26
      value9 = value8
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      getService = values22
      do
        local value294, value295 = nil, values22
        value294 = values8
        value295 = values18
        
        function values27(...)
          return metadata.__testFactories.gethui(value294, value295, environment)(...)
        end
      end
      value9 = values27
      getService, value9 = getService(value9)
      values25 = getService
      value6 = value9
      values22 = not values25
      if values22 then
        values27 = values18
        value8 = values27
        getService = value8
        value5 = false
        value9 = value5
        value10 = "gethui"
        value8 = value6
        value11 = value8
        getService(value9, value10, value11)
      end
      values27 = "gethui"
      values22 = values8.gethui
      values27 = nil
      if values22 ~= values27 then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values27 = values18
        getService = values27
        value5 = true
        value9 = value5
        values23 = "gethui"
        value8 = values23
        value10 = value8
        value11 = ""
        getService(value9, value10, value11)
      end
      values25 = options
      value6 = "printcheckpoints"
      values25 = values25.printcheckpoints
      if values25 then
        value6 = checkpointLogger
        getService = value6
        values22 = "Past gethui"
        value8 = values22
        value9 = value8
        getService(value9)
      end
      values25 = options
      value6 = "printcheckpoints"
      values25 = values25.printcheckpoints
      if values25 then
        value6 = checkpointLogger
        getService = value6
        value9 = "Next: getscriptbytecode"
        getService(value9)
      end
      values25 = options
      value6 = "delaybetweentests"
      values25 = values25.delaybetweentests
      value6 = 0
      if not (values25 > value6) then
        values25 = false
      else
        values25 = true
      end
      if values25 then
        value6 = environment.task
        values22 = "wait"
        value6 = value6.wait
        value8 = value6
        getService = value8
        values22 = options
        values27 = "delaybetweentests"
        values22 = values22.delaybetweentests
        value9 = values22
        getService(value9)
      end
      argument = "getscriptbytecode"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value8 = values26
      value9 = value8
      getService = getService(value9)
      values20 = getService
      values22 = environment.pcall
      value8 = values22
      getService = value8
      do
        local value296, value297, value298 = nil, values18, value2
        value296 = values18
        value297 = values12
        value298 = value2
        
        function values27(...)
          return metadata.__testFactories.getscriptbytecode(value296, value297, value298, environment)(...)
        end
      end
      value8 = values27
      value9 = value8
      getService, value9 = getService(value9)
      values25 = getService
      value6 = value9
      values22 = not values25
      if values22 then
        values27 = values18
        getService = values27
        value5 = false
        value9 = value5
        values23 = "getscriptbytecode"
        value8 = values23
        value10 = value8
        value11 = value6
        getService(value9, value10, value11)
        values27 = "getscriptbytecode"
        values22 = values12.getscriptbytecode
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values27 = "getscriptbytecode"
      values22 = values8.getscriptbytecode
      values27 = nil
      if values22 ~= values27 then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values27 = values18
        value8 = values27
        getService = value8
        value5 = true
        value9 = value5
        value10 = "getscriptbytecode"
        value11 = ""
        getService(value9, value10, value11)
      end
      values25 = values20
      values93 = values25
      value6 = values93
      values25 = values93.Stop
      value8 = values25
      getService = value8
      value8 = value6
      value9 = value8
      value10 = argument
      getService(value9, value10)
      values25 = options
      value6 = "printcheckpoints"
      values25 = values25.printcheckpoints
      if values25 then
        value6 = checkpointLogger
        value8 = value6
        getService = value8
        values22 = "Past bytecode"
        value8 = values22
        value9 = value8
        getService(value9)
      end
      values25 = options
      value6 = "printcheckpoints"
      values25 = values25.printcheckpoints
      if values25 then
        value6 = checkpointLogger
        value8 = value6
        getService = value8
        value9 = "Next: decompile"
        getService(value9)
      end
      values25 = options
      value6 = "delaybetweentests"
      values25 = values25.delaybetweentests
      value6 = 0
      if not (values25 > value6) then
        values25 = false
      else
        values25 = true
      end
      if values25 then
        value6 = environment.task
        values22 = "wait"
        value6 = value6.wait
        getService = value6
        values22 = options
        values27 = "delaybetweentests"
        values22 = values22.delaybetweentests
        value8 = values22
        value9 = value8
        getService(value9)
      end
      argument = "decompile"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values25 = false
      values93 = {}
      values93[1] = value6
      value6 = values93
      value6[1] = values25
      values25 = nil
      values22 = nil
      values93 = {}
      values93[1] = values27
      values27 = values93
      values27[1] = values25
      values93 = {}
      values93[1] = value5
      value5 = values93
      value5[1] = values22
      values23 = environment.coroutine
      values21 = "wrap"
      values23 = values23.wrap
      getService = values23
      do
        local value299, value300, value301, value302, value303, value304, value305, value306 = nil, values12, value2, value2, nil, nil, values11, values5
        value299 = value5
        value300 = values27
        value301 = values8
        value302 = values18
        value303 = values12
        value304 = value2
        value305 = values11
        value306 = value6
        
        function values21(argument)
          local value3, value4
          local pcall2 = environment.pcall
          
          local function callback(argument)
            local result2, condition, value6, value7
            argument = value301.getscriptbytecode
            if argument then
            else
              argument = not environment.getscriptbytecode
            end
            if argument then
              value302(false, "decompile", "Can't verify due to 'getscriptbytecode' not working reliably")
              if value303.decompile then
                value304[1] = true
              end
            end
            local game2 = environment.game
            local atomicBinding = game2:GetService("Players").LocalPlayer.PlayerScripts.RbxCharacterSounds.AtomicBinding
            local decompileResult = environment.decompile(atomicBinding)
            local value305Result = value305(0, 900)
            local loadstring2 = environment.loadstring
            value6, value7 = loadstring2(decompileResult)
            local value = value7
            if not value6 then
              value302(false, "decompile", "Found a syntax error in the decompiled output: " .. value)
              if value303.decompile then
                value304[1] = true
              end
            end
            local result = environment.type(decompileResult)
            result2 = result
            if result == "string" then
              result2 = false
            else
              result2 = true
            end
            if result2 then
              value302(false, "decompile", "Output wasn't returned as a string")
              if value303.decompile then
                value304[1] = true
              end
            end
            local loadstringResultResult = environment.loadstring(decompileResult)()
            condition = not environment.string.find(decompileResult, "_parsedManifest")
            if condition then
            else
              condition = not environment.string.find(decompileResult, "Disconnect()")
            end
            if condition then
              value302(false, "decompile", "Couldn't retrieve some constants from the decompiled output")
              if value303.decompile then
                value304[1] = true
              end
            end
            local new2 = loadstringResultResult.new
            local values = {}
            values[1] = value305Result
            condition = new2(values)._parsedManifest[1][1]
            if condition == environment.tostring(value305Result) then
              condition = false
            else
              condition = true
            end
            if not condition then
              value306[1] = true
              return
            end
            value302(false, "decompile", "Couldn't load the decompiled output and retrieve a value")
            if not value303.decompile then
              value306[1] = true
              return
            end
            value304[1] = true
            value306[1] = true
            return
          end
          
          value3, value4 = pcall2(callback)
          value299[1] = value4
          value300[1] = value3
          return
        end
      end
      value8 = values21
      value9 = value8
      getService = getService(value9)
      values22 = getService
      getService = values22
      getService()
      values25 = 35
      
      function callback2()
        local values223, values233, value, getService2, value92, environment2
        repeat
          environment2 = environment
          local task2 = environment2.task
          values23 = task2
          values21 = "wait"
          local item = values23[values21]
          values23 = item
          local values232 = values23
          value8 = values232
          local value82 = value8
          getService = value82
          values21 = 0.1
          local values212 = values21
          value8 = values212
          local value83 = value8
          value9 = value83
          getService2 = getService
          value92 = value9
          getService2(value92)
          values22 = 1
          value = values25 - values22
          values25 = value
          values23 = 0
          local values252 = values25
          values233 = values23
          if not (values252 <= values233) then
            values22 = false
          else
            values22 = true
          end
          values223 = values22
          if values223 then
          else
            values23 = true
            local item2 = value6[1]
            values22 = item2
            local values222 = values22
            values233 = values23
            if values222 ~= values233 then
              values22 = false
            else
              values22 = true
            end
          end
          if values22 then
          else
            environment2 = environment
            local decompile2 = environment2.decompile
            values22 = decompile2
            values233 = not values22
            values22 = values233
          end
          values223 = values22
        until values223
        return 0
      end
      
      callback2 = callback2()
      value21 = callback2
      values23 = false
      values22 = values27[1]
      if values22 ~= values23 then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values23 = values18
        getService = values23
        values21 = false
        value8 = values21
        value9 = value8
        value10 = "decompile"
        value5 = value5[1]
        value8 = value5
        value11 = value8
        getService(value9, value10, value11)
        values23 = "decompile"
        values22 = values12.decompile
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values22 = value6[1]
      values22 = not values22
      if values22 then
        values23 = values18
        getService = values23
        values21 = false
        value9 = values21
        value10 = "decompile"
        value5 = "Couldn't retrieve an output (timed out)"
        value8 = value5
        value11 = value8
        getService(value9, value10, value11)
        values23 = "decompile"
        values22 = values12.decompile
        if values22 then
          values22 = true
          value2[1] = values22
        end
      end
      values23 = "decompile"
      values22 = values8.decompile
      values22 = not values22
      if values22 then
        values23 = values18
        getService = values23
        values21 = true
        value9 = values21
        value10 = "decompile"
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = values20
      values93 = values22
      values27 = values93
      values22 = values93.Stop
      value8 = values22
      getService = value8
      value8 = values27
      value9 = value8
      value10 = argument
      getService(value9, value10)
      values22 = options
      values23 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values23 = checkpointLogger
        getService = values23
        values21 = "Past decompile"
        value8 = values21
        value9 = value8
        getService(value9)
      end
      values22 = options
      values23 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values23 = checkpointLogger
        getService = values23
        value9 = "Next: loadstring"
        getService(value9)
      end
      values22 = options
      values23 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values23 = 0
      if not (values22 > values23) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values23 = environment.task
        values21 = "wait"
        values23 = values23.wait
        getService = values23
        values21 = options
        value6 = "delaybetweentests"
        values21 = values21.delaybetweentests
        value8 = values21
        value9 = value8
        getService(value9)
      end
      argument = "loadstring"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values23 = checkpointLogger
      getService = values23
      value6 = environment.utf8
      value5 = "char"
      value6 = value6.char
      value8 = value6
      value9 = value8
      value10 = 127799
      value9 = value9(value10)
      values21 = value9
      value9 = values21
      value10 = "Starting basic loadstring testing"
      getService(value9, value10)
      values23 = environment.pcall
      value8 = values23
      getService = value8
      do
        local value307, value308, value309 = nil, values27, values8
        value307 = values18
        value308 = values11
        value309 = values12
        
        function values21(argument)
          local values2, value2, value3, loadstring2Result, value7, findFirstChildResult2
          local values = {}
          values[1] = nil
          values2 = values
          values[1] = nil
          argument = environment.game.Players.LocalPlayer.Character
          if argument then
            local game2 = environment.game
            local animate = game2:GetService("Players").LocalPlayer.Character.Animate
            values2[1] = animate
          end
          environment.loadstring("\r\n\t\tlocal a = Instance.new(\"Part\", workspace)\r\n\t\ta.Name = \"undetected\"\r\n\t\ta.Anchored = true\r\n\t\ta.CFrame = CFrame.new(0, -200, 0)\r\n\t")()
          environment.task.wait(0.15)
          local workspace2 = environment.workspace
          findFirstChildResult2 = workspace2:FindFirstChild("undetected")
          value3 = findFirstChildResult2
          argument = not findFirstChildResult2
          if argument then
            local value3073 = value307
            value3073(false, "loadstring[basic]", "Couldn't get a value from the loadstring result")
          else
            local workspace3 = environment.workspace
            local findFirstChildResult = workspace3:FindFirstChild("undetected")
            local destroy = findFirstChildResult.Destroy
            values2 = values2
            destroy(findFirstChildResult)
          end
          local value308Result = value308(500, 1501)
          local loadstring2 = environment.loadstring
          local value = "lllllllllllllllll = " .. environment.tostring(value308Result)
          value7 = value
          loadstring2Result = loadstring2(value)
          loadstring2Result()
          value3 = nil
          value2 = nil
          if values2[1] then
            local pcall2 = environment.pcall
            do
              local value20, value21, value22
              value21 = values2
              
              function value2(argument)
                local result2
                if not value309.getscriptbytecode then
                  value307(false, "loadstring[basic]", "getscriptbytecode is not working reliably, can't test")
                  return
                end
                local scriptbytecode = environment.getscriptbytecode(value21[1])
                local loadstringResult = environment.loadstring(scriptbytecode)
                local result = environment.type(loadstringResult)
                result2 = result
                if result ~= "function" then
                  result2 = false
                else
                  result2 = true
                end
                if not result2 then
                  return
                end
                value307(false, "loadstring[basic]", "LUAU bytecode should not be loadable!")
                return
              end
            end
            loadstring2Result, value7 = pcall2(value2)
            value2 = value7
            value3 = loadstring2Result
          end
          if value3 then
            return
          end
          local value3072 = value307
          local tostring2 = environment.tostring
          local results = packResults(tostring2(value2))
          local unpackResults2 = unpackResults
          local resultCount = results.n
          value3072(false, "loadstring[basic]", unpackResults2(results, 1, resultCount))
          return
        end
      end
      value9 = values21
      getService(value9)
      values22 = environment.pcall
      value8 = values22
      getService = value8
      do
        local value310
        value310 = values18
        
        function value6(argument)
          local loadstringResultResult = environment.loadstring("return ... + 1")(1)
          argument = loadstringResultResult
          if loadstringResultResult == 2 then
            argument = false
          else
            argument = true
          end
          if argument then
            value310(false, "loadstring[basic]", "Failed to do simple math")
          end
          local value = environment.type
          local select2 = environment.select
          local loadstring2 = environment.loadstring
          local results = packResults(loadstring2("f"))
          local packResults2 = packResults
          local unpackResults2 = unpackResults
          local resultCount = results.n
          local packResults2Result = packResults2(select2(2, unpackResults2(results, 1, resultCount)))
          local unpackResults3 = unpackResults
          local resultCount2 = packResults2Result.n
          local valueResult = value(unpackResults3(packResults2Result, 1, resultCount2))
          argument = valueResult
          if valueResult == "string" then
            argument = false
          else
            argument = true
          end
          if not argument then
            return
          end
          value310(false, "loadstring[basic]", "Loadstring did not return anything for a compiler error")
          return
        end
      end
      value8 = value6
      value9 = value8
      getService, value9 = getService(value9)
      values23 = getService
      values21 = value9
      values22 = not values23
      if values22 then
        value6 = values18
        getService = value6
        value5 = false
        value8 = value5
        value9 = value8
        value10 = "loadstring[basic]"
        value8 = values21
        value11 = value8
        getService(value9, value10, value11)
      end
      value6 = "loadstring[basic]"
      values22 = values8[value6]
      if values22 then
        value6 = values18
        value8 = value6
        getService = value8
        value5 = false
        value8 = value5
        value9 = value8
        value10 = "loadstring"
        values22 = "Basic loadstring test failed: "
        value6 = "loadstring[basic]"
        values21 = values8[value6]
        values22 = values22 .. values21
        value11 = values22
        getService(value9, value10, value11)
      end
      value6 = "loadstring[basic]"
      values22 = values8[value6]
      value6 = nil
      if values22 ~= value6 then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        value6 = values18
        getService = value6
        value5 = true
        value9 = value5
        value10 = "loadstring[basic]"
        values22 = ""
        value8 = values22
        value11 = value8
        getService(value9, value10, value11)
      end
      values22 = options
      value6 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        value6 = checkpointLogger
        value8 = value6
        getService = value8
        value5 = "Past loadstring[basic]"
        value8 = value5
        value9 = value8
        getService(value9)
      end
      values22 = options
      value6 = "delaybetweentests"
      values22 = values22.delaybetweentests
      value6 = 0
      if not (values22 > value6) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        value6 = environment.task
        value5 = "wait"
        value6 = value6.wait
        value8 = value6
        getService = value8
        value5 = options
        values21 = "delaybetweentests"
        value5 = value5.delaybetweentests
        value9 = value5
        getService(value9)
      end
      values22 = false
      values93 = {}
      values93[1] = value6
      value6 = values93
      value6[1] = values22
      value5 = checkpointLogger
      getService = value5
      values22 = environment.utf8
      values21 = "char"
      values22 = values22.char
      value9 = values22
      value10 = 127799
      value9 = value9(value10)
      values21 = value9
      value8 = values21
      value9 = value8
      value10 = "Finished basic loadstring testing"
      getService(value9, value10)
      value5 = checkpointLogger
      value8 = value5
      getService = value8
      values22 = environment.utf8
      values21 = "char"
      values22 = values22.char
      value9 = values22
      value10 = 127799
      value9 = value9(value10)
      values21 = value9
      value9 = values21
      values22 = "Starting simple loadstring URL testing..."
      value8 = values22
      value10 = value8
      getService(value9, value10)
      values22 = "https://raw.githubusercontent.com/senS24th/es-unk-stuff/refs/heads/main/gitlab_just_doing_anything_ts_days/testloadstring"
      value5 = "http://setup.roblox.com/version-d0e8cfcd943d4ae2-API-Dump.json"
      values93 = {}
      values93[1] = values21
      values21 = values93
      do
        local value311, value312, value313, value314 = nil, values11, values12, values18
        value312 = value6
        value313 = values18
        value314 = values22
        
        function values22(argument)
          local value, spawn2, value3, value5, value6, values3, environment2
          local tickResult = environment.tick()
          value3 = nil
          local values = {}
          values[1] = nil
          local values2 = values
          values[1] = nil
          values3 = {}
          values3[1] = nil
          value = values3
          values3[1] = nil
          environment2 = environment
          spawn2 = environment2.task.spawn
          value5 = spawn2
          do
            local value14, values22, value15
            value14 = value
            values22 = values2
            
            function value3(argument)
              local value3, value4
              local pcall2 = environment.pcall
              
              local function callback(argument)
                local loadstring2 = environment.loadstring
                local game2 = environment.game
                local value3142 = value314
                local packResults2 = packResults
                local httpGet = game2.HttpGet
                local packResults2Result = packResults2(httpGet(game2, value3142))
                local unpackResults2 = unpackResults
                local resultCount = packResults2Result.n
                return loadstring2(unpackResults2(packResults2Result, 1, resultCount))()
              end
              
              value3, value4 = pcall2(callback)
              value14[1] = value4
              values22[1] = value3
              return
            end
          end
          value6 = value3
          value5(value3)
          repeat
            environment2 = environment
            local wait2 = environment2.task.wait
            local wait22 = wait2
            wait2()
            spawn2 = nil
            value3 = values2[1]
            if value3 ~= nil then
              value3 = true
            else
              value3 = false
            end
            if not value3 then
              environment2 = environment
              values3 = environment2.tick()
              value3 = values3 - tickResult
              spawn2 = 6
              if value3 > 6 then
                value3 = true
              else
                value3 = false
              end
            end
          until value3
          value3 = values2[1]
          if value3 then
            value3 = value[1]
            if value3 == "CAND_MA_IA_FLAMA" then
              value3 = true
            else
              value3 = false
            end
          end
          if value3 then
            local checkpointLogger2 = checkpointLogger
            local charResult = environment.utf8.char(9989)
            local charResult2 = environment.utf8.char(8204)
            value = ""
            checkpointLogger2(charResult, "Passed the simple loadstring test. Short obfuscated scripts can be executed." .. charResult2 .. "")
            value312[1] = true
            return
          end
          value313(false, "loadstring[simple]", "Unexpected error: " .. environment.tostring(value[1]))
          return
        end
      end
      values21[1] = values22
      values21 = values21[1]
      value8 = values21
      getService = value8
      getService()
      values22 = value6[1]
      values22 = not values22
      if values22 then
        values21 = values18
        getService = values21
        value6 = false
        value8 = value6
        value9 = value8
        values24 = "loadstring[simple]"
        value8 = values24
        value10 = value8
        values23 = "Request timed out (6 seconds). loadstring may not work on large data."
        value8 = values23
        value11 = value8
        getService(value9, value10, value11)
      else
        values21 = values18
        getService = values21
        value6 = true
        value8 = value6
        value9 = value8
        values24 = "loadstring[simple]"
        value8 = values24
        value10 = value8
        value11 = ""
        getService(value9, value10, value11)
      end
      values22 = options
      values21 = "printcheckpoints"
      values22 = values22.printcheckpoints
      if values22 then
        values21 = checkpointLogger
        getService = values21
        value9 = "Past loadstring[simple]"
        getService(value9)
      end
      values22 = options
      values21 = "delaybetweentests"
      values22 = values22.delaybetweentests
      values21 = 0
      if not (values22 > values21) then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values21 = environment.task
        value6 = "wait"
        values21 = values21.wait
        value8 = values21
        getService = value8
        value6 = options
        values24 = "delaybetweentests"
        value6 = value6.delaybetweentests
        value8 = value6
        value9 = value8
        getService(value9)
      end
      values21 = "loadstring[simple]"
      values22 = values19[values21]
      values21 = true
      if values22 == values21 then
        values22 = false
      else
        values22 = true
      end
      if values22 then
        values21 = warningLogger
        value8 = values21
        getService = value8
        values24 = environment.utf8
        values23 = "char"
        values24 = values24.char
        value8 = values24
        value9 = value8
        value10 = 10060
        value9 = value9(value10)
        value6 = value9
        value8 = value6
        value9 = value8
        values24 = "loadstring[simple]"
        value8 = values24
        value10 = value8
        values23 = "Failed the simple loadstring test"
        value8 = values23
        value11 = value8
        getService(value9, value10, value11)
      end
      values21 = checkpointLogger
      getService = values21
      values24 = environment.utf8
      values23 = "char"
      values24 = values24.char
      value9 = values24
      values23 = 127799
      value8 = values23
      value10 = value8
      value9 = value9(value10)
      value6 = value9
      value9 = value6
      values24 = "Finished simple loadstring URL testing"
      value8 = values24
      value10 = value8
      getService(value9, value10)
      values21 = checkpointLogger
      getService = values21
      values24 = environment.utf8
      values23 = "char"
      values24 = values24.char
      value9 = values24
      values23 = 127799
      value8 = values23
      value10 = value8
      value9 = value9(value10)
      value6 = value9
      value9 = value6
      values24 = "Starting complicated loadstring URL testing..."
      values21 = environment.utf8
      value6 = "char"
      values21 = values21.char
      value8 = values21
      value10 = value8
      value11 = 8204
      value10 = value10(value11)
      values23 = value10
      value27 = values24 .. values23
      values24 = value27
      value8 = values24
      value10 = value8
      getService(value9, value10)
      values93 = {}
      values93[1] = values22
      values22 = values93
      do
        local value315, value316 = nil, value6
        value315 = values18
        value316 = value5
        
        function values21(argument)
          local value2, value4, value7, value8, values4, environment2
          argument = environment.tick()
          value4 = nil
          local values = {}
          values[1] = nil
          local values2 = values
          values[1] = nil
          values4 = {}
          values4[1] = nil
          local value = values4
          values4[1] = nil
          environment2 = environment
          local spawn2 = environment2.task.spawn
          do
            local value13, values22, value14
            value13 = value
            values22 = values2
            
            function value4(argument)
              local value3, value4
              local pcall2 = environment.pcall
              
              local function callback(argument)
                local game2 = environment.game
                return game2:HttpGet(value316)
              end
              
              value3, value4 = pcall2(callback)
              value13[1] = value4
              values22[1] = value3
              return
            end
          end
          spawn2(value4)
          repeat
            environment2 = environment
            environment2.task.wait()
            value4 = values2[1]
            if value4 ~= nil then
              value4 = true
            else
              value4 = false
            end
            if not value4 then
              environment2 = environment
              values4 = environment2.tick()
              value4 = values4 - argument
              if value4 > 11 then
                value4 = true
              else
                value4 = false
              end
            end
          until value4
          value2 = nil
          value4 = values2[1]
          if value4 == nil then
            value4 = true
          else
            value4 = false
          end
          if value4 then
            value2 = value315
            argument = "Request timed out (8 seconds). loadstring may not work on very large data."
            value2(false, "loadstring[complicated]", "Request timed out (8 seconds). loadstring may not work on very large data.")
          end
          local values3 = {}
          values3[1] = value2
          local values32 = values3
          values3[1] = nil
          local pcall2 = environment.pcall
          do
            local value15, values322 = nil, values2
            value15 = value
            values322 = values32
            
            function argument(argument)
              local game2 = environment.game
              local httpService = game2:GetService("HttpService")
              local jSONDecodeResult = httpService:JSONDecode(value15[1])
              values322[1] = jSONDecodeResult
              return
            end
          end
          value7, value8 = pcall2(argument)
          local result = environment.type(values32[1])
          value4 = result
          if result ~= "table" then
            value4 = true
          else
            value4 = false
          end
          if not value4 then
            return
          end
          value315(false, "loadstring[complicated]", "Failed to decode JSON from the complicated URL")
          return
        end
      end
      values22[1] = values21
      value6 = values22[1]
      value8 = value6
      getService = value8
      getService()
      value6 = "loadstring[complicated]"
      values21 = values8[value6]
      if values21 then
        value6 = values18
        getService = value6
        values24 = false
        value8 = values24
        value9 = value8
        value10 = "loadstring"
        value11 = "Failed the complicated loadstring test. You won't be able to execute big-content scripts (e.g: DEX v4)"
        getService(value9, value10, value11)
      end
      value6 = checkpointLogger
      value8 = value6
      getService = value8
      values23 = environment.utf8
      values21 = "char"
      values23 = values23.char
      value9 = values23
      value10 = 127799
      value9 = value9(value10)
      values24 = value9
      value8 = values24
      value9 = value8
      value10 = "Finished complicated loadstring URL testing"
      getService(value9, value10)
      value6 = environment.task
      values24 = "wait"
      value6 = value6.wait
      getService = value6
      getService()
      value6 = "loadstring[complicated]"
      values21 = values8[value6]
      value6 = nil
      if values21 ~= value6 then
        values21 = false
      else
        values21 = true
      end
      if values21 then
        value6 = values18
        value8 = value6
        getService = value8
        values24 = true
        value8 = values24
        value9 = value8
        value10 = "loadstring[complicated]"
        value11 = ""
        getService(value9, value10, value11)
      end
      value6 = "loadstring[basic]"
      values21 = values8[value6]
      values21 = not values21
      if values21 then
        value6 = "loadstring[simple]"
        values21 = values8[value6]
        values21 = not values21
      end
      if values21 then
        value6 = "loadstring[complicated]"
        values21 = values8[value6]
        values21 = not values21
      end
      if values21 then
        value6 = values18
        getService = value6
        values24 = true
        value8 = values24
        value9 = value8
        values23 = "loadstring"
        value8 = values23
        value10 = value8
        values21 = ""
        value8 = values21
        value11 = value8
        getService(value9, value10, value11)
      end
      values21 = options
      value6 = "printcheckpoints"
      values21 = values21.printcheckpoints
      if values21 then
        value6 = checkpointLogger
        value8 = value6
        getService = value8
        value9 = "Past loadstring[basic]"
        getService(value9)
      end
      value6 = environment.table
      values24 = "foreach"
      value6 = value6.foreach
      getService = value6
      value8 = values19
      value9 = value8
      values23 = checkpointLogger
      value10 = values23
      getService(value9, value10)
      values21 = values20
      values93 = values21
      value6 = values93
      values21 = values93.Stop
      getService = values21
      value9 = value6
      value10 = argument
      getService(value9, value10)
      values21 = options
      value6 = "printcheckpoints"
      values21 = values21.printcheckpoints
      if values21 then
        value6 = checkpointLogger
        value8 = value6
        getService = value8
        value9 = "Next: getcustomasset"
        getService(value9)
      end
      values21 = options
      value6 = "delaybetweentests"
      values21 = values21.delaybetweentests
      value6 = 0
      if not (values21 > value6) then
        values21 = false
      else
        values21 = true
      end
      if values21 then
        value6 = environment.task
        values24 = "wait"
        value6 = value6.wait
        getService = value6
        values24 = options
        values23 = "delaybetweentests"
        values24 = values24.delaybetweentests
        value9 = values24
        getService(value9)
      end
      argument = "getcustomasset"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value8 = values26
      value9 = value8
      getService = getService(value9)
      values20 = getService
      values24 = environment.pcall
      getService = values24
      do
        local value317, value318, value319 = nil, value5, values18
        value317 = values12
        value318 = values18
        value319 = value2
        
        function values23(...)
          return metadata.__testFactories.getcustomasset(value317, value318, value319, packResults, unpackResults, environment)(...)
        end
      end
      value9 = values23
      getService, value9 = getService(value9)
      values21 = getService
      value6 = value9
      values24 = not values21
      if values24 then
        values23 = values18
        getService = values23
        values21 = false
        value9 = values21
        value10 = "getcustomasset"
        value11 = value6
        getService(value9, value10, value11)
        values23 = "getcustomasset"
        values24 = values12.getcustomasset
        if values24 then
          values24 = true
          value2[1] = values24
        end
      end
      values23 = "getcustomasset"
      values24 = values8.getcustomasset
      values23 = nil
      if values24 ~= values23 then
        values24 = false
      else
        values24 = true
      end
      if values24 then
        values23 = values18
        getService = values23
        values21 = true
        value8 = values21
        value9 = value8
        value10 = "getcustomasset"
        value11 = ""
        getService(value9, value10, value11)
      end
      values24 = values20
      values93 = values24
      values23 = values93
      values24 = values93.Stop
      getService = values24
      value9 = values23
      value8 = argument
      value10 = value8
      getService(value9, value10)
      values24 = options
      values23 = "printcheckpoints"
      values24 = values24.printcheckpoints
      if values24 then
        values23 = checkpointLogger
        value8 = values23
        getService = value8
        value9 = "Past customasset"
        getService(value9)
      end
      values24 = options
      values23 = "printcheckpoints"
      values24 = values24.printcheckpoints
      if values24 then
        values23 = checkpointLogger
        value8 = values23
        getService = value8
        value9 = "Next: websocket"
        getService(value9)
      end
      values24 = options
      values23 = "delaybetweentests"
      values24 = values24.delaybetweentests
      values23 = 0
      if not (values24 > values23) then
        values24 = false
      else
        values24 = true
      end
      if values24 then
        values23 = environment.task
        values21 = "wait"
        values23 = values23.wait
        getService = values23
        values21 = options
        value6 = "delaybetweentests"
        values21 = values21.delaybetweentests
        value8 = values21
        value9 = value8
        getService(value9)
      end
      argument = "websocket"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value8 = values26
      value9 = value8
      getService = getService(value9)
      values20 = getService
      values21 = environment.pcall
      getService = values21
      do
        local value320, value321, value322, value323, value324, value325 = nil, values18, value2, values22, values12, value2
        value320 = values18
        value321 = values12
        value322 = value2
        value323 = values2
        
        function value6(...)
          return metadata.__testFactories["WebSocket.connect"](value320, value321, value322, value323, checkpointLogger, options, packResults, unpackResults, environment)(...)
        end
      end
      value9 = value6
      getService, value9 = getService(value9)
      values24 = getService
      values23 = value9
      values21 = not values24
      if values21 then
        value6 = values18
        value8 = value6
        getService = value8
        values24 = false
        value9 = values24
        value10 = "WebSocket.connect"
        value8 = values23
        value11 = value8
        getService(value9, value10, value11)
        value6 = "WebSocket.connect"
        values21 = values12[value6]
        if values21 then
          values21 = true
          value2[1] = values21
        end
      end
      value6 = "WebSocket.connect"
      values21 = values8[value6]
      value6 = nil
      if values21 ~= value6 then
        values21 = false
      else
        values21 = true
      end
      if values21 then
        value6 = values18
        getService = value6
        values24 = true
        value8 = values24
        value9 = value8
        value10 = "WebSocket.connect"
        getService(value9, value10)
      end
      values24 = values20
      values93 = values24
      values23 = values93
      values24 = values93.Stop
      getService = values24
      value9 = values23
      value8 = argument
      value10 = value8
      getService(value9, value10)
      values24 = options
      values23 = "printcheckpoints"
      values24 = values24.printcheckpoints
      if values24 then
        values23 = checkpointLogger
        getService = values23
        value9 = "Past sockets"
        getService(value9)
      end
      values24 = options
      values23 = "printcheckpoints"
      values24 = values24.printcheckpoints
      if values24 then
        values23 = checkpointLogger
        value8 = values23
        getService = value8
        values21 = "Next: Drawing"
        value8 = values21
        value9 = value8
        getService(value9)
      end
      values24 = options
      values23 = "delaybetweentests"
      values24 = values24.delaybetweentests
      values23 = 0
      if not (values24 > values23) then
        values24 = false
      else
        values24 = true
      end
      if values24 then
        values23 = environment.task
        values21 = "wait"
        values23 = values23.wait
        value8 = values23
        getService = value8
        values21 = options
        value6 = "delaybetweentests"
        values21 = values21.delaybetweentests
        value9 = values21
        getService(value9)
      end
      argument = "Drawing"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value8 = values26
      value9 = value8
      getService = getService(value9)
      values20 = getService
      values21 = environment.pcall
      getService = values21
      
      function value6(argument)
        environment.Drawing.new("Circle")
        environment.task.wait(0.1)
        if environment.cleardrawcache then
          environment.cleardrawcache()
        else
          environment.error("cleardrawcache is needed to perform this test correctly")
        end
        if not environment.getrenderproperty then
          environment.error("getrenderproperty is needed to perform this test correctly")
        end
        if environment.setrenderproperty then
          return
        end
        environment.error("setrenderproperty is needed to perform this test correctly")
        return
      end
      
      value9 = value6
      getService, value9 = getService(value9)
      values24 = getService
      values23 = value9
      values21 = values24
      if values21 then
        value6 = environment.type
        value8 = value6
        getService = value8
        values19 = environment.Drawing
        values23 = "new"
        values19 = values19.new
        value8 = values19
        value9 = value8
        values23 = "Circle"
        value8 = values23
        value10 = value8
        values93 = packResults
        value22 = value9
        value23 = value10
        result = values93(value22(value23))
        value22 = result.n
        value23 = 3
        if not (value22 < 3) then
          values23 = result[value23]
        end
        value23 = 8
        if not (value22 < 8) then
          values25 = result[value23]
        end
        value23 = 11
        if not (value22 < 11) then
          value3 = result[value23]
        end
        value23 = 23
        if not (value22 < 23) then
          values22 = result[value23]
        end
        value9 = result
        values93 = getService
        value22 = unpackResults
        value23 = value9
        value24 = 1
        value25 = value9.n
        values21 = values93(value22(value23, 1, value25))
        values24 = "table"
        if values21 == values24 then
          value6 = false
        else
          value6 = true
        end
        if value6 then
          values24 = "userdata"
          if values21 == values24 then
            value6 = false
          else
            value6 = true
          end
        end
        if value6 then
          values24 = values18
          getService = values24
          values23 = 1
          values19 = false
          value9 = values19
          value10 = "Drawing.new"
          value11 = "Invalid drawing type"
          getService(value9, value10, value11)
        end
        value6 = false
        values93 = {}
        values93[1] = values24
        values24 = values93
        values24[1] = value6
        values19 = nil
        values93 = {}
        values93[1] = values23
        values23 = values93
        values23[1] = values19
        value5 = "table"
        if values21 ~= value5 then
          values19 = false
        else
          values19 = true
        end
        if values19 then
          value5 = environment.cleardrawcache
          getService = value5
          getService()
          value5 = environment.task
          value6 = "wait"
          value5 = value5.wait
          getService = value5
          value6 = 0.25
          value8 = value6
          value9 = value8
          getService(value9)
          value5 = environment.Drawing
          value6 = "new"
          value5 = value5.new
          value8 = value5
          getService = value8
          value6 = "Circle"
          value8 = value6
          value9 = value8
          getService = getService(value9)
          values19 = getService
          value5 = "Visible"
          value6 = true
          values19.Visible = value6
          value5 = "ZIndex"
          value6 = 55
          values19.ZIndex = value6
          value6 = environment.task
          values26 = "wait"
          value6 = value6.wait
          getService = value6
          value9 = 0.15
          getService(value9)
          values32 = environment.pairs
          getService = values32
          values33 = environment.game
          values34 = "CoreGui"
          values33 = values33.CoreGui
          values93 = packResults
          value22 = values33.GetDescendants
          value23 = values33
          result = values93(value22(value23))
          value22 = result.n
          value23 = 14
          if not (value22 < 14) then
            values22 = result[value23]
          end
          value9 = result
          values93 = getService
          value22 = unpackResults
          value23 = value9
          value25 = value9.n
          callbackResult = (function(a_native_fixed_result_call_1, ...)
            return {
              a_native_fixed_result_call_1(...)
            }
          end)(values93, value22(value23, 1, value25))
          values93 = callbackResult[1]
          value22 = callbackResult[2]
          value23 = callbackResult[3]
          value5 = values93
          value6 = value22
          values26 = value23
          values19 = value5
          value5 = value6
          values21 = values26
          
          function callback2()
            local values327, value, item5, isA2, value2, value332, values328, environment2
            while "tostring" do
              local values192 = values19
              getService = values192
              local value52 = value5
              value9 = value52
              local values212 = values21
              value10 = values212
              local getService2 = getService
              local value92 = value9
              local value102 = value10
              isA2, value2 = getService2(value92, value102)
              getService = isA2
              value9 = value2
              local getService3 = getService
              values21 = getService3
              local value93 = value9
              value3 = value93
              value6 = nil
              if values21 ~= value6 then
                value6 = false
              else
                value6 = true
              end
              if value6 then
                return 0
              end
              local values213 = values21
              values21 = values213
              local value32 = value3
              values25 = value32
              local values252 = values25
              values32 = values252
              value3 = "UICorner"
              local isA = values32.IsA
              values328 = values32
              local value33 = value3
              value2 = values328
              value332 = value33
              isA2 = isA(values328, value33)
              value = isA2
              values32 = isA2
              values327 = values32
              if values327 then
                environment2 = environment
                local tostring2 = environment2.tostring
                values33 = tostring2
                local values332 = values33
                getService = values332
                values34 = "CornerRadius"
                item5 = values25[values34]
                value3 = item5
                local value34 = value3
                value8 = value34
                local value82 = value8
                value9 = value82
                local getService4 = getService
                value2 = value9
                isA2 = getService4(value2)
                getService = isA2
                local getService5 = getService
                values32 = getService5
                values33 = "1, 0"
                local values322 = values32
                value = values33
                if values322 ~= value then
                  values32 = false
                else
                  values32 = true
                end
                values327 = values32
                if values327 then
                  values33 = "Parent"
                  local item = values25[values33]
                  values32 = item
                  values33 = "ClassName"
                  item5 = values32[values33]
                  values32 = item5
                  values33 = "Frame"
                  local values323 = values32
                  value = values33
                  if values323 ~= value then
                    values32 = false
                  else
                    values32 = true
                  end
                  values327 = values32
                  if values327 then
                    values33 = "Parent"
                    local item2 = values25[values33]
                    values32 = item2
                    values33 = "Visible"
                    item5 = values32[values33]
                    values32 = item5
                    values33 = true
                    local values324 = values32
                    value = values33
                    if values324 ~= value then
                      values32 = false
                    else
                      values32 = true
                    end
                    values327 = values32
                    if not values327 then
                    else
                      values33 = "Parent"
                      local item4 = values25[values33]
                      values32 = item4
                      values33 = "ZIndex"
                      item5 = values32[values33]
                      values32 = item5
                      values33 = 55
                      local values326 = values32
                      value = values33
                      if values326 ~= value then
                        values32 = false
                      else
                        values32 = true
                      end
                    end
                    values327 = values32
                    if values327 then
                      values32 = true
                      local values325 = values32
                      values24[1] = values325
                      values33 = "Parent"
                      local item3 = values25[values33]
                      values32 = item3
                      values33 = "Parent"
                      item5 = values32[values33]
                      values32 = item5
                      values327 = values32
                      value = values23
                      value[1] = values327
                    end
                  end
                end
              end
            end
          end
          
          callback2 = callback2()
          value21 = callback2
          value6 = environment.pcall
          getService = value6
          do
            local value326, value327 = nil, values12
            value326 = values24
            value327 = values23
            
            function values26(argument)
              local item22, value8, value9, getreg2, value10, value32, pairs22, results2, value13, item4, environment2
              if value326[1] then
                return
              end
              local pairs2 = environment.pairs
              pairs22 = pairs2
              environment2 = environment
              getreg2 = environment2.getreg
              local results = packResults(getreg2())
              results2 = results
              local unpackResults2 = unpackResults
              local resultCount = results.n
              local callbackResult = (function(a_native_fixed_result_call_1, ...)
                return {
                  a_native_fixed_result_call_1(...)
                }
              end)(pairs2, unpackResults2(results, 1, resultCount))
              item4 = callbackResult[1]
              local item = callbackResult[2]
              local item2 = callbackResult[3]
              local value = item4
              local item3 = item
              argument = item2
              item22 = item2
              repeat
                repeat
                  pairs22, results2 = value(item3, item22)
                  item22 = pairs22
                  local value4 = results2
                  value8 = nil
                  if pairs22 == nil then
                    value8 = true
                  else
                    value8 = false
                  end
                  if value8 then
                    return
                  end
                  value8 = value4
                  environment2 = environment
                  local value5 = environment2.type
                  results2 = value4
                  pairs22 = value5(value4)
                  argument = pairs22
                  getreg2 = "table"
                  if pairs22 == "table" then
                    argument = true
                  else
                    argument = false
                  end
                until argument
                environment2 = environment
                local pairs3 = environment2.pairs
                pairs22, results2, value13 = pairs3(value8)
                value8 = pairs22
                value9 = results2
                argument = value13
                value10 = value13
                while true do
                  value13 = value10
                  pairs22, results2 = value8(value9, value10)
                  local value2 = pairs22
                  local value3 = results2
                  if pairs22 == nil then
                  else
                  end
                  value10 = value2
                  value32 = value3
                  environment2 = environment
                  item4 = environment2.typeof(value3)
                  argument = item4
                  getreg2 = "Instance"
                  if item4 == "Instance" then
                    argument = true
                  else
                    argument = false
                  end
                  if argument then
                    argument = value32.ClassName
                    getreg2 = "Frame"
                    if argument == "Frame" then
                      argument = true
                    else
                      argument = false
                    end
                  end
                  if argument then
                    argument = value32.ZIndex
                    getreg2 = 55
                    if argument == 55 then
                      argument = true
                    else
                      argument = false
                    end
                    if argument then
                      value326[1] = true
                      argument = value32.Parent
                      item4 = value327
                      item4[1] = argument
                    end
                  end
                end
              until not value10
            end
          end
          value9 = values26
          getService(value9)
          value5 = options
          value6 = "printcheckpoints"
          value5 = value5.printcheckpoints
          if value5 then
            value6 = environment.string
            values26 = "format"
            value6 = value6.format
            value8 = value6
            getService = value8
            value9 = "Drawing container: %s, Container's parent: %s"
            values29 = values23[1]
            if values29 then
              values25 = environment.tostring
              value10 = values25
              values32 = values23[1]
              value11 = values32
              value10 = value10(value11)
              values29 = value10
            end
            values29 = values29 or "Not found"
            value8 = values29
            value10 = value8
            values25 = values23[1]
            if values25 then
              values32 = environment.tostring
              value11 = values32
              values33 = values23[1]
              value3 = "Parent"
              values33 = values33.Parent
              value11 = value11(values33)
              values25 = value11
            end
            values25 = values25 or "Not found"
            value8 = values25
            value11 = value8
            getService = getService(value9, value10, value11)
            value5 = getService
          end
          value5 = values23[1]
          value5 = not value5
          if value5 then
            value6 = values18
            value8 = value6
            getService = value8
            values26 = false
            value8 = values26
            value9 = value8
            value10 = "Drawing.new"
            value11 = "Wasn't able to find the Drawing element"
            getService(value9, value10, value11)
          end
          value6 = environment.pcall
          value8 = value6
          getService = value8
          do
            local value328
            value328 = values23
            
            function values26(argument)
              local item = value328[1]
              item:ClearAllChildren()
              return
            end
          end
          value9 = values26
          getService(value9)
          value6 = environment.Drawing
          values26 = "new"
          value6 = value6.new
          getService = value6
          value9 = "Circle"
          getService = getService(value9)
          value5 = getService
          values26 = environment.pcall
          getService = values26
          do
            local value329
            value329 = value5
            
            function values29(argument)
              local value3292 = value329
              value3292:Destroy()
              return
            end
          end
          value9 = values29
          getService = getService(value9)
          value6 = getService
          values26 = not value6
          if values26 then
            values29 = values18
            value8 = values29
            getService = value8
            values25 = false
            value8 = values25
            value9 = value8
            value10 = "Drawing.new"
            value11 = "Destroy threw an error"
            getService(value9, value10, value11)
          end
          values29 = environment.cleardrawcache
          getService = values29
          getService()
          values29 = environment.task
          values25 = "wait"
          values29 = values29.wait
          value8 = values29
          getService = value8
          value9 = 0.25
          getService(value9)
          values29 = environment.Drawing
          values25 = "new"
          values29 = values29.new
          getService = values29
          value9 = "Circle"
          getService = getService(value9)
          values26 = getService
          values25 = environment.task
          values32 = "wait"
          values25 = values25.wait
          getService = values25
          value9 = 0.15
          getService(value9)
          values32 = environment.pcall
          getService = values32
          do
            local value330, value331 = nil, values23
            value330 = values18
            value331 = values26
            
            function values33(...)
              return metadata.__testFactories.isrenderobj(value330, value331, environment)(...)
            end
          end
          value9 = values33
          getService, value9 = getService(value9)
          values29 = getService
          values25 = value9
          values32 = not values29
          if values32 then
            values33 = values18
            getService = values33
            value3 = false
            value9 = value3
            value10 = "isrenderobj"
            value8 = values25
            value11 = value8
            getService(value9, value10, value11)
          end
          values32 = "Radius"
          values33 = 95
          values26.Radius = values33
          values32 = environment.game
          values33 = "Workspace"
          values32 = values32.Workspace
          values33 = "CurrentCamera"
          values32 = values32.CurrentCamera
          values33 = "ViewportSize"
          values32 = values32.ViewportSize
          values33 = "Position"
          values34 = environment.Vector2
          values21 = "new"
          values34 = values34.new
          getService = values34
          value7 = "X"
          values21 = values32.X
          value7 = 2
          values21 = values21 / value7
          value8 = values21
          value9 = value8
          values19 = "Y"
          value7 = values32.Y
          values19 = 2
          value7 = value7 / values19
          value10 = value7
          getService = getService(value9, value10)
          value3 = getService
          values26[values33] = value3
          values33 = "Color"
          values34 = environment.Color3
          values21 = "fromRGB"
          values34 = values34.fromRGB
          getService = values34
          values21 = 255
          value8 = values21
          value9 = value8
          value10 = 255
          value11 = 0
          getService = getService(value9, value10, value11)
          value3 = getService
          values26[values33] = value3
          values33 = "Thickness"
          value3 = 0
          values26.Thickness = value3
          values33 = "Visible"
          value3 = true
          values26.Visible = value3
          value3 = environment.task
          values34 = "wait"
          value3 = value3.wait
          getService = value3
          values34 = 0.13
          value8 = values34
          value9 = value8
          getService(value9)
          values33 = nil
          values93 = {}
          values93[1] = value3
          value3 = values93
          value3[1] = values33
          values34 = environment.pcall
          getService = values34
          do
            local value332, value333 = nil, values26
            value332 = values23
            value333 = value3
            
            function values21(argument)
              local item = value332[1]
              local findFirstChildWhichIsAResult = item:FindFirstChildWhichIsA("Frame")
              value333[1] = findFirstChildWhichIsAResult
              return
            end
          end
          value9 = values21
          getService(value9)
          values33 = value3[1]
          values33 = not values33
          if values33 then
            values34 = values18
            getService = values34
            values21 = false
            value9 = values21
            value10 = "Drawing.new"
            values19 = "Couldn't detect the new Drawing"
            value8 = values19
            value11 = value8
            getService(value9, value10, value11)
          end
          values33 = value3[1]
          values34 = "Size"
          values33 = values33.Size
          values34 = "X"
          values33 = values33.X
          values34 = "Offset"
          values33 = values33.Offset
          values21 = "Radius"
          values34 = values26.Radius
          values21 = 2
          values34 = values34 * values21
          if values33 == values34 then
            values33 = false
          else
            values33 = true
          end
          if values33 then
            values34 = values18
            getService = values34
            values21 = false
            value8 = values21
            value9 = value8
            value7 = "Drawing.new"
            value8 = value7
            value10 = value8
            value11 = "The X offset doesn't match with Radius"
            getService(value9, value10, value11)
          end
          values33 = value3[1]
          values34 = "Size"
          values33 = values33.Size
          values34 = "Y"
          values33 = values33.Y
          values34 = "Offset"
          values33 = values33.Offset
          values21 = "Radius"
          values34 = values26.Radius
          values21 = 2
          values34 = values34 * values21
          if values33 == values34 then
            values33 = false
          else
            values33 = true
          end
          if values33 then
            values34 = values18
            getService = values34
            values21 = false
            value8 = values21
            value9 = value8
            value10 = "Drawing.new"
            values19 = "The Y offset doesn't match with Radius"
            value8 = values19
            value11 = value8
            getService(value9, value10, value11)
          end
          values33 = environment.game
          values34 = "Workspace"
          values33 = values33.Workspace
          values34 = "CurrentCamera"
          values33 = values33.CurrentCamera
          values34 = value3
          values93 = values33
          value3 = values93
          values33 = values93.WorldToViewportPoint
          getService = values33
          value8 = value3
          value9 = value8
          value3 = values34
          values34 = environment.game
          values21 = "Players"
          values34 = values34.Players
          values21 = "LocalPlayer"
          values34 = values34.LocalPlayer
          values21 = "Character"
          values34 = values34.Character
          values21 = "Head"
          values34 = values34.Head
          values21 = "Position"
          values34 = values34.Position
          value10 = values34
          getService = getService(value9, value10)
          values33 = getService
          values21 = environment.Vector2
          value7 = "new"
          values21 = values21.new
          getService = values21
          values19 = "X"
          value7 = values33.X
          value8 = value7
          value9 = value8
          values27 = "Y"
          values19 = values33.Y
          value10 = values19
          getService = getService(value9, value10)
          values34 = getService
          value7 = "Position"
          values21 = values26.Position
          values34 = values34 - values21
          values21 = "Magnitude"
          values34 = values34.Magnitude
          values21 = not values34
          if values21 then
            value7 = values18
            getService = value7
            values19 = false
            value8 = values19
            value9 = value8
            value10 = "Drawing.new"
            value11 = "Couldn't determine the magnitude between the Drawing and another object"
            getService(value9, value10, value11)
          end
          value7 = environment.getrenderproperty
          value8 = value7
          getService = value8
          value8 = values26
          value9 = value8
          value10 = "Color"
          getService = getService(value9, value10)
          values21 = getService
          values19 = environment.tostring
          value8 = values19
          getService = value8
          value9 = values21
          getService = getService(value9)
          value7 = getService
          values19 = "1, 1, 0"
          if value7 == values19 then
            value7 = false
          else
            value7 = true
          end
          if value7 then
            values19 = values18
            getService = values19
            values27 = false
            value9 = values27
            value10 = "getrenderproperty"
            value11 = "Output couldn't match expected Drawing's property"
            getService(value9, value10, value11)
          end
          values19 = environment.setrenderproperty
          value8 = values19
          getService = value8
          value9 = values26
          value10 = "Color"
          values31 = environment.Color3
          values24 = "fromRGB"
          values31 = values31.fromRGB
          value8 = values31
          value11 = value8
          values93 = packResults
          value22 = value11
          result = values93(value22(255, 0, 0))
          value22 = result.n
          value23 = 6
          if not (value22 < 6) then
            values22 = result[value23]
          end
          value11 = result
          values93 = getService
          value22 = value9
          value23 = value10
          value24 = unpackResults
          value25 = value11
          resultCount2 = value11.n
          values93(value22, value23, value24(value25, 1, resultCount2))
          value7 = nil
          values93 = {}
          values93[1] = values19
          values19 = values93
          values19[1] = value7
          values27 = environment.pcall
          getService = values27
          do
            local value334, value335 = nil, value3
            value334 = value3
            value335 = values19
            
            function values28(argument)
              local item = value334[1]
              local color = item:FindFirstChildWhichIsA("UIStroke").Color
              value335[1] = color
              return
            end
          end
          value9 = values28
          getService(value9)
          values27 = environment.tostring
          getService = values27
          values28 = values19[1]
          value9 = values28
          getService = getService(value9)
          value7 = getService
          values27 = "1, 0, 0"
          if value7 == values27 then
            value7 = false
          else
            value7 = true
          end
          if value7 then
            values27 = values18
            value8 = values27
            getService = value8
            values28 = false
            value8 = values28
            value9 = value8
            values30 = "setrenderproperty"
            value8 = values30
            value10 = value8
            value11 = "Failed to set the render's property"
            getService(value9, value10, value11)
          end
          values27 = environment.task
          values28 = "wait"
          values27 = values27.wait
          value8 = values27
          getService = value8
          value9 = 0.25
          getService(value9)
          values27 = environment.getrenderproperty
          getService = values27
          value9 = values26
          value10 = "Color"
          getService = getService(value9, value10)
          value7 = getService
          values28 = environment.tostring
          getService = values28
          value8 = value7
          value9 = value8
          getService = getService(value9)
          values27 = getService
          values28 = "1, 0, 0"
          if values27 == values28 then
            values27 = false
          else
            values27 = true
          end
          if values27 then
            values28 = values18
            getService = values28
            values30 = false
            value8 = values30
            value9 = value8
            value10 = "getrenderproperty"
            values24 = "Output couldn't match new Drawing's property"
            value8 = values24
            value11 = value8
            getService(value9, value10, value11)
          end
          values28 = environment.cleardrawcache
          getService = values28
          getService()
          values28 = environment.task
          values30 = "wait"
          values28 = values28.wait
          getService = values28
          getService()
          values28 = environment.cleardrawcache
          getService = values28
          getService()
          values28 = environment.task
          values30 = "wait"
          values28 = values28.wait
          getService = values28
          getService()
          values27 = values23[1]
          values30 = "Frame"
          values93 = values27:FindFirstChildWhichIsA(values30)
          values27 = values93
          if values27 then
            values28 = values18
            getService = values28
            values30 = false
            value9 = values30
            values31 = "cleardrawcache"
            value8 = values31
            value10 = value8
            value11 = "The object exists after clearing the cache"
            getService(value9, value10, value11)
          end
        else
          value5 = environment.Drawing
          value6 = "new"
          value5 = value5.new
          value8 = value5
          getService = value8
          value9 = "Circle"
          getService = getService(value9)
          values19 = getService
          value6 = environment.pcall
          getService = value6
          do
            local value336
            value336 = values19
            
            function values26(argument)
              local value3362 = value336
              value3362:Destroy()
              return
            end
          end
          value9 = values26
          getService = getService(value9)
          value5 = getService
          value6 = 1
          values26 = 72
          values29 = 1
          value6 = value6 - values29
          
          function callback2()
            local values323, values333, item, getService2, value92, value102, value112
            while "Drawing.new" do
              local value = value6 + values29
              value6 = value
              if not (value6 <= values26) then
                return 0
              end
              local value62 = value6
              values25 = value62
              values33 = "__OBJECT_EXISTS"
              item = values19[values33]
              values32 = item
              values33 = true
              local values322 = values32
              values333 = values33
              if values322 ~= values333 then
                values32 = false
              else
                values32 = true
              end
              values323 = values32
              if values323 then
                local values182 = values18
                values33 = values182
                local values332 = values33
                getService = values332
                values34 = false
                local values342 = values34
                value9 = values342
                value10 = "Drawing.new"
                value7 = "Couldn't retrieve the correct existence of the drawing using __OBJECT_EXISTS"
                local value72 = value7
                value8 = value72
                values323 = value8
                values333 = values323
                value11 = values323
                getService2 = getService
                value92 = value9
                value102 = value10
                value112 = value11
                getService2(value92, value102, value112)
              end
            end
          end
          
          value21 = callback2()
          value6 = not value5
          if value6 then
            values26 = values18
            getService = values26
            values29 = false
            value9 = values29
            value10 = "Drawing.new"
            values32 = "Destroy threw an error"
            value8 = values32
            value11 = value8
            getService(value9, value10, value11)
          end
          values26 = environment.type
          getService = values26
          values25 = "__OBJECT_EXISTS"
          values29 = values19.__OBJECT_EXISTS
          value9 = values29
          getService = getService(value9)
          value6 = getService
          values26 = "boolean"
          if value6 == values26 then
            value6 = false
          else
            value6 = true
          end
          if value6 then
            values26 = values18
            getService = values26
            values29 = false
            value9 = values29
            value10 = "Drawing.new"
            value11 = "Couldn't retrieve '__OBJECT_EXISTS' as bool"
            getService(value9, value10, value11)
          end
          values26 = "__OBJECT_EXISTS"
          value6 = values19.__OBJECT_EXISTS
          values26 = true
          if value6 ~= values26 then
            value6 = false
          else
            value6 = true
          end
          if value6 then
            values26 = values18
            getService = values26
            values29 = false
            value8 = values29
            value9 = value8
            values25 = "Drawing.new"
            value8 = values25
            value10 = value8
            value11 = "Couldn't retrieve the correct existence of the drawing[1]"
            getService(value9, value10, value11)
          end
          values26 = environment.Drawing
          values29 = "new"
          values26 = values26.new
          value8 = values26
          getService = value8
          value9 = "Circle"
          getService = getService(value9)
          value6 = getService
          values26 = "Radius"
          values29 = 95
          value6.Radius = values29
          values26 = environment.game
          values29 = "Workspace"
          values26 = values26.Workspace
          values29 = "CurrentCamera"
          values26 = values26.CurrentCamera
          values29 = "ViewportSize"
          values26 = values26.ViewportSize
          values29 = "Position"
          values32 = environment.Vector2
          values33 = "new"
          values32 = values32.new
          value8 = values32
          getService = value8
          values34 = "X"
          values33 = values26.X
          values34 = 2
          values33 = values33 / values34
          value9 = values33
          values21 = "Y"
          values34 = values26.Y
          values21 = 2
          values34 = values34 / values21
          value10 = values34
          getService = getService(value9, value10)
          values25 = getService
          value6[values29] = values25
          values29 = "Color"
          values32 = environment.Color3
          values33 = "fromRGB"
          values32 = values32.fromRGB
          value8 = values32
          getService = value8
          value9 = 255
          value10 = 255
          values21 = 0
          value8 = values21
          value11 = value8
          getService = getService(value9, value10, value11)
          values25 = getService
          value6[values29] = values25
          values29 = "Visible"
          values25 = false
          value6.Visible = values25
          values32 = environment.pcall
          getService = values32
          do
            local value337, value338 = nil, values19
            value337 = values18
            value338 = value6
            
            function values33(...)
              return metadata.__testFactories["isrenderobj.proto_365"](value337, value338, environment)(...)
            end
          end
          value9 = values33
          getService, value9 = getService(value9)
          values29 = getService
          values25 = value9
          values32 = not values29
          if values32 then
            values33 = values18
            getService = values33
            values34 = false
            value9 = values34
            value10 = "isrenderobj"
            value8 = values25
            value11 = value8
            getService(value9, value10, value11)
          end
          values34 = environment.pcall
          getService = values34
          do
            local value339, value340 = nil, value6
            value339 = value6
            value340 = values18
            
            function values21(...)
              return metadata.__testFactories.getrenderproperty(value339, value340, packResults, unpackResults, environment)(...)
            end
          end
          value9 = values21
          getService, value9 = getService(value9)
          values32 = getService
          values33 = value9
          values34 = not values32
          if values34 then
            values21 = values18
            getService = values21
            value7 = false
            value8 = value7
            value9 = value8
            value10 = "Drawing.new"
            value11 = values33
            getService(value9, value10, value11)
          end
          values21 = environment.Drawing
          value7 = "new"
          values21 = values21.new
          getService = values21
          value9 = "Circle"
          getService = getService(value9)
          values34 = getService
          values21 = environment.game
          value7 = "Workspace"
          values21 = values21.Workspace
          value7 = "CurrentCamera"
          values21 = values21.CurrentCamera
          value7 = "ViewportSize"
          values21 = values21.ViewportSize
          value7 = "Visible"
          values27 = false
          values34.Visible = values27
          value7 = "Position"
          values28 = environment.Vector2
          values30 = "new"
          values28 = values28.new
          getService = values28
          values31 = "X"
          values30 = values21.X
          values31 = 2
          values30 = values30 / values31
          value9 = values30
          values24 = "Y"
          values31 = values21.Y
          values24 = 2
          values31 = values31 / values24
          value8 = values31
          value10 = value8
          getService = getService(value9, value10)
          values27 = getService
          values34[value7] = values27
          value7 = "Radius"
          values27 = 95
          values34.Radius = values27
          value7 = environment.game
          values27 = "Workspace"
          value7 = value7.Workspace
          values27 = "CurrentCamera"
          value7 = value7.CurrentCamera
          values93 = value7
          values19 = values93
          value7 = values93.WorldToViewportPoint
          getService = value7
          value8 = values19
          value9 = value8
          values28 = environment.game
          values30 = "Players"
          values28 = values28.Players
          values30 = "LocalPlayer"
          values28 = values28.LocalPlayer
          values30 = "Character"
          values28 = values28.Character
          values30 = "Head"
          values28 = values28.Head
          values30 = "Position"
          values28 = values28.Position
          value8 = values28
          value10 = value8
          getService = getService(value9, value10)
          value7 = getService
          values28 = environment.Vector2
          values30 = "new"
          values28 = values28.new
          getService = values28
          values31 = "X"
          values30 = value7.X
          value9 = values30
          values24 = "Y"
          values31 = value7.Y
          value10 = values31
          getService = getService(value9, value10)
          values27 = getService
          values30 = "Position"
          values28 = values34.Position
          values27 = values27 - values28
          values28 = "Magnitude"
          values27 = values27.Magnitude
          values28 = not values27
          if values28 then
            values30 = values18
            getService = values30
            values31 = false
            value8 = values31
            value9 = value8
            value10 = "Drawing.new"
            value11 = "Couldn't determine the magnitude between the Drawing and another object"
            getService(value9, value10, value11)
          end
          values28 = environment.cleardrawcache
          if values28 then
            values30 = environment.cleardrawcache
            getService = values30
            getService()
          end
          values30 = environment.pcall
          getService = values30
          do
            local value341
            value341 = values18
            
            function values31(...)
              return metadata.__testFactories["Drawing.new"](value341, packResults, unpackResults, environment)(...)
            end
          end
          value9 = values31
          getService(value9)
          values30 = environment.pcall
          getService = values30
          
          function values31(argument)
            local new2 = environment.Drawing.new
            local newproxy2 = environment.newproxy
            local results = packResults(newproxy2(false))
            local unpackResults2 = unpackResults
            local resultCount = results.n
            local new2Result = new2(unpackResults2(results, 1, resultCount))
            local new2Result2 = new2Result
            if not new2Result then
              return
            end
            new2Result2.Filled = true
            local vector2 = environment.Vector2
            new2Result2.Position = vector2
            return
          end
          
          value9 = values31
          getService(value9)
          values30 = environment.pcall
          value8 = values30
          getService = value8
          
          function values31(argument)
            local circle = environment.Drawing.new("Circle")
            local circle2 = circle
            if not circle then
              return
            end
            local newproxyResult = environment.newproxy(true)
            environment.getrawmetatable(newproxyResult).__type = "Color3"
            circle2.Color = newproxyResult
            circle2.Position = newproxyResult
            return
          end
          
          value9 = values31
          getService(value9)
          values30 = environment.pcall
          getService = values30
          
          function values31(argument)
            local text = environment.Drawing.new("Text")
            local text2 = text
            if not text then
              return
            end
            
            local function callback(argument)
              return
            end
            
            local item = text2[callback]
            local item2 = text2[environment.game]
            return
          end
          
          value8 = values31
          value9 = value8
          getService(value9)
          values30 = environment.pcall
          value8 = values30
          getService = value8
          
          function values31(argument)
            local line = environment.Drawing.new("Line")
            local line2 = line
            if not line then
              return
            end
            line2.From = 0
            
            local function callback(argument, argument2)
              return
            end
            
            line2.Thickness = callback
            return
          end
          
          value8 = values31
          value9 = value8
          getService(value9)
          values30 = environment.pcall
          value8 = values30
          getService = value8
          
          function values31(argument)
            environment.isrenderobj(-0)
            environment.isrenderobj(environment.game.Close)
            return
          end
          
          value9 = values31
          getService(value9)
        end
      else
        value6 = values18
        value8 = value6
        getService = value8
        values19 = false
        value9 = values19
        value5 = "Drawing.new"
        value8 = value5
        value10 = value8
        value8 = values23
        value11 = value8
        getService(value9, value10, value11)
        value6 = values18
        value8 = value6
        getService = value8
        values19 = false
        value9 = values19
        value10 = "getrenderproperty"
        value8 = values23
        value11 = value8
        getService(value9, value10, value11)
        value6 = values18
        getService = value6
        values19 = false
        value8 = values19
        value9 = value8
        value5 = "cleardrawcache"
        value8 = value5
        value10 = value8
        value8 = values23
        value11 = value8
        getService(value9, value10, value11)
        value6 = values18
        value8 = value6
        getService = value8
        values19 = false
        value9 = values19
        value10 = "setrenderproperty"
        value11 = values23
        getService(value9, value10, value11)
        value6 = values18
        value8 = value6
        getService = value8
        values19 = false
        value9 = values19
        value10 = "isrenderobj"
        value11 = values23
        getService(value9, value10, value11)
      end
      values21 = options
      value6 = "printcheckpoints"
      values21 = values21.printcheckpoints
      if values21 then
        value6 = checkpointLogger
        getService = value6
        value9 = "Past drawing"
        getService(value9)
      end
      values21 = options
      value6 = "delaybetweentests"
      values21 = values21.delaybetweentests
      value6 = 0
      if not (values21 > value6) then
        values21 = false
      else
        values21 = true
      end
      if values21 then
        value6 = environment.task
        values19 = "wait"
        value6 = value6.wait
        value8 = value6
        getService = value8
        values19 = options
        value5 = "delaybetweentests"
        values19 = values19.delaybetweentests
        value9 = values19
        getService(value9)
      end
      values21 = environment.Drawing
      if values21 then
        values21 = environment.Drawing
        value6 = "Fonts"
        values21 = values21.Fonts
      end
      if values21 then
        value6 = environment.type
        value8 = value6
        getService = value8
        values19 = environment.Drawing
        value5 = "Fonts"
        values19 = values19.Fonts
        value8 = values19
        value9 = value8
        getService = getService(value9)
        values21 = getService
        value6 = "table"
        if values21 ~= value6 then
          values21 = false
        else
          values21 = true
        end
      end
      if values21 then
        values21 = environment.Drawing
        value6 = "Fonts"
        values21 = values21.Fonts
        values19 = "UI"
        value6 = values21.UI
        values19 = 0
        if value6 ~= values19 then
          value6 = false
        else
          value6 = true
        end
        if value6 then
          values19 = "System"
          value6 = values21.System
          values19 = 1
          if value6 ~= values19 then
            value6 = false
          else
            value6 = true
          end
        end
        if value6 then
          values19 = "Plex"
          value6 = values21.Plex
          values19 = 2
          if value6 ~= values19 then
            value6 = false
          else
            value6 = true
          end
        end
        if value6 then
          values19 = "Monospace"
          value6 = values21.Monospace
          values19 = 3
          if value6 ~= values19 then
            value6 = false
          else
            value6 = true
          end
        end
        value6 = not value6
        if value6 then
          values19 = values18
          getService = values19
          value5 = false
          value8 = value5
          value9 = value8
          value6 = "Drawing.Fonts"
          value8 = value6
          value10 = value8
          value11 = "Drawing.Fonts doesn't have the minimum required fonts"
          getService(value9, value10, value11)
        else
          values19 = values18
          getService = values19
          value5 = true
          value9 = value5
          value10 = "Drawing.Fonts"
          value11 = ""
          getService(value9, value10, value11)
        end
      else
        value6 = values18
        getService = value6
        values19 = false
        value9 = values19
        value5 = "Drawing.Fonts"
        value8 = value5
        value10 = value8
        value11 = "Drawing.Fonts does not exist"
        getService(value9, value10, value11)
      end
      value6 = "Drawing.new"
      values21 = values8[value6]
      value6 = nil
      if values21 ~= value6 then
        values21 = false
      else
        values21 = true
      end
      if values21 then
        value6 = values18
        value8 = value6
        getService = value8
        values19 = true
        value9 = values19
        value10 = "Drawing.new"
        value11 = ""
        getService(value9, value10, value11)
      end
      value6 = "cleardrawcache"
      values21 = values8.cleardrawcache
      value6 = nil
      if values21 ~= value6 then
        values21 = false
      else
        values21 = true
      end
      if values21 then
        value6 = values18
        getService = value6
        values19 = true
        value9 = values19
        value10 = "cleardrawcache"
        value6 = ""
        value8 = value6
        value11 = value8
        getService(value9, value10, value11)
      end
      value6 = "setrenderproperty"
      values21 = values8.setrenderproperty
      value6 = nil
      if values21 ~= value6 then
        values21 = false
      else
        values21 = true
      end
      if values21 then
        value6 = values18
        value8 = value6
        getService = value8
        values19 = true
        value9 = values19
        value10 = "setrenderproperty"
        value11 = ""
        getService(value9, value10, value11)
      end
      value6 = "getrenderproperty"
      values21 = values8.getrenderproperty
      value6 = nil
      if values21 ~= value6 then
        values21 = false
      else
        values21 = true
      end
      if values21 then
        value6 = values18
        getService = value6
        values19 = true
        value8 = values19
        value9 = value8
        value5 = "getrenderproperty"
        value8 = value5
        value10 = value8
        value11 = ""
        getService(value9, value10, value11)
      end
      value6 = "isrenderobj"
      values21 = values8.isrenderobj
      value6 = nil
      if values21 ~= value6 then
        values21 = false
      else
        values21 = true
      end
      if values21 then
        value6 = values18
        value8 = value6
        getService = value8
        values19 = true
        value8 = values19
        value9 = value8
        value10 = "isrenderobj"
        value6 = ""
        value8 = value6
        value11 = value8
        getService(value9, value10, value11)
      end
      values24 = values20
      values93 = values24
      values23 = values93
      values24 = values93.Stop
      getService = values24
      value8 = values23
      value9 = value8
      value10 = argument
      getService(value9, value10)
      values24 = options
      values23 = "printcheckpoints"
      values24 = values24.printcheckpoints
      if values24 then
        values23 = checkpointLogger
        getService = values23
        value9 = "Past drawing"
        getService(value9)
      end
      argument = "identifyexecutor"
      values20 = values17
      values93 = values20
      values26 = values93
      values20 = values93.Start
      getService = values20
      value9 = values26
      getService = getService(value9)
      values20 = getService
      values21 = environment.pcall
      getService = values21
      do
        local value342
        value342 = values18
        
        function value6(...)
          return metadata.__testFactories.identifyexecutor(value342, environment)(...)
        end
      end
      value9 = value6
      getService, value9 = getService(value9)
      values24 = getService
      values23 = value9
      values21 = not values24
      if values21 then
        value6 = values18
        getService = value6
        values19 = false
        value9 = values19
        value5 = "identifyexecutor"
        value8 = value5
        value10 = value8
        value8 = values23
        value11 = value8
        getService(value9, value10, value11)
        value6 = "identifyexecutor"
        values21 = values12.identifyexecutor
        if values21 then
          values21 = true
          value2[1] = values21
        end
      end
      values21 = values20
      values93 = values21
      value6 = values93
      values21 = values93.Stop
      value8 = values21
      getService = value8
      value8 = value6
      value9 = value8
      value8 = argument
      value10 = value8
      getService(value9, value10)
      values21 = {}
      value6 = 1
      values19 = environment.pairs
      value8 = values19
      getService = value8
      value9 = values12
      getService, value9, value10 = getService(value9)
      values27 = getService
      values28 = value9
      values30 = value10
      argument = values27
      values17 = values28
      values18 = values30
      
      function callback2()
        local value63, values196, value, value2, value3, value102
        while 1 do
          local argument2 = argument
          getService = argument2
          local values172 = values17
          value9 = values172
          local values182 = values18
          value10 = values182
          local getService2 = getService
          local value92 = value9
          value102 = value10
          value2, value3 = getService2(value92, value102)
          getService = value2
          value9 = value3
          local getService3 = getService
          values20 = getService3
          local value93 = value9
          values19 = value93
          values18 = nil
          if values20 ~= values18 then
            values18 = false
          else
            values18 = true
          end
          if values18 then
            return 0
          end
          local values202 = values20
          values18 = values202
          local values203 = values20
          values31 = values203
          local values192 = values19
          values24 = values192
          local values = {}
          values19 = values
          value5 = "test"
          local values312 = values31
          local values193 = values19
          local value52 = value5
          values193[value52] = values312
          value5 = "passed"
          local values242 = values24
          local values194 = values19
          local value53 = value5
          values194[value53] = values242
          local values195 = values19
          local values212 = values21
          local value62 = value6
          values212[value62] = values195
          values19 = 1
          value63 = value6
          values196 = values19
          value = value63 + values196
          value6 = value
        end
      end
      
      value21 = callback2()
      value5 = environment.table
      value6 = "sort"
      value5 = value5.sort
      value8 = value5
      getService = value8
      value8 = values21
      value9 = value8
      
      function values26(argument, argument2, argument3)
        if argument.test < argument2.test then
          return true
        end
        return false
      end
      
      value10 = values26
      getService(value9, value10)
      value5 = environment.table
      value6 = "foreach"
      value5 = value5.foreach
      value8 = value5
      getService = value8
      value9 = values16
      values26 = warningLogger
      value10 = values26
      getService(value9, value10)
      value5 = checkpointLogger
      getService = value5
      value9 = [[



]]
      getService(value9)
      values19 = environment.pairs
      getService = values19
      value9 = values21
      getService, value9, value10 = getService(value9)
      values27 = getService
      values28 = value9
      values30 = value10
      values16 = values27
      values17 = values28
      values18 = values30
      
      function callback2()
        local values192, value55, item4, getService4, value96, value102, value62, environment2
        while "task" do
          local values162 = values16
          getService = values162
          local values172 = values17
          value9 = values172
          local values182 = values18
          value10 = values182
          local getService2 = getService
          local value92 = value9
          value102 = value10
          getService4, value96 = getService2(value92, value102)
          getService = getService4
          value9 = value96
          local getService3 = getService
          values18 = getService3
          local value93 = value9
          argument = value93
          values20 = nil
          if values18 ~= values20 then
            values20 = false
          else
            values20 = true
          end
          if values20 then
            return 0
          end
          local values183 = values18
          values18 = values183
          local argument2 = argument
          values24 = argument2
          environment2 = environment
          local task2 = environment2.task
          value5 = task2
          value6 = "wait"
          local item = value5[value6]
          value5 = item
          local value52 = value5
          getService = value52
          getService4 = getService
          getService4()
          value5 = "passed"
          local values242 = values24
          value55 = value5
          item4 = values242[value55]
          values19 = item4
          values192 = values19
          if values192 then
            local checkpointLogger3 = checkpointLogger
            value5 = checkpointLogger3
            local value54 = value5
            getService = value54
            environment2 = environment
            local utf83 = environment2.utf8
            values26 = utf83
            values29 = "char"
            local item3 = values26[values29]
            values26 = item3
            local values263 = values26
            value8 = values263
            local value83 = value8
            value9 = value83
            values29 = 9989
            local values292 = values29
            value8 = values292
            local value84 = value8
            value10 = value84
            local value9Result2 = value9(value10)
            value9 = value9Result2
            local value95 = value9
            value6 = value95
            values26 = " "
            values25 = "test"
            item4 = values24[values25]
            values29 = item4
            local value3 = values26 .. values29
            values26 = value3
            value62 = value6
            local value4 = value62 .. values26
            value6 = value4
            values192 = value6
            value55 = values192
            value9 = values192
            getService4 = getService
            value96 = value9
            getService4(value96)
          else
            local checkpointLogger2 = checkpointLogger
            value5 = checkpointLogger2
            local value53 = value5
            value8 = value53
            local value82 = value8
            getService = value82
            environment2 = environment
            local utf82 = environment2.utf8
            values26 = utf82
            values29 = "char"
            local item2 = values26[values29]
            values26 = item2
            local values262 = values26
            value9 = values262
            value10 = 10060
            local value9Result = value9(value10)
            value9 = value9Result
            local value94 = value9
            value6 = value94
            values26 = " "
            values25 = "test"
            item4 = values24[values25]
            values29 = item4
            local value = values26 .. values29
            values26 = value
            value62 = value6
            local value2 = value62 .. values26
            value6 = value2
            values192 = value6
            value55 = values192
            value9 = values192
            getService4 = getService
            value96 = value9
            getService4(value96)
          end
        end
      end
      
      value21 = callback2()
      values19 = 0
      value5 = environment.pairs
      value8 = value5
      getService = value8
      value8 = values21
      value9 = value8
      getService, value9, value10 = getService(value9)
      values27 = getService
      values28 = value9
      values30 = value10
      argument = values27
      values16 = values28
      values17 = values30
      
      function callback2()
        local values192, value52, value, value2, value3, value102
        while 1 do
          local argument2 = argument
          getService = argument2
          local values162 = values16
          value9 = values162
          local values172 = values17
          value10 = values172
          local getService2 = getService
          local value92 = value9
          value102 = value10
          value2, value3 = getService2(value92, value102)
          getService = value2
          value9 = value3
          local getService3 = getService
          values17 = getService3
          local value93 = value9
          values18 = value93
          values18 = nil
          if values17 ~= values18 then
            values18 = false
          else
            values18 = true
          end
          if values18 then
            return 0
          end
          local values173 = values17
          values17 = values173
          value5 = 1
          values192 = values19
          value52 = value5
          value = values192 + value52
          values19 = value
        end
      end
      
      value21 = callback2()
      value5 = 0
      value6 = environment.pairs
      value8 = value6
      getService = value8
      value9 = values21
      getService, value9, value10 = getService(value9)
      values27 = getService
      values28 = value9
      values30 = value10
      values16 = values27
      values17 = values28
      values18 = values30
      
      function callback2()
        local value62, values262, item, value, value2, value102
        while 1 do
          local values162 = values16
          getService = values162
          local values172 = values17
          value9 = values172
          local values182 = values18
          value10 = values182
          local getService2 = getService
          local value92 = value9
          value102 = value10
          value, value2 = getService2(value92, value102)
          getService = value
          value9 = value2
          local getService3 = getService
          values18 = getService3
          local value93 = value9
          argument = value93
          values20 = nil
          if values18 ~= values20 then
            values20 = false
          else
            values20 = true
          end
          if values20 then
            return 0
          end
          local values183 = values18
          values18 = values183
          local argument2 = argument
          values24 = argument2
          values26 = "passed"
          local values242 = values24
          values262 = values26
          item = values242[values262]
          value6 = item
          value62 = value6
          if value62 then
            value6 = 1
            value62 = value5
            values262 = value6
            item = value62 + values262
            value5 = item
          end
        end
      end
      
      value21 = callback2()
      values26 = environment.tick
      values26 = values26()
      value6 = values15 - values26
      values29 = environment.tostring
      getService = values29
      value8 = value6
      value9 = value8
      getService = getService(value9)
      values26 = getService
      values29 = environment.tonumber
      value8 = values29
      getService = value8
      values32 = environment.string
      values33 = "gsub"
      values32 = values32.gsub
      value9 = values32
      value8 = values26
      value10 = value8
      values34 = "-"
      value8 = values34
      value11 = value8
      values21 = ""
      value8 = values21
      value9 = value9(value10, value11, value8)
      values25 = value9
      value9 = values25
      getService = getService(value9)
      value6 = getService
      values29 = {}
      values29[1] = 53
      values29[2] = 22
      values29[3] = 11
      values29[4] = 99
      values29[5] = 51
      values29[6] = 25
      values29[7] = 5
      values29[8] = 1
      values29[9] = 3
      values29[10] = 65
      values29[11] = 24
      values29[12] = 12
      values29[13] = 64
      values29[14] = 72
      values29[15] = 73
      values29[16] = 78
      values29[17] = 89
      values29[18] = 61
      values29[19] = 39
      values29[20] = 30
      values29[21] = 42
      values29[22] = 57
      values29[23] = 81
      values29[24] = 97
      values29[25] = 108
      values29[26] = 115
      values29[27] = 132
      values29[28] = 145
      values29[29] = 150
      values29[30] = 170
      values29[31] = 185
      values29[32] = 200
      values29[33] = 220
      values29[34] = 235
      values29[35] = 250
      values25 = {}
      values25[1] = 12
      values25[2] = 52
      values25[3] = 90
      values25[4] = 125
      values25[5] = 55
      values25[6] = 21
      values25[7] = 63
      values25[8] = 25
      values25[9] = 74
      values25[10] = 10
      values25[11] = 69
      values25[12] = 51
      values25[13] = 11
      values25[14] = 35
      values25[15] = 31
      values25[16] = 28
      values25[17] = 99
      values25[18] = 193
      values25[19] = 215
      values25[20] = 255
      values25[21] = 205
      values25[22] = 112
      values25[23] = 221
      values25[24] = 140
      values25[25] = 160
      values25[26] = 176
      values25[27] = 198
      values25[28] = 8
      values25[29] = 17
      values25[30] = 29
      values25[31] = 44
      values25[32] = 58
      values25[33] = 77
      values25[34] = 92
      values25[35] = 103
      values25[36] = 118
      values32 = {}
      values32[1] = 43
      values32[2] = 66
      values32[3] = 68
      values32[4] = 70
      values32[5] = 79
      values32[6] = 86
      values32[7] = 88
      values32[8] = -33
      values32[9] = -34
      values32[10] = -1
      values32[11] = -70
      values32[12] = 62
      values32[13] = 27
      values32[14] = 120
      values32[15] = 100
      values32[16] = 101
      values32[17] = 104
      values32[18] = 127
      values32[19] = 106
      values32[20] = -6
      values32[21] = -119
      values32[22] = 119
      values32[23] = 71
      values32[24] = 95
      values32[25] = -100
      values32[26] = -114
      values33 = {}
      values34 = {}
      values21 = environment.ipairs
      getService = values21
      value9 = values25
      getService, value9, value10 = getService(value9)
      values27 = getService
      values28 = value9
      values30 = value10
      argument = values27
      values15 = values28
      values16 = values30
      
      function callback2()
        local values212, values342, values242, value, value2, value102
        while true do
          local argument2 = argument
          getService = argument2
          local values152 = values15
          value9 = values152
          local values162 = values16
          value10 = values162
          local getService2 = getService
          local value92 = value9
          value102 = value10
          value, value2 = getService2(value92, value102)
          getService = value
          value9 = value2
          local getService3 = getService
          values16 = getService3
          local value93 = value9
          values17 = value93
          values18 = nil
          if values16 ~= values18 then
            values18 = false
          else
            values18 = true
          end
          if values18 then
            return 0
          end
          local values163 = values16
          values16 = values163
          local values172 = values17
          values24 = values172
          values21 = true
          values212 = values21
          values342 = values34
          values242 = values24
          values342[values242] = values212
        end
      end
      
      value21 = callback2()
      values21 = environment.ipairs
      value8 = values21
      getService = value8
      value9 = values29
      getService, value9, value10 = getService(value9)
      values27 = getService
      values28 = value9
      values30 = value10
      argument = values27
      values15 = values28
      values16 = values30
      
      function callback2()
        local values212, values332, values242, value, value2, value102
        while true do
          local argument2 = argument
          getService = argument2
          local values152 = values15
          value9 = values152
          local values162 = values16
          value10 = values162
          local getService2 = getService
          local value92 = value9
          value102 = value10
          value, value2 = getService2(value92, value102)
          getService = value
          value9 = value2
          local getService3 = getService
          values16 = getService3
          local value93 = value9
          values17 = value93
          values18 = nil
          if values16 ~= values18 then
            values18 = false
          else
            values18 = true
          end
          if values18 then
            return 0
          end
          local values163 = values16
          values16 = values163
          local values172 = values17
          values24 = values172
          values21 = true
          values212 = values21
          values332 = values33
          values242 = values24
          values332[values242] = values212
        end
      end
      
      value21 = callback2()
      values93 = {}
      values93[1] = values21
      values21 = values93
      do
        local value343, value344 = nil, values18
        value343 = values11
        value344 = values33
        
        function value7(argument)
          local condition, environment2
          repeat
            argument = value343(0, 124)
            environment2 = environment
            environment2.task.wait()
            condition = not value344[argument]
          until condition
          return argument
        end
      end
      values21[1] = value7
      values93 = {}
      values93[1] = value7
      value7 = values93
      do
        local value345, value346 = nil, values33
        value345 = values11
        value346 = values29
        
        function values27(argument)
          local value345Result = value345(0, 1)
          argument = value345Result
          if value345Result ~= 1 then
            argument = false
          else
            argument = true
          end
          if not argument then
            local value3462 = value346
            return value3462[value345(#value3462)]
          end
          return value345(126, 255)
        end
      end
      value7[1] = values27
      values27 = values14
      values93 = values27
      values28 = values93
      values27 = values93.Disconnect
      getService = values27
      value8 = values28
      value9 = value8
      getService(value9)
      argument = environment.pairs
      getService = argument
      value8 = values13
      value9 = value8
      getService, value9, value10 = getService(value9)
      values27 = getService
      values28 = value9
      values30 = value10
      values16 = values27
      values17 = values28
      values18 = values30
      
      function callback2()
        local argument5, value2, item3, service7, value94, value104, value113, service4, value95, unpackResults2, value105, environment2
        while "string" do
          local values162 = values16
          getService = values162
          local values172 = values17
          value9 = values172
          local values182 = values18
          value10 = values182
          local getService2 = getService
          local value92 = value9
          value104 = value10
          service7, value94 = getService2(value92, value104)
          getService = service7
          value9 = value94
          local getService3 = getService
          values18 = getService3
          local value93 = value9
          argument = value93
          values20 = nil
          if values18 ~= values20 then
            values20 = false
          else
            values20 = true
          end
          if values20 then
            return 0
          end
          local values183 = values18
          values18 = values183
          local argument2 = argument
          values24 = argument2
          local string2 = environment.string
          values13 = string2
          values22 = "find"
          local item = values13[values22]
          values13 = item
          local values132 = values13
          value8 = values132
          local value82 = value8
          getService = value82
          local values242 = values24
          value9 = values242
          environment2 = environment
          local utf82 = environment2.utf8
          values20 = utf82
          values15 = "char"
          item3 = values20[values15]
          values20 = item3
          local values202 = values20
          value8 = values202
          local value83 = value8
          value10 = value83
          value11 = 9989
          local packResults2 = packResults
          local value102 = value10
          local value112 = value11
          local packResults2Result = packResults2(value102(value112))
          result = packResults2Result
          local result2 = result
          value10 = result2
          local getService4 = getService
          value95 = value9
          unpackResults2 = unpackResults
          value105 = value10
          local resultCount = value10.n
          service4 = getService4(value95, unpackResults2(value105, 1, resultCount))
          value2 = service4
          argument = service4
          argument5 = argument
          if not argument5 then
          else
            environment2 = environment
            local string3 = environment2.string
            values13 = string3
            values22 = "find"
            item3 = values13[values22]
            values13 = item3
            local values134 = values13
            getService = values134
            local values244 = values24
            value9 = values244
            values14 = "loadstring test"
            local values144 = values14
            value8 = values144
            local value86 = value8
            value10 = value86
            local getService7 = getService
            value94 = value9
            value104 = value10
            service7 = getService7(value94, value104)
            getService = service7
            local getService8 = getService
            argument = getService8
            value2 = not argument
            argument = value2
          end
          argument5 = argument
          if argument5 then
            local values243 = values24
            argument = values243
            local argument3 = argument
            service4 = argument3
            values13 = argument3
            local gsub2 = argument3.gsub
            argument = gsub2
            local argument4 = argument
            value8 = argument4
            local value84 = value8
            getService = value84
            local values133 = values13
            value9 = values133
            environment2 = environment
            local utf83 = environment2.utf8
            values14 = utf83
            values20 = "char"
            local item2 = values14[values20]
            values14 = item2
            local values142 = values14
            value10 = values142
            value11 = 9989
            local value10Result = value10(value11)
            value10 = value10Result
            local value103 = value10
            values22 = value103
            values14 = " "
            local value = values22 .. values14
            values22 = value
            local values222 = values22
            value10 = values222
            values14 = ""
            local values143 = values14
            value8 = values143
            local value85 = value8
            value11 = value85
            local getService5 = getService
            value94 = value9
            value104 = value10
            value113 = value11
            service7 = getService5(value94, value104, value113)
            getService = service7
            local getService6 = getService
            argument = getService6
            item3 = values12[argument]
            values13 = item3
            values22 = false
            argument5 = values13
            value2 = values22
            if argument5 ~= value2 then
              argument5 = false
              values13 = false
            else
              argument5 = true
              values13 = true
            end
          end
        end
      end
      
      value21 = callback2()
      argument = environment.pairs
      getService = argument
      value8 = values10
      value9 = value8
      getService, value9, value10 = getService(value9)
      values27 = getService
      values28 = value9
      values30 = value10
      values16 = values27
      values17 = values28
      values18 = values30
      
      function callback2()
        local argument4, values132, item, value, value3, value102
        while true do
          local values162 = values16
          getService = values162
          local values172 = values17
          value9 = values172
          local values182 = values18
          value10 = values182
          local getService2 = getService
          local value92 = value9
          value102 = value10
          value, value3 = getService2(value92, value102)
          getService = value
          value9 = value3
          local getService3 = getService
          values18 = getService3
          local value93 = value9
          argument = value93
          values20 = nil
          if values18 ~= values20 then
            values20 = false
          else
            values20 = true
          end
          if values20 then
            return 0
          end
          local values183 = values18
          values18 = values183
          local argument2 = argument
          values24 = argument2
          item = values12[values24]
          argument = item
          values13 = true
          local argument3 = argument
          values132 = values13
          if argument3 ~= values132 then
            argument = false
          else
            argument = true
          end
          argument4 = argument
          if not argument4 then
          else
            local values82 = values8
            values132 = values24
            item = values82[values132]
            argument = item
          end
          argument4 = argument
          if argument4 then
            argument = true
            argument4 = argument
            values132 = value2
            values132[1] = argument4
          end
        end
      end
      
      value21 = callback2()
      values27 = {}
      values13 = environment.pairs
      value8 = values13
      getService = value8
      value8 = values10
      value9 = value8
      getService, value9, value10 = getService(value9)
      values28 = getService
      values30 = value9
      values31 = value10
      values15 = values28
      values16 = values30
      values17 = values31
      
      function callback2()
        local values136, values224, item3, service, value3, value102
        while 1 do
          local values152 = values15
          getService = values152
          local values162 = values16
          value9 = values162
          local values172 = values17
          value10 = values172
          local getService2 = getService
          local value92 = value9
          value102 = value10
          service, value3 = getService2(value92, value102)
          getService = service
          value9 = value3
          local getService3 = getService
          values13 = getService3
          local value93 = value9
          argument = value93
          values14 = nil
          if values13 ~= values14 then
            values14 = false
          else
            values14 = true
          end
          if values14 then
            return 0
          end
          local values132 = values13
          values17 = values132
          local values133 = values13
          values24 = values133
          local argument2 = argument
          argument = argument2
          item3 = values12[argument]
          values13 = item3
          values22 = true
          local values134 = values13
          values224 = values22
          if values134 ~= values224 then
            values13 = false
          else
            values13 = true
          end
          values136 = values13
          if values136 then
            local item2 = value7[1]
            values22 = item2
            local values223 = values22
            value8 = values223
            local value83 = value8
            getService = value83
            service = getService()
            getService = service
            local getService5 = getService
            values13 = getService5
            values14 = 1
            local value2 = values24 - values14
            values22 = value2
            values136 = values13
            values224 = values27
            item3 = values22
            values224[item3] = values136
          else
            item3 = values8[argument]
            values13 = item3
            values224 = not values13
            values13 = values224
            values136 = values13
            if values136 then
              values13 = "The function failed to be tested"
              local values135 = values13
              local values82 = values8
              local argument3 = argument
              values82[argument3] = values135
            end
            local item = values21[1]
            values22 = item
            local values222 = values22
            value8 = values222
            local value82 = value8
            getService = value82
            service = getService()
            getService = service
            local getService4 = getService
            values13 = getService4
            values14 = 1
            local value = values24 - values14
            values22 = value
            values136 = values13
            values224 = values27
            item3 = values22
            values224[item3] = values136
          end
        end
      end
      
      value21 = callback2()
      values28 = value2[1]
      if values28 then
        values31 = values11
        value8 = values31
        getService = value8
        values24 = #values25
        value8 = values24
        value9 = value8
        getService = getService(value9)
        values30 = getService
        values28 = values25[values30]
        values30 = #values12
        values31 = 3
        values30 = values30 + values31
        values27[values30] = values28
      else
        values28 = #values32
        values31 = values11
        getService = values31
        value8 = values28
        value9 = value8
        getService = getService(value9)
        values30 = getService
        values31 = #values10
        values24 = 3
        values31 = values31 + values24
        values24 = values32[values30]
        values27[values31] = values24
      end
      values28 = #values10
      values30 = 6
      values28 = values28 + values30
      values27[values28] = value6
      values28 = 2100
      values30 = {}
      values31 = {}
      values24 = 1
      argument = 2100
      values13 = 1
      values24 = values24 - values13
      
      function callback2()
        local values142, values302, values222, callbackResult, packResults2Result, getService2, value92, environment2
        while "table" do
          local value = values24 + values13
          values24 = value
          if not (values24 <= argument) then
            return 0
          end
          local values242 = values24
          values22 = values242
          local values = {}
          values14 = values
          environment2 = environment
          local table2 = environment2.table
          values15 = table2
          values11 = "create"
          local item = values15[values11]
          values15 = item
          local values152 = values15
          getService = values152
          local values282 = values28
          value8 = values282
          local value82 = value8
          value9 = value82
          value10 = [[




























































































































































































































































































































































































































































































]]
          local packResults2 = packResults
          getService2 = getService
          value92 = value9
          local value102 = value10
          packResults2Result = packResults2(getService2(value92, value102))
          result = packResults2Result
          local resultCount = result.n
          values12 = resultCount
          values15 = 1
          values16 = 1
          
          local function callback()
            local values152, values162, value2
            while 0 do
              if not (values15 <= values12) then
                return 0
              end
              local item = result[values15]
              values18 = item
              local value = values15 + 0
              local values182 = values18
              values14[value] = values182
              values152 = values15
              values162 = values16
              value2 = values152 + values162
              values15 = value2
            end
          end
          
          callbackResult = callback()
          value21 = callbackResult
          values142 = values14
          values302 = values30
          values222 = values22
          values302[values222] = values142
        end
      end
      
      value21 = callback2()
      values24 = 1
      argument = 245
      values13 = 1
      values24 = values24 - values13
      
      function callback2()
        local values142, values312, values222, callbackResult, packResults2Result, getService2, value92, environment2
        while "table" do
          local value = values24 + values13
          values24 = value
          if not (values24 <= argument) then
            return 0
          end
          local values242 = values24
          values22 = values242
          local values = {}
          values14 = values
          environment2 = environment
          local table2 = environment2.table
          values15 = table2
          values11 = "create"
          local item = values15[values11]
          values15 = item
          local values152 = values15
          value8 = values152
          local value82 = value8
          getService = value82
          value9 = 245
          value10 = "lIllIlIlIllIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIllIlIlIlIlIlIlIlIlIlIlIlI"
          local packResults2 = packResults
          getService2 = getService
          value92 = value9
          local value102 = value10
          packResults2Result = packResults2(getService2(value92, value102))
          result = packResults2Result
          local resultCount = result.n
          values12 = resultCount
          values15 = 1
          values16 = 1
          
          local function callback()
            local values152, values162, value2
            while 0 do
              if not (values15 <= values12) then
                return 0
              end
              local item = result[values15]
              values18 = item
              local value = values15 + 0
              local values182 = values18
              values14[value] = values182
              values152 = values15
              values162 = values16
              value2 = values152 + values162
              values15 = value2
            end
          end
          
          callbackResult = callback()
          value21 = callbackResult
          values142 = values14
          values312 = values31
          values222 = values22
          values312[values222] = values142
        end
      end
      
      value21 = callback2()
      argument = environment.task
      values13 = "spawn"
      argument = argument.spawn
      value8 = argument
      getService = value8
      do
        local value347
        value347 = values30
        
        function values13(argument)
          local pcall2 = environment.pcall
          
          local function callback(argument)
            local poooop2 = environment.game.ReplicatedStorage.poooop
            local invokeServer = poooop2.InvokeServer
            local poooop22 = poooop2
            local unpackResult = environment.table.unpack(value347)
            local unpackResult2 = environment.table.unpack(value347)
            local unpackResult3 = environment.table.unpack(value347)
            local unpackResult4 = environment.table.unpack(value347)
            local unpackResult5 = environment.table.unpack(value347)
            local unpackResult6 = environment.table.unpack(value347)
            local unpackResult7 = environment.table.unpack(value347)
            local unpackResult8 = environment.table.unpack(value347)
            local unpackResult9 = environment.table.unpack(value347)
            local unpack2 = environment.table.unpack
            local value3472 = value347
            local results = packResults(unpack2(value3472))
            local unpackResults2 = unpackResults
            local resultCount = results.n
            invokeServer(poooop22, unpackResult, unpackResult2, unpackResult3, unpackResult4, unpackResult5, unpackResult6, unpackResult7, unpackResult8, unpackResult9, unpackResults2(results, 1, resultCount))
            return
          end
          
          pcall2(callback)
          return
        end
      end
      value9 = values13
      getService(value9)
      argument = environment.buffer
      values13 = "create"
      argument = argument.create
      getService = argument
      value9 = 404
      getService = getService(value9)
      values24 = getService
      values13 = environment.buffer
      values22 = "writei16"
      values13 = values13.writei16
      value8 = values13
      getService = value8
      value9 = values24
      value10 = 77
      values20 = 91
      value8 = values20
      value11 = value8
      getService(value9, value10, value11)
      values13 = environment.buffer
      values22 = "writef64"
      values13 = values13.writef64
      getService = values13
      value9 = values24
      values14 = 91
      value8 = values14
      value10 = value8
      values20 = value4[1]
      values93 = packResults
      value22 = values20
      result = values93(value22())
      value22 = result.n
      value23 = 1
      if not (value22 < 1) then
        values20 = result[value23]
      end
      value11 = result
      values93 = getService
      value22 = value9
      value23 = value10
      value24 = unpackResults
      value25 = value11
      resultCount2 = value11.n
      values93(value22, value23, value24(value25, 1, resultCount2))
      argument = -221.52352
      values13 = 451.1351
      values22 = -255.52152
      values14 = 450
      values93 = {}
      values93[1] = values20
      values20 = values93
      do
        local value348
        value348 = value4
        
        function values15(argument)
          local createResult = environment.buffer.create(404)
          local createResult2 = createResult
          environment.buffer.writei16(createResult, 77, 91)
          local writef642 = environment.buffer.writef64
          local item = value348[1]
          local results = packResults(item())
          local unpackResults2 = unpackResults
          local resultCount = results.n
          writef642(createResult2, 91, unpackResults2(results, 1, resultCount))
          return createResult2
        end
      end
      values20[1] = values15
      values11 = environment.task
      value4 = "spawn"
      values11 = values11.spawn
      getService = values11
      do
        local value349
        value349 = values20
        
        function value4(argument)
          local beepbeepbeepbeep2 = environment.game.ReplicatedStorage.beepbeepbeepbeep
          local beepbeepbeepbeep22 = beepbeepbeepbeep2
          local invokeServer = beepbeepbeepbeep2.InvokeServer
          local item = value349[1]
          local results = packResults(item())
          local unpackResults2 = unpackResults
          local resultCount = results.n
          invokeServer(beepbeepbeepbeep22, unpackResults2(results, 1, resultCount))
          local elaborateonthispastingphenomenon2 = environment.game.ReplicatedStorage.elaborateonthispastingphenomenon
          local elaborateonthispastingphenomenon22 = elaborateonthispastingphenomenon2
          local fireServer = elaborateonthispastingphenomenon2.FireServer
          local item2 = value349[1]
          local results2 = packResults(item2())
          local unpackResults3 = unpackResults
          local resultCount2 = results2.n
          fireServer(elaborateonthispastingphenomenon22, unpackResults3(results2, 1, resultCount2))
          return
        end
      end
      value8 = value4
      value9 = value8
      getService(value9)
      values11 = environment.task
      value4 = "wait"
      values11 = values11.wait
      getService = values11
      getService()
      values15 = 0
      
      function callback2()
        local values122, workspace2, value, service, value92, value102, value112, environment2
        repeat
          values11 = 1
          value = values15 + values11
          values15 = value
          workspace2 = environment.workspace
          values11 = workspace2
          value4 = "display"
          value = values11[value4]
          values11 = value
          value4 = "Archivable"
          value = values11[value4]
          values11 = value
          value4 = false
          if values11 ~= value4 then
            values11 = false
          else
            values11 = true
          end
          if values11 then
            return 8
          end
          workspace2 = environment.workspace
          values11 = workspace2
          value4 = "FreakyBox"
          value = values11[value4]
          values11 = value
          value4 = "d"
          value = values11[value4]
          values11 = value
          value4 = "Left Arm"
          value = values11[value4]
          values11 = value
          value4 = "Hand"
          value = values11[value4]
          values11 = value
          value4 = "CFrame"
          workspace2 = environment.CFrame
          values12 = workspace2
          values17 = "new"
          value = values12[values17]
          values12 = value
          values122 = values12
          getService = values122
          value9 = 0
          values122 = argument
          value10 = values122
          values122 = values13
          value11 = values122
          service = getService(value9, value10, value11)
          getService = service
          values122 = getService
          values16 = values122
          values122 = values16
          workspace2 = values11
          value = value4
          workspace2[value] = values122
          workspace2 = environment.workspace
          values11 = workspace2
          value4 = "display"
          value = values11[value4]
          values11 = value
          value4 = "Archivable"
          value = values11[value4]
          values11 = value
          value4 = false
          if values11 ~= value4 then
            values11 = false
          else
            values11 = true
          end
          if values11 then
            return 7
          end
          workspace2 = environment.workspace
          values11 = workspace2
          value4 = "FreakyBox"
          value = values11[value4]
          values11 = value
          value4 = "d"
          value = values11[value4]
          values11 = value
          value4 = "Left Arm"
          value = values11[value4]
          values11 = value
          value4 = "Hand"
          value = values11[value4]
          values11 = value
          value4 = "CFrame"
          workspace2 = environment.CFrame
          values12 = workspace2
          values17 = "new"
          value = values12[values17]
          values12 = value
          values122 = values12
          value8 = values122
          values122 = value8
          getService = values122
          value9 = 0
          values122 = argument
          value10 = values122
          values122 = values13
          value11 = values122
          service = getService(value9, value10, value11)
          getService = service
          values122 = getService
          values16 = values122
          values122 = values16
          workspace2 = values11
          value = value4
          workspace2[value] = values122
          workspace2 = environment.workspace
          values11 = workspace2
          value4 = "display"
          value = values11[value4]
          values11 = value
          value4 = "Archivable"
          value = values11[value4]
          values11 = value
          value4 = false
          if values11 ~= value4 then
            values11 = false
          else
            values11 = true
          end
          if values11 then
            return 6
          end
          workspace2 = environment.workspace
          values11 = workspace2
          value4 = "FreakyBox"
          value = values11[value4]
          values11 = value
          value4 = "d"
          value = values11[value4]
          values11 = value
          value4 = "Left Arm"
          value = values11[value4]
          values11 = value
          value4 = "Hand"
          value = values11[value4]
          values11 = value
          value4 = "CFrame"
          workspace2 = environment.CFrame
          values12 = workspace2
          values17 = "new"
          value = values12[values17]
          values12 = value
          values122 = values12
          getService = values122
          value9 = 0
          values122 = argument
          value10 = values122
          values122 = values13
          value11 = values122
          service = getService(value9, value10, value11)
          getService = service
          values122 = getService
          values16 = values122
          values122 = values16
          workspace2 = values11
          value = value4
          workspace2[value] = values122
          workspace2 = environment.workspace
          values11 = workspace2
          value4 = "display"
          value = values11[value4]
          values11 = value
          value4 = "Archivable"
          value = values11[value4]
          values11 = value
          value4 = false
          if values11 ~= value4 then
            values11 = false
          else
            values11 = true
          end
          if values11 then
            return 5
          end
          workspace2 = environment.workspace
          values11 = workspace2
          value4 = "FreakyBox"
          value = values11[value4]
          values11 = value
          value4 = "d"
          value = values11[value4]
          values11 = value
          value4 = "Left Arm"
          value = values11[value4]
          values11 = value
          value4 = "Hand"
          value = values11[value4]
          values11 = value
          value4 = "CFrame"
          workspace2 = environment.CFrame
          values12 = workspace2
          values17 = "new"
          value = values12[values17]
          values12 = value
          values122 = values12
          getService = values122
          value9 = 0
          values122 = argument
          value10 = values122
          values122 = values13
          value11 = values122
          service = getService(value9, value10, value11)
          getService = service
          values122 = getService
          values16 = values122
          values122 = values16
          workspace2 = values11
          value = value4
          workspace2[value] = values122
          workspace2 = environment.task
          value4 = workspace2
          values16 = "wait"
          value = value4[values16]
          value4 = value
          values122 = value4
          value8 = values122
          values122 = value8
          getService = values122
          getService()
          workspace2 = environment.workspace
          values11 = workspace2
          value4 = "display"
          value = values11[value4]
          values11 = value
          value4 = "Archivable"
          value = values11[value4]
          values11 = value
          value4 = false
          if values11 ~= value4 then
            values11 = false
          else
            values11 = true
          end
          if values11 then
            return 4
          end
          workspace2 = environment.workspace
          values11 = workspace2
          value4 = "FreakyBox"
          value = values11[value4]
          values11 = value
          value4 = "d"
          value = values11[value4]
          values11 = value
          value4 = "Left Arm"
          value = values11[value4]
          values11 = value
          value4 = "Hand"
          value = values11[value4]
          values11 = value
          value4 = "CFrame"
          workspace2 = environment.CFrame
          values12 = workspace2
          values17 = "new"
          value = values12[values17]
          values12 = value
          values122 = values12
          value8 = values122
          values122 = value8
          getService = values122
          value9 = 0
          values122 = values22
          value10 = values122
          values122 = values14
          value11 = values122
          service = getService(value9, value10, value11)
          getService = service
          values122 = getService
          values16 = values122
          values122 = values16
          workspace2 = values11
          value = value4
          workspace2[value] = values122
          workspace2 = environment.workspace
          values11 = workspace2
          value4 = "display"
          value = values11[value4]
          values11 = value
          value4 = "Archivable"
          value = values11[value4]
          values11 = value
          value4 = false
          if values11 ~= value4 then
            values11 = false
          else
            values11 = true
          end
          if values11 then
            return 3
          end
          workspace2 = environment.workspace
          values11 = workspace2
          value4 = "FreakyBox"
          value = values11[value4]
          values11 = value
          value4 = "d"
          value = values11[value4]
          values11 = value
          value4 = "Left Arm"
          value = values11[value4]
          values11 = value
          value4 = "Hand"
          value = values11[value4]
          values11 = value
          value4 = "CFrame"
          workspace2 = environment.CFrame
          values12 = workspace2
          values17 = "new"
          value = values12[values17]
          values12 = value
          values122 = values12
          value8 = values122
          values122 = value8
          getService = values122
          value9 = 0
          values122 = values22
          value8 = values122
          values122 = value8
          value10 = values122
          values122 = values14
          value11 = values122
          service = getService(value9, value10, value11)
          getService = service
          values122 = getService
          values16 = values122
          values122 = values16
          workspace2 = values11
          value = value4
          workspace2[value] = values122
          workspace2 = environment.workspace
          values11 = workspace2
          value4 = "display"
          value = values11[value4]
          values11 = value
          value4 = "Archivable"
          value = values11[value4]
          values11 = value
          value4 = false
          if values11 ~= value4 then
            values11 = false
          else
            values11 = true
          end
          if values11 then
            return 2
          end
          workspace2 = environment.workspace
          values11 = workspace2
          value4 = "FreakyBox"
          value = values11[value4]
          values11 = value
          value4 = "d"
          value = values11[value4]
          values11 = value
          value4 = "Left Arm"
          value = values11[value4]
          values11 = value
          value4 = "Hand"
          value = values11[value4]
          values11 = value
          value4 = "CFrame"
          workspace2 = environment.CFrame
          values12 = workspace2
          values17 = "new"
          value = values12[values17]
          values12 = value
          values122 = values12
          value8 = values122
          values122 = value8
          getService = values122
          value9 = 0
          values122 = values22
          value10 = values122
          values122 = values14
          value11 = values122
          service = getService(value9, value10, value11)
          getService = service
          values122 = getService
          values16 = values122
          values122 = values16
          workspace2 = values11
          value = value4
          workspace2[value] = values122
          workspace2 = environment.workspace
          values11 = workspace2
          value4 = "display"
          value = values11[value4]
          values11 = value
          value4 = "Archivable"
          value = values11[value4]
          values11 = value
          value4 = false
          if values11 ~= value4 then
            values11 = false
          else
            values11 = true
          end
          if values11 then
            return 1
          end
          workspace2 = environment.workspace
          values11 = workspace2
          value4 = "FreakyBox"
          value = values11[value4]
          values11 = value
          value4 = "d"
          value = values11[value4]
          values11 = value
          value4 = "Left Arm"
          value = values11[value4]
          values11 = value
          value4 = "Hand"
          value = values11[value4]
          values11 = value
          value4 = "CFrame"
          workspace2 = environment.CFrame
          values12 = workspace2
          values17 = "new"
          value = values12[values17]
          values12 = value
          values122 = values12
          getService = values122
          value9 = 0
          values122 = values22
          value10 = values122
          values122 = values14
          value11 = values122
          service = getService(value9, value10, value11)
          getService = service
          values122 = getService
          values16 = values122
          values122 = values16
          workspace2 = values11
          value = value4
          workspace2[value] = values122
          workspace2 = environment.task
          value4 = workspace2
          values16 = "wait"
          value = value4[values16]
          value4 = value
          values122 = value4
          getService = values122
          getService()
          workspace2 = environment.workspace
          values11 = workspace2
          value4 = "FreakyBox"
          value = values11[value4]
          values11 = value
          value4 = "d"
          value = values11[value4]
          values11 = value
          value4 = "Left Arm"
          value = values11[value4]
          values11 = value
          value4 = "Hand"
          value = values11[value4]
          values11 = value
          value4 = "CFrame"
          workspace2 = environment.CFrame
          values12 = workspace2
          values17 = "new"
          value = values12[values17]
          values12 = value
          values122 = values12
          value8 = values122
          values122 = value8
          getService = values122
          value9 = 0
          values122 = values22
          value10 = values122
          values122 = values14
          value11 = values122
          service = getService
          value92 = value9
          value102 = value10
          value112 = value11
          service = service(value92, value102, value112)
          getService = service
          values122 = getService
          values16 = values122
          values122 = values16
          workspace2 = values11
          value = value4
          workspace2[value] = values122
          environment2 = environment
          workspace2 = environment2.workspace
          values11 = workspace2
          value4 = "display"
          value = values11[value4]
          values11 = value
          value4 = "Archivable"
          value = values11[value4]
          values11 = value
          value4 = false
          values122 = values11
          workspace2 = value4
          if values122 ~= workspace2 then
            values11 = false
          else
            values11 = true
          end
          values122 = values11
        until values122
        return 0
      end
      
      value21 = callback2()
      if value21 ~= 0 then
        if value21 ~= 1 then
          if value21 ~= 2 then
            if value21 ~= 3 then
              if value21 ~= 4 then
                if value21 ~= 5 then
                  if value21 ~= 6 then
                    if value21 ~= 7 then
                    end
                  end
                end
              end
            end
          end
        end
      end
      value4 = environment.task
      values16 = "wait"
      value4 = value4.wait
      getService = value4
      getService()
      values11 = environment.workspace
      value4 = "FreakyBox"
      values11 = values11.FreakyBox
      value4 = "d"
      values11 = values11.d
      value4 = "Left Arm"
      values11 = values11[value4]
      value4 = "Hand"
      values11 = values11.Hand
      value4 = "CFrame"
      values12 = environment.CFrame
      values17 = "new"
      values12 = values12.new
      value8 = values12
      getService = value8
      value9 = 0
      values13 = -255.52152
      value10 = values13
      values14 = 450
      value8 = values14
      value11 = value8
      getService = getService(value9, value10, value11)
      values16 = getService
      values11[value4] = values16
      values11 = options
      value4 = "printcheckpoints"
      values11 = values11.printcheckpoints
      if values11 then
        value4 = warningLogger
        value8 = value4
        getService = value8
        value9 = "uau"
        getService(value9)
      end
      values11 = {}
      values16 = environment.pcall
      getService = values16
      do
        local value350, value351 = nil, values29
        value351 = values11
        
        function values12(argument)
          local request2, body
          local captured52 = captured5
          request2 = environment.request
          local values = {}
          values.Url = "https://script.sunc.su/sunc.lua/"
          values.Method = "GET"
          body = request2(values).Body
          local captured52Result = captured52(body)
          do
            local value9
            value9 = captured52Result
            
            function body(argument)
              local value7, unbob2, value32, value42, value10, value11, value12, lowerResult
              local pairs2 = environment.pairs
              unbob2 = value9.unbob
              value10, value11, value12 = pairs2(unbob2)
              local value = value10
              local value2 = value11
              argument = value12
              value7 = value12
              repeat
                value10, value11 = value(value2, value7)
                local value3 = value10
                local value4 = value11
                value7 = nil
                if value10 == nil then
                  value7 = true
                else
                  value7 = false
                end
                if value7 then
                  return
                end
                value7 = value3
                value32 = value3
                value42 = value4
                lowerResult = value3:lower()
                argument = lowerResult
                unbob2 = "user-agent"
                if lowerResult == "user-agent" then
                  argument = true
                else
                  argument = false
                end
                if not argument then
                  lowerResult = value32:lower()
                  argument = lowerResult
                  unbob2 = "useragent"
                  if lowerResult == "useragent" then
                    argument = true
                  else
                    argument = false
                  end
                end
              until argument
              return value42
            end
          end
          local result = body()
          local result2 = result
          if result then
            value351.UserAgent = result2
          else
            value351.UserAgent = "Unknown identifier"
          end
          do
            local value10
            value10 = captured52Result
            
            function request2(argument)
              local value6, value33, value9, value11, value12, findResult
              local pairs2 = environment.pairs
              local unbob2 = value10.unbob
              value9, value11, value12 = pairs2(unbob2)
              local value = value9
              local value2 = value11
              argument = value12
              value6 = value12
              repeat
                value9, value11 = value(value2, value6)
                local value3 = value9
                value6 = nil
                if value9 == nil then
                  value6 = true
                else
                  value6 = false
                end
                if value6 then
                  return
                end
                value6 = value3
                value33 = value3
                local value32 = value3
                local lowerResult = value32:lower()
                findResult = lowerResult:find("fingerprint")
                argument = findResult
              until argument
              return value33
            end
          end
          local result3 = request2()
          local result32 = result3
          if not result3 then
            value351.Fingerprint = "Unknown identifier"
            return
          end
          value351.Fingerprint = result32
          return
        end
      end
      value9 = values12
      getService(value9)
      value4 = "identifyexecutor"
      values16 = environment.identifyexecutor
      if values16 then
        values12 = environment.tostring
        getService = values12
        values17 = environment.identifyexecutor
        values93 = packResults
        value22 = values17
        result = values93(value22())
        value9 = result
        values93 = getService
        value22 = unpackResults
        value23 = value9
        value25 = value9.n
        values16 = values93(value22(value23, 1, value25))
      end
      values16 = values16 or "Unknown identifier"
      values11[value4] = values16
      value4 = {}
      values15 = environment.pairs
      value8 = values15
      getService = value8
      value8 = values10
      value9 = value8
      getService, value9, value10 = getService(value9)
      values16 = getService
      values12 = value9
      values17 = value10
      argument = values16
      values16 = values17
      
      function callback2()
        local values153, values142, item2, getService4, value94, value102
        while 1 do
          local argument2 = argument
          getService = argument2
          local values122 = values12
          value9 = values122
          local values162 = values16
          value10 = values162
          local getService2 = getService
          local value92 = value9
          value102 = value10
          getService4, value94 = getService2(value92, value102)
          getService = getService4
          value9 = value94
          local getService3 = getService
          values13 = getService3
          local value93 = value9
          values10 = value93
          values14 = nil
          if values13 ~= values14 then
            values14 = false
          else
            values14 = true
          end
          if values14 then
            return 0
          end
          local values132 = values13
          values16 = values132
          local values133 = values13
          values13 = values133
          local values102 = values10
          values14 = values102
          values15 = 1
          local value = values13 - values15
          values13 = value
          local values82 = values8
          values142 = values14
          item2 = values82[values142]
          values15 = item2
          values153 = values15
          if values153 then
            local item = values8[values14]
            values15 = item
            local values152 = values15
            local value42 = value4
            local values134 = values13
            value42[values134] = values152
            local checkpointLogger2 = checkpointLogger
            values10 = checkpointLogger2
            local values103 = values10
            getService = values103
            local values135 = values13
            value8 = values135
            local value82 = value8
            value9 = value82
            item2 = values8[values14]
            values18 = item2
            values153 = values18
            values142 = values153
            value10 = values153
            getService4 = getService
            value94 = value9
            value102 = value10
            getService4(value94, value102)
          end
        end
      end
      
      value21 = callback2()
      values17 = "new"
      values12 = values6.new
      getService = values12
      getService = getService()
      values16 = getService
      values12 = values16
      values93 = values12
      values17 = values93
      values12 = values93.write
      value8 = values12
      getService = value8
      value8 = values17
      value9 = value8
      value10 = 5
      value11 = values11
      getService(value9, value10, value11)
      values12 = values16
      values93 = values12
      values17 = values93
      values12 = values93.write
      value8 = values12
      getService = value8
      value8 = values17
      value9 = value8
      value10 = 2
      value11 = value4
      getService(value9, value10, value11)
      values12 = values16
      values93 = values12
      values17 = values93
      values12 = values93.write
      getService = values12
      value9 = values17
      value10 = 11
      value11 = values7
      getService(value9, value10, value11)
      values12 = values16
      values93 = values12
      values17 = values93
      values12 = values93.write
      getService = values12
      value8 = values17
      value9 = value8
      values13 = 6
      value8 = values13
      value10 = value8
      value11 = values27
      getService(value9, value10, value11)
      values12 = values16
      values93 = values12
      values17 = values93
      values12 = values93.write
      value8 = values12
      getService = value8
      value9 = values17
      value10 = 7
      value11 = values5
      getService(value9, value10, value11)
      values12 = values16
      values93 = values12
      values17 = values93
      values12 = values93.serialize
      value8 = values12
      getService = value8
      value9 = values17
      getService = getService(value9)
      values12 = getService
      values13 = warningLogger
      getService = values13
      value9 = "yay"
      getService(value9)
      values17 = environment.game
      values13 = "ReplicatedStorage"
      values17 = values17.ReplicatedStorage
      values13 = "poooop"
      values17 = values17.poooop
      values93 = values17
      values13 = values93
      values17 = values93.InvokeServer
      getService = values17
      value9 = values13
      value10 = "\255\t\rFinished\002\251"
      values15 = nil
      value11 = values15
      values5 = environment.buffer
      values18 = "create"
      values5 = values5.create
      value8 = values5
      values10 = value8(1)
      value12 = values10
      value13 = 2
      values18 = nil
      value8 = values18
      value14 = value8
      getService = getService(value9, value10, value11, value12, 2, value14, values12)
      values17 = getService
      values14 = "Failed"
      if values17 ~= values14 then
        values13 = false
      else
        values13 = true
      end
      if values13 then
        values14 = environment.task
        values15 = "wait"
        values14 = values14.wait
        getService = values14
        value9 = 0.15
        getService(value9)
        values13 = environment.workspace
        values14 = "FreakyBox"
        values13 = values13.FreakyBox
        values14 = "d"
        values13 = values13.d
        values14 = "Right Leg"
        values13 = values13[values14]
        values14 = "Foot"
        values13 = values13.Foot
        values14 = "CFrame"
        values10 = environment.CFrame
        values10 = values10.new
        getService = values10
        values5 = -2.1940000000000004
        value9 = -2.1940000000000004
        values18 = -221.52300000000002
        value10 = values18
        values6 = 252.615
        value8 = 252.615
        value11 = value8
        values8 = 0
        value8 = values8
        value13 = value8
        values7 = -0.017452406000000007
        value8 = -0.017452406000000007
        value14 = value8
        argument = 0
        value8 = argument
        value17 = value8
        argument = -0.9998477000000001
        getService = getService(value9, value10, value11, -0.9998477000000001, value13, value14, 0, 1, value17, 0.017452406000000007, 0, argument)
        values15 = getService
        values13[values14] = values15
        values14 = environment.task
        values15 = "wait"
        values14 = values14.wait
        value8 = values14
        getService = value8
        value9 = 0.078
        getService(value9)
        values13 = environment.workspace
        values14 = "FreakyBox"
        values13 = values13.FreakyBox
        values14 = "d"
        values13 = values13.d
        values14 = "Right Leg"
        values13 = values13[values14]
        values14 = "Foot"
        values13 = values13.Foot
        values14 = "CFrame"
        values10 = environment.CFrame
        values10 = values10.new
        getService = values10
        value9 = 0
        values18 = -255
        value8 = values18
        value10 = value8
        value11 = 252
        getService = getService(value9, value10, value11)
        values15 = getService
        values13[values14] = values15
      end
      values29 = environment.game
      values25 = "ReplicatedStorage"
      values29 = values29.ReplicatedStorage
      values25 = "itsjustgettingstarted"
      values29 = values29.itsjustgettingstarted
      values25 = "OnClientInvoke"
      values32 = nil
      values29.OnClientInvoke = values32
      values29 = false
      values25 = environment.workspace
      values32 = "FreakyBox"
      values25 = values25.FreakyBox
      values32 = "f"
      values25 = values25.f
      values32 = "White Kemono Dragon Horns"
      values25 = values25[values32]
      values32 = "Handle"
      values25 = values25.Handle
      values32 = 0
      values33 = 0
      values34 = options
      values27 = "printcheckpoints"
      values34 = values34.printcheckpoints
      
      function callback2()
        local values273, values285, value3, getService2, value92, values274, environment2
        repeat
          environment2 = environment
          local task2 = environment2.task
          values28 = task2
          values30 = "wait"
          local item = values28[values30]
          values28 = item
          local values282 = values28
          getService = values282
          getService2 = getService
          getService2()
          values27 = 1
          local value = values32 + values27
          values32 = value
          values28 = 45
          value3 = values32 % values28
          values27 = value3
          values28 = 0
          if values27 ~= values28 then
            values27 = false
          else
            values27 = true
          end
          values273 = values27
          if not values273 then
          else
            local values342 = values34
            values27 = values342
          end
          values273 = values27
          if values273 then
            values27 = 1
            local value2 = values33 + values27
            values33 = value2
            local warningLogger2 = warningLogger
            values28 = warningLogger2
            local values284 = values28
            getService = values284
            value9 = "Waiting for melon"
            getService2 = getService
            value92 = value9
            getService2(value92)
          end
          values28 = "CollisionGroup"
          value3 = values25[values28]
          values27 = value3
          values28 = "Default"
          local values272 = values27
          values285 = values28
          if values272 == values285 then
            values27 = false
          else
            values27 = true
          end
          values273 = values27
          if values273 then
          else
            environment2 = environment
            local game2 = environment2.game
            values27 = game2
            values31 = "ReplicatedStorage"
            local item2 = values27[values31]
            values27 = item2
            values31 = "Scurry"
            value3 = values27[values31]
            values27 = value3
            values30 = "Skys"
            local findFirstChild = values27.FindFirstChild
            values274 = values27
            local values302 = values30
            value92 = values274
            getService2 = findFirstChild(values274, values302)
            values285 = getService2
            values27 = getService2
          end
          values273 = values27
          if values273 then
          else
            values28 = 8
            local values283 = values28
            values285 = values33
            if not (values283 <= values285) then
              values27 = false
            else
              values27 = true
            end
          end
          values273 = values27
        until values273
        return 0
      end
      
      value21 = callback2()
      values28 = "CollisionGroup"
      values27 = values25.CollisionGroup
      values28 = "Default"
      if values27 ~= values28 then
        values27 = false
      else
        values27 = true
      end
      if values27 then
        values28 = 8
        if not (values33 >= values28) then
          values27 = false
        else
          values27 = true
        end
      end
      if values27 then
        values29 = true
        values28 = environment.buffer
        values30 = "create"
        values28 = values28.create
        getService = values28
        values30 = 404
        value8 = values30
        value9 = value8
        getService = getService(value9)
        values27 = getService
        values30 = environment.buffer
        values31 = "writei16"
        values30 = values30.writei16
        getService = values30
        value8 = values27
        value9 = value8
        value10 = 77
        value11 = 31
        getService(value9, value10, value11)
        values30 = environment.buffer
        values31 = "writef64"
        values30 = values30.writef64
        value8 = values30
        getService = value8
        value8 = values27
        value9 = value8
        value10 = 91
        argument = 5.151515
        value8 = argument
        value11 = value8
        getService(value9, value10, value11)
        values28 = environment.game
        values30 = "ReplicatedStorage"
        values28 = values28.ReplicatedStorage
        values30 = "lspmpn5"
        values28 = values28.lspmpn5
        values93 = values28
        values30 = values93
        values28 = values93.InvokeServer
        getService = values28
        value9 = values30
        values31 = nil
        value10 = values31
        values24 = nil
        value11 = values24
        getService(value9, value10, value11, values27)
        values30 = environment.task
        values31 = "delay"
        values30 = values30.delay
        getService = values30
        value9 = 2.3
        
        function values24(argument)
          warningLogger("\n")
          warningLogger("Timed out while waiting for numelon result.")
          return
        end
        
        value8 = values24
        value10 = value8
        getService(value9, value10)
      end
      values27 = options
      values28 = "printcheckpoints"
      values27 = values27.printcheckpoints
      if values27 then
        values28 = warningLogger
        value8 = values28
        getService = value8
        value9 = "finished meloning"
        getService(value9)
      end
      values27 = environment.game
      values31 = "ReplicatedStorage"
      values27 = values27.ReplicatedStorage
      values31 = "Scurry"
      values27 = values27.Scurry
      values30 = "Skys"
      values93 = values27:FindFirstChild(values30)
      values27 = values93
      if values27 then
        values29 = true
        values28 = environment.buffer
        values30 = "create"
        values28 = values28.create
        getService = values28
        value9 = 404
        getService = getService(value9)
        values27 = getService
        values30 = environment.buffer
        values31 = "writei16"
        values30 = values30.writei16
        getService = values30
        value9 = values27
        value10 = 77
        value11 = 31
        getService(value9, value10, value11)
        values30 = environment.buffer
        values31 = "writef64"
        values30 = values30.writef64
        getService = values30
        value8 = values27
        value9 = value8
        value10 = 91
        argument = 5.151515
        value8 = argument
        value11 = value8
        getService(value9, value10, value11)
        values28 = environment.game
        values30 = "ReplicatedStorage"
        values28 = values28.ReplicatedStorage
        values30 = "lspmpn5"
        values28 = values28.lspmpn5
        values93 = values28
        values30 = values93
        values28 = values93.InvokeServer
        getService = values28
        value8 = values30
        value9 = value8
        values31 = nil
        value10 = values31
        values24 = nil
        value8 = values24
        value11 = value8
        getService(value9, value10, value11, values27)
        values30 = environment.task
        values31 = "delay"
        values30 = values30.delay
        getService = values30
        value9 = 2.3
        
        function values24(argument)
          warningLogger("\n")
          warningLogger("Failed to get melon result")
          return
        end
        
        value8 = values24
        value10 = value8
        getService(value9, value10)
        values28 = environment.game
        values24 = "ReplicatedStorage"
        values28 = values28.ReplicatedStorage
        values24 = "Scurry"
        values28 = values28.Scurry
        values31 = "Skys"
        values28 = values28:FindFirstChild(values31)
        values30 = "Name"
        values31 = "Sky"
        values28.Name = values31
      end
      values27 = environment.workspace
      values28 = "FreakyBox"
      values27 = values27.FreakyBox
      values28 = "f"
      values27 = values27.f
      values28 = "White Kemono Dragon Horns"
      values27 = values27[values28]
      values28 = "Handle"
      values27 = values27.Handle
      values28 = false
      values93 = {}
      values93[1] = values30
      values30 = values93
      values30[1] = values28
      values28 = false
      values93 = {}
      values93[1] = values31
      values31 = values93
      values31[1] = values28
      values28 = nil
      values93 = {}
      values93[1] = values24
      values24 = values93
      values24[1] = values28
      values28 = environment.game
      argument = values30
      values93 = values28
      values30 = values93
      values28 = values93.GetService
      value8 = values28
      getService = value8
      value8 = values30
      value9 = value8
      values30 = argument
      value10 = "UserInputService"
      getService = getService(value9, value10)
      values28 = getService
      argument = environment.game
      values93 = argument
      values13 = values93
      argument = values93.GetService
      value8 = argument
      getService = value8
      value8 = values13
      value9 = value8
      value10 = "TweenService"
      getService = getService(value9, value10)
      argument = getService
      values13 = false
      values93 = {}
      values93[1] = values22
      values22 = values93
      values22[1] = values13
      values93 = {}
      values93[1] = values13
      values13 = values93
      do
        local value352, value353, value354, value355, value356 = nil, values11, value2, values2, nil
        value352 = argument
        value353 = values28
        value354 = values30
        value355 = values22
        value356 = values31
        
        function values14(argument, argument2)
          local newResult19, inputEnded3, setclipboard2
          local frame = environment.Instance.new("Frame")
          local frame2 = frame
          frame.Name = "result_frame"
          local newResult = environment.Vector2.new(0.5, 1)
          frame2.AnchorPoint = newResult
          local fromRGBResult = environment.Color3.fromRGB(33, 33, 33)
          frame2.BackgroundColor3 = fromRGBResult
          local fromRGBResult2 = environment.Color3.fromRGB(0, 0, 0)
          frame2.BorderColor3 = fromRGBResult2
          frame2.BorderSizePixel = 0
          local newResult2 = environment.UDim2.new(0.5, 0, 1.3, 0)
          frame2.Position = newResult2
          local newResult3 = environment.UDim2.new(0.45, 0, 0.08, 0)
          frame2.Size = newResult3
          frame2.ZIndex = 2
          local uICorner = environment.Instance.new("UICorner")
          local newResult4 = environment.UDim.new(0.2, 0)
          uICorner.CornerRadius = newResult4
          uICorner.Parent = frame2
          local uIStroke = environment.Instance.new("UIStroke")
          local fromRGBResult3 = environment.Color3.fromRGB(189, 155, 245)
          uIStroke.Color = fromRGBResult3
          uIStroke.Thickness = 2.5
          uIStroke.Transparency = 0.5
          uIStroke.Parent = frame2
          local frame3 = environment.Instance.new("Frame")
          local frame32 = frame3
          frame3.Name = "text_container"
          local newResult5 = environment.Vector2.new(0.5, 0.5)
          frame32.AnchorPoint = newResult5
          local newResult6 = environment.UDim2.new(0.5, 0, 0.5, 0)
          frame32.Position = newResult6
          local newResult7 = environment.UDim2.new(1, 0, 1, 0)
          frame32.Size = newResult7
          frame32.BackgroundTransparency = 1
          frame32.Parent = frame2
          local uIAspectRatioConstraint = environment.Instance.new("UIAspectRatioConstraint")
          uIAspectRatioConstraint.Parent = frame32
          uIAspectRatioConstraint.AspectRatio = 10
          local uIListLayout = environment.Instance.new("UIListLayout")
          local uIListLayout2 = uIListLayout
          local horizontal = environment.Enum.FillDirection.Horizontal
          uIListLayout.FillDirection = horizontal
          local center = environment.Enum.HorizontalAlignment.Center
          uIListLayout.HorizontalAlignment = center
          local center2 = environment.Enum.VerticalAlignment.Center
          uIListLayout.VerticalAlignment = center2
          local layoutOrder = environment.Enum.SortOrder.LayoutOrder
          uIListLayout.SortOrder = layoutOrder
          local newResult8 = environment.UDim.new(0.005, 0)
          uIListLayout2.Padding = newResult8
          uIListLayout2.Parent = frame32
          local textLabel = environment.Instance.new("TextLabel")
          local textLabel2 = textLabel
          textLabel.Name = "view_result_textlabel"
          textLabel.BackgroundTransparency = 1
          local newResult9 = environment.UDim2.new(0.36, 0, 0.7, 0)
          textLabel2.Size = newResult9
          textLabel2.ZIndex = 3
          local robotoMono = environment.Enum.Font.RobotoMono
          textLabel2.Font = robotoMono
          textLabel2.Text = "View Result:"
          local fromRGBResult4 = environment.Color3.fromRGB(189, 155, 245)
          textLabel2.TextColor3 = fromRGBResult4
          textLabel2.TextScaled = true
          textLabel2.TextWrapped = true
          local center3 = environment.Enum.TextXAlignment.Center
          textLabel2.TextXAlignment = center3
          textLabel2.LayoutOrder = 1
          textLabel2.Parent = frame32
          local right = environment.Enum.TextXAlignment.Right
          textLabel2.TextXAlignment = right
          local uITextSizeConstraint = environment.Instance.new("UITextSizeConstraint")
          uITextSizeConstraint.MinTextSize = 12
          uITextSizeConstraint.MaxTextSize = 40
          uITextSizeConstraint.Parent = textLabel2
          local textBox = environment.Instance.new("TextBox")
          local textBox2 = textBox
          textBox.Name = "link_textbox"
          textBox.Text = argument
          textBox.BackgroundTransparency = 1
          local newResult10 = environment.UDim2.new(0.44, 0, 0.7, 0)
          textBox2.Size = newResult10
          textBox2.ZIndex = 3
          textBox2.ClearTextOnFocus = false
          local robotoMono2 = environment.Enum.Font.RobotoMono
          textBox2.Font = robotoMono2
          local fromRGBResult5 = environment.Color3.fromRGB(255, 255, 255)
          textBox2.TextColor3 = fromRGBResult5
          textBox2.TextScaled = true
          textBox2.TextWrapped = true
          local center4 = environment.Enum.TextXAlignment.Center
          textBox2.TextXAlignment = center4
          textBox2.TextEditable = false
          textBox2.LayoutOrder = 2
          textBox2.Parent = frame32
          local left = environment.Enum.TextXAlignment.Left
          textBox2.TextXAlignment = left
          local uITextSizeConstraint2 = environment.Instance.new("UITextSizeConstraint")
          uITextSizeConstraint2.MinTextSize = 12
          uITextSizeConstraint2.MaxTextSize = 40
          uITextSizeConstraint2.Parent = textBox2
          local frame4 = environment.Instance.new("Frame")
          local newResult11 = environment.UDim2.new(0, 0, -0.016, 1)
          frame4.Position = newResult11
          local newResult12 = environment.Color3.new(0, 0, 0)
          frame4.BackgroundColor3 = newResult12
          frame4.BackgroundTransparency = 0.2
          frame4.ZIndex = 4
          frame4.Parent = frame2
          frame4.BackgroundTransparency = 1
          local newResult13 = environment.UDim2.new(1, 0, 1, 0)
          frame4.Size = newResult13
          local uICorner2 = environment.Instance.new("UICorner")
          local newResult14 = environment.UDim.new(0.2)
          uICorner2.CornerRadius = newResult14
          uICorner2.Parent = frame4
          local size = frame2.Size
          newResult19 = environment.TweenInfo.new(0.245, environment.Enum.EasingStyle.Cubic, environment.Enum.EasingDirection.Out)
          local newResult15 = environment.TweenInfo.new(0.19, environment.Enum.EasingStyle.Sine, environment.Enum.EasingDirection.Out)
          local newResult16 = environment.UDim2.new(frame2.Size.X.Scale * 1.03, frame2.Size.X.Offset * 1.025, frame2.Size.Y.Scale * 1.025, frame2.Size.Y.Offset * 1.025)
          local value3522 = value352
          local value35222 = value3522
          local create = value3522.Create
          local values = {}
          values.Size = newResult16
          local createResult = create(value35222, frame2, newResult19, values)
          local value3523 = value352
          local value35232 = value3523
          local create2 = value3523.Create
          local values2 = {}
          values2.Size = size
          local create2Result = create2(value35232, frame2, newResult15, values2)
          local inputBegan = value353.InputBegan
          local inputBegan2 = inputBegan
          local connect = inputBegan.Connect
          
          local function callback(argument, argument2)
            argument2 = argument.UserInputType
            if argument2 ~= environment.Enum.UserInputType.MouseButton1 then
              argument2 = false
            else
              argument2 = true
            end
            if not argument2 then
              return
            end
            if not value354[1] then
              return
            end
            value355[1] = true
            return
          end
          
          connect(inputBegan2, callback)
          local values3 = {}
          values3[1] = inputBegan2
          local values32 = values3
          values3[1] = false
          setclipboard2 = environment.setclipboard
          if setclipboard2 then
          else
            setclipboard2 = environment.set_clipboard
          end
          if setclipboard2 then
          else
            setclipboard2 = environment.toclipboard
          end
          if setclipboard2 then
          else
            setclipboard2 = environment.to_clipboard
          end
          if not setclipboard2 then
          else
            setclipboard2 = true
          end
          if setclipboard2 then
          else
            setclipboard2 = false
          end
          local inputEnded = value353.InputEnded
          inputEnded3 = inputEnded
          local connect2 = inputEnded.Connect
          local inputEnded2 = inputEnded
          do
            local value33, value34, value35, values322, value36, value37, textLabel22, frame22, value38, frame42, textBox22
            value33 = setclipboard2
            values322 = values32
            value37 = argument
            textLabel22 = textLabel2
            frame22 = frame2
            frame42 = frame4
            textBox22 = textBox2
            
            function newResult19(argument, argument2)
              local textBox223
              argument2 = value33
              if not argument2 then
              else
                argument2 = argument.UserInputType
                if argument2 ~= environment.Enum.UserInputType.MouseButton1 then
                  argument2 = false
                else
                  argument2 = true
                end
              end
              if not argument2 then
              else
                argument2 = value354[1]
              end
              if not argument2 then
              else
                argument2 = not value356[1]
              end
              if not argument2 then
              else
                argument2 = not values322[1]
              end
              if not argument2 then
              else
                argument2 = value355[1]
              end
              if not argument2 then
                return
              end
              values322[1] = true
              environment.pcall(environment.setclipboard, "https://" .. value37)
              local textLabel222 = textLabel22
              local cloneResult = textLabel222:Clone()
              local cloneResult2 = cloneResult
              local frame222 = frame22
              cloneResult.Parent = frame222
              cloneResult.Text = "Copied to clipboard!"
              local robotoMono = environment.Enum.Font.RobotoMono
              cloneResult.Font = robotoMono
              cloneResult.Name = "C"
              cloneResult.ZIndex = 4
              local newResult = environment.Vector2.new(0.5, 0.5)
              cloneResult2.AnchorPoint = newResult
              local newResult2 = environment.UDim2.new(0.5, 0, 0.5, 0)
              cloneResult2.Position = newResult2
              local newResult3 = environment.UDim2.new(1, 0, 0.7, 0)
              cloneResult2.Size = newResult3
              local center = environment.Enum.TextXAlignment.Center
              cloneResult2.TextXAlignment = center
              local value3522 = value352
              local value35222 = value3522
              local create = value3522.Create
              local frame422 = frame42
              local newResult4 = environment.TweenInfo.new(0.2)
              local values = {}
              values.BackgroundTransparency = 0.15
              local createResult = create(value35222, frame422, newResult4, values)
              local value3523 = value352
              local value35232 = value3523
              local create2 = value3523.Create
              local frame423 = frame42
              local newResult5 = environment.TweenInfo.new(0.2)
              local values2 = {}
              values2.BackgroundTransparency = 1
              local create2Result = create2(value35232, frame423, newResult5, values2)
              local value3524 = value352
              local value35242 = value3524
              local create3 = value3524.Create
              local newResult6 = environment.TweenInfo.new(0.2)
              local values3 = {}
              values3.TextTransparency = 0
              local create3Result = create3(value35242, cloneResult2, newResult6, values3)
              local value3525 = value352
              local value35252 = value3525
              local create4 = value3525.Create
              local newResult7 = environment.TweenInfo.new(0.5)
              local values4 = {}
              values4.TextTransparency = 1
              local create4Result = create4(value35252, cloneResult2, newResult7, values4)
              createResult:Play()
              create3Result:Play()
              local value3526 = value352
              local textLabel223 = textLabel22
              local newResult8 = environment.TweenInfo.new(0.1)
              local values5 = {}
              values5.TextTransparency = 1
              local createResult2 = value3526:Create(textLabel223, newResult8, values5)
              createResult2:Play()
              local value3527 = value352
              local textBox222 = textBox22
              local newResult9 = environment.TweenInfo.new(0.1)
              local values6 = {}
              values6.TextTransparency = 1
              local createResult3 = value3527:Create(textBox222, newResult9, values6)
              createResult3:Play()
              environment.task.wait(0.51)
              create4Result:Play()
              create2Result:Play()
              environment.task.wait(0.21)
              local value3528 = value352
              local textLabel224 = textLabel22
              local newResult10 = environment.TweenInfo.new(0.1)
              local values7 = {}
              values7.TextTransparency = 0
              local createResult4 = value3528:Create(textLabel224, newResult10, values7)
              createResult4:Play()
              local value3529 = value352
              textBox223 = textBox22
              local newResult11 = environment.TweenInfo.new(0.1)
              local values8 = {}
              values8.TextTransparency = 0
              local createResult5 = value3529:Create(textBox223, newResult11, values8)
              createResult5:Play()
              local completed = create4Result.Completed
              local connect = completed.Connect
              local completed2 = completed
              do
                local value21, value22, cloneResult22
                cloneResult22 = cloneResult2
                
                function textBox223(argument)
                  values322[1] = false
                  value355[1] = false
                  local cloneResult222 = cloneResult22
                  cloneResult222:Destroy()
                  return
                end
              end
              connect(completed2, textBox223)
              return
            end
          end
          connect2(inputEnded2, newResult19)
          local mouseEnter = frame2.MouseEnter
          local connect3 = mouseEnter.Connect
          local mouseEnter2 = mouseEnter
          do
            local value39, createResult2
            createResult2 = createResult
            
            function inputEnded3(argument)
              value354[1] = true
              local createResult22 = createResult2
              createResult22:Play()
              return
            end
          end
          connect3(mouseEnter2, inputEnded3)
          local mouseLeave = frame2.MouseLeave
          local connect4 = mouseLeave.Connect
          local mouseLeave2 = mouseLeave
          do
            local value40, value41, create2Result2 = nil, createResult, nil
            create2Result2 = create2Result
            
            function inputEnded3(argument)
              value355[1] = false
              value354[1] = false
              local create2Result22 = create2Result2
              create2Result22:Play()
              return
            end
          end
          connect4(mouseLeave2, inputEnded3)
          local mouseEnter3 = textBox2.MouseEnter
          local mouseEnter32 = mouseEnter3
          local connect5 = mouseEnter3.Connect
          
          local function callback2(argument)
            value356[1] = true
            return
          end
          
          connect5(mouseEnter32, callback2)
          local mouseLeave3 = textBox2.MouseLeave
          local mouseLeave32 = mouseLeave3
          local connect6 = mouseLeave3.Connect
          
          local function callback3(argument)
            value356[1] = false
            return
          end
          
          connect6(mouseLeave32, callback3)
          local value3524 = value352
          local value35242 = value3524
          local create3 = value3524.Create
          local newResult17 = environment.TweenInfo.new(0.27, environment.Enum.EasingStyle.Cubic, environment.Enum.EasingDirection.Out)
          local values4 = {}
          local newResult18 = environment.UDim2.new(0.5, 0, 0.932, 0)
          values4.Position = newResult18
          local create3Result = create3(value35242, frame2, newResult17, values4)
          create3Result:Play()
          return frame2
        end
      end
      values13[1] = values14
      values93 = {}
      values93[1] = values14
      values14 = values93
      
      function values15(argument)
        local values2, value8, fromRGB3, new6, value21
        local frame = environment.Instance.new("Frame")
        local frame2 = frame
        frame.Name = "result_background"
        local newResult = environment.Vector2.new(0.5, 0.5)
        frame2.AnchorPoint = newResult
        local fromRGBResult = environment.Color3.fromRGB(255, 255, 255)
        frame2.BackgroundColor3 = fromRGBResult
        frame2.BackgroundTransparency = 0.5
        local newResult2 = environment.UDim2.new(0.5, 0, 0.5, 0)
        frame2.Position = newResult2
        local newResult3 = environment.UDim2.new(1, 0, 1, 0)
        frame2.Size = newResult3
        local uIGradient = environment.Instance.new("UIGradient")
        local value = "Color"
        local new2 = environment.ColorSequence.new
        local values = {}
        local new3 = environment.ColorSequenceKeypoint.new
        local fromRGB2 = environment.Color3.fromRGB
        local results = packResults(fromRGB2(0, 0, 0))
        local unpackResults2 = unpackResults
        local resultCount = results.n
        local new3Result = new3(0, unpackResults2(results, 1, resultCount))
        local new4 = environment.ColorSequenceKeypoint.new
        fromRGB3 = environment.Color3.fromRGB
        local results2 = packResults(fromRGB3(0, 0, 0))
        local packResults2 = packResults
        value21 = 1
        local unpackResults3 = unpackResults
        local resultCount2 = results2.n
        local packResults2Result = packResults2(new4(1, unpackResults3(results2, 1, resultCount2)))
        local packResults2Result2 = packResults2Result
        values[1] = new3Result
        local resultCount3 = packResults2Result.n
        value8 = 1
        local value2 = 1
        while resultCount3 >= value8 do
          fromRGB3 = packResults2Result2[value8]
          value21 = value8 + 1
          values[value21] = fromRGB3
          value8 = value8 + value2
        end
        local new2Result = new2(values)
        uIGradient[value] = new2Result
        uIGradient.Rotation = 90
        local value3 = "Transparency"
        new6 = environment.NumberSequence.new
        values2 = {}
        local newResult4 = environment.NumberSequenceKeypoint.new(0, 1)
        local newResult5 = environment.NumberSequenceKeypoint.new(0.69, 0.81)
        local newResult6 = environment.NumberSequenceKeypoint.new(0.87, 0.68)
        local numberSequenceKeypoint = environment.NumberSequenceKeypoint
        fromRGB3 = "new"
        local new5 = numberSequenceKeypoint.new
        local packResults3 = packResults
        value21 = 1
        local packResults3Result = packResults3(new5(1, 0))
        local packResults3Result2 = packResults3Result
        values2[1] = newResult4
        values2[2] = newResult5
        values2[3] = newResult6
        local resultCount4 = packResults3Result.n
        value8 = 1
        local value4 = 1
        while true do
          if not (resultCount4 >= value8) then
            new6 = new6(values2)
            values2 = new6
            uIGradient[value3] = new6
            uIGradient.Parent = frame2
            return frame2
          end
          fromRGB3 = packResults3Result2[value8]
          value21 = value8 + 3
          values2[value21] = fromRGB3
          value8 = value8 + value4
        end
      end
      
      values14[1] = values15
      values93 = {}
      values93[1] = values15
      values15 = values93
      do
        local value357, value358, value359 = nil, values28, values30
        value357 = values14
        value358 = values24
        value359 = values13
        
        function values11(argument, argument2)
          local screenGui = environment.Instance.new("ScreenGui")
          local screenGui2 = screenGui
          screenGui.Name = "sUNC_melon_result"
          screenGui.ResetOnSpawn = false
          local game2 = environment.game
          local serviceResult = game2:service("CoreGui")
          screenGui2.Parent = serviceResult
          local global = environment.Enum.ZIndexBehavior.Global
          screenGui2.ZIndexBehavior = global
          local itemResult = value357[1]()
          value358[1] = itemResult
          value358[1].Parent = screenGui2
          local itemResult2 = value359[1](argument)
          local item = value358[1]
          itemResult2.Parent = item
          return screenGui2
        end
      end
      values15[1] = values11
      values11 = not values29
      if values11 then
        value4 = values15[1]
        getService = value4
        values16 = "r.sunc.su/"
        values17 = values[1]
        value9 = values17
        values14 = "CollisionGroup"
        values13 = values27.CollisionGroup
        value8 = values13
        value10 = value8
        values14 = 5
        value8 = values14
        value11 = value8
        value9 = value9(value10, value11)
        values12 = value9
        value27 = values16 .. values12
        values16 = value27
        value9 = values16
        getService(value9)
      end
      values11 = "CollisionGroup"
      value4 = "Default"
      values27.CollisionGroup = value4
      values25 = environment.math
      values32 = "floor"
      values25 = values25.floor
      getService = values25
      values32 = value5 / values19
      values33 = 100
      values32 = values32 * values33
      value9 = values32
      getService = getService(value9)
      values29 = getService
      values32 = environment.task
      values33 = "wait"
      values32 = values32.wait
      getService = values32
      values33 = 0.05
      value8 = values33
      value9 = value8
      getService(value9)
      values32 = checkpointLogger
      getService = values32
      value9 = "\n"
      getService(value9)
      values25 = value2[1]
      values25 = not values25
      if values25 then
        values32 = checkpointLogger
        getService = values32
        values33 = "\240\159\152\142 Passed the test with "
        values27 = environment.tostring
        value8 = values27
        value9 = value8
        value10 = values29
        value9 = value9(value10)
        values34 = value9
        values27 = "%"
        argument = environment.utf8
        values11 = "char"
        argument = argument.char
        value9 = argument
        value10 = 8204
        value9 = value9(value10)
        values28 = value9
        argument = " succ"
        values11 = "e"
        values16 = values2
        value8 = values16
        value9 = value8
        values12 = "zG991J6qJErf"
        value8 = values12
        value10 = value8
        values17 = "vxxdpv/eQWr3"
        value8 = values17
        value11 = value8
        value9 = value9(value10, value11)
        value4 = value9
        values12 = " "
        values13 = environment.utf8
        values14 = "char"
        values13 = values13.char
        value8 = values13
        value9 = value8
        values14 = 8204
        value8 = values14
        value10 = value8
        value9 = value9(value10)
        values17 = value9
        values13 = "out "
        values15 = environment.utf8
        values10 = "char"
        values15 = values15.char
        value9 = values15
        values10 = 8204
        value8 = values10
        value10 = value8
        value9 = value9(value10)
        values14 = value9
        values15 = "of "
        values5 = environment.utf8
        values18 = "char"
        value8 = values5.char
        value9 = value8
        values18 = 8204
        value8 = values18
        value10 = value8
        value9 = value9(value10)
        values10 = value9
        values6 = values2
        value8 = values6
        value9 = value8
        values7 = "wg=="
        value8 = "wg=="
        value10 = value8
        values8 = "6w=="
        value8 = values8
        value11 = value8
        value9 = value9(value10, value11)
        values18 = value9
        value27 = values19 .. values18
        values5 = value27
        values10 = values10 .. value27
        values15 = values15 .. values10
        values14 = values14 .. values15
        values13 = values13 .. values14
        values17 = values17 .. values13
        values12 = values12 .. values17
        values16 = value5 .. values12
        value4 = value4 .. values16
        values11 = values11 .. value4
        argument = argument .. values11
        values28 = values28 .. argument
        values27 = values27 .. values28
        values34 = values34 .. values27
        values33 = values33 .. values34
        value9 = values33
        getService(value9)
      else
        values32 = checkpointLogger
        value8 = values32
        getService = value8
        values33 = "\240\159\152\142 Passed the test with "
        values27 = environment.tostring
        values34 = values27(values29)
        values27 = "%"
        argument = environment.utf8
        values11 = "char"
        argument = argument.char
        value8 = argument
        value9 = value8
        values11 = 8204
        value8 = values11
        value10 = value8
        value9 = value9(value10)
        values28 = value9
        argument = " succ"
        values11 = "e"
        value4 = "ss rate"
        values16 = " "
        values17 = environment.utf8
        values13 = "char"
        values17 = values17.char
        value8 = values17
        value9 = value8
        value10 = 8204
        value9 = value9(value10)
        values12 = value9
        values17 = "("
        values14 = " "
        values10 = environment.utf8
        values10 = values10.char
        value9 = values10
        value10 = 8204
        value9 = value9(value10)
        values15 = value9
        values10 = "out "
        values18 = environment.utf8
        values18 = values18.char
        value8 = values18
        value9 = value8
        value10 = 8204
        value9 = value9(value10)
        values5 = value9
        values18 = "of "
        values7 = environment.utf8
        values8 = "char"
        value9 = values7.char
        value10 = 8204
        value9 = value9(value10)
        values6 = value9
        value9 = values2
        value10 = "wg=="
        value11 = "6w=="
        value9 = value9(value10, value11)
        values8 = value9
        values18 = values18 .. values6 .. values19 .. values8
        values10 = values10 .. values5 .. values18
        values15 = values15 .. values10
        values14 = values14 .. values15
        values13 = value5 .. values14
        values17 = values17 .. values13
        values12 = values12 .. values17
        values16 = values16 .. values12
        value4 = value4 .. values16
        values11 = values11 .. value4
        argument = argument .. values11
        values28 = values28 .. argument
        values27 = values27 .. values28
        values34 = values34 .. values27
        values33 = values33 .. values34
        value8 = values33
        value9 = value8
        getService(value9)
        values32 = values4[1]
        getService = values32
        getService()
      end
      values32 = checkpointLogger
      getService = values32
      values34 = environment.utf8
      values27 = "char"
      values34 = values34.char
      value8 = values34
      value9 = value8
      value10 = 10060
      value9 = value9(value10)
      values33 = value9
      value8 = values33
      value9 = value8
      values34 = "Total tests failed: "
      values28 = environment.utf8
      argument = "char"
      values28 = values28.char
      value10 = values28
      value11 = 8204
      value10 = value10(value11)
      values27 = value10
      values28 = values19 - value5
      values27 = values27 .. values28
      values34 = values34 .. values27
      value10 = values34
      getService(value9, value10)
      values32 = checkpointLogger
      value8 = values32
      getService = value8
      values33 = "\240\159\152\143 This test was made by senS"
      value8 = values33
      value9 = value8
      getService(value9)
      values32 = checkpointLogger
      value8 = values32
      getService = value8
      values33 = "\240\159\141\137 corporate sponsorship \208\187\208\190\208\187 \240\159\152\130\240\159\152\130\n"
      value8 = values33
      value9 = value8
      getService(value9)
      values25 = value6
      values33 = environment.tostring
      values32 = values33(values25)
      values11 = values32
      values16 = 1
      values12 = 1
      values93 = values11.sub
      value22 = values11
      value23 = values16
      value24 = values12
      values93 = values93(value22, value23, value24)
      values11 = values93
      values33 = values11
      values34 = "-"
      if values33 ~= values34 then
        values33 = false
      else
        values33 = true
      end
      if values33 then
        values33 = values32
        values27 = value3
        values93 = values33
        value3 = values93
        values33 = values93.sub
        value8 = values33
        getService = value8
        value8 = value3
        value9 = value8
        values27 = 2
        value8 = values27
        value10 = value8
        getService = getService(value9, value10)
        values33 = getService
        values32 = values33
      end
      environment2 = environment
      values34 = environment2.tonumber
      value8 = values34
      getService = value8
      value9 = values32
      getService = getService(value9)
      values33 = getService
      
      function values27(argument, argument2)
        return environment.math.floor(argument * 100) / 100
      end
      
      value8 = values27
      environment2 = environment
      environment2.truncateToOneDecimal = value8
      values27 = checkpointLogger
      getService = values27
      values28 = "Finished the test in "
      environment2 = environment
      values11 = environment2.truncateToOneDecimal
      values93 = values11
      value22 = values33
      values93 = values93(value22)
      argument = values93
      values11 = " seconds"
      values93 = argument
      value22 = values11
      value27 = values93 .. value22
      argument = value27
      values93 = values28
      value22 = argument
      value27 = values93 .. value22
      values28 = value27
      value9 = values28
      getService(value9)
      values27 = checkpointLogger
      value8 = values27
      getService = value8
      value9 = "\n"
      getService(value9)
      values27 = checkpointLogger
      getService = values27
      values28 = "sUNC, VERSION 2.1.5 "
      values93 = values28
      value22 = values9
      value27 = values93 .. value22
      values28 = value27
      value9 = values28
      getService(value9)
      environment2 = environment
      values11 = environment2.game
      values16 = "RunService"
      values93 = values11.GetService
      value22 = values11
      value23 = values16
      values93 = values93(value22, value23)
      values11 = values93
      values27 = values11
      values93 = values27.IsStudio
      value22 = values27
      values93 = values93(value22)
      values27 = values93
      values34 = values27
      if values34 then
        values27 = checkpointLogger
        getService = values27
        value9 = "Contributors: vvultt, GRH, 0_void, Dottik, citam."
        getService(value9)
        values34 = environment.getgenv
        values34 = values34()
        values27 = "000PPP000"
        values28 = false
        values34[values27] = values28
        values34 = environment.getgenv
        values34 = values34()
        values27 = "000PPP000"
        values28 = nil
        values34[values27] = values28
        environment.getgenv()["000PPP000"] = false
        values93 = environment.getgenv()
        values3 = "000PPP000"
        values93["000PPP000"] = nil
        return
      end
      values27 = checkpointLogger
      getService = values27
      values28 = "Contribu"
      environment2 = environment
      values11 = environment2.utf8
      value4 = "char"
      values11 = values11.char
      value9 = values11
      value10 = 8204
      value9 = value9(value10)
      argument = value9
      values11 = "tors: Richy, Lovre, vvultt, GRH,"
      environment2 = environment
      values16 = environment2.utf8
      values12 = "char"
      values16 = values16.char
      value9 = values16
      values12 = 8204
      value8 = values12
      value10 = value8
      value9 = value9(value10)
      value4 = value9
      values16 = " 0_void, Dottik, Pixeluted, citam."
      values93 = value4
      value22 = values16
      value27 = values93 .. value22
      value4 = value27
      values93 = values11
      value22 = value4
      value27 = values93 .. value22
      values11 = value27
      values93 = argument
      value22 = values11
      value27 = values93 .. value22
      argument = value27
      values93 = values28
      value22 = argument
      value27 = values93 .. value22
      values28 = value27
      value8 = values28
      value9 = value8
      getService(value9)
      values34 = values3
      values28 = values21
      values93 = values34
      values21 = values93
      values34 = values93.Disconnect
      value8 = values34
      getService = value8
      value9 = values21
      getService(value9)
      environment2 = environment
      values34 = environment2.getgenv
      values93 = values34
      values93 = values93()
      values34 = values93
      values27 = "000PPP000"
      values28 = false
      values34[values27] = values28
      environment2 = environment
      values34 = environment2.getgenv
      values93 = values34
      values93 = values93()
      values34 = values93
      values27 = "000PPP000"
      values28 = nil
      values34[values27] = values28
      environment2 = environment
      values7 = environment2.getgenv
      values93 = values7()
      values93["000PPP000"] = false
      environment2 = environment
      values7 = environment2.getgenv
      values93 = values7()
      values93["000PPP000"] = nil
      return
    end
  else
    values65 = warningLogger
    getService = values65
    value8 = "[1] - Please execute sUNC in the dedicated place. You can find it on our Discord server [discord.gg/yGNzDrvbF5]"
    value9 = value8
    getService(value9)
    values64 = options
    values65 = "printcheckpoints"
    values64 = values64.printcheckpoints
    if not values64 then
      values65 = environment.task
      values65 = values65.wait
      getService = values65
      value9 = 0.3
      getService(value9)
      values64 = environment.game
      values64 = values64:GetService("TeleportService")
      values93 = values64
      values65 = values93
      values64 = values93.Teleport
      getService = values64
      value9 = values65
      value10 = 133609342474444
      value11 = environment.game.Players.LocalPlayer
      getService(value9, value10, value11)
      return
    else
      values65 = warningLogger
      getService = values65
      value9 = "just make it warn(\"diofdjaosijdsfajia\"). Credits: ETq"
      getService(value9)
      values65 = environment.task
      values65 = values65.wait
      getService = values65
      value9 = 0.3
      getService(value9)
      values64 = environment.game
      values64 = values64:GetService("TeleportService")
      values93 = values64
      values65 = values93
      values64 = values93.Teleport
      getService = values64
      value9 = values65
      value10 = 133609342474444
      value11 = environment.game.Players.LocalPlayer
      getService(value9, value10, value11)
      return
    end
  end
  return
end
