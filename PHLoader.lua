local SupportedGames = {
    [17625359962] = "https://your-site.com/rivals.lua",
    [76503495566299] = "https://flowauth.net/v1/loaders/f4d724bc1730e21cf242efe7c2aaddb8.lua",
}

local GameId = game.GameId
local ScriptURL = SupportedGames[GameId]

if not ScriptURL then
    warn("PICKA'S HUB: Game not supported")
    return
end

local Success, Result = pcall(function()
    return game:HttpGet(ScriptURL)
end)

if not Success then
    warn("PICKA'S HUB: Failed to download script")
    warn(Result)
    return
end

local ExecuteSuccess, ExecuteError = pcall(function()
    loadstring(Result)()
end)

if not ExecuteSuccess then
    warn("PICKA'S HUB: Script execution failed")
    warn(ExecuteError)
end
