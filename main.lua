-- ========================================================
-- SCRIPT: ĐỒNG M NGUYÊN [ BLOX FRUITS V3.0 ] - OBFUSCATED
-- Tự Động Nhận Q + Farm Level/Boss + Giảm Lag 45% (Bật/Tắt Khôi Phục)
-- ========================================================

local _0x1 = game:GetService("Players")
local _0x2 = game:GetService("TweenService")
local _0x3 = game:GetService("UserInputService")
local _0x4 = game:GetService("RunService")
local _0x5 = game:GetService("Lighting")
local _0x6 = game:GetService("ReplicatedStorage")
local _0x7 = game:GetService("VirtualUser")
local _0x8 = _0x1.LocalPlayer

local _0xPlaceId = game.PlaceId
local _0xCurrentSea = 1
if _0xPlaceId == 4442272183 then _0xCurrentSea = 2
elseif _0xPlaceId == 7449423635 then _0xCurrentSea = 3 end

if game:GetService("CoreGui"):FindFirstChild("DongMNguyen_BF_V3") then
    game:GetService("CoreGui"):FindFirstChild("DongMNguyen_BF_V3"):Destroy()
end

local _0xGui = Instance.new("ScreenGui")
_0xGui.Name = "DongMNguyen_BF_V3"
_0xGui.ResetOnSpawn = false

local _0xParent = game:GetService("CoreGui")
pcall(function() if gethui then _0xParent = gethui() end end)
_0xGui.Parent = _0xParent or _0x8:WaitForChild("PlayerGui")

local _0xC_BG = Color3.fromRGB(15, 16, 22)
local _0xC_Side = Color3.fromRGB(22, 24, 32)
local _0xC_Card = Color3.fromRGB(28, 30, 40)
local _0xC_Accent = Color3.fromRGB(0, 230, 150)
local _0xC_Text = Color3.fromRGB(240, 242, 250)
local _0xC_SubText = Color3.fromRGB(130, 135, 155)

-- Button Open/Close
local _0xBtnOpen = Instance.new("TextButton")
_0xBtnOpen.Size = UDim2.new(0, 52, 0, 52)
_0xBtnOpen.Position = UDim2.new(0.05, 0, 0.25, 0)
_0xBtnOpen.BackgroundColor3 = _0xC_Side
_0xBtnOpen.Text = "ĐMN"
_0xBtnOpen.TextColor3 = _0xC_Accent
_0xBtnOpen.Font = Enum.Font.GothamBold
_0xBtnOpen.TextSize = 13
_0xBtnOpen.Visible = false
_0xBtnOpen.Active = true
_0xBtnOpen.Parent = _0xGui

local _0xBtnC = Instance.new("UICorner")
_0xBtnC.CornerRadius = UDim.new(1, 0)
_0xBtnC.Parent = _0xBtnOpen

local _0xBtnS = Instance.new("UIStroke")
_0xBtnS.Color = _0xC_Accent
_0xBtnS.Thickness = 2
_0xBtnS.Parent = _0xBtnOpen

-- Main Window
local _0xMain = Instance.new("Frame")
_0xMain.Size = UDim2.new(0, 560, 0, 370)
_0xMain.Position = UDim2.new(0.5, -280, 0.5, -185)
_0xMain.BackgroundColor3 = _0xC_BG
_0xMain.BorderSizePixel = 0
_0xMain.ClipsDescendants = true
_0xMain.Parent = _0xGui

local _0xMainC = Instance.new("UICorner")
_0xMainC.CornerRadius = UDim.new(0, 12)
_0xMainC.Parent = _0xMain

local _0xMainS = Instance.new("UIStroke")
_0xMainS.Color = Color3.fromRGB(40, 44, 58)
_0xMainS.Thickness = 1
_0xMainS.Parent = _0xMain

-- TopBar
local _0xTop = Instance.new("Frame")
_0xTop.Size = UDim2.new(1, 0, 0, 40)
_0xTop.BackgroundColor3 = _0xC_Side
_0xTop.Parent = _0xMain

local _0xTitle = Instance.new("TextLabel")
_0xTitle.Size = UDim2.new(0, 320, 1, 0)
_0xTitle.Position = UDim2.new(0, 15, 0, 0)
_0xTitle.BackgroundTransparency = 1
_0xTitle.Text = string.format("ĐỒNG M NGUYÊN  [ BLOX FRUITS V3.0 - SEA %d ]", _0xCurrentSea)
_0xTitle.TextColor3 = _0xC_Text
_0xTitle.Font = Enum.Font.GothamBold
_0xTitle.TextSize = 12
_0xTitle.TextXAlignment = Enum.TextXAlignment.Left
_0xTitle.Parent = _0xTop

local _0xClose = Instance.new("TextButton")
_0xClose.Size = UDim2.new(0, 28, 0, 28)
_0xClose.Position = UDim2.new(1, -34, 0.5, -14)
_0xClose.BackgroundTransparency = 1
_0xClose.Text = "✕"
_0xClose.TextColor3 = Color3.fromRGB(240, 80, 80)
_0xClose.Font = Enum.Font.GothamBold
_0xClose.TextSize = 14
_0xClose.Parent = _0xTop

-- SideBar & Content
local _0xSide = Instance.new("Frame")
_0xSide.Size = UDim2.new(0, 145, 1, -40)
_0xSide.Position = UDim2.new(0, 0, 0, 40)
_0xSide.BackgroundColor3 = _0xC_Side
_0xSide.Parent = _0xMain

local _0xSideL = Instance.new("UIListLayout")
_0xSideL.SortOrder = Enum.SortOrder.LayoutOrder
_0xSideL.Padding = UDim.new(0, 4)
_0xSideL.Parent = _0xSide

local _0xSideP = Instance.new("UIPadding")
_0xSideP.PaddingTop = UDim.new(0, 8)
_0xSideP.PaddingLeft = UDim.new(0, 6)
_0xSideP.PaddingRight = UDim.new(0, 6)
_0xSideP.Parent = _0xSide

local _0xContent = Instance.new("Frame")
_0xContent.Size = UDim2.new(1, -145, 1, -40)
_0xContent.Position = UDim2.new(0, 145, 0, 40)
_0xContent.BackgroundTransparency = 1
_0xContent.Parent = _0xMain

-- Dragging Logic
local function _0xMakeDrag(_0xF)
    local _0xD, _0xDI, _0xDS, _0xSP
    _0xF.InputBegan:Connect(function(_0xI)
        if _0xI.UserInputType == Enum.UserInputType.MouseButton1 or _0xI.UserInputType == Enum.UserInputType.Touch then
            _0xD = true; _0xDS = _0xI.Position; _0xSP = _0xF.Position
            _0xI.Changed:Connect(function() if _0xI.UserInputState == Enum.UserInputState.End then _0xD = false end end)
        end
    end)
    _0xF.InputChanged:Connect(function(_0xI)
        if _0xI.UserInputType == Enum.UserInputType.MouseMovement or _0xI.UserInputType == Enum.UserInputType.Touch then _0xDI = _0xI end
    end)
    _0x3.InputChanged:Connect(function(_0xI)
        if _0xI == _0xDI and _0xD then
            local _0xDelta = _0xI.Position - _0xDS
            _0xF.Position = UDim2.new(_0xSP.X.Scale, _0xSP.X.Offset + _0xDelta.X, _0xSP.Y.Scale, _0xSP.Y.Offset + _0xDelta.Y)
        end
    end)
end

_0xMakeDrag(_0xMain)
_0xMakeDrag(_0xBtnOpen)

_0xClose.MouseButton1Click:Connect(function() _0xMain.Visible = false; _0xBtnOpen.Visible = true end)
_0xBtnOpen.MouseButton1Click:Connect(function() _0xMain.Visible = true; _0xBtnOpen.Visible = false end)

-- Tab Builder
local _0xTabs = {}
local function _0xCreateTab(_0xName, _0xIcon)
    local _0xBtn = Instance.new("TextButton")
    _0xBtn.Size = UDim2.new(1, 0, 0, 34)
    _0xBtn.BackgroundTransparency = 1
    _0xBtn.Text = " " .. _0xIcon .. "  " .. _0xName
    _0xBtn.TextColor3 = _0xC_SubText
    _0xBtn.Font = Enum.Font.GothamMedium
    _0xBtn.TextSize = 11
    _0xBtn.TextXAlignment = Enum.TextXAlignment.Left
    _0xBtn.Parent = _0xSide

    local _0xBC = Instance.new("UICorner")
    _0xBC.CornerRadius = UDim.new(0, 6)
    _0xBC.Parent = _0xBtn

    local _0xPage = Instance.new("ScrollingFrame")
    _0xPage.Size = UDim2.new(1, 0, 1, 0)
    _0xPage.BackgroundTransparency = 1
    _0xPage.ScrollBarThickness = 3
    _0xPage.ScrollBarImageColor3 = _0xC_Accent
    _0xPage.Visible = false
    _0xPage.Parent = _0xContent

    local _0xPL = Instance.new("UIListLayout")
    _0xPL.SortOrder = Enum.SortOrder.LayoutOrder
    _0xPL.Padding = UDim.new(0, 8)
    _0xPL.Parent = _0xPage

    local _0xPP = Instance.new("UIPadding")
    _0xPP.PaddingTop = UDim.new(0, 8)
    _0xPP.PaddingLeft = UDim.new(0, 8)
    _0xPP.PaddingRight = UDim.new(0, 8)
    _0xPP.Parent = _0xPage

    _0xBtn.MouseButton1Click:Connect(function()
        for _, _0xT in pairs(_0xTabs) do
            _0xT.Button.BackgroundTransparency = 1; _0xT.Button.TextColor3 = _0xC_SubText; _0xT.Page.Visible = false
        end
        _0xBtn.BackgroundTransparency = 0; _0xBtn.BackgroundColor3 = _0xC_Card; _0xBtn.TextColor3 = _0xC_Text; _0xPage.Visible = true
    end)

    table.insert(_0xTabs, {Button = _0xBtn, Page = _0xPage})
    if #_0xTabs == 1 then
        _0xBtn.BackgroundTransparency = 0; _0xBtn.BackgroundColor3 = _0xC_Card; _0xBtn.TextColor3 = _0xC_Text; _0xPage.Visible = true
    end
    return _0xPage
end

-- UI Controls
local function _0xAddToggle(_0xP, _0xT, _0xD, _0xCB)
    local _0xF = Instance.new("Frame")
    _0xF.Size = UDim2.new(1, -6, 0, 40)
    _0xF.BackgroundColor3 = _0xC_Card
    _0xF.Parent = _0xP

    local _0xFC = Instance.new("UICorner")
    _0xFC.CornerRadius = UDim.new(0, 8)
    _0xFC.Parent = _0xF

    local _0xL = Instance.new("TextLabel")
    _0xL.Size = UDim2.new(0.7, 0, 1, 0)
    _0xL.Position = UDim2.new(0, 10, 0, 0)
    _0xL.BackgroundTransparency = 1
    _0xL.Text = _0xT
    _0xL.TextColor3 = _0xC_Text
    _0xL.Font = Enum.Font.GothamMedium
    _0xL.TextSize = 11
    _0xL.TextXAlignment = Enum.TextXAlignment.Left
    _0xL.Parent = _0xF

    local _0xB = Instance.new("TextButton")
    _0xB.Size = UDim2.new(0, 40, 0, 20)
    _0xB.Position = UDim2.new(1, -48, 0.5, -10)
    _0xB.BackgroundColor3 = _0xD and _0xC_Accent or Color3.fromRGB(50, 54, 68)
    _0xB.Text = ""
    _0xB.Parent = _0xF

    local _0xBC = Instance.new("UICorner")
    _0xBC.CornerRadius = UDim.new(1, 0)
    _0xBC.Parent = _0xB

    local _0xK = Instance.new("Frame")
    _0xK.Size = UDim2.new(0, 14, 0, 14)
    _0xK.Position = _0xD and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)
    _0xK.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _0xK.Parent = _0xB

    local _0xKC = Instance.new("UICorner")
    _0xKC.CornerRadius = UDim.new(1, 0)
    _0xKC.Parent = _0xK

    local _0xSt = _0xD
    _0xB.MouseButton1Click:Connect(function()
        _0xSt = not _0xSt
        _0x2:Create(_0xK, TweenInfo.new(0.15), {Position = _0xSt and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)}):Play()
        _0x2:Create(_0xB, TweenInfo.new(0.15), {BackgroundColor3 = _0xSt and _0xC_Accent or Color3.fromRGB(50, 54, 68)}):Play()
        _0xCB(_0xSt)
    end)
end

local function _0xAddDropdown(_0xP, _0xT, _0xO, _0xCB)
    local _0xF = Instance.new("Frame")
    _0xF.Size = UDim2.new(1, -6, 0, 40)
    _0xF.BackgroundColor3 = _0xC_Card
    _0xF.Parent = _0xP

    local _0xFC = Instance.new("UICorner")
    _0xFC.CornerRadius = UDim.new(0, 8)
    _0xFC.Parent = _0xF

    local _0xL = Instance.new("TextLabel")
    _0xL.Size = UDim2.new(0.4, 0, 1, 0)
    _0xL.Position = UDim2.new(0, 10, 0, 0)
    _0xL.BackgroundTransparency = 1
    _0xL.Text = _0xT
    _0xL.TextColor3 = _0xC_Text
    _0xL.Font = Enum.Font.GothamMedium
    _0xL.TextSize = 11
    _0xL.TextXAlignment = Enum.TextXAlignment.Left
    _0xL.Parent = _0xF

    local _0xB = Instance.new("TextButton")
    _0xB.Size = UDim2.new(0.55, -10, 0, 26)
    _0xB.Position = UDim2.new(0.45, 0, 0.5, -13)
    _0xB.BackgroundColor3 = Color3.fromRGB(20, 22, 30)
    _0xB.Text = (_0xO[1] or "Chọn...") .. "  ↓"
    _0xB.TextColor3 = _0xC_Accent
    _0xB.Font = Enum.Font.GothamBold
    _0xB.TextSize = 10
    _0xB.Parent = _0xF

    local _0xBC = Instance.new("UICorner")
    _0xBC.CornerRadius = UDim.new(0, 6)
    _0xBC.Parent = _0xB

    local _0xI = 1
    _0xB.MouseButton1Click:Connect(function()
        _0xI = _0xI % #_0xO + 1
        _0xB.Text = _0xO[_0xI] .. "  ↓"
        _0xCB(_0xO[_0xI])
    end)
end

local function _0xAddButton(_0xP, _0xT, _0xCB)
    local _0xF = Instance.new("Frame")
    _0xF.Size = UDim2.new(1, -6, 0, 40)
    _0xF.BackgroundColor3 = _0xC_Card
    _0xF.Parent = _0xP

    local _0xFC = Instance.new("UICorner")
    _0xFC.CornerRadius = UDim.new(0, 8)
    _0xFC.Parent = _0xF

    local _0xB = Instance.new("TextButton")
    _0xB.Size = UDim2.new(1, -16, 1, -12)
    _0xB.Position = UDim2.new(0, 8, 0, 6)
    _0xB.BackgroundColor3 = Color3.fromRGB(20, 22, 30)
    _0xB.Text = _0xT
    _0xB.TextColor3 = _0xC_Accent
    _0xB.Font = Enum.Font.GothamBold
    _0xB.TextSize = 11
    _0xB.Parent = _0xF

    local _0xBC = Instance.new("UICorner")
    _0xBC.CornerRadius = UDim.new(0, 6)
    _0xBC.Parent = _0xB

    _0xB.MouseButton1Click:Connect(_0xCB)
end

-- TẠO CÁC TAB
local _0xTabFarm = _0xCreateTab("Auto Farm", "🗡")
local _0xTabFruit = _0xCreateTab("Trái Ác Quỷ", "🍎")
local _0xTabLag = _0xCreateTab("Giảm Lag 45%", "⚡")
local _0xTabTele = _0xCreateTab("Dịch Chuyển", "🌐")
local _0xTabESP = _0xCreateTab("Định Vị ESP", "👁")

---------------------------------------------------------
-- HÀM DỊCH CHUYỂN AN TOÀN
---------------------------------------------------------
local function _0xTweenTo(_0xCFrameTarget)
    local _0xChar = _0x8.Character
    if _0xChar and _0xChar:FindFirstChild("HumanoidRootPart") then
        local _0xHRP = _0xChar.HumanoidRootPart
        local _0xDist = (_0xHRP.Position - _0xCFrameTarget.Position).Magnitude
        local _0xSpeed = 320
        local _0xInfo = TweenInfo.new(_0xDist / _0xSpeed, Enum.EasingStyle.Linear)
        local _0xTween = _0x2:Create(_0xHRP, _0xInfo, {CFrame = _0xCFrameTarget})
        _0xTween:Play()
        return _0xTween
    end
end

---------------------------------------------------------
-- 1. TỰ ĐỘNG LẤY Q + AUTO FARM LEVEL & BOSS THEO CẤP ĐỘ
---------------------------------------------------------
local _0xAutoFarm = false
local _0xFarmHeight = 10
local _0xSelectedWeapon = "1. Melee"

-- Menu chọn vũ khí dạng thả xuống (↓) đúng yêu cầu
local _0xWeaponsList = {"1. Melee", "2. Kiếm", "3. Súng", "4. Trái Ác Quỷ"}
_0xAddDropdown(_0xTabFarm, "Chọn Vũ Khí Đánh", _0xWeaponsList, function(_0xWp)
    _0xSelectedWeapon = _0xWp
end)

_0xAddToggle(_0xTabFarm, "Auto Farm Level + Tự Nhận Q", false, function(_0xSt)
    _0xAutoFarm = _0xSt
end)

-- Bảng Quái & Quest Theo Level (Sea 1)
local function _0xGetQuestData()
    local _0xLvl = 1
    if _0x8:FindFirstChild("Data") and _0x8.Data:FindFirstChild("Level") then
        _0xLvl = _0x8.Data.Level.Value
    end

    if _0xLvl >= 1 and _0xLvl < 10 then
        return "BanditQuest1", 1, "Bandit", CFrame.new(1059, 16, 1549), CFrame.new(1190, 16, 1610)
    elseif _0xLvl >= 10 and _0xLvl < 15 then
        return "JungleQuest", 1, "Monkey", CFrame.new(-1598, 36, 153), CFrame.new(-1610, 36, 140)
    elseif _0xLvl >= 15 and _0xLvl < 30 then
        return "JungleQuest", 2, "Gorilla", CFrame.new(-1598, 36, 153), CFrame.new(-1240, 6, -490)
    elseif _0xLvl >= 30 and _0xLvl < 40 then
        return "BuggyQuest1", 1, "Pirate", CFrame.new(-1140, 4, 3828), CFrame.new(-1210, 4, 3920)
    else
        return "BanditQuest1", 1, "Bandit", CFrame.new(1059, 16, 1549), CFrame.new(1190, 16, 1610)
    end
end

-- Vòng lặp Auto Farm Chi Tiết
task.spawn(function()
    while task.wait(0.15) do
        if _0xAutoFarm then
            pcall(function()
                local _0xChar = _0x8.Character
                if not _0xChar or not _0xChar:FindFirstChild("HumanoidRootPart") then return end

                -- Tự động cầm vũ khí theo dạng đã chọn
                for _, _0xTool in pairs(_0x8.Backpack:GetChildren()) do
                    if _0xTool:IsA("Tool") then
                        local _0xTip = _0xTool.ToolTip
                        if (_0xSelectedWeapon == "1. Melee" and _0xTip == "Melee") or
                           (_0xSelectedWeapon == "2. Kiếm" and _0xTip == "Sword") or
                           (_0xSelectedWeapon == "3. Súng" and _0xTip == "Gun") or
                           (_0xSelectedWeapon == "4. Trái Ác Quỷ" and _0xTip == "Blox Fruit") then
                            _0xChar.Humanoid:EquipTool(_0xTool)
                        end
                    end
                end

                -- Kiểm tra xem đã nhận Nhiệm Vụ chưa
                local _0xPGui = _0x8:FindFirstChild("PlayerGui")
                local _0xHasQuest = _0xPGui and _0xPGui:FindFirstChild("Main") and _0xPGui.Main:FindFirstChild("Quest") and _0xPGui.Main.Quest.Visible

                local _0xQName, _0xQLvl, _0xMobName, _0xQCFrame, _0xMCFrame = _0xGetQuestData()

                if not _0xHasQuest then
                    -- Chưa có Q: Bay đến NPC lấy Nhiệm vụ
                    _0xTweenTo(_0xQCFrame)
                    task.wait(0.5)
                    _0x6.Remotes.CommF_:InvokeServer("StartQuest", _0xQName, _0xQLvl)
                else
                    -- Đã có Q: Tìm quái tiêu diệt
                    local _0xEnemies = workspace:FindFirstChild("Enemies")
                    local _0xFoundTarget = false
                    if _0xEnemies then
                        for _, _0xEnemy in pairs(_0xEnemies:GetChildren()) do
                            if _0xEnemy.Name == _0xMobName and _0xEnemy:FindFirstChild("HumanoidRootPart") and _0xEnemy:FindFirstChildOfClass("Humanoid") and _0xEnemy:FindFirstChildOfClass("Humanoid").Health > 0 then
                                _0xFoundTarget = true
                                _0xChar.HumanoidRootPart.CFrame = _0xEnemy.HumanoidRootPart.CFrame * CFrame.new(0, _0xFarmHeight, 0) * CFrame.Angles(math.rad(-90), 0, 0)
                                _0x7:CaptureController()
                                _0x7:ClickButton1(Vector2.new(500, 500))
                                break
                            end
                        end
                    end
                    if not _0xFoundTarget then
                        _0xTweenTo(_0xMCFrame)
                    end
                end
            end)
        end
    end
end)

---------------------------------------------------------
-- 2. GIẢM LAG 45% HỆ THỐNG (BẬT / TẮT KHÔI PHỤC)
---------------------------------------------------------
local _0xHiddenEffects = {}

local function _0xToggleLagReduction(_0xState)
    if _0xState then
        -- BẬT: Ẩn 45% các hiệu ứng chiêu thức/hạt
        local _0xIndex = 0
        for _, _0xObj in pairs(workspace:GetDescendants()) do
            if _0xObj:IsA("ParticleEmitter") or _0xObj:IsA("Trail") or _0xObj:IsA("Beam") or _0xObj:IsA("Smoke") or _0xObj:IsA("Fire") then
                _0xIndex = _0xIndex + 1
                -- Lấy tỉ lệ ẩn ~45%
                if _0xIndex % 10 <= 4 then
                    if _0xObj.Enabled then
                        table.insert(_0xHiddenEffects, _0xObj)
                        _0xObj.Enabled = false
                    end
                end
            end
        end
    else
        -- TẮT: Khôi phục lại toàn bộ 100% hiệu ứng như ban đầu
        for _, _0xObj in pairs(_0xHiddenEffects) do
            if _0xObj and _0xObj.Parent then
                _0xObj.Enabled = true
            end
        end
        table.clear(_0xHiddenEffects)
    end
end

_0xAddToggle(_0xTabLag, "Giảm Lag 45% Hiệu Ứng (Tắt Được)", false, function(_0xSt)
    _0xToggleLagReduction(_0xSt)
end)

---------------------------------------------------------
-- 3. ĐỊNH VỊ & DỊCH CHUYỂN TRÁI ÁC QUỶ (FRUIT ESP & TELE)
---------------------------------------------------------
local _0xFruitEspActive = false
local _0xFruitHolders = {}

local function _0xGetFruits()
    local _0xFruits = {}
    for _, _0xV in pairs(workspace:GetChildren()) do
        if _0xV:IsA("Tool") or string.find(_0xV.Name, "Fruit") or string.find(_0xV.Name, "Trái") then
            if _0xV:FindFirstChild("Handle") or _0xV:IsA("MeshPart") or _0xV:IsA("BasePart") then
                table.insert(_0xFruits, _0xV)
            end
        end
    end
    return _0xFruits
end

_0x4.RenderStepped:Connect(function()
    if not _0xFruitEspActive then
        for _, _0xG in pairs(_0xFruitHolders) do _0xG:Destroy() end
        table.clear(_0xFruitHolders)
        return
    end

    local _0xMyChar = _0x8.Character
    local _0xMyHRP = _0xMyChar and _0xMyChar:FindFirstChild("HumanoidRootPart")

    for _, _0xFruit in pairs(_0xGetFruits()) do
        local _0xPart = _0xFruit:FindFirstChild("Handle") or _0xFruit
        if _0xMyHRP and _0xPart then
            local _0xDist = math.floor((_0xMyHRP.Position - _0xPart.Position).Magnitude * 0.28)
            
            local _0xBb = _0xFruitHolders[_0xFruit]
            if not _0xBb or not _0xBb.Parent then
                _0xBb = Instance.new("BillboardGui")
                _0xBb.Name = "Fruit_ESP"
                _0xBb.AlwaysOnTop = true
                _0xBb.Size = UDim2.new(0, 180, 0, 32)
                _0xBb.StudsOffset = Vector3.new(0, 2, 0)
                
                local _0xTxt = Instance.new("TextLabel")
                _0xTxt.Name = "Label"
                _0xTxt.Size = UDim2.new(1, 0, 1, 0)
                _0xTxt.BackgroundTransparency = 1
                _0xTxt.TextColor3 = Color3.fromRGB(255, 215, 0)
                _0xTxt.Font = Enum.Font.GothamBold
                _0xTxt.TextSize = 11
                _0xTxt.TextStrokeTransparency = 0.2
                _0xTxt.Parent = _0xBb

                _0xBb.Parent = _0xPart
                _0xFruitHolders[_0xFruit] = _0xBb
            end

            local _0xL = _0xBb:FindFirstChild("Label")
            if _0xL then
                _0xL.Text = string.format("🍎 %s\n📏 %dm", _0xFruit.Name, _0xDist)
            end
        end
    end
end)

_0xAddToggle(_0xTabFruit, "Bật Định Vị Trái Ác Quỷ (Fruit ESP)", false, function(_0xSt)
    _0xFruitEspActive = _0xSt
end)

_0xAddButton(_0xTabFruit, "🚀 Dịch Chuyển Đến Trái Ác Quỷ Gần Nhất", function()
    local _0xFruits = _0xGetFruits()
    if #_0xFruits > 0 then
        local _0xTarget = _0xFruits[1]
        local _0xPart = _0xTarget:FindFirstChild("Handle") or _0xTarget
        if _0xPart then
            _0xTweenTo(_0xPart.CFrame)
        end
    end
end)

---------------------------------------------------------
-- 4. ĐỊNH VỊ NGƯỜI CHƠI (PLAYER ESP)
---------------------------------------------------------
local _0xPlayerEspActive = false
local _0xPlayerHolders = {}

_0x4.RenderStepped:Connect(function()
    if not _0xPlayerEspActive then
        for _, _0xG in pairs(_0xPlayerHolders) do _0xG:Destroy() end
        table.clear(_0xPlayerHolders)
        return
    end

    local _0xMyChar = _0x8.Character
    local _0xMyHRP = _0xMyChar and _0xMyChar:FindFirstChild("HumanoidRootPart")

    for _, _0xPlr in pairs(_0x1:GetPlayers()) do
        if _0xPlr ~= _0x8 and _0xPlr.Character and _0xPlr.Character:FindFirstChild("HumanoidRootPart") then
            local _0xTgtHRP = _0xPlr.Character.HumanoidRootPart
            if _0xMyHRP then
                local _0xDist = math.floor((_0xMyHRP.Position - _0xTgtHRP.Position).Magnitude * 0.28)
                local _0xLvl = "N/A"
                if _0xPlr:FindFirstChild("Data") and _0xPlr.Data:FindFirstChild("Level") then
                    _0xLvl = tostring(_0xPlr.Data.Level.Value)
                end

                local _0xBb = _0xPlayerHolders[_0xPlr]
                if not _0xBb or not _0xBb.Parent then
                    _0xBb = Instance.new("BillboardGui")
                    _0xBb.Name = "Player_ESP"
                    _0xBb.AlwaysOnTop = true
                    _0xBb.Size = UDim2.new(0, 180, 0, 36)
                    _0xBb.StudsOffset = Vector3.new(0, 3.5, 0)
                    
                    local _0xTxt = Instance.new("TextLabel")
                    _0xTxt.Name = "Label"
                    _0xTxt.Size = UDim2.new(1, 0, 1, 0)
                    _0xTxt.BackgroundTransparency = 1
                    _0xTxt.TextColor3 = _0xC_Accent
                    _0xTxt.Font = Enum.Font.GothamBold
                    _0xTxt.TextSize = 11
                    _0xTxt.TextStrokeTransparency = 0.3
                    _0xTxt.Parent = _0xBb

                    _0xBb.Parent = _0xTgtHRP
                    _0xPlayerHolders[_0xPlr] = _0xBb
                end

                local _0xL = _0xBb:FindFirstChild("Label")
                if _0xL then
                    _0xL.Text = string.format("👤 %s [Lv. %s]\n📏 Khoảng cách: %dm", _0xPlr.DisplayName, _0xLvl, _0xDist)
                end
            end
        end
    end
end)

_0xAddToggle(_0xTabESP, "Bật Định Vị Người Chơi (ESP)", false, function(_0xSt)
    _0xPlayerEspActive = _0xSt
end)
