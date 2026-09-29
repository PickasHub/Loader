--[[
██████╗ ██╗ ██████╗██╗  ██╗ █████╗ ███████╗██╗  ██╗██╗   ██╗██████╗
██╔══██╗██║██╔════╝██║ ██╔╝██╔══██╗██╔════╝██║  ██║██║   ██║██╔══██╗
██████╔╝██║██║     █████╔╝ ███████║███████╗███████║██║   ██║██████╔╝
██╔═══╝ ██║██║     ██╔═██╗ ██╔══██║╚════██║██╔══██║██║   ██║██╔══██╗
██║     ██║╚██████╗██║  ██╗██║  ██║███████║██║  ██║╚██████╔╝██████╔╝
╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝

                         ⚡ PICKASHUB ⚡
              discord : https://discord.gg/EZVwVe5g4t
]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local Gui = Instance.new("ScreenGui")
Gui.Name = "PICKASHUB_Loading"
Gui.ResetOnSpawn = false
Gui.IgnoreGuiInset = true
Gui.Parent = PlayerGui

local Background = Instance.new("Frame")
Background.Size = UDim2.fromScale(1, 1)
Background.BackgroundColor3 = Color3.fromRGB(12, 5, 18)
Background.BackgroundTransparency = 0
Background.Parent = Gui

local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 4, 16)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(27, 7, 42)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(9, 3, 15))
})
Gradient.Rotation = 45
Gradient.Parent = Background

local Container = Instance.new("Frame")
Container.AnchorPoint = Vector2.new(0.5, 0.5)
Container.Position = UDim2.fromScale(0.5, 0.5)
Container.Size = UDim2.fromOffset(180, 180)
Container.BackgroundTransparency = 1
Container.Parent = Background

local Icon = Instance.new("TextLabel")
Icon.AnchorPoint = Vector2.new(0.5, 0.5)
Icon.Position = UDim2.fromScale(0.5, 0.38)
Icon.Size = UDim2.fromOffset(70, 70)
Icon.BackgroundTransparency = 1
Icon.Text = "✦"
Icon.TextColor3 = Color3.fromRGB(157, 0, 255)
Icon.TextSize = 58
Icon.Font = Enum.Font.GothamBold
Icon.Parent = Container

local Glow = Instance.new("UIStroke")
Glow.Color = Color3.fromRGB(157, 0, 255)
Glow.Thickness = 2
Glow.Transparency = 0.25
Glow.Parent = Icon

local Status = Instance.new("TextLabel")
Status.AnchorPoint = Vector2.new(0.5, 0.5)
Status.Position = UDim2.fromScale(0.5, 0.68)
Status.Size = UDim2.fromOffset(180, 30)
Status.BackgroundTransparency = 1
Status.Text = "Loading PICKA'S HUB..."
Status.TextColor3 = Color3.fromRGB(235, 220, 255)
Status.TextSize = 14
Status.Font = Enum.Font.GothamMedium
Status.Parent = Container

local BarBackground = Instance.new("Frame")
BarBackground.AnchorPoint = Vector2.new(0.5, 0.5)
BarBackground.Position = UDim2.fromScale(0.5, 0.82)
BarBackground.Size = UDim2.fromOffset(150, 4)
BarBackground.BackgroundColor3 = Color3.fromRGB(45, 20, 60)
BarBackground.BorderSizePixel = 0
BarBackground.Parent = Container

local BarCorner = Instance.new("UICorner")
BarCorner.CornerRadius = UDim.new(1, 0)
BarCorner.Parent = BarBackground

local Bar = Instance.new("Frame")
Bar.Size = UDim2.new(0, 0, 1, 0)
Bar.BackgroundColor3 = Color3.fromRGB(157, 0, 255)
Bar.BorderSizePixel = 0
Bar.Parent = BarBackground

local BarCorner2 = Instance.new("UICorner")
BarCorner2.CornerRadius = UDim.new(1, 0)
BarCorner2.Parent = Bar

-- Animated loading icon
task.spawn(function()
    while Gui.Parent do
        local Tween = TweenService:Create(
            Icon,
            TweenInfo.new(0.7, Enum.EasingStyle.Linear),
            {Rotation = Icon.Rotation + 360}
        )

        Tween:Play()
        Tween.Completed:Wait()
    end
end)

-- 3 second loading
local BarTween = TweenService:Create(
    Bar,
    TweenInfo.new(3, Enum.EasingStyle.Linear),
    {Size = UDim2.new(1, 0, 1, 0)}
)

BarTween:Play()

task.wait(3)

Status.Text = "Loaded!"

task.wait(0.25)

-- Fade out
local Fade = TweenService:Create(
    Background,
    TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {BackgroundTransparency = 1}
)

Fade:Play()

for _, Object in ipairs(Container:GetDescendants()) do
    if Object:IsA("TextLabel") then
        TweenService:Create(
            Object,
            TweenInfo.new(0.5),
            {TextTransparency = 1}
        ):Play()
    elseif Object:IsA("Frame") then
        TweenService:Create(
            Object,
            TweenInfo.new(0.5),
            {BackgroundTransparency = 1}
        ):Play()
    end
end

Fade.Completed:Wait()

Gui:Destroy()

-- Load PICKA'S HUB
local Execute = loadstring(game:HttpGet(
    "https://api.obscuravm.com/scripts/7227495279761307250"
))

Execute()
