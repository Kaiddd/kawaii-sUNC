local a = getsenv(game.Players.LocalPlayer.PlayerScripts.lefty).yourepmoingme
local old; old = hookfunction(a, function()
    workspace["I AM SUNC_0"].SurfaceGui.ImageLabel.Active = true
end)
task.wait(0.4)
hookfunction(a, old)