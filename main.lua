-- ========================================================
-- SCRIPT: AUTO FARM LEVEL (SỬA LỖI TỰ ĐÁNH & CHUYỂN SEA)
-- Hỗ trợ tất cả Executors Mobile/PC
-- ========================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

_G.AutoFarmLevel = false

-- 1. XỬ LÝ NOCLIP (XUYÊN VẬT THỂ KHI BAY)
RunService.Stepped:Connect(function()
    if _G.AutoFarmLevel and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- 2. THÔNG BÁO KÍCH HOẠT
local function ShowNotification(text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "ĐỒNG M NGUYÊN HUB",
            Text = text,
            Duration = 4
        })
    end)
end

-- 3. HÀM BAY TWEEN AN TOÀN
local function TweenTo(targetCFrame)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local hrp = char.HumanoidRootPart
        local dist = (hrp.Position - targetCFrame.Position).Magnitude
        local speed = 320
        local info = TweenInfo.new(dist / speed, Enum.EasingStyle.Linear)
        local tween = TweenService:Create(hrp, info, {CFrame = targetCFrame})
        tween:Play()
        return tween
    end
end

-- 4. HÀM TỰ ĐỘNG TRANG BỊ VŨ KHÍ & VUNG ĐÓN ĐÁNH (CƠ CHẾ MỚI KHOẢNG 100% HOẠT ĐỘNG)
local function AutoAttack()
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("Humanoid") then return end

    -- Tự trang bị vũ khí đầu tiên trong balo nếu chưa cầm
    local currentTool = char:FindFirstChildOfClass("Tool")
    if not currentTool then
        for _, item in pairs(LocalPlayer.Backpack:GetChildren()) do
            if item:IsA("Tool") then
                char.Humanoid:EquipTool(item)
                currentTool = item
                break
            end
        end
    end

    -- Kích hoạt vung vũ khí đánh
    if currentTool then
        currentTool:Activate()
        pcall(function()
            ReplicatedStorage.Remotes.CommF_:InvokeServer("RegisterAttack")
        end)
    end
end

-- 5. HÀM GOM QUÁI LẠI MỘT ĐIỂM
local function BringMobs(targetCFrame)
    pcall(function()
        local enemies = workspace:FindFirstChild("Enemies")
        if enemies then
            for _, enemy in pairs(enemies:GetChildren()) do
                if enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChildOfClass("Humanoid") then
                    if enemy.Humanoid.Health > 0 and (enemy.HumanoidRootPart.Position - targetCFrame.Position).Magnitude <= 300 then
                        enemy.HumanoidRootPart.CFrame = targetCFrame
                        enemy.HumanoidRootPart.CanCollide = false
                        enemy.Humanoid.WalkSpeed = 0
                    end
                end
            end
        end
    end)
end

-- 6. BẢNG NHIỆM VỤ THEO LEVEL
local function GetQuestData()
    local level = 1
    if LocalPlayer:FindFirstChild("Data") and LocalPlayer.Data:FindFirstChild("Level") then
        level = LocalPlayer.Data.Level.Value
    end

    -- ĐỦ LEVEL TỰ SANG SEA
    if level >= 700 and game.PlaceId == 2753915549 then
        ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelDressrosa")
        return nil
    elseif level >= 1500 and game.PlaceId == 4442272183 then
        ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")
        return nil
    end

    -- SEA 1
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
    -- SEA 2
    elseif game.PlaceId == 4442272183 then
        return "Area1Quest", 1, CFrame.new(-425, 73, 1835), CFrame.new(-750, 73, 2400)
    -- SEA 3
    elseif game.PlaceId == 7449423635 then
        return "PiratePortQuest", 1, CFrame.new(-290, 44, 5580), CFrame.new(-450, 44, 5500)
    end
end

-- 7. VÒNG LẶP CHÍNH AUTO FARM
task.spawn(function()
    while task.wait(0.1) do
        if _G.AutoFarmLevel then
            pcall(function()
                local char = LocalPlayer.Character
                if not char or not char:FindFirstChild("HumanoidRootPart") then return end

                local questName, questLvl, npcCFrame, mobCFrame = GetQuestData()
                if not questName then return end

                -- Kiểm tra trạng thái Quest
                local pGui = LocalPlayer:FindFirstChild("PlayerGui")
                local hasQuest = pGui and pGui:FindFirstChild("Main") and pGui.Main:FindFirstChild("Quest") and pGui.Main.Quest.Visible

                if not hasQuest then
                    -- Chưa có Quest -> Bay tới NPC bấm nhận
                    TweenTo(npcCFrame)
                    if (char.HumanoidRootPart.Position - npcCFrame.Position).Magnitude <= 15 then
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", questName, questLvl)
                    end
                else
                    -- Đã có Quest -> Quét tìm quái gần bãi quái
                    local targetMob = nil
                    local enemies = workspace:FindFirstChild("Enemies")
                    if enemies then
                        for _, enemy in pairs(enemies:GetChildren()) do
                            local hum = enemy:FindFirstChildOfClass("Humanoid")
                            local hrp = enemy:FindFirstChild("HumanoidRootPart")
                            if hum and hrp and hum.Health > 0 then
                                -- Ưu tiên lấy quái gần bãi nhiệm vụ trong vòng 400m
                                if (hrp.Position - mobCFrame.Position).Magnitude <= 400 then
                                    targetMob = enemy
                                    break
                                end
                            end
                        end
                    end

                    if targetMob then
                        -- Bay treo trên đầu quái 8 studs & vung đòn đánh
                        local mobHRP = targetMob.HumanoidRootPart
                        char.HumanoidRootPart.CFrame = mobHRP.CFrame * CFrame.new(0, 8, 0) * CFrame.Angles(math.rad(-90), 0, 0)
                        
                        -- Gom các con quái khác tới cùng điểm
                        BringMobs(mobHRP.CFrame)
                        
                        -- Đánh trực tiếp
                        AutoAttack()
                    else
                        -- Đợi quái spawn -> Bay sẵn tới Bãi quái
                        TweenTo(mobCFrame)
                    end
                end
            end)
        end
    end
end)

-- 8. GIAO DIỆN BẬT / TẮT
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DongMNguyen_FixFarm"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 220, 0, 110)
Frame.Position = UDim2.new(0.05, 0, 0.4, 0)
Frame.BackgroundColor3 = Color3.fromRGB(20, 22, 30)
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "AUTO FARM FIX 100%"
Title.TextColor3 = Color3.fromRGB(0, 230, 150)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 12
Title.Parent = Frame

local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0.9, 0, 0, 45)
ToggleBtn.Position = UDim2.new(0.05, 0, 0.4, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 44, 58)
ToggleBtn.Text = "BẬT FARM LEVEL"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 12
ToggleBtn.Parent = Frame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 8)
BtnCorner.Parent = ToggleBtn

ToggleBtn.MouseButton1Click:Connect(function()
    _G.AutoFarmLevel = not _G.AutoFarmLevel
    if _G.AutoFarmLevel then
        ToggleBtn.Text = "TẮT FARM LEVEL"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 120)
        ShowNotification("Kích hoạt farm lever thành công [Blox Fruits]")
    else
        ToggleBtn.Text = "BẬT FARM LEVEL"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 44, 58)
        ShowNotification("Đã tắt Auto Farm Level")
    end
end)
