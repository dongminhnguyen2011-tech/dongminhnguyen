-- LocalScript: ĐỒNG M NGUYÊN [ V1.0 ] - PC Gaming Camera & Ultra FPS Engine
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
-- 1. QUÉT TÊN GAME & CẤU HÌNH
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
    FPSBoosted = false,
    UltraPCMode = false
}

local childAddedConnection = nil

---------------------------------------------------------
-- 2. GIAO DIỆN CHÍNH
---------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DongMNnguyen_PCGaming_Hub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 340, 0, 300)
MainFrame.Position = UDim2.new(0.5, -170, 0.4, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 15, 22)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Active = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(0, 230, 255)
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame

-- Header
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 36)
Header.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
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
-- 3. KHUNG THÔNG TIN GAME & FPS
---------------------------------------------------------
local GameLabelFrame = Instance.new("Frame")
GameLabelFrame.Size = UDim2.new(0.9, 0, 0, 24)
GameLabelFrame.Position = UDim2.new(0.05, 0, 0.14, 0)
GameLabelFrame.BackgroundColor3 = Color3.fromRGB(20, 26, 38)
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
GameText.TextSize = 11
GameText.TextXAlignment = Enum.TextXAlignment.Left
GameText.Parent = GameLabelFrame

local FPSFrame = Instance.new("Frame")
FPSFrame.Size = UDim2.new(0.9, 0, 0, 26)
FPSFrame.Position = UDim2.new(0.05, 0, 0.23, 0)
FPSFrame.BackgroundColor3 = Color3.fromRGB(16, 22, 32)
FPSFrame.Parent = MainFrame

local FPSCorner = Instance.new("UICorner")
FPSCorner.CornerRadius = UDim.new(0, 6)
FPSCorner.Parent = FPSFrame

local FPSStroke = Instance.new("UIStroke")
FPSStroke.Color = Color3.fromRGB(0, 200, 255)
FPSStroke.Thickness = 1
FPSStroke.Parent = FPSFrame

local FPSText = Instance.new("TextLabel")
FPSText.Size = UDim2.new(1, 0, 1, 0)
FPSText.BackgroundTransparency = 1
FPSText.Text = "⚡ TỐC ĐỘ GAME: 0 FPS"
FPSText.TextColor3 = Color3.fromRGB(0, 255, 150)
FPSText.Font = Enum.Font.SourceSansBold
FPSText.TextSize = 12
FPSText.Parent = FPSFrame

local frameCount = 0
local lastTime = os.clock()

RunService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
    local currentTime = os.clock()
    if currentTime - lastTime >= 1 then
        local fps = math.floor(frameCount / (currentTime - lastTime))
        FPSText.Text = "⚡ TỐC ĐỘ GAME: " .. tostring(fps) .. " FPS"
        
        if fps >= 60 then
            FPSText.TextColor3 = Color3.fromRGB(0, 255, 150)
        elseif fps >= 30 then
            FPSText.TextColor3 = Color3.fromRGB(255, 200, 0)
        else
            FPSText.TextColor3 = Color3.fromRGB(255, 60, 60)
        end
        
        frameCount = 0
        lastTime = currentTime
    end
end)

---------------------------------------------------------
-- 4. CONTAINER NÚT BẬT/TẮT
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
Container.Size = UDim2.new(0.9, 0, 0.62, 0)
Container.Position = UDim2.new(0.05, 0, 0.34, 0)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

local UIList = Instance.new("UIListLayout")
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 6)
UIList.Parent = Container

local function createToggleButton(title, defaultState, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 36)
    btn.BackgroundColor3 = defaultState and Color3.fromRGB(40, 180, 80) or Color3.fromRGB(30, 36, 50)
    btn.Text = title .. (defaultState and ": ON" or ": OFF")
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 11
    btn.Parent = Container
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
    
    local state = defaultState
    btn.MouseButton1Click:Connect(function()
        state = not state
        local targetColor = state and Color3.fromRGB(40, 180, 80) or Color3.fromRGB(30, 36, 50)
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = targetColor}):Play()
        btn.Text = title .. (state and ": ON" or ": OFF")
        callback(state)
    end)
    return btn
end

---------------------------------------------------------
-- CHỨC NĂNG SIÊU CẤP: CHẾ ĐỘ PC GAMING (XOAY CAM SIÊU MƯỢT)
---------------------------------------------------------
local function cleanObject(obj)
    if obj:IsA("BasePart") then
        obj.Material = Enum.Material.SmoothPlastic
        obj.CastShadow = false
        obj.Reflectance = 0
    elseif obj:IsA("Decal") or obj:IsA("Texture") then
        obj.Transparency = 1
    elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") or obj:IsA("Beam") or obj:IsA("Highlight") then
        obj.Enabled = false
    elseif obj:IsA("PostEffect") or obj:IsA("Atmosphere") or obj:IsA("SunRaysEffect") or obj:IsA("BlurEffect") or obj:IsA("BloomEffect") or obj:IsA("DepthOfFieldEffect") then
        obj.Enabled = false
    elseif obj:IsA("SurfaceAppearance") then
        obj:Destroy()
    end
end

createToggleButton("🖥️ Chế Độ PC Gaming (Xoay Cam Siêu Mượt)", Config.UltraPCMode, function(val)
    Config.UltraPCMode = val
    if val then
        -- 1. Ép Lighting & Terrain về mức siêu nhẹ
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        Lighting.Brightness = 1
        pcall(function() sethiddenproperty(Lighting, "Technology", Enum.Technology.Voxel) end)
        
        if Workspace.Terrain then
            Workspace.Terrain.WaterWaveSize = 0
            Workspace.Terrain.WaterWaveSpeed = 0
            Workspace.Terrain.WaterReflectance = 0
            Workspace.Terrain.WaterTransparency = 0
            pcall(function() setfieldproperty(Workspace.Terrain, "Decoration", false) end)
        end
        
        -- 2. Tối ưu hóa hệ thống Render & Phản hồi Camera
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
        Workspace.InterpolationThrottling = Enum.InterpolationThrottling.Disabled
        if setfpscap then setfpscap(1000) end

        -- 3. Quét toàn bộ map
        for _, obj in pairs(game:GetDescendants()) do
            cleanObject(obj)
        end
        
        -- 4. Tự động dọn dẹp vật thể/chiêu thức mới sinh ra để tránh rít khi xoay cam
        childAddedConnection = Workspace.DescendantAdded:Connect(function(newObj)
            if Config.UltraPCMode then
                cleanObject(newObj)
            end
        end)
    else
        if childAddedConnection then
            childAddedConnection:Disconnect()
            childAddedConnection = nil
        end
        settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
        settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Default
        Workspace.InterpolationThrottling = Enum.InterpolationThrottling.Default
        if setfpscap then setfpscap(60) end
    end
end)

---------------------------------------------------------
-- CHỨC NĂNG TĂNG FPS & GIẢM LAG THƯỜNG
---------------------------------------------------------
createToggleButton("⚡ Giảm lag cơ bản (Xóa/Khôi phục đồ họa)", Config.LagReduced, function(val)
    Config.LagReduced = val
    if val then
        Lighting.GlobalShadows = false
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") then
                obj.Material = Enum.Material.SmoothPlastic
                obj.CastShadow = false
            end
        end
    end
end)

createToggleButton("🚀 Mở Khóa 1000 FPS Cực Hạn", Config.FPSBoosted, function(val)
    Config.FPSBoosted = val
    if val then
        if setfpscap then setfpscap(1000) end
    else
        if setfpscap then setfpscap(60) end
    end
end)

---------------------------------------------------------
-- DI CHUYỂN & CHUYỂN ĐỔI UI
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
            MainFrame.Size = UDim2.new(0, 340, 0, 300)
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
            Size = UDim2.new(0, 340, 0, 290)
        })
        tween:Play()
        tween.Completed:Connect(function()
            isTransitioning = false
        end)
    end
end

CloseBtn.MouseButton1Click:Connect(toggleUI)
CircleBtn.MouseButton1Click:Connect(toggleUI)
