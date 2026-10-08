-- LocalScript: ĐỒNG M NGUYÊN [ V1.0 ] - Smooth & Reversible Ultra Optimizer
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local MarketplaceService = game:GetService("MarketplaceService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

---------------------------------------------------------
-- 1. TỰ ĐỘNG QUÉT TÊN GAME ĐANG CHƠI
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
-- 2. BẢNG BỘ NHỚ LƯU TRẠNG THÁI GỐC (ĐỂ KHÔI PHỤC KHI TẮT)
---------------------------------------------------------
local OriginalState = {
    Lighting = {},
    Parts = {},
    Decals = {},
    Effects = {}
}

local Config = {
    LagReduced = false,
    FPSBoosted = false
}

---------------------------------------------------------
-- 3. KHỞI TẠO GIAO DIỆN CHÍNH (SCREEN GUI)
---------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DongMNnguyen_SmoothHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 340, 0, 210)
MainFrame.Position = UDim2.new(0.5, -170, 0.4, -105)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 18, 26)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
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
Header.Size = UDim2.new(1, 0, 0, 36)
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
TitleLabel.TextSize = 15
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = Header

-- Nút Đóng (X)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 24, 0, 24)
CloseBtn.Position = UDim2.new(1, -30, 0, 6)
CloseBtn.BackgroundColor3 = Color3.fromRGB(230, 50, 60)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.TextSize = 12
CloseBtn.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

-- Khung Hiển Thị Tên Game Đang Chơi
local GameLabelFrame = Instance.new("Frame")
GameLabelFrame.Size = UDim2.new(0.9, 0, 0, 26)
GameLabelFrame.Position = UDim2.new(0.05, 0, 0.22, 0)
GameLabelFrame.BackgroundColor3 = Color3.fromRGB(24, 30, 42)
GameLabelFrame.Parent = MainFrame

local GameLabelCorner = Instance.new("UICorner")
GameLabelCorner.CornerRadius = UDim.new(0, 6)
GameLabelCorner.Parent = GameLabelFrame

local GameText = Instance.new("TextLabel")
GameText.Size = UDim2.new(1, -12, 1, 0)
GameText.Position = UDim2.new(0, 8, 0, 0)
GameText.BackgroundTransparency = 1
GameText.Text = "🎮 GAME: " .. string.upper(currentGameName)
GameText.TextColor3 = Color3.fromRGB(255, 200, 80)
GameText.Font = Enum.Font.SourceSansBold
GameText.TextSize = 12
GameText.TextXAlignment = Enum.TextXAlignment.Left
GameText.Parent = GameLabelFrame

-- Nút Tròn ĐMN (Nổi bật khi ẩn Menu)
local CircleBtn = Instance.new("TextButton")
CircleBtn.Name = "CircleBtn_DMN"
CircleBtn.Size = UDim2.new(0, 50, 0, 50)
CircleBtn.Position = UDim2.new(0.03, 0, 0.25, 0)
CircleBtn.BackgroundColor3 = Color3.fromRGB(15, 25, 40)
CircleBtn.Text = "ĐMN"
CircleBtn.TextColor3 = Color3.fromRGB(0, 230, 255)
CircleBtn.Font = Enum.Font.SourceSansBold
CircleBtn.TextSize = 15
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

-- Khung chứa các nút tính năng
local Container = Instance.new("Frame")
Container.Size = UDim2.new(0.9, 0, 0.58, 0)
Container.Position = UDim2.new(0.05, 0, 0.38, 0)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

local UIList = Instance.new("UIListLayout")
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 8)
UIList.Parent = Container

-- Hàm Tạo Nút Bật/Tắt Mượt Mà
local function createToggleButton(title, defaultState, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 38)
    btn.BackgroundColor3 = defaultState and Color3.fromRGB(40, 180, 80) or Color3.fromRGB(35, 42, 58)
    btn.Text = title .. (defaultState and ": ON" or ": OFF")
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 13
    btn.Parent = Container
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
    
    local state = defaultState
    btn.MouseButton1Click:Connect(function()
        state = not state
        local targetColor = state and Color3.fromRGB(40, 180, 80) or Color3.fromRGB(35, 42, 58)
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = targetColor}):Play()
        btn.Text = title .. (state and ": ON" or ": OFF")
        callback(state)
    end)
    return btn
end

---------------------------------------------------------
-- CHỨC NĂNG 1: GIẢM LAG (BẬT LÀ GIẢM NGAY, TẮT KHÔI PHỤC GỐC)
---------------------------------------------------------
createToggleButton("⚡ Giảm lag (Tắt/Bật khôi phục 100%)", Config.LagReduced, function(val)
    Config.LagReduced = val
    if val then
        -- LƯU LẠI CÁC TRẠNG THÁI GỐC CỦA MAP
        OriginalState.Lighting.GlobalShadows = Lighting.GlobalShadows
        OriginalState.Lighting.FogEnd = Lighting.FogEnd
        
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") then
                OriginalState.Parts[obj] = {Material = obj.Material, CastShadow = obj.CastShadow}
                obj.Material = Enum.Material.SmoothPlastic
                obj.CastShadow = false
            elseif obj:IsA("Decal") or obj:IsA("Texture") then
                OriginalState.Decals[obj] = obj.Transparency
                obj.Transparency = 1
            elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") then
                OriginalState.Effects[obj] = obj.Enabled
                obj.Enabled = false
            end
        end
    else
        -- KHÔI PHỤC LẠI NGUYÊN BẢN BAN ĐẦU KHI TẮT
        if OriginalState.Lighting.GlobalShadows ~= nil then
            Lighting.GlobalShadows = OriginalState.Lighting.GlobalShadows
            Lighting.FogEnd = OriginalState.Lighting.FogEnd
        end
        
        for part, props in pairs(OriginalState.Parts) do
            if part and part.Parent then
                part.Material = props.Material
                part.CastShadow = props.CastShadow
            end
        end
        
        for decal, trans in pairs(OriginalState.Decals) do
            if decal and decal.Parent then
                decal.Transparency = trans
            end
        end
        
        for effect, enabled in pairs(OriginalState.Effects) do
            if effect and effect.Parent then
                effect.Enabled = enabled
            end
        end
        
        -- Dọn dẹp cache
        OriginalState.Parts = {}
        OriginalState.Decals = {}
        OriginalState.Effects = {}
        OriginalState.Lighting = {}
    end
end)

---------------------------------------------------------
-- CHỨC NĂNG 2: TĂNG 300 FPS & ÉP KHUNG HÌNH KHÔNG ĐỘ TRỄ
---------------------------------------------------------
createToggleButton("🚀 Tăng 300 FPS & Ép mượt không độ trễ", Config.FPSBoosted, function(val)
    Config.FPSBoosted = val
    if val then
        if setfpscap then setfpscap(300) end
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
    else
        if setfpscap then setfpscap(60) end
        settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
        settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Default
    end
end)

---------------------------------------------------------
-- TWEEN MỞ / ĐÓNG MENU & DI CHUYỂN
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

local isTransitioning = false
local function toggleUI()
    if isTransitioning then return end
    isTransitioning = true

    if MainFrame.Visible then
        -- Hiệu ứng thu nhỏ Menu
        local tween = TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0)
        })
        tween:Play()
        tween.Completed:Connect(function()
            MainFrame.Visible = false
            MainFrame.Size = UDim2.new(0, 340, 0, 210)
            CircleBtn.Visible = true
            CircleBtn.Size = UDim2.new(0, 0, 0, 0)
            TweenService:Create(CircleBtn, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 50, 0, 50)
            }):Play()
            isTransitioning = false
        end)
    else
        -- Hiệu ứng phóng to Menu
        CircleBtn.Visible = false
        MainFrame.Visible = true
        MainFrame.Size = UDim2.new(0, 0, 0, 0)
        local tween = TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 340, 0, 210)
        })
        tween:Play()
        tween.Completed:Connect(function()
            isTransitioning = false
        end)
    end
end

CloseBtn.MouseButton1Click:Connect(toggleUI)
CircleBtn.MouseButton1Click:Connect(toggleUI)
