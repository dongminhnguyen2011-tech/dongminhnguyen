-- LocalScript: ĐỒNG M NGUYÊN [ V1.0 ] - Ultra 1000 FPS & Realtime FPS Display
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local MarketplaceService = game:GetService("MarketplaceService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

---------------------------------------------------------
-- 1. TỰ ĐỘNG QUÉT TÊN GAME
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

local Config = {
    LagReduced = false,
    FPSBoosted = false
}

---------------------------------------------------------
-- 2. KHỞI TẠO GIAO DIỆN CHÍNH
---------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DongMNnguyen_FPS_Counter_Hub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 340, 0, 245)
MainFrame.Position = UDim2.new(0.5, -170, 0.4, -122)
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

-- Header
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

---------------------------------------------------------
-- 3. KHUNG HIỂN THỊ TÊN GAME & KHUNG ĐO FPS THỜI GIAN THỰC
---------------------------------------------------------
-- Khung Tên Game
local GameLabelFrame = Instance.new("Frame")
GameLabelFrame.Size = UDim2.new(0.9, 0, 0, 26)
GameLabelFrame.Position = UDim2.new(0.05, 0, 0.18, 0)
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

-- Khung Đo FPS Realtime
local FPSFrame = Instance.new("Frame")
FPSFrame.Size = UDim2.new(0.9, 0, 0, 28)
FPSFrame.Position = UDim2.new(0.05, 0, 0.31, 0)
FPSFrame.BackgroundColor3 = Color3.fromRGB(20, 28, 40)
FPSFrame.Parent = MainFrame

local FPSCorner = Instance.new("UICorner")
FPSCorner.CornerRadius = UDim.new(0, 6)
FPSCorner.Parent = FPSFrame

local FPSStroke = Instance.new("UIStroke")
FPSStroke.Color = Color3.fromRGB(0, 180, 255)
FPSStroke.Thickness = 1
FPSStroke.Parent = FPSFrame

local FPSText = Instance.new("TextLabel")
FPSText.Size = UDim2.new(1, 0, 1, 0)
FPSText.BackgroundTransparency = 1
FPSText.Text = "⚡ TỐC ĐỘ GAME: 0 FPS"
FPSText.TextColor3 = Color3.fromRGB(0, 255, 150)
FPSText.Font = Enum.Font.SourceSansBold
FPSText.TextSize = 13
FPSText.Parent = FPSFrame

-- Logic Tính Khung Hình FPS Chính Xác
local frameCount = 0
local lastTime = os.clock()

RunService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
    local currentTime = os.clock()
    if currentTime - lastTime >= 1 then
        local fps = math.floor(frameCount / (currentTime - lastTime))
        FPSText.Text = "⚡ TỐC ĐỘ GAME: " .. tostring(fps) .. " FPS"
        
        if fps >= 60 then
            FPSText.TextColor3 = Color3.fromRGB(0, 255, 150) -- Xanh lá (Mượt)
        elseif fps >= 30 then
            FPSText.TextColor3 = Color3.fromRGB(255, 200, 0) -- Vàng (Trung bình)
        else
            FPSText.TextColor3 = Color3.fromRGB(255, 60, 60)  -- Đỏ (Lag)
        end
        
        frameCount = 0
        lastTime = currentTime
    end
end)

---------------------------------------------------------
-- 4. NÚT TRÒN ĐMN (HIỆN KHI ẨN MENU)
---------------------------------------------------------
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

local Container = Instance.new("Frame")
Container.Size = UDim2.new(0.9, 0, 0.52, 0)
Container.Position = UDim2.new(0.05, 0, 0.45, 0)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

local UIList = Instance.new("UIListLayout")
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 8)
UIList.Parent = Container

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
-- CHỨC NĂNG 1: GIẢM LAG (XÓA & KHÔI PHỤC 100% ĐỒ HỌA)
---------------------------------------------------------
createToggleButton("⚡ Giảm lag (Bật xóa / Tắt khôi phục 100%)", Config.LagReduced, function(val)
    Config.LagReduced = val
    if val then
        if Lighting:GetAttribute("DMN_Shadows") == nil then
            Lighting:SetAttribute("DMN_Shadows", Lighting.GlobalShadows)
            Lighting:SetAttribute("DMN_FogEnd", Lighting.FogEnd)
        end
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9

        for _, effect in pairs(Lighting:GetChildren()) do
            if effect:IsA("PostEffect") or effect:IsA("Atmosphere") then
                if effect:GetAttribute("DMN_Enabled") == nil then
                    effect:SetAttribute("DMN_Enabled", effect.Enabled)
                end
                effect.Enabled = false
            end
        end

        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") then
                if obj:GetAttribute("DMN_Mat") == nil then
                    obj:SetAttribute("DMN_Mat", obj.Material.Name)
                    obj:SetAttribute("DMN_Shadow", obj.CastShadow)
                end
                obj.Material = Enum.Material.SmoothPlastic
                obj.CastShadow = false
            elseif obj:IsA("Decal") or obj:IsA("Texture") then
                if obj:GetAttribute("DMN_Trans") == nil then
                    obj:SetAttribute("DMN_Trans", obj.Transparency)
                end
                obj.Transparency = 1
            elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") or obj:IsA("Beam") then
                if obj:GetAttribute("DMN_Enabled") == nil then
                    obj:SetAttribute("DMN_Enabled", obj.Enabled)
                end
                obj.Enabled = false
            end
        end
    else
        if Lighting:GetAttribute("DMN_Shadows") ~= nil then
            Lighting.GlobalShadows = Lighting:GetAttribute("DMN_Shadows")
            Lighting.FogEnd = Lighting:GetAttribute("DMN_FogEnd")
            Lighting:SetAttribute("DMN_Shadows", nil)
            Lighting:SetAttribute("DMN_FogEnd", nil)
        end

        for _, effect in pairs(Lighting:GetChildren()) do
            if effect:IsA("PostEffect") or effect:IsA("Atmosphere") then
                local origState = effect:GetAttribute("DMN_Enabled")
                if origState ~= nil then
                    effect.Enabled = origState
                    effect:SetAttribute("DMN_Enabled", nil)
                end
            end
        end

        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") then
                local origMat = obj:GetAttribute("DMN_Mat")
                local origShadow = obj:GetAttribute("DMN_Shadow")
                if origMat then
                    pcall(function() obj.Material = Enum.Material[origMat] end)
                    obj:SetAttribute("DMN_Mat", nil)
                end
                if origShadow ~= nil then
                    obj.CastShadow = origShadow
                    obj:SetAttribute("DMN_Shadow", nil)
                end
            elseif obj:IsA("Decal") or obj:IsA("Texture") then
                local origTrans = obj:GetAttribute("DMN_Trans")
                if origTrans ~= nil then
                    obj.Transparency = origTrans
                    obj:SetAttribute("DMN_Trans", nil)
                end
            elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") or obj:IsA("Beam") then
                local origEnabled = obj:GetAttribute("DMN_Enabled")
                if origEnabled ~= nil then
                    obj.Enabled = origEnabled
                    obj:SetAttribute("DMN_Enabled", nil)
                end
            end
        end
    end
end)

---------------------------------------------------------
-- CHỨC NĂNG 2: TĂNG 1000 FPS CỰC HẠN & TRIỆT CẢM ĐỘ TRỄ
---------------------------------------------------------
createToggleButton("🚀 Tăng 1000 FPS Cực Hạn (Siêu Mượt)", Config.FPSBoosted, function(val)
    Config.FPSBoosted = val
    if val then
        if setfpscap then setfpscap(1000) end
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
        workspace.InterpolationThrottling = Enum.InterpolationThrottling.Disabled
    else
        if setfpscap then setfpscap(60) end
        settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
        settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Default
        workspace.InterpolationThrottling = Enum.InterpolationThrottling.Default
    end
end)

---------------------------------------------------------
-- DI CHUYỂN & CHUYỂN ĐỔI ẨN/HIỆN
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
        local tween = TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0)
        })
        tween:Play()
        tween.Completed:Connect(function()
            MainFrame.Visible = false
            MainFrame.Size = UDim2.new(0, 340, 0, 245)
            CircleBtn.Visible = true
            CircleBtn.Size = UDim2.new(0, 0, 0, 0)
            TweenService:Create(CircleBtn, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 50, 0, 50)
            }):Play()
            isTransitioning = false
        end)
    else
        CircleBtn.Visible = false
        MainFrame.Visible = true
        MainFrame.Size = UDim2.new(0, 0, 0, 0)
        local tween = TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 340, 0, 245)
        })
        tween:Play()
        tween.Completed:Connect(function()
            isTransitioning = false
        end)
    end
end

CloseBtn.MouseButton1Click:Connect(toggleUI)
CircleBtn.MouseButton1Click:Connect(toggleUI)
