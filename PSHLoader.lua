if not game:IsLoaded() then
    game.Loaded:Wait()
end

local StarterGui = game:GetService("StarterGui")

local routes = {
    [17625359962] = { "Rivals", "https://cdn.luaprotect.dev/u/a2ee68/NclxO8ewnJ79FBNv" },
    [76503495566299] = { "Steal A Chicken", "https://raw.githubusercontent.com/PickasHub/LoaderV2/refs/heads/main/Steal%25a%25chickenV1" },

    [1234567890] = { "JNkie Game 1", "https://api.jnkie.com/api/v1/luascripts/public/65145d04673e06eb2bb39a0fc4b4572fbe1880187ff6e793bf3a16229150a84a/download" },
    [9876543210] = { "JNkie Game 2", "https://api.jnkie.com/api/v1/luascripts/public/65145d04673e06eb2bb39a0fc4b4572fbe1880187ff6e793bf3a16229150a84a/download" },
}

local route = routes[game.PlaceId] or routes[game.GameId]

if not route then
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "PICKA'S HUB",
            Text = "Game not supported.",
            Duration = 5
        })
    end)

    warn("[PICKA'S HUB] Game not supported: " .. tostring(game.PlaceId))
    return
end

local gameName = route[1]
local scriptUrl = route[2]

local success, source = pcall(function()
    return game:HttpGet(scriptUrl)
end)

if not success or not source or source == "" then
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "PICKA'S HUB",
            Text = "Failed to load " .. gameName .. ".",
            Duration = 5
        })
    end)

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
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "PICKA'S HUB",
            Text = "Error loading " .. gameName .. ".",
            Duration = 5
        })
    end)

    warn("[PICKA'S HUB] Error in " .. gameName .. ": " .. tostring(err))
end
