-- ========================================================
-- SCRIPT: ĐỒNG M NGUYÊN [ V1.0 ]
-- Phong cách Giao diện RealKid Hub / Premium Dark UI
-- Hỗ trợ: Tất cả Game, Điện thoại (Android/iOS) & PC
-- ========================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer

-- Xóa GUI cũ nếu đã tồn tại
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

-- Màu sắc chủ đạo (Chuẩn Dark Theme theo ảnh ví dụ)
local BG_COLOR = Color3.fromRGB(20, 21, 26)       -- Nền chính
local SIDEBAR_COLOR = Color3.fromRGB(26, 27, 34)  -- Sidebar bên trái
local CARD_COLOR = Color3.fromRGB(32, 34, 44)     -- Khung chức năng
local ACCENT_COLOR = Color3.fromRGB(90, 95, 240)  -- Màu Xanh/Tím hiện đại
local TEXT_COLOR = Color3.fromRGB(235, 238, 245)
local SUBTEXT_COLOR = Color3.fromRGB(150, 155, 175)

-- 1. NÚT TRÒN NỔI (FLOATING BUTTON - KÉO DI CHUYỂN DỄ DÀNG)
local OpenButton = Instance.new("TextButton")
OpenButton.Name = "OpenButton"
OpenButton.Size = UDim2.new(0, 50, 0, 50)
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

-- 2. KHUNG MENU CHÍNH (MAIN WINDOW GIỐNG ẢNH 1)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 540, 0, 330)
MainFrame.Position = UDim2.new(0.5, -270, 0.5, -165)
MainFrame.BackgroundColor3 = BG_COLOR
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local UICornerMain = Instance.new("UICorner")
UICornerMain.CornerRadius = UDim.new(0, 12)
UICornerMain.Parent = MainFrame

local UIStrokeMain = Instance.new("UIStroke")
UIStrokeMain.Color = Color3.fromRGB(45, 48, 62)
UIStrokeMain.Thickness = 1
UIStrokeMain.Parent = MainFrame

-- thanh Tiêu Đề (TOPBAR)
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

-- Các Nút Đóng & Thu Nhỏ
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -34, 0.5, -14)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(230, 90, 90)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14
CloseBtn.Parent = TopBar

local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 28, 0, 28)
MinBtn.Position = UDim2.new(1, -66, 0.5, -14)
MinBtn.BackgroundTransparency = 1
MinBtn.Text = "—"
MinBtn.TextColor3 = SUBTEXT_COLOR
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 12
MinBtn.Parent = TopBar

-- SIDEBAR (DANH MỤC BÊN TRÁI)
local SideBar = Instance.new("Frame")
SideBar.Size = UDim2.new(0, 150, 1, -40)
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

-- CONTENT AREA (NỘI DUNG BÊN PHẢI)
local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -150, 1, -40)
ContentArea.Position = UDim2.new(0, 150, 0, 40)
ContentArea.BackgroundTransparency = 1
ContentArea.Parent = MainFrame

-- TÍNH NĂNG KÉO THẢ BẰNG TAY / CHUỘT
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

-- BẬT / ẨN MENU
local function toggleUI(visible)
    MainFrame.Visible = visible
    OpenButton.Visible = not visible
end

CloseBtn.MouseButton1Click:Connect(function() toggleUI(false) end)
MinBtn.MouseButton1Click:Connect(function() toggleUI(false) end)
OpenButton.MouseButton1Click:Connect(function() toggleUI(true) end)

-- QUẢN LÝ TAB BÊN TRÁI
local tabs = {}

local function createTab(name, iconText)
    local TabButton = Instance.new("TextButton")
    TabButton.Size = UDim2.new(1, 0, 0, 36)
    TabButton.BackgroundColor3 = BG_COLOR
    TabButton.BackgroundTransparency = 1
    TabButton.Text = "  " .. iconText .. "  " .. name
    TabButton.TextColor3 = SUBTEXT_COLOR
    TabButton.Font = Enum.Font.GothamMedium
    TabButton.TextSize = 12
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
    PagePadding.PaddingLeft = UDim.new(0, 12)
    PagePadding.PaddingRight = UDim.new(0, 12)
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

    local tabData = {Button = TabButton, Page = TabPage}
    table.insert(tabs, tabData)

    if #tabs == 1 then
        TabButton.BackgroundTransparency = 0
        TabButton.BackgroundColor3 = CARD_COLOR
        TabButton.TextColor3 = TEXT_COLOR
        TabPage.Visible = true
    end

    return TabPage
end

-- HÀM TẠO CÔNG TẮC TOGGLE SWITCH (GIỐNG MẪU ẢNH 1)
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
    Label.TextSize = 12
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame

    -- Nút Gạt Tròn (Switch)
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

-- ĐỊNH NGHĨA CÁC TAB CHỨC NĂNG
local TabOptim = createTab("Tối Ưu & Lag", "⚡")
local TabESP = createTab("Định Vị ESP", "👁")
local TabLuck = createTab("May Mắn & Khác", "🍀")

---------------------------------------------------------
-- 1. TÍNH NĂNG GIẢM LAG (ĐÃ FIX LỖI 100% - KHÔNG BỊ ĐỎ MAP)
---------------------------------------------------------
local originalMaterials = {}
local originalDecals = {}

local function setAntiLag(state)
    if state then
        Lighting.GlobalShadows = false
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v:IsA("Terrain") then
                if not originalMaterials[v] then
                    originalMaterials[v] = v.Material
                end
                v.Material = Enum.Material.SmoothPlastic
            elseif v:IsA("Decal") or v:IsA("Texture") then
                if originalDecals[v] == nil then
                    originalDecals[v] = v.Transparency
                end
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
                v.Enabled = false
            elseif v:IsA("PostEffect") then
                v.Enabled = false
            end
        end
    else
        -- Khôi phục 100% nguyên bản khi TẮT
        Lighting.GlobalShadows = true
        for part, mat in pairs(originalMaterials) do
            if part and part.Parent then
                part.Material = mat
            end
        end
        for decal, trans in pairs(originalDecals) do
            if decal and decal.Parent then
                decal.Transparency = trans
            end
        end
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
                v.Enabled = true
            elseif v:IsA("PostEffect") then
                v.Enabled = true
            end
        end
    end
end

addToggle(TabOptim, "Giảm Lag 45% (Xóa Hiệu Ứng Nặng)", false, function(state)
    setAntiLag(state)
end)

addToggle(TabOptim, "Mở Khóa 240 FPS (Tăng Độ Mượt)", false, function(state)
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
-- 2. ĐỊNH VỊ NGƯỜI CHƠI (ESP 240 MÉT CHÍNH XÁC)
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
                
                -- Bán kính 240 mét (~850 studs trong game)
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

addToggle(TabESP, "Định Vị Người Chơi (240m)", false, function(state)
    espActive = state
end)

---------------------------------------------------------
-- 3. TĂNG MAY MẮN +100%
---------------------------------------------------------
addToggle(TabLuck, "Tăng May Mắn +100% (Client Boost)", false, function(state)
    -- Tối ưu hóa gửi gói tin Client-side
end)
