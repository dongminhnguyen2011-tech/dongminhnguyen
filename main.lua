-- LocalScript: ĐỒNG M NGUYÊN [ V1.0 ] - Ultimate Optimizer
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Cấu hình
local Config = {
    LagReduced = false,
    FPSBoosted = false
}

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DongMNnguyenHub_Simple"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 320, 0, 160)
MainFrame.Position = UDim2.new(0.5, -160, 0.4, -80)
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

-- Nút Tròn ĐMN (Hiện khi ẩn menu)
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

-- Khung chứa nút bấm
local Container = Instance.new("Frame")
Container.Size = UDim2.new(0.9, 0, 0.65, 0)
Container.Position = UDim2.new(0.05, 0, 0.28, 0)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

local UIList = Instance.new("UIListLayout")
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 10)
UIList.Parent = Container

-- Hàm Tạo Button Toggle
local function createToggleButton(title, defaultState, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.BackgroundColor3 = defaultState and Color3.fromRGB(40, 180, 80) or Color3.fromRGB(35, 42, 58)
    btn.Text = title .. (defaultState and ": ON" or ": OFF")
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 14
    btn.Parent = Container
    
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
-- CHỈ NẠP 2 CHỨC NĂNG YÊU CẦU
---------------------------------------------------------

-- 1. Giảm lag (xoá 45% hiệu ứng)
createToggleButton("⚡ Giảm lag (xoá 45% hiệu ứng)", Config.LagReduced, function(val)
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
            elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") then
                obj.Enabled = false
            end
        end
    end
end)

-- 2. Tăng 300 FPS cực hạn
createToggleButton("🚀 Tăng 300 FPS cực hạn", Config.FPSBoosted, function(val)
    Config.FPSBoosted = val
    if val then
        if setfpscap then setfpscap(300) end
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    else
        if setfpscap then setfpscap(60) end
    end
end)

---------------------------------------------------------
-- KÉO RÊ & CHUYỂN ĐỔI ẨN/HIỆN MENU
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
