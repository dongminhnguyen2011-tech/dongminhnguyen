--// ĐMN - NGUYỄN MOD
--// main.lua
--// Thay toàn bộ code cũ bằng code này

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

--==================================================
-- SETTINGS
--==================================================

local EFFECT_REDUCTION = 0.45
local ESP_DISTANCE = 180

local SmoothEnabled = false
local ESPEnabled = false
local LuckEnabled = false
local LocationEnabled = false

--==================================================
-- GUI
--==================================================

local Gui = Instance.new("ScreenGui")
Gui.Name = "DMN_NGUYEN"
Gui.ResetOnSpawn = false
Gui.IgnoreGuiInset = true
Gui.Parent = PlayerGui

--==================================================
-- MAIN MENU
--==================================================

local Main = Instance.new("Frame")
Main.Size = UDim2.fromOffset(315, 330)
Main.Position = UDim2.new(0.5, -157, 0.5, -165)
Main.BackgroundColor3 = Color3.fromRGB(15, 16, 20)
Main.BorderSizePixel = 0
Main.Active = true
Main.Parent = Gui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 18)
MainCorner.Parent = Main

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(70, 75, 90)
Stroke.Thickness = 1.5
Stroke.Transparency = 0.25
Stroke.Parent = Main

--==================================================
-- HEADER
--==================================================

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 58)
Header.BackgroundColor3 = Color3.fromRGB(22, 24, 30)
Header.BorderSizePixel = 0
Header.Active = true
Header.Parent = Main

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 18)
HeaderCorner.Parent = Header

local Icon = Instance.new("TextLabel")
Icon.Size = UDim2.fromOffset(42, 42)
Icon.Position = UDim2.fromOffset(9, 8)
Icon.BackgroundColor3 = Color3.fromRGB(35, 38, 48)
Icon.Text = "Đ"
Icon.TextColor3 = Color3.fromRGB(255, 255, 255)
Icon.TextSize = 22
Icon.Font = Enum.Font.GothamBlack
Icon.Parent = Header

local IconCorner = Instance.new("UICorner")
IconCorner.CornerRadius = UDim.new(1, 0)
IconCorner.Parent = Icon

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -105, 0, 25)
Title.Position = UDim2.fromOffset(59, 8)
Title.BackgroundTransparency = 1
Title.Text = "ĐMN"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.new(1, -105, 0, 18)
SubTitle.Position = UDim2.fromOffset(59, 31)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "NGUYÊN MOD • CONTROL"
SubTitle.TextColor3 = Color3.fromRGB(145, 150, 165)
SubTitle.TextSize = 10
SubTitle.Font = Enum.Font.GothamMedium
SubTitle.TextXAlignment = Enum.TextXAlignment.Left
SubTitle.Parent = Header

local Close = Instance.new("TextButton")
Close.Size = UDim2.fromOffset(38, 38)
Close.Position = UDim2.new(1, -47, 0, 10)
Close.BackgroundColor3 = Color3.fromRGB(65, 42, 47)
Close.Text = "×"
Close.TextColor3 = Color3.fromRGB(255, 220, 225)
Close.TextSize = 22
Close.Font = Enum.Font.GothamBold
Close.BorderSizePixel = 0
Close.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 11)
CloseCorner.Parent = Close

--==================================================
-- BUTTON FUNCTION
--==================================================

local function CreateButton(y, title, icon)
    local Button = Instance.new("TextButton")

    Button.Size = UDim2.new(1, -24, 0, 48)
    Button.Position = UDim2.fromOffset(12, y)
    Button.BackgroundColor3 = Color3.fromRGB(29, 31, 38)
    Button.BorderSizePixel = 0
    Button.Text = ""
    Button.AutoButtonColor = false
    Button.Parent = Main

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 13)
    Corner.Parent = Button

    local BStroke = Instance.new("UIStroke")
    BStroke.Color = Color3.fromRGB(55, 58, 70)
    BStroke.Thickness = 1
    BStroke.Transparency = 0.3
    BStroke.Parent = Button

    local I = Instance.new("TextLabel")
    I.Size = UDim2.fromOffset(38, 38)
    I.Position = UDim2.fromOffset(5, 5)
    I.BackgroundColor3 = Color3.fromRGB(40, 43, 52)
    I.Text = icon
    I.TextSize = 19
    I.TextColor3 = Color3.fromRGB(235, 235, 240)
    I.Font = Enum.Font.GothamBold
    I.Parent = Button

    local IC = Instance.new("UICorner")
    IC.CornerRadius = UDim.new(0, 10)
    IC.Parent = I

    local Name = Instance.new("TextLabel")
    Name.Size = UDim2.new(1, -130, 0, 23)
    Name.Position = UDim2.fromOffset(52, 4)
    Name.BackgroundTransparency = 1
    Name.Text = title
    Name.TextColor3 = Color3.fromRGB(245, 245, 248)
    Name.TextSize = 12
    Name.Font = Enum.Font.GothamBold
    Name.TextXAlignment = Enum.TextXAlignment.Left
    Name.Parent = Button

    local Status = Instance.new("TextLabel")
    Status.Size = UDim2.new(1, -130, 0, 18)
    Status.Position = UDim2.fromOffset(52, 26)
    Status.BackgroundTransparency = 1
    Status.Text = "ĐANG TẮT"
    Status.TextColor3 = Color3.fromRGB(145, 150, 160)
    Status.TextSize = 9
    Status.Font = Enum.Font.GothamMedium
    Status.TextXAlignment = Enum.TextXAlignment.Left
    Status.Parent = Button

    local Toggle = Instance.new("Frame")
    Toggle.Size = UDim2.fromOffset(42, 23)
    Toggle.Position = UDim2.new(1, -52, 0.5, -11)
    Toggle.BackgroundColor3 = Color3.fromRGB(52, 54, 63)
    Toggle.BorderSizePixel = 0
    Toggle.Parent = Button

    local TC = Instance.new("UICorner")
    TC.CornerRadius = UDim.new(1, 0)
    TC.Parent = Toggle

    local Dot = Instance.new("Frame")
    Dot.Size = UDim2.fromOffset(17, 17)
    Dot.Position = UDim2.fromOffset(3, 3)
    Dot.BackgroundColor3 = Color3.fromRGB(210, 212, 218)
    Dot.BorderSizePixel = 0
    Dot.Parent = Toggle

    local DC = Instance.new("UICorner")
    DC.CornerRadius = UDim.new(1, 0)
    DC.Parent = Dot

    Button.MouseEnter:Connect(function()
        TweenService:Create(
            Button,
            TweenInfo.new(0.15),
            {BackgroundColor3 = Color3.fromRGB(38, 41, 50)}
        ):Play()
    end)

    Button.MouseLeave:Connect(function()
        TweenService:Create(
            Button,
            TweenInfo.new(0.15),
            {BackgroundColor3 = Color3.fromRGB(29, 31, 38)}
        ):Play()
    end)

    return Button, Status, Toggle, Dot
end

--==================================================
-- BUTTONS
--==================================================

local SmoothButton, SmoothStatus, SmoothToggle, SmoothDot =
    CreateButton(69, "TĂNG ĐỘ MƯỢT", "⚡")

local ESPButton, ESPStatus, ESPToggle, ESPDot =
    CreateButton(123, "ĐỊNH VỊ NGƯỜI CHƠI", "📍")

local LuckButton, LuckStatus, LuckToggle, LuckDot =
    CreateButton(177, "LUCK 100%", "🍀")

local Info = Instance.new("TextLabel")
Info.Size = UDim2.new(1, -24, 0, 35)
Info.Position = UDim2.fromOffset(12, 235)
Info.BackgroundTransparency = 1
Info.Text = "ĐMN • Các chức năng mặc định đang TẮT"
Info.TextColor3 = Color3.fromRGB(115, 120, 135)
Info.TextSize = 10
Info.Font = Enum.Font.GothamMedium
Info.TextXAlignment = Enum.TextXAlignment.Center
Info.Parent = Main

local Version = Instance.new("TextLabel")
Version.Size = UDim2.new(1, -24, 0, 25)
Version.Position = UDim2.fromOffset(12, 280)
Version.BackgroundTransparency = 1
Version.Text = "ĐỒNG M NGUYÊN • V2"
Version.TextColor3 = Color3.fromRGB(80, 85, 98)
Version.TextSize = 9
Version.Font = Enum.Font.GothamBold
Version.TextXAlignment = Enum.TextXAlignment.Center
Version.Parent = Main

--==================================================
-- TOGGLE VISUAL
--==================================================

local function SetToggle(toggle, dot, status, enabled)
    if enabled then
        TweenService:Create(
            toggle,
            TweenInfo.new(0.18),
            {BackgroundColor3 = Color3.fromRGB(45, 145, 80)}
        ):Play()

        TweenService:Create(
            dot,
            TweenInfo.new(0.18),
            {Position = UDim2.fromOffset(22, 3)}
        ):Play()

        status.Text = "ĐANG BẬT"
        status.TextColor3 = Color3.fromRGB(90, 220, 125)
    else
        TweenService:Create(
            toggle,
            TweenInfo.new(0.18),
            {BackgroundColor3 = Color3.fromRGB(52, 54, 63)}
        ):Play()

        TweenService:Create(
            dot,
            TweenInfo.new(0.18),
            {Position = UDim2.fromOffset(3, 3)}
        ):Play()

        status.Text = "ĐANG TẮT"
        status.TextColor3 = Color3.fromRGB(145, 150, 160)
    end
end

--==================================================
-- DRAG MENU
--==================================================

local dragging = false
local dragStart
local startPos

Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then

        dragging = true
        dragStart = input.Position
        startPos = Main.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Header.InputChanged:Connect(function(input)
    if not dragging then
        return
    end

    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement then

        local delta = input.Position - dragStart

        Main.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

--==================================================
-- 45% EFFECT REDUCTION
--==================================================

local Original = {}

local function Save(v, property)
    if Original[v] == nil then
        Original[v] = {}
    end

    if Original[v][property] == nil then
        pcall(function()
            Original[v][property] = v[property]
        end)
    end
end

local function ReduceEffects()
    for _, v in ipairs(Workspace:GetDescendants()) do

        if v:IsA("ParticleEmitter") then
            Save(v, "Rate")

            pcall(function()
                v.Rate = Original[v].Rate * (1 - EFFECT_REDUCTION)
            end)

        elseif v:IsA("Trail") then
            Save(v, "Lifetime")

            pcall(function()
                v.Lifetime = Original[v].Lifetime * (1 - EFFECT_REDUCTION)
            end)

        elseif v:IsA("Beam") then
            Save(v, "Segments")

            pcall(function()
                v.Segments = math.max(
                    1,
                    math.floor(Original[v].Segments * (1 - EFFECT_REDUCTION))
                )
            end)

        elseif v:IsA("Smoke") then
            Save(v, "Opacity")

            pcall(function()
                v.Opacity = Original[v].Opacity * (1 - EFFECT_REDUCTION)
            end)

        elseif v:IsA("Fire") then
            Save(v, "Size")

            pcall(function()
                v.Size = Original[v].Size * (1 - EFFECT_REDUCTION)
            end)
        end
    end

    pcall(function()
        Lighting.GlobalShadows = false
    end)
end

--==================================================
-- ESP / PLAYER LOCATION
--==================================================

local ESPObjects = {}

local function RemoveESP(player)
    if ESPObjects[player] then
        ESPObjects[player]:Destroy()
        ESPObjects[player] = nil
    end
end

local function CreateESP(player)
    if player == LocalPlayer then
        return
    end

    if not ESPEnabled then
        return
    end

    local character = player.Character
    if not character then
        return
    end

    local root = character:FindFirstChild("HumanoidRootPart")
    if not root then
        return
    end

    RemoveESP(player)

    local Billboard = Instance.new("BillboardGui")
    Billboard.Name = "DMN_LOCATION"
    Billboard.Size = UDim2.fromOffset(150, 42)
    Billboard.StudsOffset = Vector3.new(0, 3.5, 0)
    Billboard.AlwaysOnTop = true
    Billboard.Adornee = root
    Billboard.Parent = root

    local BG = Instance.new("Frame")
    BG.Size = UDim2.fromScale(1, 1)
    BG.BackgroundColor3 = Color3.fromRGB(12, 14, 18)
    BG.BackgroundTransparency = 0.12
    BG.BorderSizePixel = 0
    BG.Parent = Billboard

    local BC = Instance.new("UICorner")
    BC.CornerRadius = UDim.new(0, 9)
    BC.Parent = BG

    local BS = Instance.new("UIStroke")
    BS.Color = Color3.fromRGB(75, 85, 105)
    BS.Thickness = 1
    BS.Parent = BG

    local Name = Instance.new("TextLabel")
    Name.Size = UDim2.new(1, -8, 0, 19)
    Name.Position = UDim2.fromOffset(4, 2)
    Name.BackgroundTransparency = 1
    Name.Text = "📍 " .. player.DisplayName
    Name.TextColor3 = Color3.fromRGB(255, 255, 255)
    Name.TextSize = 10
    Name.Font = Enum.Font.GothamBold
    Name.TextXAlignment = Enum.TextXAlignment.Center
    Name.Parent = BG

    local Distance = Instance.new("TextLabel")
    Distance.Name = "Distance"
    Distance.Size = UDim2.new(1, -8, 0, 17)
    Distance.Position = UDim2.fromOffset(4, 21)
    Distance.BackgroundTransparency = 1
    Distance.Text = "Đang xác định..."
    Distance.TextColor3 = Color3.fromRGB(110, 220, 145)
    Distance.TextSize = 9
    Distance.Font = Enum.Font.GothamMedium
    Distance.TextXAlignment = Enum.TextXAlignment.Center
    Distance.Parent = BG

    ESPObjects[player] = Billboard
end

local function UpdateESP()
    if not ESPEnabled then
        for player in pairs(ESPObjects) do
            RemoveESP(player)
        end
        return
    end

    local myCharacter = LocalPlayer.Character
    if not myCharacter then
        return
    end

    local myRoot = myCharacter:FindFirstChild("HumanoidRootPart")
    if not myRoot then
        return
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then

            local character = player.Character
            local root = character and character:FindFirstChild("HumanoidRootPart")

            if root then
                local distance =
                    (root.Position - myRoot.Position).Magnitude

                if distance <= ESP_DISTANCE then
                    if not ESPObjects[player] then
                        CreateESP(player)
                    end

                    local gui = ESPObjects[player]

                    if gui then
                        local bg = gui:FindFirstChildOfClass("Frame")

                        if bg then
                            local distanceLabel =
                                bg:FindFirstChild("Distance")

                            if distanceLabel then
                                distanceLabel.Text =
                                    math.floor(distance) .. " studs"
                            end
                        end
                    end
                else
                    RemoveESP(player)
                end
            else
                RemoveESP(player)
            end
        end
    end
end

Players.PlayerRemoving:Connect(function(player)
    RemoveESP(player)
end)

--==================================================
-- LUCK
--==================================================

local LuckValue = LocalPlayer:FindFirstChild("DMN_LUCK")

if not LuckValue then
    LuckValue = Instance.new("NumberValue")
    LuckValue.Name = "DMN_LUCK"
    LuckValue.Value = 1
    LuckValue.Parent = LocalPlayer
end

--==================================================
-- BUTTON EVENTS
--==================================================

SmoothButton.Activated:Connect(function()
    SmoothEnabled = not SmoothEnabled

    SetToggle(
        SmoothToggle,
        SmoothDot,
        SmoothStatus,
        SmoothEnabled
    )

    if SmoothEnabled then
        ReduceEffects()
    end
end)

ESPButton.Activated:Connect(function()
    ESPEnabled = not ESPEnabled

    SetToggle(
        ESPToggle,
        ESPDot,
        ESPStatus,
        ESPEnabled
    )

    UpdateESP()
end)

LuckButton.Activated:Connect(function()
    LuckEnabled = not LuckEnabled

    SetToggle(
        LuckToggle,
        LuckDot,
        LuckStatus,
        LuckEnabled
    )

    if LuckEnabled then
        LuckValue.Value = 2
    else
        LuckValue.Value = 1
    end
end)

--==================================================
-- UPDATE ESP
--==================================================

task.spawn(function()
    while Gui.Parent do
        task.wait(0.35)
        UpdateESP()
    end
end)

--==================================================
-- ROUND BUTTON ĐMN
--==================================================

local function CreateRoundButton()

    local Button = Instance.new("TextButton")

    Button.Name = "DMN_Round"
    Button.Size = UDim2.fromOffset(70, 70)
    Button.Position = UDim2.new(0, 18, 0.5, -35)
    Button.BackgroundColor3 = Color3.fromRGB(16, 18, 23)
    Button.BorderSizePixel = 0
    Button.Text = ""
    Button.Active = true
    Button.Parent = Gui

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(1, 0)
    Corner.Parent = Button

    local Ring = Instance.new("UIStroke")
    Ring.Color = Color3.fromRGB(100, 110, 135)
    Ring.Thickness = 2
    Ring.Parent = Button

    local Gradient = Instance.new("UIGradient")
    Gradient.Rotation = 45
    Gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(55, 60, 75)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(18, 20, 26))
    })
    Gradient.Parent = Button

    local Logo = Instance.new("TextLabel")
    Logo.Size = UDim2.fromScale(1, 0.58)
    Logo.Position = UDim2.fromScale(0, 0.04)
    Logo.BackgroundTransparency = 1
    Logo.Text = "ĐMN"
    Logo.TextColor3 = Color3.fromRGB(255, 255, 255)
    Logo.TextSize = 18
    Logo.Font = Enum.Font.GothamBlack
    Logo.Parent = Button

    local Small = Instance.new("TextLabel")
    Small.Size = UDim2.fromScale(1, 0.25)
    Small.Position = UDim2.fromScale(0, 0.60)
    Small.BackgroundTransparency = 1
    Small.Text = "MENU"
    Small.TextColor3 = Color3.fromRGB(150, 155, 170)
    Small.TextSize = 8
    Small.Font = Enum.Font.GothamBold
    Small.Parent = Button

    -- hiệu ứng khi chạm
    Button.Activated:Connect(function()
        Main.Visible = true
        Button:Destroy()
    end)

    -- kéo nút tròn
    local draggingButton = false
    local startButton
    local startButtonPos

    Button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch
            or input.UserInputType == Enum.UserInputType.MouseButton1 then

            draggingButton = true
            startButton = input.Position
            startButtonPos = Button.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    draggingButton = false
                end
            end)
        end
    end)

    Button.InputChanged:Connect(function(input)
        if not draggingButton then
            return
        end

        if input.UserInputType == Enum.UserInputType.Touch
            or input.UserInputType == Enum.UserInputType.MouseMovement then

            local delta = input.Position - startButton

            Button.Position = UDim2.new(
                startButtonPos.X.Scale,
                startButtonPos.X.Offset + delta.X,
                startButtonPos.Y.Scale,
                startButtonPos.Y.Offset + delta.Y
            )
        end
    end)
end

Close.Activated:Connect(function()
    Main.Visible = false
		CreateRoundButton()
end)

--==================================================
-- START
--==================================================

SetToggle(SmoothToggle, SmoothDot, SmoothStatus, false)
SetToggle(ESPToggle, ESPDot, ESPStatus, false)
SetToggle(LuckToggle, LuckDot, LuckStatus, false)

print("ĐMN NGUYÊN MOD V2 LOADED")
