-- ========================================================
-- SCRIPT: AUTO FARM LEVEL CHUYÊN DỤNG (TỐI ƯU KHÔNG LỖI)
-- Hỗ trợ: Sea 1, Sea 2, Sea 3 | Tự gom quái + Tự chuyển Sea
-- ========================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

-- BẬT Noclip để không bị vướng địa hình khi gom quái/bay
RunService.Stepped:Connect(function()
    if _G.AutoFarmLevel and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- 1. THÔNG BÁO KÍCH HOẠT
local function ShowNotification(text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "ĐỒNG M NGUYÊN HUB",
            Text = text,
            Duration = 5
        })
    end)
end

-- 2. HÀM BAY TWEEN AN TOÀN (KHÔNG BỊ KICK)
local function TweenTo(targetCFrame)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local hrp = char.HumanoidRootPart
        local dist = (hrp.Position - targetCFrame.Position).Magnitude
        local speed = 300 -- Tốc độ di chuyển an toàn
        local info = TweenInfo.new(dist / speed, Enum.EasingStyle.Linear)
        local tween = TweenService:Create(hrp, info, {CFrame = targetCFrame})
        tween:Play()
        return tween
    end
end

-- 3. HÀM TỰ ĐỘNG GOM QUÁI (BRING MOBS)
local function BringMobs(mobName, targetCFrame)
    pcall(function()
        local enemies = workspace:FindFirstChild("Enemies")
        if enemies then
            for _, enemy in pairs(enemies:GetChildren()) do
                if enemy.Name == mobName and enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChildOfClass("Humanoid") then
                    if enemy.Humanoid.Health > 0 and (enemy.HumanoidRootPart.Position - targetCFrame.Position).Magnitude <= 350 then
                        enemy.HumanoidRootPart.CFrame = targetCFrame
                        enemy.HumanoidRootPart.CanCollide = false
                        enemy.Humanoid.WalkSpeed = 0
                    end
                end
            end
        end
    end)
end

-- 4. BẢNG DỮ LIỆU NHIỆM VỤ THEO LEVEL (CẬP NHẬT TẤT CẢ CÁC SEA)
local function GetQuestData()
    local level = 1
    if LocalPlayer:FindFirstChild("Data") and LocalPlayer.Data:FindFirstChild("Level") then
        level = LocalPlayer.Data.Level.Value
    end

    -- CHUYỂN SEA TỰ ĐỘNG KHI ĐỦ LEVEL
    if level >= 700 and game.PlaceId == 2753915549 then
        ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelDressrosa")
        return nil
    elseif level >= 1500 and game.PlaceId == 4442272183 then
        ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")
        return nil
    end

    -- DỮ LIỆU CÁC ĐẢO & NHIỆM VỤ SEA 1
    if game.PlaceId == 2753915549 then
        if level >= 1 and level < 10 then
            return "BanditQuest1", 1, "Bandit", CFrame.new(1059, 16, 1549), CFrame.new(1190, 16, 1610)
        elseif level >= 10 and level < 15 then
            return "JungleQuest", 1, "Monkey", CFrame.new(-1598, 36, 153), CFrame.new(-1610, 36, 140)
        elseif level >= 15 and level < 30 then
            return "JungleQuest", 2, "Gorilla", CFrame.new(-1598, 36, 153), CFrame.new(-1240, 6, -490)
        elseif level >= 30 and level < 40 then
            return "BuggyQuest1", 1, "Pirate", CFrame.new(-1140, 4, 3828), CFrame.new(-1210, 4, 3920)
        elseif level >= 40 and level < 60 then
            return "BuggyQuest1", 2, "Brute", CFrame.new(-1140, 4, 3828), CFrame.new(-1150, 4, 4250)
        elseif level >= 60 and level < 90 then
            return "DesertQuest", 1, "Desert Bandit", CFrame.new(894, 6, 4388), CFrame.new(950, 6, 4450)
        elseif level >= 90 and level < 120 then
            return "SnowQuest", 1, "Snow Bandit", CFrame.new(1385, 87, -1298), CFrame.new(1280, 105, -1380)
        elseif level >= 120 and level < 150 then
            return "MarineQuest2", 1, "Chief Petty Officer", CFrame.new(-5035, 29, 4325), CFrame.new(-4850, 22, 4260)
        elseif level >= 150 and level < 190 then
            return "SkyQuest", 1, "Sky Bandit", CFrame.new(-4840, 718, -2620), CFrame.new(-4980, 718, -2830)
        elseif level >= 190 and level < 250 then
            return "PrisonQuest", 1, "Prisoner", CFrame.new(530, 2, 474), CFrame.new(480, 2, 580)
        elseif level >= 250 and level < 300 then
            return "ColosseumQuest", 1, "Toga Warrior", CFrame.new(-1580, 7, -2980), CFrame.new(-1800, 7, -2900)
        elseif level >= 300 and level < 375 then
            return "MagmaQuest", 1, "Military Soldier", CFrame.new(-5313, 12, 8515), CFrame.new(-5400, 12, 8580)
        elseif level >= 375 and level < 450 then
            return "FishmanQuest", 1, "Fishman Warrior", CFrame.new(61122, 18, 1569), CFrame.new(61000, 18, 1450)
        elseif level >= 450 and level < 525 then
            return "SkyExp1Quest", 1, "God's Guard", CFrame.new(-4720, 845, -1950), CFrame.new(-4700, 845, -1800)
        elseif level >= 525 and level < 625 then
            return "SkyExp2Quest", 1, "Royal Squad", CFrame.new(-7900, 5600, -2280), CFrame.new(-7700, 5600, -2300)
        elseif level >= 625 and level < 700 then
            return "FountainQuest", 1, "Galley Pirate", CFrame.new(5258, 38, 4050), CFrame.new(5500, 38, 3950)
        end
    
    -- DỮ LIỆU CÁC ĐẢO SEA 2 (MẪU CHÍNH)
    elseif game.PlaceId == 4442272183 then
        if level >= 700 and level < 775 then
            return "Area1Quest", 1, "Raider", CFrame.new(-425, 73, 1835), CFrame.new(-750, 73, 2400)
        elseif level >= 775 and level < 875 then
            return "Area2Quest", 1, "Mercenary", CFrame.new(630, 73, 918), CFrame.new(850, 73, 1200)
        else
            return "Area1Quest", 1, "Raider", CFrame.new(-425, 73, 1835), CFrame.new(-750, 73, 2400)
        end

    -- DỮ LIỆU CÁC ĐẢO SEA 3 (MẪU CHÍNH)
    elseif game.PlaceId == 7449423635 then
        return "PiratePortQuest", 1, "Pirate Port", CFrame.new(-290, 44, 5580), CFrame.new(-450, 44, 5500)
    end
end

-- 5. VÒNG LẶP AUTO FARM CHÍNH
_G.AutoFarmLevel = false
_G.SelectedWeapon = "Melee" -- Các tùy chọn: "Melee", "Sword", "Gun", "Blox Fruit"

task.spawn(function()
    while task.wait(0.1) do
        if _G.AutoFarmLevel then
            pcall(function()
                local char = LocalPlayer.Character
                if not char or not char:FindFirstChild("HumanoidRootPart") then return end

                -- Tự động cầm vũ khí chọn sẵn
                for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if tool:IsA("Tool") and (tool.ToolTip == _G.SelectedWeapon or _G.SelectedWeapon == "Melee") then
                        char.Humanoid:EquipTool(tool)
                    end
                end

                local questName, questLvl, mobName, npcCFrame, mobCFrame = GetQuestData()
                if not questName then return end

                -- Kiểm tra xem đã nhận Nhiệm vụ chưa
                local pGui = LocalPlayer:FindFirstChild("PlayerGui")
                local hasQuest = pGui and pGui:FindFirstChild("Main") and pGui.Main:FindFirstChild("Quest") and pGui.Main.Quest.Visible

                if not hasQuest then
                    -- CHƯA CÓ Q: Bay tới NPC tự động bấm nhận Nhiệm vụ
                    TweenTo(npcCFrame)
                    if (char.HumanoidRootPart.Position - npcCFrame.Position).Magnitude <= 15 then
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", questName, questLvl)
                    end
                else
                    -- ĐÃ CÓ Q: Tìm quái, Gom quái và Đánh
                    local targetMob = nil
                    local enemies = workspace:FindFirstChild("Enemies")
                    if enemies then
                        for _, enemy in pairs(enemies:GetChildren()) do
                            if enemy.Name == mobName and enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChildOfClass("Humanoid") and enemy.Humanoid.Health > 0 then
                                targetMob = enemy
                                break
                            end
                        end
                    end

                    if targetMob then
                        -- Bay đè lên đầu quái (khoảng cách 9 studs)
                        local targetPos = targetMob.HumanoidRootPart.CFrame * CFrame.new(0, 9, 0) * CFrame.Angles(math.rad(-90), 0, 0)
                        char.HumanoidRootPart.CFrame = targetPos

                        -- Gom các con quái xung quanh lại một điểm
                        BringMobs(mobName, targetMob.HumanoidRootPart.CFrame)

                        -- Tự động bấm đánh
                        VirtualUser:CaptureController()
                        VirtualUser:ClickButton1(Vector2.new(500, 500))
                    else
                        -- Nếu chưa spawn quái thì bay chờ ở bãi quái
                        TweenTo(mobCFrame)
                    end
                end
            end)
        end
    end
end)

-- 6. GIAO DIỆN BẬT / TẮT BẰNG MỘT NÚT BẤM DUY NHẤT
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DongMNguyen_AutoFarm_Only"
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
Title.Text = "AUTO FARM LEVEL"
Title.TextColor3 = Color3.fromRGB(0, 230, 150)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 13
Title.Parent = Frame

local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0.9, 0, 0, 45)
ToggleBtn.Position = UDim2.new(0.05, 0, 0.4, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 44, 58)
ToggleBtn.Text = "BẬT AUTO FARM"
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
        ToggleBtn.Text = "TẮT AUTO FARM"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 120)
        ShowNotification("kích hoạt farm lever thành công [Blox Fruits]")
    else
        ToggleBtn.Text = "BẬT AUTO FARM"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 44, 58)
        ShowNotification("Đã tắt Auto Farm Level")
    end
end)
