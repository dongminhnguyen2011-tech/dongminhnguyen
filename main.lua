-- =================================================================
-- BLOX FRUITS: ULTIMATE AUTO FARM LEVEL (OPTIMIZED & MODERN UI)
-- Hỗ trợ: Sea 1, Sea 2, Sea 3 | Tự chuyển Đảo & Sea | Gom quái mượt
-- =================================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- BIẾN CẤU HÌNH HỆ THỐNG
_G.AutoFarmLevel = false
_G.SelectWeapon = "Melee" -- Melee, Sword, Blox Fruit
_G.TweenSpeed = 300       -- Tốc độ di chuyển an toàn

-- 1. HÀM NGUYÊN MẪU NOCLIP (XUYÊN VẬT THỂ KHI BAY)
RunService.Stepped:Connect(function()
    if _G.AutoFarmLevel and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- 2. HÀM BAY TWEEN AN TOÀN
local currentTween = nil
local function TweenTo(targetCFrame)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local hrp = char.HumanoidRootPart
        local dist = (hrp.Position - targetCFrame.Position).Magnitude
        
        -- Nếu khoảng cách quá ngắn thì dịch chuyển trực tiếp
        if dist < 10 then
            hrp.CFrame = targetCFrame
            return
        end

        local info = TweenInfo.new(dist / _G.TweenSpeed, Enum.EasingStyle.Linear)
        currentTween = TweenService:Create(hrp, info, {CFrame = targetCFrame})
        currentTween:Play()
    end
end

-- 3. HÀM TỰ ĐỘNG ĐÁNH VÀ TRANG BỊ VŨ KHÍ
local function AutoAttack()
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("Humanoid") then return end

    -- Tự cầm vũ khí được chọn
    local tool = char:FindFirstChildOfClass("Tool")
    if not tool then
        for _, item in pairs(LocalPlayer.Backpack:GetChildren()) do
            if item:IsA("Tool") then
                if (_G.SelectWeapon == "Melee" and item.ToolTip == "Melee") or
                   (_G.SelectWeapon == "Sword" and item.ToolTip == "Sword") or
                   (_G.SelectWeapon == "Blox Fruit" and item.ToolTip == "Blox Fruit") or
                   _G.SelectWeapon == "Melee" then
                    char.Humanoid:EquipTool(item)
                    tool = item
                    break
                end
            end
        end
    end

    -- Kích hoạt đòn đánh
    if tool then
        tool:Activate()
        pcall(function()
            ReplicatedStorage.Remotes.CommF_:InvokeServer("RegisterAttack")
        end)
    end
end

-- 4. HÀM GOM QUÁI LẠI MỘT ĐIỂM (BRING MOBS)
local function BringMobs(targetCFrame)
    pcall(function()
        local enemies = workspace:FindFirstChild("Enemies")
        if enemies then
            for _, enemy in pairs(enemies:GetChildren()) do
                local hum = enemy:FindFirstChildOfClass("Humanoid")
                local hrp = enemy:FindFirstChild("HumanoidRootPart")
                if hum and hrp and hum.Health > 0 then
                    if (hrp.Position - targetCFrame.Position).Magnitude <= 320 then
                        hrp.CFrame = targetCFrame
                        hrp.CanCollide = false
                        hum.WalkSpeed = 0
                    end
                end
            end
        end
    end)
end

-- 5. BẢNG DỮ LIỆU CÁC NHIỆM VỤ THEO LEVEL
local function GetQuestData()
    local level = 1
    if LocalPlayer:FindFirstChild("Data") and LocalPlayer.Data:FindFirstChild("Level") then
        level = LocalPlayer.Data.Level.Value
    end

    -- ĐỦ LEVEL TỰ CHUYỂN SEA
    if level >= 700 and game.PlaceId == 2753915549 then
        ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelDressrosa")
        return nil
    elseif level >= 1500 and game.PlaceId == 4442272183 then
        ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")
        return nil
    end

    -- CẤP ĐỘ SEA 1 (FIRST SEA)
    if game.PlaceId == 2753915549 then
        if level >= 1 and level < 10 then
            return "BanditQuest1", 1, CFrame.new(1059, 16, 1549), CFrame.new(1190, 16, 1610)
        elseif level >= 10 and level < 15 then
            return "JungleQuest", 1, CFrame.new(-1598, 36, 153), CFrame.new(-1610, 36, 140)
        elseif level >= 15 and level < 30 then
            return "JungleQuest", 2, CFrame.new(-1598, 36, 153), CFrame.new(-1240, 6, -490)
        elseif level >= 30 and level < 40 then
            return "BuggyQuest1", 1, CFrame.new(-1140, 4, 3828), CFrame.new(-1210, 4, 3920)
        elseif level >= 40 and level < 60 then
            return "BuggyQuest1", 2, CFrame.new(-1140, 4, 3828), CFrame.new(-1150, 4, 4250)
        elseif level >= 60 and level < 90 then
            return "DesertQuest", 1, CFrame.new(894, 6, 4388), CFrame.new(950, 6, 4450)
        elseif level >= 90 and level < 120 then
            return "SnowQuest", 1, CFrame.new(1385, 87, -1298), CFrame.new(1280, 105, -1380)
        elseif level >= 120 and level < 150 then
            return "MarineQuest2", 1, CFrame.new(-5035, 29, 4325), CFrame.new(-4850, 22, 4260)
        elseif level >= 150 and level < 190 then
            return "SkyQuest", 1, CFrame.new(-4840, 718, -2620), CFrame.new(-4980, 718, -2830)
        elseif level >= 190 and level < 250 then
            return "PrisonQuest", 1, CFrame.new(530, 2, 474), CFrame.new(480, 2, 580)
        elseif level >= 250 and level < 300 then
            return "ColosseumQuest", 1, CFrame.new(-1580, 7, -2980), CFrame.new(-1800, 7, -2900)
        elseif level >= 300 and level < 375 then
            return "MagmaQuest", 1, CFrame.new(-5313, 12, 8515), CFrame.new(-5400, 12, 8580)
        elseif level >= 375 and level < 450 then
            return "FishmanQuest", 1, CFrame.new(61122, 18, 1569), CFrame.new(61000, 18, 1450)
        elseif level >= 450 and level < 525 then
            return "SkyExp1Quest", 1, CFrame.new(-4720, 845, -1950), CFrame.new(-4700, 845, -1800)
        elseif level >= 525 and level < 625 then
            return "SkyExp2Quest", 1, CFrame.new(-7900, 5600, -2280), CFrame.new(-7700, 5600, -2300)
        elseif level >= 625 and level < 700 then
            return "FountainQuest", 1, CFrame.new(5258, 38, 4050), CFrame.new(5500, 38, 3950)
        end
    -- CẤP ĐỘ SEA 2 (SECOND SEA)
    elseif game.PlaceId == 4442272183 then
        if level >= 700 and level < 775 then
            return "Area1Quest", 1, CFrame.new(-425, 73, 1835), CFrame.new(-750, 73, 2400)
        elseif level >= 775 and level < 875 then
            return "Area2Quest", 1, CFrame.new(630, 73, 918), CFrame.new(850, 73, 1200)
        else
            return "Area1Quest", 1, CFrame.new(-425, 73, 1835), CFrame.new(-750, 73, 2400)
        end
    -- CẤP ĐỘ SEA 3 (THIRD SEA)
    elseif game.PlaceId == 7449423635 then
        return "PiratePortQuest", 1, CFrame.new(-290, 44, 5580), CFrame.new(-450, 44, 5500)
    end
end

-- 6. VÒNG LẶP XỬ LÝ CHÍNH
task.spawn(function()
    while task.wait(0.05) do
        if _G.AutoFarmLevel then
            pcall(function()
                local char = LocalPlayer.Character
                if not char or not char:FindFirstChild("HumanoidRootPart") then return end

                local questName, questLvl, npcCFrame, mobCFrame = GetQuestData()
                if not questName then return end

                -- Kiểm tra xem đã có Nhiệm vụ chưa
                local pGui = LocalPlayer:FindFirstChild("PlayerGui")
                local hasQuest = pGui and pGui:FindFirstChild("Main") and pGui.Main:FindFirstChild("Quest") and pGui.Main.Quest.Visible

                if not hasQuest then
                    -- CHƯA CÓ Q: Bay tới NPC nhận Q
                    TweenTo(npcCFrame)
                    if (char.HumanoidRootPart.Position - npcCFrame.Position).Magnitude <= 15 then
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", questName, questLvl)
                    end
                else
                    -- ĐÃ CÓ Q: Tìm mục tiêu xung quanh bãi quái
                    local targetMob = nil
                    local enemies = workspace:FindFirstChild("Enemies")
                    if enemies then
                        for _, enemy in pairs(enemies:GetChildren()) do
                            local hum = enemy:FindFirstChildOfClass("Humanoid")
                            local hrp = enemy:FindFirstChild("HumanoidRootPart")
                            if hum and hrp and hum.Health > 0 then
                                if (hrp.Position - mobCFrame.Position).Magnitude <= 380 then
                                    targetMob = enemy
                                    break
                                end
                            end
                        end
                    end

                    if targetMob then
                        -- Bay treo trên đầu quái 8.5 studs
                        local mobHRP = targetMob.HumanoidRootPart
                        char.HumanoidRootPart.CFrame = mobHRP.CFrame * CFrame.new(0, 8.5, 0) * CFrame.Angles(math.rad(-90), 0, 0)
                        
                        -- Gom quái xung quanh & Đánh
                        BringMobs(mobHRP.CFrame)
                        AutoAttack()
                    else
                        -- Bay sẵn tới điểm quái chờ spawn
                        TweenTo(mobCFrame)
                    end
                end
            end)
        end
    end
end)

-- =================================================================
-- 7. THIẾT KẾ GIAO DIỆN (MODERN DARK/NEON GUI)
-- =================================================================

-- Xóa UI cũ nếu có
if game:GetService("CoreGui"):FindFirstChild("DongMNguyen_UltraUI") then
    game:GetService("CoreGui"):FindFirstChild("DongMNguyen_UltraUI"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DongMNguyen_UltraUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

-- Khung chính UI
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 340, 0, 220)
MainFrame.Position = UDim2.new(0.35, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 17, 23)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(0, 255, 160)
MainStroke.Thickness = 1.5
MainStroke.Transparency = 0.3
MainStroke.Parent = MainFrame

-- Thanh tiêu đề
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = Color3.fromRGB(22, 25, 35)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 12)
TopBarCorner.Parent = TopBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -50, 1, 0)
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "ĐỒNG M NGUYÊN HUB • AUTO FARM"
TitleLabel.TextColor3 = Color3.fromRGB(0, 255, 160)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 13
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TopBar

-- Nút Thu nhỏ / Đóng
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -34, 0, 6)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 80)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 11
CloseBtn.Parent = TopBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Container chứa nội dung
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -20, 1, -55)
ContentFrame.Position = UDim2.new(0, 10, 0, 48)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

-- Nút Bật/Tắt Auto Farm
local ToggleFarmBtn = Instance.new("TextButton")
ToggleFarmBtn.Size = UDim2.new(1, 0, 0, 50)
ToggleFarmBtn.Position = UDim2.new(0, 0, 0, 10)
ToggleFarmBtn.BackgroundColor3 = Color3.fromRGB(30, 35, 48)
ToggleFarmBtn.Text = "BẬT AUTO FARM LEVEL"
ToggleFarmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleFarmBtn.Font = Enum.Font.GothamBold
ToggleFarmBtn.TextSize = 13
ToggleFarmBtn.Parent = ContentFrame

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = ToggleFarmBtn

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Color = Color3.fromRGB(50, 55, 75)
ToggleStroke.Thickness = 1
ToggleStroke.Parent = ToggleFarmBtn

ToggleFarmBtn.MouseButton1Click:Connect(function()
    _G.AutoFarmLevel = not _G.AutoFarmLevel
    if _G.AutoFarmLevel then
        ToggleFarmBtn.Text = "TẮT AUTO FARM LEVEL [ ĐANG CHẠY ]"
        ToggleFarmBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 100)
        ToggleStroke.Color = Color3.fromRGB(0, 255, 150)
        
        pcall(function()
            StarterGui:SetCore("SendNotification", {
                Title = "ĐỒNG M NGUYÊN HUB",
                Text = "Kích hoạt farm lever thành công Blox Fruits",
                Duration = 4
            })
        end)
    else
        ToggleFarmBtn.Text = "BẬT AUTO FARM LEVEL"
        ToggleFarmBtn.BackgroundColor3 = Color3.fromRGB(30, 35, 48)
        ToggleStroke.Color = Color3.fromRGB(50, 55, 75)
    end
end)

-- Chọn loại Vũ Khí
local WeaponBtn = Instance.new("TextButton")
WeaponBtn.Size = UDim2.new(1, 0, 0, 40)
WeaponBtn.Position = UDim2.new(0, 0, 0, 70)
WeaponBtn.BackgroundColor3 = Color3.fromRGB(25, 28, 38)
WeaponBtn.Text = "VŨ KHÍ: MELEE (CẬN CHIẾN)"
WeaponBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
WeaponBtn.Font = Enum.Font.GothamSemibold
WeaponBtn.TextSize = 12
WeaponBtn.Parent = ContentFrame

local WeaponCorner = Instance.new("UICorner")
WeaponCorner.CornerRadius = UDim.new(0, 8)
WeaponCorner.Parent = WeaponBtn

local weaponsList = {"Melee", "Sword", "Blox Fruit"}
local currentWpIdx = 1

WeaponBtn.MouseButton1Click:Connect(function()
    currentWpIdx = currentWpIdx + 1
    if currentWpIdx > #weaponsList then currentWpIdx = 1 end
    _G.SelectWeapon = weaponsList[currentWpIdx]
    WeaponBtn.Text = "VŨ KHÍ: " .. string.upper(_G.SelectWeapon)
end)

-- Trạng thái hệ thống
local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(1, 0, 0, 25)
StatusText.Position = UDim2.new(0, 0, 0, 125)
StatusText.BackgroundTransparency = 1
StatusText.Text = "Trạng thái: Sẵn sàng hoạt động"
StatusText.TextColor3 = Color3.fromRGB(130, 140, 160)
StatusText.Font = Enum.Font.Gotham
StatusText.TextSize = 11
StatusText.Parent = ContentFrame
