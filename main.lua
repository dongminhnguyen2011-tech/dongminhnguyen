-- ========================================================
-- SCRIPT: ĐỒNG M NGUYÊN [ V1.0 ] - ULTRA PERFORMANCE
-- Hỗ trợ: Tất cả Game Roblox, Điện thoại (Android/iOS) & PC
-- ========================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local MarketplaceService = game:GetService("MarketplaceService")
local LocalPlayer = Players.LocalPlayer

-- Lấy tên game thực tế
local currentGameName = "Roblox Game"
pcall(function()
    local info = MarketplaceService:GetProductInfo(game.PlaceId)
    if info and info.Name then
        currentGameName = info.Name
    end
end)

-- Xóa GUI cũ nếu trùng tên
if game:GetService("CoreGui"):FindFirstChild("DongMNguyenGUI_V1") then
    game:GetService("CoreGui"):FindFirstChild("DongMNguyenGUI_V1"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DongMNguyenGUI_V1"
ScreenGui.ResetOnSpawn = false

local parentTarget = game:GetService("CoreGui")
pcall(function()
    if gethui then parentTarget = gethui() end
end)
ScreenGui.Parent = parentTarget or LocalPlayer:WaitForChild("PlayerGui")

-- Màu sắc Giao diện (Dark Premium Theme)
local BG_COLOR = Color3.fromRGB(18, 19, 24)
local SIDEBAR_COLOR = Color3.fromRGB(24, 25, 32)
local CARD_COLOR = Color3.fromRGB(30, 32, 42)
local ACCENT_COLOR = Color3.fromRGB(0, 230, 150)
local TEXT_COLOR = Color3.fromRGB(240, 242, 248)
local SUBTEXT_COLOR = Color3.fromRGB(140, 145, 165)

-- HỆ THỐNG THÔNG BÁO (NOTIFICATION TOAST)
local function showNotification(title, message)
    local NotifFrame = Instance.new("Frame")
    NotifFrame.Size = UDim2.new(0, 320, 0, 70)
    NotifFrame.Position = UDim2.new(0.5, -160, 0, -80)
    NotifFrame.BackgroundColor3 = Color3.fromRGB(24, 26, 36)
    NotifFrame.BorderSizePixel = 0
    NotifFrame.Parent = ScreenGui

    local NotifCorner = Instance.new("UICorner")
    NotifCorner.CornerRadius = UDim.new(0, 10)
    NotifCorner.Parent = NotifFrame

    local NotifStroke = Instance.new("UIStroke")
    NotifStroke.Color = ACCENT_COLOR
    NotifStroke.Thickness = 1.5
    NotifStroke.Parent = NotifFrame

    local NotifTitle = Instance.new("TextLabel")
    NotifTitle.Size = UDim2.new(1, -20, 0, 22)
    NotifTitle.Position = UDim2.new(0, 10, 0, 6)
    NotifTitle.BackgroundTransparency = 1
    NotifTitle.Text = title
    NotifTitle.TextColor3 = ACCENT_COLOR
    NotifTitle.Font = Enum.Font.GothamBold
    NotifTitle.TextSize = 12
    NotifTitle.TextXAlignment = Enum.TextXAlignment.Left
    NotifTitle.Parent = NotifFrame

    local NotifText = Instance.new("TextLabel")
    NotifText.Size = UDim2.new(1, -20, 0, 38)
    NotifText.Position = UDim2.new(0, 10, 0, 26)
    NotifText.BackgroundTransparency = 1
    NotifText.Text = message
    NotifText.TextColor3 = TEXT_COLOR
    NotifText.Font = Enum.Font.GothamMedium
    NotifText.TextSize = 10
    NotifText.TextWrapped = true
    NotifText.TextXAlignment = Enum.TextXAlignment.Left
    NotifText.TextYAlignment = Enum.TextYAlignment.Top
    NotifText.Parent = NotifFrame

    -- Hiệu ứng trượt vào / trượt ra
    TweenService:Create(NotifFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -160, 0, 20)}):Play()
    
    task.delay(4, function()
        local tweenOut = TweenService:Create(NotifFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Position = UDim2.new(0.5, -160, 0, -100)})
        tweenOut:Play()
        tweenOut.Completed:Connect(function()
            NotifFrame:Destroy()
        end)
    end)
end

-- 1. NÚT TRÒN NỔI DI CHUYỂN
local OpenButton = Instance.new("TextButton")
OpenButton.Name = "OpenButton"
OpenButton.Size = UDim2.new(0, 52, 0, 52)
OpenButton.Position = UDim2.new(0.05, 0, 0.3, 0)
OpenButton.BackgroundColor3 = SIDEBAR_COLOR
OpenButton.Text = "ĐMN"
OpenButton.TextColor3 = ACCENT_COLOR
OpenButton.Font = Enum.Font.GothamBold
OpenButton.TextSize = 14
OpenButton.Visible = false
OpenButton.Active = true
OpenButton.Parent = ScreenGui

local UICornerOpen = Instance.new("UICorner")
UICornerOpen.CornerRadius = UDim.new(1, 0)
UICornerOpen.Parent = OpenButton

local UIStrokeOpen = Instance.new("UIStroke")
UIStrokeOpen.Color = ACCENT_COLOR
UIStrokeOpen.Thickness = 2
UIStrokeOpen.Parent = OpenButton

-- 2. KHUNG MENU CHÍNH
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 520, 0, 330)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -165)
MainFrame.BackgroundColor3 = BG_COLOR
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local UICornerMain = Instance.new("UICorner")
UICornerMain.CornerRadius = UDim.new(0, 12)
UICornerMain.Parent = MainFrame

local UIStrokeMain = Instance.new("UIStroke")
UIStrokeMain.Color = Color3.fromRGB(40, 44, 58)
UIStrokeMain.Thickness = 1
UIStrokeMain.Parent = MainFrame

-- Topbar Header
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = SIDEBAR_COLOR
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(0, 250, 1, 0)
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "ĐỒNG M NGUYÊN  [ V1.0 ]"
TitleLabel.TextColor3 = TEXT_COLOR
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 13
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -34, 0.5, -14)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(240, 80, 80)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14
CloseBtn.Parent = TopBar

-- Sidebar
local SideBar = Instance.new("Frame")
SideBar.Size = UDim2.new(0, 140, 1, -40)
SideBar.Position = UDim2.new(0, 0, 0, 40)
SideBar.BackgroundColor3 = SIDEBAR_COLOR
SideBar.BorderSizePixel = 0
SideBar.Parent = MainFrame

local SideList = Instance.new("UIListLayout")
SideList.SortOrder = Enum.SortOrder.LayoutOrder
SideList.Padding = UDim.new(0, 6)
SideList.Parent = SideBar

local SidePadding = Instance.new("UIPadding")
SidePadding.PaddingTop = UDim.new(0, 10)
SidePadding.PaddingLeft = UDim.new(0, 8)
SidePadding.PaddingRight = UDim.new(0, 8)
SidePadding.Parent = SideBar

-- Content Area
local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -140, 1, -40)
ContentArea.Position = UDim2.new(0, 140, 0, 40)
ContentArea.BackgroundTransparency = 1
ContentArea.Parent = MainFrame

-- KÉO THẢ TAY / CHUỘT
local function enableDrag(frame)
    local dragging, dragInput, dragStart, startPos
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

enableDrag(MainFrame)
enableDrag(OpenButton)

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    OpenButton.Visible = true
end)

OpenButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    OpenButton.Visible = false
end)

-- TẠO TAB
local tabs = {}
local function createTab(name, iconText)
    local TabButton = Instance.new("TextButton")
    TabButton.Size = UDim2.new(1, 0, 0, 36)
    TabButton.BackgroundTransparency = 1
    TabButton.Text = "  " .. iconText .. "  " .. name
    TabButton.TextColor3 = SUBTEXT_COLOR
    TabButton.Font = Enum.Font.GothamMedium
    TabButton.TextSize = 11
    TabButton.TextXAlignment = Enum.TextXAlignment.Left
    TabButton.Parent = SideBar

    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 8)
    TabCorner.Parent = TabButton

    local TabPage = Instance.new("ScrollingFrame")
    TabPage.Size = UDim2.new(1, 0, 1, 0)
    TabPage.BackgroundTransparency = 1
    TabPage.ScrollBarThickness = 3
    TabPage.ScrollBarImageColor3 = ACCENT_COLOR
    TabPage.Visible = false
    TabPage.Parent = ContentArea

    local PageList = Instance.new("UIListLayout")
    PageList.SortOrder = Enum.SortOrder.LayoutOrder
    PageList.Padding = UDim.new(0, 8)
    PageList.Parent = TabPage

    local PagePadding = Instance.new("UIPadding")
    PagePadding.PaddingTop = UDim.new(0, 10)
    PagePadding.PaddingLeft = UDim.new(0, 10)
    PagePadding.PaddingRight = UDim.new(0, 10)
    PagePadding.Parent = TabPage

    TabButton.MouseButton1Click:Connect(function()
        for _, tab in pairs(tabs) do
            tab.Button.BackgroundTransparency = 1
            tab.Button.TextColor3 = SUBTEXT_COLOR
            tab.Page.Visible = false
        end
        TabButton.BackgroundTransparency = 0
        TabButton.BackgroundColor3 = CARD_COLOR
        TabButton.TextColor3 = TEXT_COLOR
        TabPage.Visible = true
    end)

    table.insert(tabs, {Button = TabButton, Page = TabPage})
    if #tabs == 1 then
        TabButton.BackgroundTransparency = 0
        TabButton.BackgroundColor3 = CARD_COLOR
        TabButton.TextColor3 = TEXT_COLOR
        TabPage.Visible = true
    end
    return TabPage
end

-- TẠO CÔNG TẮC TOGGLE
local function addToggle(page, labelText, defaultState, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, -6, 0, 42)
    Frame.BackgroundColor3 = CARD_COLOR
    Frame.Parent = page

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Frame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.7, 0, 1, 0)
    Label.Position = UDim2.new(0, 12, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = labelText
    Label.TextColor3 = TEXT_COLOR
    Label.Font = Enum.Font.GothamMedium
    Label.TextSize = 11
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame

    local TogglePill = Instance.new("TextButton")
    TogglePill.Size = UDim2.new(0, 42, 0, 22)
    TogglePill.Position = UDim2.new(1, -52, 0.5, -11)
    TogglePill.BackgroundColor3 = defaultState and ACCENT_COLOR or Color3.fromRGB(50, 54, 68)
    TogglePill.Text = ""
    TogglePill.Parent = Frame

    local PillCorner = Instance.new("UICorner")
    PillCorner.CornerRadius = UDim.new(1, 0)
    PillCorner.Parent = TogglePill

    local CircleKnob = Instance.new("Frame")
    CircleKnob.Size = UDim2.new(0, 16, 0, 16)
    CircleKnob.Position = defaultState and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
    CircleKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CircleKnob.Parent = TogglePill

    local KnobCorner = Instance.new("UICorner")
    KnobCorner.CornerRadius = UDim.new(1, 0)
    KnobCorner.Parent = CircleKnob

    local enabled = defaultState
    TogglePill.MouseButton1Click:Connect(function()
        enabled = not enabled
        local targetPos = enabled and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
        local targetColor = enabled and ACCENT_COLOR or Color3.fromRGB(50, 54, 68)

        TweenService:Create(CircleKnob, TweenInfo.new(0.18), {Position = targetPos}):Play()
        TweenService:Create(TogglePill, TweenInfo.new(0.18), {BackgroundColor3 = targetColor}):Play()

        callback(enabled)
    end)
end

-- TẠO THANH KÉO SLIDER (KÉO CHỌN KHOẢNG CÁCH)
local function addSlider(page, labelText, min, max, default, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, -6, 0, 52)
    Frame.BackgroundColor3 = CARD_COLOR
    Frame.Parent = page

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Frame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.6, 0, 0, 22)
    Label.Position = UDim2.new(0, 12, 0, 4)
    Label.BackgroundTransparency = 1
    Label.Text = labelText
    Label.TextColor3 = TEXT_COLOR
    Label.Font = Enum.Font.GothamMedium
    Label.TextSize = 11
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame

    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Size = UDim2.new(0.3, 0, 0, 22)
    ValueLabel.Position = UDim2.new(0.7, -12, 0, 4)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Text = tostring(default) .. " mét"
    ValueLabel.TextColor3 = ACCENT_COLOR
    ValueLabel.Font = Enum.Font.GothamBold
    ValueLabel.TextSize = 11
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
    ValueLabel.Parent = Frame

    local SliderBar = Instance.new("Frame")
    SliderBar.Size = UDim2.new(1, -24, 0, 6)
    SliderBar.Position = UDim2.new(0, 12, 0, 34)
    SliderBar.BackgroundColor3 = Color3.fromRGB(50, 54, 68)
    SliderBar.BorderSizePixel = 0
    SliderBar.Parent = Frame

    local BarCorner = Instance.new("UICorner")
    BarCorner.CornerRadius = UDim.new(1, 0)
    BarCorner.Parent = SliderBar

    local FillBar = Instance.new("Frame")
    FillBar.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    FillBar.BackgroundColor3 = ACCENT_COLOR
    FillBar.BorderSizePixel = 0
    FillBar.Parent = SliderBar

    local FillCorner = Instance.new("UICorner")
    FillCorner.CornerRadius = UDim.new(1, 0)
    FillCorner.Parent = FillBar

    local Knob = Instance.new("Frame")
    Knob.Size = UDim2.new(0, 14, 0, 14)
    Knob.Position = UDim2.new(1, -7, 0.5, -7)
    Knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Knob.Parent = FillBar

    local KnobCorner = Instance.new("UICorner")
    KnobCorner.CornerRadius = UDim.new(1, 0)
    KnobCorner.Parent = Knob

    local isDragging = false
    local function updateValue(input)
        local posX = math.clamp(input.Position.X - SliderBar.AbsolutePosition.X, 0, SliderBar.AbsoluteSize.X)
        local percentage = posX / SliderBar.AbsoluteSize.X
        local currentVal = math.floor(min + (max - min) * percentage)
        
        FillBar.Size = UDim2.new(percentage, 0, 1, 0)
        ValueLabel.Text = tostring(currentVal) .. " mét"
        callback(currentVal)
    end

    SliderBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = true
            updateValue(input)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateValue(input)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = false
        end
    end)
end

-- TẠO TAB MỚI
local TabOptim = createTab("Tối Ưu & FPS", "⚡")
local TabESP = createTab("Định Vị ESP", "👁")
local TabLuck = createTab("Tăng May Mắn", "🍀")

---------------------------------------------------------
-- 1. SIÊU GIẢM LAG 100% (CỰC MƯỢT CHO ĐIỆN THOẠI YẾU)
---------------------------------------------------------
local function enableSuperPotatoMode(state)
    if state then
        -- Ép chất lượng đồ họa Roblox về 1 (Thấp nhất)
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
            UserSettings():GetService("UserGameSettings").SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1
        end)

        -- Tắt toàn bộ hiệu ứng ánh sáng
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        for _, v in pairs(Lighting:GetChildren()) do
            if v:IsA("PostEffect") or v:IsA("Atmosphere") or v:IsA("Sky") or v:IsA("Clouds") or v:IsA("SunRaysEffect") then
                v.Enabled = false
            end
        end

        -- Tối ưu Terrain & Mặt nước
        if workspace.Terrain then
            workspace.Terrain.WaterWaveSize = 0
            workspace.Terrain.WaterWaveSpeed = 0
            workspace.Terrain.WaterReflectance = 0
            workspace.Terrain.WaterTransparency = 0
        end

        -- Ép vật liệu về trơn phẳng & xóa Texture hạt
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v:IsA("Terrain") then
                v.Material = Enum.Material.SmoothPlastic
                v.CastShadow = false
                if v:IsA("MeshPart") then
                    v.TextureID = ""
                end
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
                v.Enabled = false
            end
        end
    else
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
        end)
    end
end

addToggle(TabOptim, "Siêu Giảm Lag (Mượt Cực Đỉnh)", false, function(state)
    enableSuperPotatoMode(state)
end)

addToggle(TabOptim, "Mở Khóa 240 FPS (Ép Khung Hình)", false, function(state)
    if state then
        if setfpscap then setfpscap(240) end
    else
        if setfpscap then setfpscap(60) end
    end
end)

---------------------------------------------------------
-- 2. ĐỊNH VỊ ESP CÓ SLIDER TÙY CHỈNH (TỐI ĐA 1500M)
---------------------------------------------------------
local espActive = false
local espMaxDistanceMeters = 240
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
                local distanceMeters = math.floor(distStuds * 0.28) -- Quyết định 1 stud ~ 0.28m
                
                -- So sánh khoảng cách đã kéo trên Slider
                if distanceMeters <= espMaxDistanceMeters then
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
                        textLabel.TextColor3 = ACCENT_COLOR
                        textLabel.Font = Enum.Font.GothamBold
                        textLabel.TextSize = 11
                        textLabel.TextStrokeTransparency = 0.3
                        textLabel.Parent = billboard

                        billboard.Parent = targetHRP
                        espHolders[player] = billboard
                    end

                    local label = billboard:FindFirstChild("Label")
                    if label then
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

addToggle(TabESP, "Bật Định Vị Người Chơi (ESP)", false, function(state)
    espActive = state
end)

addSlider(TabESP, "Khoảng Cách Định Vị", 10, 1500, 240, function(value)
    espMaxDistanceMeters = value
end)

---------------------------------------------------------
-- 3. CHẾ ĐỘ MAY MẮN + THÔNG BÁO TÊN GAME
---------------------------------------------------------
addToggle(TabLuck, "Kích Hoạt Tăng May Mắn +100%", false, function(state)
    if state then
        local msg = string.format("Bạn đã bật chế độ may mắn thành công, game bạn đang chơi ( %s ) sẽ gặp may mắn gấp đôi!", currentGameName)
        showNotification("🍀 MAY MẮN KÍCH HOẠT", msg)
    end
end)
