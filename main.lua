-- LocalScript: ĐỒNG M NGUYÊN [ V1.0 ] - Universal Hub
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local MarketplaceService = game:GetService("MarketplaceService")

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
-- 2. CẤU HÌNH HỆ THỐNG (SETTINGS)
---------------------------------------------------------
local Config = {
    ESP_Enabled = false,
    MaxDistance = 500, -- Khởi tạo mặc định 500 (Tùy chỉnh 50 - 20000)
    LagReduced = false,
    FPSBoosted = false
}

---------------------------------------------------------
-- 3. KHỞI TẠO GIAO DIỆN CHÍNH & NÚT TRÒN ĐMN
---------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DongMNnguyenHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Main Menu Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 360, 0, 370)
MainFrame.Position = UDim2.new(0.5, -180, 0.3, -185)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 18, 26)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(0, 200, 255)
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame

-- Header Bar
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 38)
Header.BackgroundColor3 = Color3.fromRGB(22, 27, 38)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 12)
HeaderCorner.Parent = Header

-- Tên Giao Diện
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -45, 1, 0)
TitleLabel.Position = UDim2.new(0, 12, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "ĐỒNG M NGUYÊN [ V1.0 ]"
TitleLabel.TextColor3 = Color3.fromRGB(0, 230, 255)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 16
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = Header

-- Nút Đóng GUI (X)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 26, 0, 26)
CloseBtn.Position = UDim2.new(1, -32, 0, 6)
CloseBtn.BackgroundColor3 = Color3.fromRGB(230, 50, 60)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.TextSize = 13
CloseBtn.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

-- Nút Tròn Nổi ĐMN Đẹp (Floating Circle Button)
local CircleBtn = Instance.new("TextButton")
CircleBtn.Name = "CircleBtn_DMN"
CircleBtn.Size = UDim2.new(0, 52, 0, 52)
CircleBtn.Position = UDim2.new(0.03, 0, 0.2, 0)
CircleBtn.BackgroundColor3 = Color3.fromRGB(15, 25, 40)
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
-- 4. HIỂN THỊ GAME ĐANG CHƠI & THÔNG BÁO CHẠY NGANG
---------------------------------------------------------
-- Label Hiển Thị Game Đang Chơi
local GameLabel = Instance.new("TextLabel")
GameLabel.Size = UDim2.new(0.9, 0, 0, 22)
GameLabel.Position = UDim2.new(0.05, 0, 0.12, 0)
GameLabel.BackgroundTransparency = 1
GameLabel.Text = "🎮 GAME: " .. string.upper(currentGameName)
GameLabel.TextColor3 = Color3.fromRGB(255, 200, 80)
GameLabel.Font = Enum.Font.SourceSansBold
GameLabel.TextSize = 13
GameLabel.TextXAlignment = Enum.TextXAlignment.Left
GameLabel.Parent = MainFrame

-- Khung Chứa Thông Báo Chạy Ngang (Marquee)
local NoticeFrame = Instance.new("Frame")
NoticeFrame.Size = UDim2.new(0.9, 0, 0, 26)
NoticeFrame.Position = UDim2.new(0.05, 0, 0.19, 0)
NoticeFrame.BackgroundColor3 = Color3.fromRGB(25, 30, 42)
NoticeFrame.ClipsDescendants = true
NoticeFrame.Parent = MainFrame

local NoticeCorner = Instance.new("UICorner")
NoticeCorner.CornerRadius = UDim.new(0, 6)
NoticeCorner.Parent = NoticeFrame

local NoticeText = Instance.new("TextLabel")
NoticeText.Size = UDim2.new(0, 700, 1, 0)
NoticeText.Position = UDim2.new(1, 0, 0, 0)
NoticeText.BackgroundTransparency = 1
NoticeText.Text = "📢 THÔNG BÁO: BẠN ĐÃ KÍCH THÀNH CÔNG PHIÊN BẢN MỚI NHẤT               "
NoticeText.TextColor3 = Color3.fromRGB(0, 255, 170)
NoticeText.Font = Enum.Font.SourceSansBold
NoticeText.TextSize = 13
NoticeText.TextXAlignment = Enum.TextXAlignment.Left
NoticeText.Parent = NoticeFrame

-- Vòng lặp chữ chạy ngang liên tục
RunService.RenderStepped:Connect(function()
    if MainFrame.Visible then
        NoticeText.Position = NoticeText.Position - UDim2.new(0, 2, 0, 0)
        if NoticeText.AbsolutePosition.X + NoticeText.AbsoluteSize.X < NoticeFrame.AbsolutePosition.X then
            NoticeText.Position = UDim2.new(1, 0, 0, 0)
        end
    end
end)

---------------------------------------------------------
-- 5. KÉO RÊ GIAO DIỆN & ĐỔI TRẠNG THÁI ẨN/HIỆN
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
CircleBtn.MouseButton1Click:Connect(toggleUI)

---------------------------------------------------------
-- 6. TÍNH NĂNG ĐỊNH VỊ (ESP), GIẢM LAG & TĂNG FPS
---------------------------------------------------------
-- Nút ESP
local ESPBtn = Instance.new("TextButton")
ESPBtn.Size = UDim2.new(0.9, 0, 0, 42)
ESPBtn.Position = UDim2.new(0.05, 0, 0.28, 0)
ESPBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
ESPBtn.Text = "Định vị Người Chơi (ESP): OFF"
ESPBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPBtn.Font = Enum.Font.SourceSansBold
ESPBtn.TextSize = 14
ESPBtn.Parent = MainFrame

local ESPCorner = Instance.new("UICorner")
ESPCorner.CornerRadius = UDim.new(0, 8)
ESPCorner.Parent = ESPBtn

-- Ô Chỉnh Khoảng Cách (50 - 20000)
local DistLabel = Instance.new("TextLabel")
DistLabel.Size = UDim2.new(0.5, 0, 0, 30)
DistLabel.Position = UDim2.new(0.05, 0, 0.41, 0)
DistLabel.BackgroundTransparency = 1
DistLabel.Text = "Tầm nhìn (50-20000 studs):"
DistLabel.TextColor3 = Color3.fromRGB(200, 210, 225)
DistLabel.Font = Enum.Font.SourceSans
DistLabel.TextSize = 13
DistLabel.TextXAlignment = Enum.TextXAlignment.Left
DistLabel.Parent = MainFrame

local DistBox = Instance.new("TextBox")
DistBox.Size = UDim2.new(0.35, 0, 0, 30)
DistBox.Position = UDim2.new(0.6, 0, 0.41, 0)
DistBox.BackgroundColor3 = Color3.fromRGB(28, 35, 50)
DistBox.Text = tostring(Config.MaxDistance)
DistBox.TextColor3 = Color3.fromRGB(0, 230, 255)
DistBox.Font = Enum.Font.SourceSansBold
DistBox.TextSize = 14
DistBox.Parent = MainFrame

local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 6)
BoxCorner.Parent = DistBox

DistBox.FocusLost:Connect(function()
    local val = tonumber(DistBox.Text)
    if val then
        Config.MaxDistance = math.clamp(val, 50, 20000)
        DistBox.Text = tostring(Config.MaxDistance)
    else
        DistBox.Text = tostring(Config.MaxDistance)
    end
end)

-- Nút Giảm Lag Vật Liệu 45%
local LagBtn = Instance.new("TextButton")
LagBtn.Size = UDim2.new(0.9, 0, 0, 42)
LagBtn.Position = UDim2.new(0.05, 0, 0.52, 0)
LagBtn.BackgroundColor3 = Color3.fromRGB(35, 42, 58)
LagBtn.Text = "Giảm Lag Vật Liệu (45%): OFF"
LagBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
LagBtn.Font = Enum.Font.SourceSansBold
LagBtn.TextSize = 14
LagBtn.Parent = MainFrame

local LagCorner = Instance.new("UICorner")
LagCorner.CornerRadius = UDim.new(0, 8)
LagCorner.Parent = LagBtn

-- Nút Tăng 300 FPS
local FPSBtn = Instance.new("TextButton")
FPSBtn.Size = UDim2.new(0.9, 0, 0, 42)
FPSBtn.Position = UDim2.new(0.05, 0, 0.66, 0)
FPSBtn.BackgroundColor3 = Color3.fromRGB(35, 42, 58)
FPSBtn.Text = "Mở Khóa 300 FPS & Optimize: OFF"
FPSBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FPSBtn.Font = Enum.Font.SourceSansBold
FPSBtn.TextSize = 14
FPSBtn.Parent = MainFrame

local FPSCorner = Instance.new("UICorner")
FPSCorner.CornerRadius = UDim.new(0, 8)
FPSCorner.Parent = FPSBtn

---------------------------------------------------------
-- LOGIC XỬ LÝ ESP & TỐI ƯU HÓA
---------------------------------------------------------
local function getLevel(player)
    if player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Level") then
        return tostring(player.leaderstats.Level.Value)
    elseif player:FindFirstChild("Data") and player.Data:FindFirstChild("Level") then
        return tostring(player.Data.Level.Value)
    end
    return "N/A"
end

local function createESP(player)
    if player == LocalPlayer then return end
    local function applyBillboard(character)
        if not character then return end
        local head = character:WaitForChild("Head", 5)
        if not head or head:FindFirstChild("ESP_Tag") then return end

        local bb = Instance.new("BillboardGui")
        bb.Name = "ESP_Tag"
        bb.Adornee = head
        bb.Size = UDim2.new(0, 180, 0, 50)
        bb.StudsOffset = Vector3.new(0, 2.5, 0)
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
                        tag.Info.Text = string.format("[%s]\nKC: %d Studs | Cấp: %s", p.DisplayName, dist, levelStr)
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

ESPBtn.MouseButton1Click:Connect(function()
    Config.ESP_Enabled = not Config.ESP_Enabled
    if Config.ESP_Enabled then
        ESPBtn.Text = "Định vị Người Chơi (ESP): ON"
        ESPBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
    else
        ESPBtn.Text = "Định vị Người Chơi (ESP): OFF"
        ESPBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
    end
end)

LagBtn.MouseButton1Click:Connect(function()
    Config.LagReduced = not Config.LagReduced
    if Config.LagReduced then
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") then
                obj.Material = Enum.Material.SmoothPlastic
                obj.CastShadow = false
            elseif obj:IsA("Decal") or obj:IsA("Texture") then
                obj.Transparency = 1
            elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") then
                obj.Enabled = false
            end
        end
        LagBtn.Text = "Giảm Lag Vật Liệu (45%): ĐÃ BẬT"
        LagBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
    else
        LagBtn.Text = "Giảm Lag Vật Liệu (45%): OFF"
        LagBtn.BackgroundColor3 = Color3.fromRGB(35, 42, 58)
    end
end)

FPSBtn.MouseButton1Click:Connect(function()
    Config.FPSBoosted = not Config.FPSBoosted
    if Config.FPSBoosted then
        if setfpscap then setfpscap(300) end
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        FPSBtn.Text = "Mở Khóa 300 FPS: ĐÃ BẬT"
        FPSBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
    else
        if setfpscap then setfpscap(60) end
        FPSBtn.Text = "Mở Khóa 300 FPS & Optimize: OFF"
        FPSBtn.BackgroundColor3 = Color3.fromRGB(35, 42, 58)
    end
end)
