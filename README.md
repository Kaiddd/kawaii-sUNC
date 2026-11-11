# kawaii-sUNC

Devirtualized sUNC, organized into working source and API tests.

Join the [sUNC test place](https://www.roblox.com/games/90441122676618/roblox-be-like-yo-ima-need-your-face-and-stuff), then execute:

```lua
getgenv().sUNCDebug = {
    ["printcheckpoints"] = false,
    ["delaybetweentests"] = 0,
    ["printtesttimetaken"] = false,
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaiddd/kawaii-sUNC/main/main.lua"))()
```

`main.lua` downloads the required source modules automatically.

- `src/tests/` contains the named API tests.
- `src/program.lua` runs the tests and builds the results.
- `src/runtime.lua` contains the startup and integrity checks and launches the program.
- `src/metadata.lua` holds the shared table the modules are registered on.
- `src/test-dependencies/` contains the files the tests download, so no external Lua is loaded.

Verified in Kawaii: 86/86 with a result link, in about 15 seconds of testing (about 20 seconds from execution to the final summary).
