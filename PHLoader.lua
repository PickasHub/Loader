local SupportedGames = {
    [76503495566299] = "https://flowauth.net/v1/loaders/Pickas-hub-steal-a-chicken.lua",
    [17625359962] = "https://flowauth.net/v1/loaders/Pickas-Hub-RivalsV2.lua",
}

local ScriptURL = SupportedGames[game.PlaceId]

if not ScriptURL then
    warn("PICKA'S HUB: Game not supported")
    return
end

local success, code = pcall(function()
    return game:HttpGet(ScriptURL)
end)

if not success then
    warn("PICKA'S HUB: Failed to load script")
    return
end

local executeSuccess, err = pcall(function()
    loadstring(code)()
end)

if not executeSuccess then
    warn("PICKA'S HUB: Script execution failed:", err)
end
