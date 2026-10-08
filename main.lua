-- LocalScript: ĐỒNG M NGUYÊN [ V1.0 ] - Professional Hub (Ảnh 2 Style)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local MarketplaceService = game:GetService("MarketplaceService")
local TeleportService = game:GetService("TeleportService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

---------------------------------------------------------
-- 1. QUÉT TÊN GAME ĐANG CHƠI (AUTO DETECT GAME)
---------------------------------------------------------
local currentGameName = "Đang quét..."
pcall(function()
    local productInfo = MarketplaceService:GetProductInfo(game.PlaceId)
    if productInfo and productInfo.Name then
        currentGameName = productInfo.Name
    else
        currentGameName = game.Name
    end
end)

---------------------------------------------------------
-- 2. HÀM QUÉT CẤP ĐỘ (LEVEL) THÔNG MINH (KHẮC PHỤC LỖI N/A)
---------------------------------------------------------
local function getLevel(player)
    if not player then return "N/A" end
    
    -- Quét Attribute
    local attrLevel = player:GetAttribute("Level") or player:GetAttribute("Lvl") or player:GetAttribute("LevelValue")
    if attrLevel then return tostring(attrLevel) end
    
    -- Thư mục chứa thông tin phổ biến
    local searchFolders = {
        player:FindFirstChild("leaderstats"),
        player:FindFirstChild("Data"),
        player:FindFirstChild("PlayerData"),
        player:FindFirstChild("DataFolder"),
        player:FindFirstChild("Stats")
    }
    
    for _, folder in pairs(searchFolders) do
        if folder then
            for _, child in pairs(folder:GetChildren()) do
                local nameLower = string.lower(child.Name)
                if (nameLower:find("level") or nameLower:find("lvl")) and (child:IsA("ValueBase") or child:IsA("NumberValue") or child:IsA("IntValue") or child:IsA("StringValue")) then
                    return tostring(child.Value)
                end
            end
        end
    end
    
    -- Quét toàn bộ con trực tiếp trong Player
    for _, child in pairs(player:GetChildren()) do
        local nameLower = string.lower(child.Name)
        if (nameLower:find("level") or nameLower:find("lvl")) and (child:IsA("ValueBase") or child:IsA("NumberValue") or child:IsA("IntValue")) then
            return tostring(child.Value)
        end
    end
    
    return "N/A"
end

---------------------------------------------------------
-- 3. CẤU HÌNH HỆ THỐNG
---------------------------------------------------------
local Config = {
    ESP_Enabled = false,
    MaxDistance = 20000,
    LagReduced = false,
    FPSBoosted = false
}

---------------------------------------------------------
-- 4. TẠO GIAO DIỆN CHÍNH (GUI PHONG CÁCH ÁNH 2)
---------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DongMNguyenHub_V2"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 520, 0, 320)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 20, 26)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(0, 180, 255)
MainStroke.Thickness = 1.2
MainStroke.Parent = MainFrame

-- Header Bar
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 35)
Header.BackgroundColor3 = Color3.fromRGB(12, 14, 18)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 10)
HeaderCorner.Parent = Header

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(0.6, 0, 1, 0)
TitleLabel.Position = UDim2.new(0, 12, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "ĐỒNG M NGUYÊN [ V1.0 ]"
TitleLabel.TextColor3 = Color3.fromRGB(0, 220, 255)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 15
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = Header

-- Nút Thu Nhỏ (-) & Đóng (X)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 24, 0, 24)
CloseBtn.Position = UDim2.new(1, -30, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 60)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.TextSize = 13
CloseBtn.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 5)
CloseCorner.Parent = CloseBtn

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 24, 0, 24)
MinimizeBtn.Position = UDim2.new(1, -58, 0, 5)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(45, 52, 68)
MinimizeBtn.Text = "-"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.Font = Enum.Font.SourceSansBold
MinimizeBtn.TextSize = 15
MinimizeBtn.Parent = Header

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 5)
MinCorner.Parent = MinimizeBtn

-- Nút Tròn ĐMN Nổi Đẹp
local CircleBtn = Instance.new("TextButton")
CircleBtn.Name = "CircleBtn_DMN"
CircleBtn.Size = UDim2.new(0, 55, 0, 55)
CircleBtn.Position = UDim2.new(0.02, 0, 0.2, 0)
CircleBtn.BackgroundColor3 = Color3.fromRGB(15, 22, 32)
CircleBtn.Text = "ĐMN"
CircleBtn.TextColor3 = Color3.fromRGB(0, 230, 255)
CircleBtn.Font = Enum.Font.SourceSansBold
CircleBtn.TextSize = 16
CircleBtn.Visible = false
CircleBtn.Active = true
CircleBtn.Parent = ScreenGui

local CircleCorner = Instance.new("UICorner")
CircleCorner.CornerRadius = UDim.new(1, 0)
CircleCorner.Parent = CircleBtn

local CircleStroke = Instance.new("UIStroke")
CircleStroke.Color = Color3.fromRGB(0, 200, 255)
CircleStroke.Thickness = 2
CircleStroke.Parent = CircleBtn

---------------------------------------------------------
-- 5. THÔNG BÁO CHẠY NGANG & GAME DETECT
---------------------------------------------------------
local TopInfoBar = Instance.new("Frame")
TopInfoBar.Size = UDim2.new(1, -20, 0, 26)
TopInfoBar.Position = UDim2.new(0, 10, 0, 42)
TopInfoBar.BackgroundColor3 = Color3.fromRGB(25, 30, 40)
TopInfoBar.Parent = MainFrame

local TopInfoCorner = Instance.new("UICorner")
TopInfoCorner.CornerRadius = UDim.new(0, 6)
TopInfoCorner.Parent = TopInfoBar

local GameText = Instance.new("TextLabel")
GameText.Size = UDim2.new(0.38, 0, 1, 0)
GameText.Position = UDim2.new(0, 8, 0, 0)
GameText.BackgroundTransparency = 1
GameText.Text = "🎮 " .. string.upper(currentGameName)
GameText.TextColor3 = Color3.fromRGB(255, 200, 80)
GameText.Font = Enum.Font.SourceSansBold
GameText.TextSize = 12
GameText.TextXAlignment = Enum.TextXAlignment.Left
GameText.Parent = TopInfoBar

-- Khung chứa thông báo chạy
local MarqueeFrame = Instance.new("Frame")
MarqueeFrame.Size = UDim2.new(0.6, 0, 1, 0)
MarqueeFrame.Position = UDim2.new(0.4, 0, 0, 0)
MarqueeFrame.BackgroundTransparency = 1
MarqueeFrame.ClipsDescendants = true
MarqueeFrame.Parent = TopInfoBar

local NoticeText = Instance.new("TextLabel")
NoticeText.Size = UDim2.new(0, 600, 1, 0)
NoticeText.Position = UDim2.new(1, 0, 0, 0)
NoticeText.BackgroundTransparency = 1
NoticeText.Text = "📢 BẠN ĐÃ KÍCH THÀNH CÔNG PHIÊN BẢN MỚI NHẤT                "
NoticeText.TextColor3 = Color3.fromRGB(0, 255, 170)
NoticeText.Font = Enum.Font.SourceSansBold
NoticeText.TextSize = 12
NoticeText.TextXAlignment = Enum.TextXAlignment.Left
NoticeText.Parent = MarqueeFrame

RunService.RenderStepped:Connect(function()
    if MainFrame.Visible then
        NoticeText.Position = NoticeText.Position - UDim2.new(0, 1.5, 0, 0)
        if NoticeText.AbsolutePosition.X + NoticeText.AbsoluteSize.X < MarqueeFrame.AbsolutePosition.X then
            NoticeText.Position = UDim2.new(1, 0, 0, 0)
        end
    end
end)

---------------------------------------------------------
-- 6. DANH MỤC SIDEBAR VÀ TRANG NỘI DUNG (GIỐNG ÁNH 2)
---------------------------------------------------------
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 140, 1, -80)
Sidebar.Position = UDim2.new(0, 10, 0, 74)
Sidebar.BackgroundColor3 = Color3.fromRGB(24, 28, 38)
Sidebar.Parent = MainFrame

local SideCorner = Instance.new("UICorner")
SideCorner.CornerRadius = UDim.new(0, 8)
SideCorner.Parent = Sidebar

local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -165, 1, -80)
ContentArea.Position = UDim2.new(0, 155, 0, 74)
ContentArea.BackgroundColor3 = Color3.fromRGB(24, 28, 38)
ContentArea.Parent = MainFrame

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 8)
ContentCorner.Parent = ContentArea

-- Quản lý Tabs
local Tabs = {}
local TabButtons = {}

local function createTab(name, icon)
    local page = Instance.new("ScrollingFrame")
    page.Size = UDim2.new(1, -12, 1, -12)
    page.Position = UDim2.new(0, 6, 0, 6)
    page.BackgroundTransparency = 1
    page.ScrollBarThickness = 3
    page.ScrollBarImageColor3 = Color3.fromRGB(0, 180, 255)
    page.Visible = false
    page.Parent = ContentArea
    
    local listLayout = Instance.new("UIListLayout")
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Padding = UDim.new(0, 8)
    listLayout.Parent = page
    
    Tabs[name] = page
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 32)
    btn.Position = UDim2.new(0.05, 0, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(32, 38, 52)
    btn.Text = "  " .. icon .. "  " .. name
    btn.TextColor3 = Color3.fromRGB(170, 185, 205)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 13
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = Sidebar
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    
    TabButtons[name] = btn
    
    btn.MouseButton1Click:Connect(function()
        for tabName, tabFrame in pairs(Tabs) do
            tabFrame.Visible = (tabName == name)
            TabButtons[tabName].BackgroundColor3 = (tabName == name) and Color3.fromRGB(0, 150, 220) or Color3.fromRGB(32, 38, 52)
            TabButtons[tabName].TextColor3 = (tabName == name) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(170, 185, 205)
        end
    end)
    
    return page
end

-- Tạo các Tab
local TabESP = createTab("Định Vị (ESP)", "🎯")
local TabOptimize = createTab("Tối Ưu / FPS", "⚡")
local TabServer = createTab("Máy Chủ", "🌐")

-- Mặc định chọn Tab 1
Tabs["Định Vị (ESP)"].Visible = true
TabButtons["Định Vị (ESP)"].BackgroundColor3 = Color3.fromRGB(0, 150, 220)
TabButtons["Định Vị (ESP)"].TextColor3 = Color3.fromRGB(255, 255, 255)

---------------------------------------------------------
-- 7. TẠO CÁC NÚT TÍNH NĂNG TRONG TAB (CÔNG TẮC / SLIDER)
---------------------------------------------------------
local function createToggle(parent, title, defaultState, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 38)
    frame.BackgroundColor3 = Color3.fromRGB(18, 22, 30)
    frame.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = title
    label.TextColor3 = Color3.fromRGB(220, 230, 245)
    label.Font = Enum.Font.SourceSans
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 42, 0, 22)
    toggleBtn.Position = UDim2.new(1, -50, 0.5, -11)
    toggleBtn.BackgroundColor3 = defaultState and Color3.fromRGB(0, 180, 100) or Color3.fromRGB(60, 65, 80)
    toggleBtn.Text = defaultState and "ON" or "OFF"
    toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleBtn.Font = Enum.Font.SourceSansBold
    toggleBtn.TextSize = 11
    toggleBtn.Parent = frame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 11)
    btnCorner.Parent = toggleBtn
    
    local state = defaultState
    toggleBtn.MouseButton1Click:Connect(function()
        state = not state
        toggleBtn.BackgroundColor3 = state and Color3.fromRGB(0, 180, 100) or Color3.fromRGB(60, 65, 80)
        toggleBtn.Text = state and "ON" or "OFF"
        callback(state)
    end)
end

-- Tab 1: ESP
createToggle(TabESP, "Định vị Người Chơi (ESP + Level)", Config.ESP_Enabled, function(val)
    Config.ESP_Enabled = val
end)

-- Ô nhập Khoảng cách ESP
local DistFrame = Instance.new("Frame")
DistFrame.Size = UDim2.new(1, 0, 0, 38)
DistFrame.BackgroundColor3 = Color3.fromRGB(18, 22, 30)
DistFrame.Parent = TabESP

local DistCorner = Instance.new("UICorner")
DistCorner.CornerRadius = UDim.new(0, 6)
DistCorner.Parent = DistFrame

local DistLabel = Instance.new("TextLabel")
DistLabel.Size = UDim2.new(0.6, 0, 1, 0)
DistLabel.Position = UDim2.new(0, 10, 0, 0)
DistLabel.BackgroundTransparency = 1
DistLabel.Text = "Tầm nhìn ESP (50 - 20000 studs):"
DistLabel.TextColor3 = Color3.fromRGB(220, 230, 245)
DistLabel.Font = Enum.Font.SourceSans
DistLabel.TextSize = 12
DistLabel.TextXAlignment = Enum.TextXAlignment.Left
DistLabel.Parent = DistFrame

local DistBox = Instance.new("TextBox")
DistBox.Size = UDim2.new(0, 70, 0, 24)
DistBox.Position = UDim2.new(1, -80, 0.5, -12)
DistBox.BackgroundColor3 = Color3.fromRGB(30, 38, 52)
DistBox.Text = tostring(Config.MaxDistance)
DistBox.TextColor3 = Color3.fromRGB(0, 230, 255)
DistBox.Font = Enum.Font.SourceSansBold
DistBox.TextSize = 13
DistBox.Parent = DistFrame

local DistBoxCorner = Instance.new("UICorner")
DistBoxCorner.CornerRadius = UDim.new(0, 4)
DistBoxCorner.Parent = DistBox

DistBox.FocusLost:Connect(function()
    local val = tonumber(DistBox.Text)
    if val then
        Config.MaxDistance = math.clamp(val, 50, 20000)
        DistBox.Text = tostring(Config.MaxDistance)
    else
        DistBox.Text = tostring(Config.MaxDistance)
    end
end)

-- Tab 2: Optimize
createToggle(TabOptimize, "Giảm Lag Vật Liệu (45%)", Config.LagReduced, function(val)
    Config.LagReduced = val
    if val then
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") then
                obj.Material = Enum.Material.SmoothPlastic
                obj.CastShadow = false
            elseif obj:IsA("Decal") or obj:IsA("Texture") then
                obj.Transparency = 1
            end
        end
    end
end)

createToggle(TabOptimize, "Mở Khóa 300 FPS & Optimize", Config.FPSBoosted, function(val)
    Config.FPSBoosted = val
    if val then
        if setfpscap then setfpscap(300) end
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    else
        if setfpscap then setfpscap(60) end
    end
end)

-- Tab 3: Server
local RejoinBtn = Instance.new("TextButton")
RejoinBtn.Size = UDim2.new(1, 0, 0, 36)
RejoinBtn.BackgroundColor3 = Color3.fromRGB(30, 80, 160)
RejoinBtn.Text = "🔄 Vào lại Server hiện tại (Rejoin)"
RejoinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
RejoinBtn.Font = Enum.Font.SourceSansBold
RejoinBtn.TextSize = 13
RejoinBtn.Parent = TabServer

local RejoinCorner = Instance.new("UICorner")
RejoinCorner.CornerRadius = UDim.new(0, 6)
RejoinCorner.Parent = RejoinBtn

RejoinBtn.MouseButton1Click:Connect(function()
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
end)

---------------------------------------------------------
-- 8. KÉO RÊ DI CHUYỂN & CHUYỂN ĐỔI ẨN/HIỆN
---------------------------------------------------------
local function makeDraggable(guiObject)
    local dragging, dragInput, dragStart, startPos
    guiObject.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = guiObject.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    guiObject.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            guiObject.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

makeDraggable(MainFrame)
makeDraggable(CircleBtn)

local function toggleUI()
    MainFrame.Visible = not MainFrame.Visible
    CircleBtn.Visible = not MainFrame.Visible
end

CloseBtn.MouseButton1Click:Connect(toggleUI)
MinimizeBtn.MouseButton1Click:Connect(toggleUI)
CircleBtn.MouseButton1Click:Connect(toggleUI)

---------------------------------------------------------
-- 9. CHẠY ESP ĐỊNH VỊ HIỂN THỊ TÊN + CẤP ĐỘ + KHOẢNG CÁCH
---------------------------------------------------------
local function createESP(player)
    if player == LocalPlayer then return end
    local function applyBillboard(character)
        if not character then return end
        local head = character:WaitForChild("Head", 5)
        if not head or head:FindFirstChild("ESP_Tag") then return end

        local bb = Instance.new("BillboardGui")
        bb.Name = "ESP_Tag"
        bb.Adornee = head
        bb.Size = UDim2.new(0, 200, 0, 50)
        bb.StudsOffset = Vector3.new(0, 2.8, 0)
        bb.AlwaysOnTop = true
        bb.Parent = head

        local txt = Instance.new("TextLabel")
        txt.Name = "Info"
        txt.Size = UDim2.new(1, 0, 1, 0)
        txt.BackgroundTransparency = 1
        txt.TextColor3 = Color3.fromRGB(0, 255, 170)
        txt.TextStrokeTransparency = 0
        txt.Font = Enum.Font.SourceSansBold
        txt.TextSize = 13
        txt.Parent = bb
    end

    if player.Character then applyBillboard(player.Character) end
    player.CharacterAdded:Connect(applyBillboard)
end

for _, p in pairs(Players:GetPlayers()) do createESP(p) end
Players.PlayerAdded:Connect(createESP)

RunService.RenderStepped:Connect(function()
    if not Config.ESP_Enabled then
        for _, p in pairs(Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("Head") then
                local tag = p.Character.Head:FindFirstChild("ESP_Tag")
                if tag then tag.Enabled = false end
            end
        end
        return
    end

    local myChar = LocalPlayer.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")

    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") and p.Character:FindFirstChild("HumanoidRootPart") then
            local tag = p.Character.Head:FindFirstChild("ESP_Tag")
            if tag and tag:FindFirstChild("Info") then
                if myRoot then
                    local dist = math.floor((myRoot.Position - p.Character.HumanoidRootPart.Position).Magnitude)
                    if dist <= Config.MaxDistance then
                        tag.Enabled = true
                        local levelStr = getLevel(p)
                        tag.Info.Text = string.format("[%s]\nCấp: %s | KC: %d Studs", p.DisplayName, levelStr, dist)
    else
                        tag.Enabled = false
                    end
                else
                    tag.Enabled = false
                end
            end
        end
    end
end)
