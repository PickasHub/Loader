if not game:IsLoaded() then
    game.Loaded:Wait()
end

local routes = {
    [17625359962] = { "Rivals", "https://cdn.luaprotect.dev/u/a2ee68/NclxO8ewnJ79FBNv" },
    [76503495566299] = { "Steal A Chicken", "https://raw.githubusercontent.com/PickasHub/LoaderV2/refs/heads/main/Steal%25a%25chickenV1" },
}

local route = routes[game.PlaceId] or routes[game.GameId]

if not route then
    return
end

local gameName = route[1]
local scriptUrl = route[2]

local success, source = pcall(function()
    return game:HttpGet(scriptUrl)
end)

if not success or not source or source == "" then
    warn("[PICKA'S HUB] Failed to load: " .. gameName)
    return
end

local loaded, err = pcall(function()
    local scriptFunction = loadstring(source)

    if not scriptFunction then
        error("Failed to compile script")
    end

    scriptFunction()
end)

if not loaded then
    warn("[PICKA'S HUB] Error in " .. gameName .. ": " .. tostring(err))
end
