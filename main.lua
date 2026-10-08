-- LocalScript: Full UI Hub + Auto Farm System
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

---------------------------------------------------------
-- 1. KHỞI TẠO GIAO DIỆN (UI CREATION)
---------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AutoFarmHubUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Khung chính (Main Menu)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 320, 0, 220)
MainFrame.Position = UDim2.new(0.5, -160, 0.4, -110)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -40, 0, 35)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "AUTO FARM HUB [Phím X để ẩn/hiện]"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 14
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = MainFrame

-- Nút đóng GUI (Dấu X trên giao diện)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 25, 0, 25)
CloseBtn.Position = UDim2.new(1, -30, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.TextSize = 14
CloseBtn.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 5)
CloseCorner.Parent = CloseBtn

-- Nút Tròn Nhỏ (Floating Circle Button)
local CircleBtn = Instance.new("ImageButton")
CircleBtn.Name = "CircleToggleBtn"
CircleBtn.Size = UDim2.new(0, 50, 0, 50)
CircleBtn.Position = UDim2.new(0.05, 0, 0.2, 0)
CircleBtn.BackgroundColor3 = Color3.fromRGB(35, 130, 230)
CircleBtn.Visible = false
CircleBtn.Active = true
CircleBtn.Parent = ScreenGui

local CircleCorner = Instance.new("UICorner")
CircleCorner.CornerRadius = UDim.new(1, 0) -- Biến khung thành hình tròn
CircleCorner.Parent = CircleBtn

local CircleText = Instance.new("TextLabel")
CircleText.Size = UDim2.new(1, 0, 1, 0)
CircleText.BackgroundTransparency = 1
CircleText.Text = "HUB"
CircleText.TextColor3 = Color3.fromRGB(255, 255, 255)
CircleText.Font = Enum.Font.SourceSansBold
CircleText.TextSize = 16
CircleText.Parent = CircleBtn

-- Nút Bật/Tắt Auto Farm trong Menu
local FarmBtn = Instance.new("TextButton")
FarmBtn.Size = UDim2.new(0.9, 0, 0, 40)
FarmBtn.Position = UDim2.new(0.05, 0, 0.3, 0)
FarmBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
FarmBtn.Text = "Auto Farm: OFF"
FarmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FarmBtn.Font = Enum.Font.SourceSansBold
FarmBtn.TextSize = 16
FarmBtn.Parent = MainFrame

local FarmCorner = Instance.new("UICorner")
FarmCorner.CornerRadius = UDim.new(0, 6)
FarmCorner.Parent = FarmBtn

---------------------------------------------------------
-- 2. XỬ LÝ KÉO RÊ GIAO DIỆN (SMOOTH DRAGGABLE)
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
-- 3. XỬ LÝ BẬT/ẨN MENU (KEYBIND 'X' & TOGGLE BUTTON)
---------------------------------------------------------
local isMenuOpen = true

local function toggleUI()
    isMenuOpen = not isMenuOpen
    MainFrame.Visible = isMenuOpen
    CircleBtn.Visible = not isMenuOpen
end

-- Nhấn nút X trên bàn phím để toggle
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.X then
        toggleUI()
    end
end)

CloseBtn.MouseButton1Click:Connect(toggleUI)
CircleBtn.MouseButton1Click:Connect(toggleUI)

---------------------------------------------------------
-- 4. HỆ THỐNG AUTO FARM LEVEL & AUTO ATTACK
---------------------------------------------------------
local autoFarmEnabled = false

-- Chống AFK Kick
LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

-- Hàm dịch chuyển nhân vật mượt mà
local function tweenTo(targetCFrame, speed)
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    
    local hrp = char.HumanoidRootPart
    local distance = (hrp.Position - targetCFrame.Position).Magnitude
    local time = distance / (speed or 250)
    
    local tweenInfo = TweenInfo.new(time, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(hrp, tweenInfo, {CFrame = targetCFrame})
    tween:Play()
    return tween
end

-- Hàm tự động đánh quái
local function autoAttack()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton1(Vector2.new(0,0))
end

-- Vòng lặp Farm Level
task.spawn(function()
    while true do
        task.wait(0.1)
        if autoFarmEnabled then
            pcall(function()
                local char = LocalPlayer.Character
                if not char or not char:FindFirstChild("Humanoid") or char.Humanoid.Health <= 0 then return end
                
                -- 1. Tự động trang bị vũ khí (Melee/Tool)
                for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if tool:IsA("Tool") then
                        char.Humanoid:EquipTool(tool)
                        break
                    end
                end
                
                -- 2. Tìm quái vật gần nhất trong Workspace
                local targetMob = nil
                local shortestDistance = math.huge
                
                for _, mob in pairs(workspace:GetChildren()) do
                    -- Bạn có thể thay đổi tên quái phù hợp với Game (VD: "Bandit", "Monkey",...)
                    if mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 and mob:FindFirstChild("HumanoidRootPart") and mob.Name ~= LocalPlayer.Name then
                        local dist = (char.HumanoidRootPart.Position - mob.HumanoidRootPart.Position).Magnitude
                        if dist < shortestDistance then
                            shortestDistance = dist
                            targetMob = mob
                        end
                    end
                end
                
                -- 3. Dịch chuyển đến quái và tấn công
                if targetMob and targetMob:FindFirstChild("HumanoidRootPart") then
                    -- Bay lên đỉnh đầu quái 5 studs để tránh bị quái đánh trúng
                    local targetPos = targetMob.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0) * CFrame.Angles(math.rad(-90), 0, 0)
                    
                    if shortestDistance > 10 then
                        tweenTo(targetPos, 300)
                    else
                        char.HumanoidRootPart.CFrame = targetPos
                        autoAttack()
                    end
                end
            end)
        end
    end
end)

-- Sự kiện nhấn nút Bật/Tắt Auto Farm
FarmBtn.MouseButton1Click:Connect(function()
    autoFarmEnabled = not autoFarmEnabled
    if autoFarmEnabled then
        FarmBtn.Text = "Auto Farm: ON"
        FarmBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    else
        FarmBtn.Text = "Auto Farm: OFF"
        FarmBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
    end
end)
