-- LocalScript: ĐỒNG M NGUYÊN [ V1.0 ] - Universal All-In-One Hub
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
-- 2. HÀM QUÉT CẤP ĐỘ (LEVEL) SIÊU THÔNG MINH (SỬA LỖI N/A)
---------------------------------------------------------
local function getLevel(player)
    if not player then return nil end
    
    -- Tầng 1: Quét Attribute
    for _, attr in ipairs({"Level", "Lvl", "LVL", "Cấp", "Stage"}) do
        local val = player:GetAttribute(attr)
        if val then return tostring(val) end
    end
    
    -- Tầng 2: Quét thư mục chứa dữ liệu (leaderstats, Data, PlayerData, Stats)
    local folders = {"leaderstats", "Data", "PlayerData", "DataFolder", "Stats", "PlayerStats"}
    for _, fName in ipairs(folders) do
        local folder = player:FindFirstChild(fName)
        if folder then
            for _, child in pairs(folder:GetChildren()) do
                local nameLower = string.lower(child.Name)
                if (nameLower:find("level") or nameLower:find("lvl") or nameLower:find("cap")) and (child:IsA("ValueBase") or child:IsA("NumberValue") or child:IsA("IntValue") or child:IsA("StringValue")) then
                    return tostring(child.Value)
                end
            end
        end
    end
    
    -- Tầng 3: Quét con trực tiếp trong Player
    for _, child in pairs(player:GetChildren()) do
        local nameLower = string.lower(child.Name)
        if (nameLower:find("level") or nameLower:find("lvl")) and (child:IsA("ValueBase") or child:IsA("NumberValue") or child:IsA("IntValue")) then
            return tostring(child.Value)
        end
    end
    
    -- Tầng 4: Quét GUI/Overhead trên đầu nhân vật (Chuyên dụng cho Blox Fruits & Anime Game)
    if player.Character then
        local head = player.Character:FindFirstChild("Head") or player.Character:FindFirstChild("HumanoidRootPart")
        if head then
            for _, gui in pairs(head:GetDescendants()) do
                if gui:IsA("TextLabel") or gui:IsA("TextBox") then
                    local txt = gui.Text
                    local lvlNum = txt:match("[L|l][V|v]%.?%s*(%d+)") or txt:match("[L|l]evel%s*(%d+)") or txt:match("%[(%d+)%]")
                    if lvlNum then
                        return lvlNum
                    end
                end
            end
        end
    end
    
    return nil -- Không tìm thấy cấp độ thì ẩn đi chứ không hiện N/A
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
-- 4. TẠO GIAO DIỆN CHÍNH (MAIN FRAME)
---------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DongMNnguyenHub_V3"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 380, 0, 400)
MainFrame.Position = UDim2.new(0.5, -190, 0.4, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 18, 26)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
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
HeaderCorner.CornerRadius = UDim.new(0, 10)
HeaderCorner.Parent = Header

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(0.7, 0, 1, 0)
TitleLabel.Position = UDim2.new(0, 12, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "ĐỒNG M NGUYÊN [ V1.0 ]"
TitleLabel.TextColor3 = Color3.fromRGB(0, 230, 255)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 16
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = Header

-- Nút Đóng (X)
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

-- Nút Tròn ĐMN Nổi Bật
local CircleBtn = Instance.new("TextButton")
CircleBtn.Name = "CircleBtn_DMN"
CircleBtn.Size = UDim2.new(0, 55, 0, 55)
CircleBtn.Position = UDim2.new(0.03, 0, 0.25, 0)
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
-- 5. HIỂN THỊ GAME ĐANG CHƠI & THÔNG BÁO CHẠY NGANG
---------------------------------------------------------
local TopInfoBar = Instance.new("Frame")
TopInfoBar.Size = UDim2.new(0.92, 0, 0, 28)
TopInfoBar.Position = UDim2.new(0.04, 0, 0.11, 0)
TopInfoBar.BackgroundColor3 = Color3.fromRGB(25, 30, 42)
TopInfoBar.Parent = MainFrame

local TopInfoCorner = Instance.new("UICorner")
TopInfoCorner.CornerRadius = UDim.new(0, 6)
TopInfoCorner.Parent = TopInfoBar

local GameText = Instance.new("TextLabel")
GameText.Size = UDim2.new(0.42, 0, 1, 0)
GameText.Position = UDim2.new(0, 8, 0, 0)
GameText.BackgroundTransparency = 1
GameText.Text = "🎮 " .. string.upper(currentGameName)
GameText.TextColor3 = Color3.fromRGB(255, 200, 80)
GameText.Font = Enum.Font.SourceSansBold
GameText.TextSize = 12
GameText.TextXAlignment = Enum.TextXAlignment.Left
GameText.Parent = TopInfoBar

-- Khung thông báo chữ chạy
local MarqueeFrame = Instance.new("Frame")
MarqueeFrame.Size = UDim2.new(0.55, 0, 1, 0)
MarqueeFrame.Position = UDim2.new(0.45, 0, 0, 0)
MarqueeFrame.BackgroundTransparency = 1
MarqueeFrame.ClipsDescendants = true
MarqueeFrame.Parent = TopInfoBar

local NoticeText = Instance.new("TextLabel")
NoticeText.Size = UDim2.new(0, 600, 1, 0)
NoticeText.Position = UDim2.new(1, 0, 0, 0)
NoticeText.BackgroundTransparency = 1
NoticeText.Text = "📢 THÔNG BÁO: BẠN ĐÃ KÍCH THÀNH CÔNG PHIÊN BẢN MỚI NHẤT                "
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
-- 6. KHUNG CUỘN CHÍNH CHỨA TẤT CẢ TÍNH NĂNG (SCROLL)
---------------------------------------------------------
local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Size = UDim2.new(0.92, 0, 0.78, 0)
ScrollFrame.Position = UDim2.new(0.04, 0, 0.2, 0)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.ScrollBarThickness = 4
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 200, 255)
ScrollFrame.Parent = MainFrame

local UIList = Instance.new("UIListLayout")
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 10)
UIList.Parent = ScrollFrame

UIList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, UIList.AbsoluteContentSize.Y + 15)
end)

-- Hàm Tạo Button Toggle On/Off
local function createToggleButton(title, defaultState, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -6, 0, 42)
    btn.BackgroundColor3 = defaultState and Color3.fromRGB(40, 180, 80) or Color3.fromRGB(35, 42, 58)
    btn.Text = title .. (defaultState and ": ON" or ": OFF")
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 14
    btn.Parent = ScrollFrame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    
    local state = defaultState
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.BackgroundColor3 = state and Color3.fromRGB(40, 180, 80) or Color3.fromRGB(35, 42, 58)
        btn.Text = title .. (state and ": ON" or ": OFF")
        callback(state)
    end)
    return btn
end

---------------------------------------------------------
-- 7. THÊM ĐẦY ĐỦ TÍNH NĂNG VÀO TRANG CHÍNH
---------------------------------------------------------

-- 1. Nút ESP
createToggleButton("🎯 Định vị Người Chơi (ESP)", Config.ESP_Enabled, function(val)
    Config.ESP_Enabled = val
end)

-- 2. Ô Chỉnh Tầm Nhìn
local DistBoxFrame = Instance.new("Frame")
DistBoxFrame.Size = UDim2.new(1, -6, 0, 38)
DistBoxFrame.BackgroundColor3 = Color3.fromRGB(24, 30, 42)
DistBoxFrame.Parent = ScrollFrame

local DistCorner = Instance.new("UICorner")
DistCorner.CornerRadius = UDim.new(0, 8)
DistCorner.Parent = DistBoxFrame

local DistLabel = Instance.new("TextLabel")
DistLabel.Size = UDim2.new(0.65, 0, 1, 0)
DistLabel.Position = UDim2.new(0, 10, 0, 0)
DistLabel.BackgroundTransparency = 1
DistLabel.Text = "📏 Tầm nhìn (50 - 20000 studs):"
DistLabel.TextColor3 = Color3.fromRGB(200, 215, 235)
DistLabel.Font = Enum.Font.SourceSans
DistLabel.TextSize = 13
DistLabel.TextXAlignment = Enum.TextXAlignment.Left
DistLabel.Parent = DistBoxFrame

local DistBox = Instance.new("TextBox")
DistBox.Size = UDim2.new(0, 80, 0, 26)
DistBox.Position = UDim2.new(1, -90, 0.5, -13)
DistBox.BackgroundColor3 = Color3.fromRGB(35, 45, 62)
DistBox.Text = tostring(Config.MaxDistance)
DistBox.TextColor3 = Color3.fromRGB(0, 230, 255)
DistBox.Font = Enum.Font.SourceSansBold
DistBox.TextSize = 14
DistBox.Parent = DistBoxFrame

local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 5)
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

-- 3. Nút Giảm Lag 45%
createToggleButton("⚡ Giảm Lag Vật Liệu (45%)", Config.LagReduced, function(val)
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

-- 4. Nút Tăng 300 FPS
createToggleButton("🚀 Mở Khóa 300 FPS & Max Optimize", Config.FPSBoosted, function(val)
    Config.FPSBoosted = val
    if val then
        if setfpscap then setfpscap(300) end
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    else
        if setfpscap then setfpscap(60) end
    end
end)

-- 5. Nút Rejoin Server
local RejoinBtn = Instance.new("TextButton")
RejoinBtn.Size = UDim2.new(1, -6, 0, 42)
RejoinBtn.BackgroundColor3 = Color3.fromRGB(30, 90, 180)
RejoinBtn.Text = "🔄 Vào lại Server hiện tại (Rejoin)"
RejoinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
RejoinBtn.Font = Enum.Font.SourceSansBold
RejoinBtn.TextSize = 14
RejoinBtn.Parent = ScrollFrame

local RejoinCorner = Instance.new("UICorner")
RejoinCorner.CornerRadius = UDim.new(0, 8)
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
CircleBtn.MouseButton1Click:Connect(toggleUI)

---------------------------------------------------------
-- 9. LOGIC HIỂN THỊ ESP ĐỊNH VỊ CHÍNH XÁC
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
                        local lvl = getLevel(p)
                        if lvl then
                            tag.Info.Text = string.format("[%s]\nCấp: %s | KC: %d Studs", p.DisplayName, lvl, dist)
                        else
                            tag.Info.Text = string.format("[%s]\nKC: %d Studs", p.DisplayName, dist)
                        end
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
