-- LocalScript: Blox Fruits VIP Hub (Sea 1 Dedicated)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Remote nhận Quest đặc trưng của Blox Fruits
local CommF_ = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")

---------------------------------------------------------
-- 1. TẠO GIAO DIỆN (UI CREATION)
---------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BloxFruitsVIPHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Main Menu
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 320, 0, 200)
MainFrame.Position = UDim2.new(0.5, -160, 0.35, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 22, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -40, 0, 35)
TitleLabel.Position = UDim2.new(0, 12, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "BLOX FRUITS HUB [An phim X]"
TitleLabel.TextColor3 = Color3.fromRGB(0, 210, 255)
TitleLabel.TextSize = 14
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = MainFrame

-- Nút đóng X
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 25, 0, 25)
CloseBtn.Position = UDim2.new(1, -30, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.TextSize = 12
CloseBtn.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 5)
CloseCorner.Parent = CloseBtn

-- Nút Tròn Nổi
local CircleBtn = Instance.new("ImageButton")
CircleBtn.Name = "CircleToggleBtn"
CircleBtn.Size = UDim2.new(0, 50, 0, 50)
CircleBtn.Position = UDim2.new(0.05, 0, 0.2, 0)
CircleBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
CircleBtn.Visible = false
CircleBtn.Active = true
CircleBtn.Parent = ScreenGui

local CircleCorner = Instance.new("UICorner")
CircleCorner.CornerRadius = UDim.new(1, 0)
CircleCorner.Parent = CircleBtn

local CircleText = Instance.new("TextLabel")
CircleText.Size = UDim2.new(1, 0, 1, 0)
CircleText.BackgroundTransparency = 1
CircleText.Text = "BF"
CircleText.TextColor3 = Color3.fromRGB(255, 255, 255)
CircleText.Font = Enum.Font.SourceSansBold
CircleText.TextSize = 16
CircleText.Parent = CircleBtn

-- Nút Bật/Tắt Auto Farm
local FarmBtn = Instance.new("TextButton")
FarmBtn.Size = UDim2.new(0.9, 0, 0, 45)
FarmBtn.Position = UDim2.new(0.05, 0, 0.35, 0)
FarmBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
FarmBtn.Text = "Auto Farm Level: OFF"
FarmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FarmBtn.Font = Enum.Font.SourceSansBold
FarmBtn.TextSize = 16
FarmBtn.Parent = MainFrame

local FarmCorner = Instance.new("UICorner")
FarmCorner.CornerRadius = UDim.new(0, 6)
FarmCorner.Parent = FarmBtn

---------------------------------------------------------
-- 2. KÉO RÊ GIAO DIỆN (DRAGGABLE)
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
-- 3. XỬ LÝ ẨN / HIỆN MENU (PHÍM X & NÚT TRÒN)
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
-- 4. AUTO FARM SYSTEM CHO BLOX FRUITS (SEA 1)
---------------------------------------------------------
local autoFarm = false

-- Chống AFK & Chống va chạm địa hình (Noclip)
RunService.Stepped:Connect(function()
    if autoFarm then
        local char = LocalPlayer.Character
        if char then
            for _, v in pairs(char:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end
    end
end)

-- Hàm tự nhận Quest trong Blox Fruits
local function checkQuest()
    local level = LocalPlayer.Data.Level.Value
    local questData = LocalPlayer.PlayerGui.Main:FindFirstChild("Quest")
    
    -- Kiểm tra nếu chưa có Quest
    if not questData or not questData.Visible then
        if level >= 1 and level <= 14 then
            -- Nhận Quest Bandit (Cấp 1-15)
            CommF_:InvokeServer("StartQuest", "BanditQuest1", 1)
        end
    end
end

-- Vòng lặp Farm chính
task.spawn(function()
    while true do
        task.wait(0.1)
        if autoFarm then
            pcall(function()
                local char = LocalPlayer.Character
                if not char or not char:FindFirstChild("Humanoid") or char.Humanoid.Health <= 0 then return end
                
                -- 1. Kiểm tra và nhận Quest
                checkQuest()
                
                -- 2. Trang bị vũ khí (Ưu tiên Combat hoặc Cận chiến)
                for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if tool:IsA("Tool") then
                        char.Humanoid:EquipTool(tool)
                        break
                    end
                end
                
                -- 3. Tìm quái Bandit trong khu vực
                local targetMob = nil
                local enemies = workspace:FindFirstChild("Enemies") or workspace
                
                for _, mob in pairs(enemies:GetChildren()) do
                    if mob.Name == "Bandit" and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 and mob:FindFirstChild("HumanoidRootPart") then
                        targetMob = mob
                        break
                    end
                end
                
                -- 4. Dịch chuyển treo trên đầu quái và tự đánh
                if targetMob and targetMob:FindFirstChild("HumanoidRootPart") then
                    char.HumanoidRootPart.CFrame = targetMob.HumanoidRootPart.CFrame * CFrame.new(0, 7, 0) * CFrame.Angles(math.rad(-90), 0, 0)
                    
                    -- Tự động bấm giữ đòn đánh
                    VirtualUser:CaptureController()
                    VirtualUser:Button1Down(Vector2.new(0,0))
                end
            end)
        end
    end
end)

FarmBtn.MouseButton1Click:Connect(function()
    autoFarm = not autoFarm
    if autoFarm then
        FarmBtn.Text = "Auto Farm Level: ON"
        FarmBtn.BackgroundColor3 = Color3.fromRGB(210, 50, 50)
    else
        FarmBtn.Text = "Auto Farm Level: OFF"
        FarmBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
    end
end)
