# kawaii-sUNC

Devirtualized sUNC, organized into working source and API tests.

Join the [sUNC test place](https://www.roblox.com/games/90441122676618/roblox-be-like-yo-ima-need-your-face-and-stuff), then execute:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaiddd/kawaii-sUNC/main/main.lua"))()
```

`main.lua` downloads the required source modules automatically.

- `src/tests/` contains the named API tests.
- `src/program.lua` registers tests and builds the results.
- `src/runtime.lua` contains startup code and required host functions.
- `src/metadata.lua` supplies data used by the tests.

Verified in Kawaii: 83/86 with `checkcaller` passing, including a completed result screen. The three expected failures are `getscriptbytecode`, `decompile`, and the dependent basic `loadstring` check.
