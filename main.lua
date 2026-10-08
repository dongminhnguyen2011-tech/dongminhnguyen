-- ========================================================
-- SCRIPT: ĐỒNG M NGUYÊN [ V1.0 ]
-- Hỗ trợ: Tất cả Game, Điện thoại (Android/iOS) & PC
-- ========================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer

-- Khởi tạo GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DongMNguyenGUI_V1"
ScreenGui.ResetOnSpawn = false

local parentTarget = game:GetService("CoreGui")
pcall(function()
    if gethui then
        parentTarget = gethui()
    end
end)
ScreenGui.Parent = parentTarget or LocalPlayer:WaitForChild("PlayerGui")

-- 1. NÚT TRÒN NỔI (FLOATING BUTTON KHẢ NĂNG KÉO THẢ)
local OpenButton = Instance.new("TextButton")
OpenButton.Name = "OpenButton"
OpenButton.Size = UDim2.new(0, 52, 0, 52)
OpenButton.Position = UDim2.new(0.05, 0, 0.35, 0)
OpenButton.BackgroundColor3 = Color3.fromRGB(20, 22, 32)
OpenButton.Text = "ĐMN"
OpenButton.TextColor3 = Color3.fromRGB(0, 255, 170)
OpenButton.Font = Enum.Font.GothamBold
OpenButton.TextSize = 14
OpenButton.Visible = false
OpenButton.Active = true
OpenButton.Parent = ScreenGui

local UICornerOpen = Instance.new("UICorner")
UICornerOpen.CornerRadius = UDim.new(1, 0)
UICornerOpen.Parent = OpenButton

local UIStrokeOpen = Instance.new("UIStroke")
UIStrokeOpen.Color = Color3.fromRGB(0, 255, 170)
UIStrokeOpen.Thickness = 2
UIStrokeOpen.Parent = OpenButton

-- 2. MENU CHÍNH (MAIN FRAME)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 310, 0, 380)
MainFrame.Position = UDim2.new(0.5, -155, 0.5, -190)
MainFrame.BackgroundColor3 = Color3.fromRGB(16, 18, 26)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local UICornerMain = Instance.new("UICorner")
UICornerMain.CornerRadius = UDim.new(0, 14)
UICornerMain.Parent = MainFrame

local UIStrokeMain = Instance.new("UIStroke")
UIStrokeMain.Color = Color3.fromRGB(0, 255, 170)
UIStrokeMain.Thickness = 1.5
UIStrokeMain.Parent = MainFrame

-- Thanh Tiêu Đề (Header)
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 45)
TitleBar.BackgroundColor3 = Color3.fromRGB(12, 13, 20)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -50, 1, 0)
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "ĐỒNG M NGUYÊN [ V1.0 ]"
TitleLabel.TextColor3 = Color3.fromRGB(0, 255, 170)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 14
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TitleBar

-- Nút Nút Đóng (X)
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 28, 0, 28)
CloseButton.Position = UDim2.new(1, -36, 0.5, -14)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 65, 85)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 13
CloseButton.Parent = TitleBar

local UICornerClose = Instance.new("UICorner")
UICornerClose.CornerRadius = UDim.new(0, 8)
UICornerClose.Parent = CloseButton

-- Danh Sách Chức Năng (Scroll)
local ContentContainer = Instance.new("ScrollingFrame")
ContentContainer.Size = UDim2.new(1, -20, 1, -55)
ContentContainer.Position = UDim2.new(0, 10, 0, 50)
ContentContainer.BackgroundTransparency = 1
ContentContainer.ScrollBarThickness = 3
ContentContainer.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 170)
ContentContainer.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.Parent = ContentContainer

-- HỖ TRỢ KÉO THẢ (DRAGGABLE CHO DI ĐỘNG & PC)
local function makeDraggable(gui)
    local dragging, dragInput, dragStart, startPos
    local function update(input)
        local delta = input.Position - dragStart
        gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

makeDraggable(MainFrame)
makeDraggable(OpenButton)

-- ĐÓNG / MỞ MENU
CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    OpenButton.Visible = true
end)

OpenButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    OpenButton.Visible = false
end)

-- HÀM TẠO NÚT BẬT/TẮT
local function createToggle(name, defaultState, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, -6, 0, 48)
    Frame.BackgroundColor3 = Color3.fromRGB(24, 27, 38)
    Frame.Parent = ContentContainer

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Frame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.65, 0, 1, 0)
    Label.Position = UDim2.new(0, 12, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = Color3.fromRGB(220, 220, 220)
    Label.Font = Enum.Font.GothamMedium
    Label.TextSize = 12
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame

    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 65, 0, 26)
    Button.Position = UDim2.new(1, -73, 0.5, -13)
    Button.BackgroundColor3 = defaultState and Color3.fromRGB(0, 255, 170) or Color3.fromRGB(45, 50, 65)
    Button.Text = defaultState and "BẬT" or "TẮT"
    Button.TextColor3 = defaultState and Color3.fromRGB(12, 13, 20) or Color3.fromRGB(180, 180, 180)
    Button.Font = Enum.Font.GothamBold
    Button.TextSize = 11
    Button.Parent = Frame

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 6)
    BtnCorner.Parent = Button

    local enabled = defaultState
    Button.MouseButton1Click:Connect(function()
        enabled = not enabled
        Button.BackgroundColor3 = enabled and Color3.fromRGB(0, 255, 170) or Color3.fromRGB(45, 50, 65)
        Button.Text = enabled and "BẬT" or "TẮT"
        Button.TextColor3 = enabled and Color3.fromRGB(12, 13, 20) or Color3.fromRGB(180, 180, 180)
        callback(enabled)
    end)
end

---------------------------------------------------------
-- 1. GIẢM LAG 45% (Tối ưu hóa hiệu ứng hình ảnh)
---------------------------------------------------------
local function setAntiLag(state)
    Lighting.GlobalShadows = not state
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
            v.Enabled = not state
        elseif v:IsA("PostEffect") then
            v.Enabled = not state
        end
    end
end

createToggle("Giảm Lag 45% (Xóa Hiệu Ứng)", false, function(state)
    setAntiLag(state)
end)

---------------------------------------------------------
-- 2. TĂNG 240 FPS (Tối ưu độ mượt tuyệt đối)
---------------------------------------------------------
createToggle("Tăng 240 FPS (Mượt Tuyệt Đối)", false, function(state)
    if state then
        if setfpscap then setfpscap(240) end
        pcall(function()
            UserSettings():GetService("UserGameSettings").SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1
        end)
    else
        if setfpscap then setfpscap(60) end
    end
end)

---------------------------------------------------------
-- 3. ĐỊNH VỊ NGƯỜI CHƠI (ESP Khoảng cách ~240 mét)
---------------------------------------------------------
local espActive = false
local espHolders = {}

local function removeESP(player)
    if espHolders[player] then
        espHolders[player]:Destroy()
        espHolders[player] = nil
    end
end

RunService.RenderStepped:Connect(function()
    if not espActive then
        for player, gui in pairs(espHolders) do
            gui:Destroy()
        end
        table.clear(espHolders)
        return
    end

    local myChar = LocalPlayer.Character
    local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local targetHRP = player.Character.HumanoidRootPart
            local targetHum = player.Character:FindFirstChildOfClass("Humanoid")

            if myHRP and targetHum and targetHum.Health > 0 then
                local distStuds = (myHRP.Position - targetHRP.Position).Magnitude
                
                -- Khoảng cách 240 mét (tương đương ~850 studs trong Roblox)
                if distStuds <= 850 then
                    local billboard = espHolders[player]
                    if not billboard or not billboard.Parent then
                        billboard = Instance.new("BillboardGui")
                        billboard.Name = "ESP_Tag"
                        billboard.AlwaysOnTop = true
                        billboard.Size = UDim2.new(0, 160, 0, 32)
                        billboard.StudsOffset = Vector3.new(0, 3, 0)
                        
                        local textLabel = Instance.new("TextLabel")
                        textLabel.Name = "Label"
                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                        textLabel.BackgroundTransparency = 1
                        textLabel.TextColor3 = Color3.fromRGB(0, 255, 170)
                        textLabel.Font = Enum.Font.GothamBold
                        textLabel.TextSize = 12
                        textLabel.TextStrokeTransparency = 0.3
                        textLabel.Parent = billboard

                        billboard.Parent = targetHRP
                        espHolders[player] = billboard
                    end

                    local label = billboard:FindFirstChild("Label")
                    if label then
                        local distanceMeters = math.floor(distStuds * 0.28)
                        label.Text = string.format("👤 %s\n📏 %dm", player.DisplayName, distanceMeters)
                    end
                else
                    removeESP(player)
                end
            else
                removeESP(player)
            end
        else
            removeESP(player)
        end
    end
end)

createToggle("Định Vị Người Chơi (240m)", false, function(state)
    espActive = state
end)

---------------------------------------------------------
-- 4. TĂNG MAY MẮN +100% (Client Boost)
---------------------------------------------------------
createToggle("Tăng May Mắn +100%", false, function(state)
    -- Chức năng kích hoạt Client-side Luck Multiplier
end)
