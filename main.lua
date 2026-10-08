-- LocalScript: Framework UI Hub VIP
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

---------------------------------------------------------
-- CẤU HÌNH HỆ THỐNG (SETTINGS)
---------------------------------------------------------
local Config = {
    AutoFarm = false,
    SelectedWeapon = "Melee", -- "Melee", "Sword", "Fruit"
    FarmSpeed = 300,
    DistanceOffset = Vector3.new(0, 7, 0) -- Cao hơn quái 7 studs
}

---------------------------------------------------------
-- TẠO GIAO DIỆN VIP (UI BUILDER)
---------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VIP_Hub_UI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Khung chính
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 260)
MainFrame.Position = UDim2.new(0.5, -200, 0.4, -130)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

-- Thanh Tiêu Đề (Header Bar)
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 35)
Header.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 10)
HeaderCorner.Parent = Header

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -50, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "VIP HUB [Nhấn phím X để Ẩn/Hiện]"
Title.TextColor3 = Color3.fromRGB(0, 220, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

-- Nút đóng (X)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 25, 0, 25)
CloseBtn.Position = UDim2.new(1, -30, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.TextSize = 12
CloseBtn.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

-- Nút tròn nổi (Floating Circle Button)
local CircleBtn = Instance.new("ImageButton")
CircleBtn.Size = UDim2.new(0, 50, 0, 50)
CircleBtn.Position = UDim2.new(0.02, 0, 0.2, 0)
CircleBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
CircleBtn.Visible = false
CircleBtn.Active = true
CircleBtn.Parent = ScreenGui

local CircleCorner = Instance.new("UICorner")
CircleCorner.CornerRadius = UDim.new(1, 0)
CircleCorner.Parent = CircleBtn

local CircleText = Instance.new("TextLabel")
CircleText.Size = UDim2.new(1, 0, 1, 0)
CircleText.BackgroundTransparency = 1
CircleText.Text = "VIP"
CircleText.TextColor3 = Color3.fromRGB(255, 255, 255)
CircleText.Font = Enum.Font.SourceSansBold
CircleText.TextSize = 16
CircleText.Parent = CircleBtn

---------------------------------------------------------
-- KÉO RÊ GIAO DIỆN (DRAGGABLE LOGIC)
---------------------------------------------------------
local function makeDraggable(guiObject)
    local dragging, dragInput, dragStart, startPos
    guiObject.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = guiObject.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    guiObject.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            guiObject.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
end

makeDraggable(MainFrame)
makeDraggable(CircleBtn)

---------------------------------------------------------
-- ẨN / HIỆN GIAO DIỆN
---------------------------------------------------------
local isMenuOpen = true
local function toggleUI()
    isMenuOpen = not isMenuOpen
    MainFrame.Visible = isMenuOpen
    CircleBtn.Visible = not isMenuOpen
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.X then
        toggleUI()
    end
end)

CloseBtn.MouseButton1Click:Connect(toggleUI)
CircleBtn.MouseButton1Click:Connect(toggleUI)

---------------------------------------------------------
-- KHU VỰC CÁC NÚT ĐIỀU KHIỂN (CONTROL PANEL)
---------------------------------------------------------
-- Nút Auto Farm
local FarmToggle = Instance.new("TextButton")
FarmToggle.Size = UDim2.new(0.9, 0, 0, 45)
FarmToggle.Position = UDim2.new(0.05, 0, 0.22, 0)
FarmToggle.BackgroundColor3 = Color3.fromRGB(45, 160, 85)
FarmToggle.Text = "Auto Farm Level: OFF"
FarmToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
FarmToggle.Font = Enum.Font.SourceSansBold
FarmToggle.TextSize = 16
FarmToggle.Parent = MainFrame

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = FarmToggle

FarmToggle.MouseButton1Click:Connect(function()
    Config.AutoFarm = not Config.AutoFarm
    if Config.AutoFarm then
        FarmToggle.Text = "Auto Farm Level: ON"
        FarmToggle.BackgroundColor3 = Color3.fromRGB(210, 55, 55)
    else
        FarmToggle.Text = "Auto Farm Level: OFF"
        FarmToggle.BackgroundColor3 = Color3.fromRGB(45, 160, 85)
    end
end)

-- Nút chuyển đổi loại vũ khí
local WeaponBtn = Instance.new("TextButton")
WeaponBtn.Size = UDim2.new(0.9, 0, 0, 40)
WeaponBtn.Position = UDim2.new(0.05, 0, 0.45, 0)
WeaponBtn.BackgroundColor3 = Color3.fromRGB(40, 45, 60)
WeaponBtn.Text = "Vũ khí ưu tiên: " .. Config.SelectedWeapon
WeaponBtn.TextColor3 = Color3.fromRGB(200, 220, 255)
WeaponBtn.Font = Enum.Font.SourceSans
WeaponBtn.TextSize = 14
WeaponBtn.Parent = MainFrame

local WpCorner = Instance.new("UICorner")
WpCorner.CornerRadius = UDim.new(0, 8)
WpCorner.Parent = WeaponBtn

local weaponsList = {"Melee", "Sword", "Fruit"}
local currentWpIndex = 1

WeaponBtn.MouseButton1Click:Connect(function()
    currentWpIndex = (currentWpIndex % #weaponsList) + 1
    Config.SelectedWeapon = weaponsList[currentWpIndex]
    WeaponBtn.Text = "Vũ khí ưu tiên: " .. Config.SelectedWeapon
end)

---------------------------------------------------------
-- CƠ CHẾ NOCLIP (XUYÊN TƯỜNG KHI AUTO FARM)
---------------------------------------------------------
RunService.Stepped:Connect(function()
    if Config.AutoFarm then
        local char = LocalPlayer.Character
        if char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end
end)
