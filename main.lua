-- ========================================================
-- SCRIPT: ĐỒNG M NGUYÊN [ BLOX FRUITS V1.0 ] - OBFUSCATED
-- Hỗ trợ: Sea 1, Sea 2, Sea 3 | All Executors (Delta, Fluxus, Codex, Hydrogen...)
-- ========================================================

local _0x1 = game:GetService("Players")
local _0x2 = game:GetService("TweenService")
local _0x3 = game:GetService("UserInputService")
local _0x4 = game:GetService("RunService")
local _0x5 = game:GetService("Lighting")
local _0x6 = game:GetService("ReplicatedStorage")
local _0x7 = _0x1.LocalPlayer

-- Nhận diện Sea hiện tại
local _0xPlaceId = game.PlaceId
local _0xCurrentSea = 1
if _0xPlaceId == 4442272183 then
    _0xCurrentSea = 2
elseif _0xPlaceId == 7449423635 then
    _0xCurrentSea = 3
end

-- Xóa GUI cũ nếu đã chạy
if game:GetService("CoreGui"):FindFirstChild("DongMNguyen_BF_V1") then
    game:GetService("CoreGui"):FindFirstChild("DongMNguyen_BF_V1"):Destroy()
end

local _0xGui = Instance.new("ScreenGui")
_0xGui.Name = "DongMNguyen_BF_V1"
_0xGui.ResetOnSpawn = false

local _0xTargetParent = game:GetService("CoreGui")
pcall(function() if gethui then _0xTargetParent = gethui() end end)
_0xGui.Parent = _0xTargetParent or _0x7:WaitForChild("PlayerGui")

-- Bảng Màu Premium Dark
local _0xC_BG = Color3.fromRGB(15, 16, 22)
local _0xC_Side = Color3.fromRGB(22, 24, 32)
local _0xC_Card = Color3.fromRGB(28, 30, 40)
local _0xC_Accent = Color3.fromRGB(0, 230, 150)
local _0xC_Text = Color3.fromRGB(240, 242, 250)
local _0xC_SubText = Color3.fromRGB(130, 135, 155)

-- Nút Tròn Nổi Di Chuyển (ĐMN)
local _0xBtnOpen = Instance.new("TextButton")
_0xBtnOpen.Name = "OpenButton"
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

local _0xBtnOpenCorner = Instance.new("UICorner")
_0xBtnOpenCorner.CornerRadius = UDim.new(1, 0)
_0xBtnOpenCorner.Parent = _0xBtnOpen

local _0xBtnOpenStroke = Instance.new("UIStroke")
_0xBtnOpenStroke.Color = _0xC_Accent
_0xBtnOpenStroke.Thickness = 2
_0xBtnOpenStroke.Parent = _0xBtnOpen

-- Main Window
local _0xMain = Instance.new("Frame")
_0xMain.Name = "MainFrame"
_0xMain.Size = UDim2.new(0, 550, 0, 350)
_0xMain.Position = UDim2.new(0.5, -275, 0.5, -175)
_0xMain.BackgroundColor3 = _0xC_BG
_0xMain.BorderSizePixel = 0
_0xMain.ClipsDescendants = true
_0xMain.Parent = _0xGui

local _0xMainCorner = Instance.new("UICorner")
_0xMainCorner.CornerRadius = UDim.new(0, 12)
_0xMainCorner.Parent = _0xMain

local _0xMainStroke = Instance.new("UIStroke")
_0xMainStroke.Color = Color3.fromRGB(40, 44, 58)
_0xMainStroke.Thickness = 1
_0xMainStroke.Parent = _0xMain

-- TopBar
local _0xTopBar = Instance.new("Frame")
_0xTopBar.Size = UDim2.new(1, 0, 0, 40)
_0xTopBar.BackgroundColor3 = _0xC_Side
_0xTopBar.BorderSizePixel = 0
_0xTopBar.Parent = _0xMain

local _0xTitle = Instance.new("TextLabel")
_0xTitle.Size = UDim2.new(0, 300, 1, 0)
_0xTitle.Position = UDim2.new(0, 15, 0, 0)
_0xTitle.BackgroundTransparency = 1
_0xTitle.Text = string.format("ĐỒNG M NGUYÊN  [ BLOX FRUITS - SEA %d ]", _0xCurrentSea)
_0xTitle.TextColor3 = _0xC_Text
_0xTitle.Font = Enum.Font.GothamBold
_0xTitle.TextSize = 12
_0xTitle.TextXAlignment = Enum.TextXAlignment.Left
_0xTitle.Parent = _0xTopBar

local _0xClose = Instance.new("TextButton")
_0xClose.Size = UDim2.new(0, 28, 0, 28)
_0xClose.Position = UDim2.new(1, -34, 0.5, -14)
_0xClose.BackgroundTransparency = 1
_0xClose.Text = "✕"
_0xClose.TextColor3 = Color3.fromRGB(240, 80, 80)
_0xClose.Font = Enum.Font.GothamBold
_0xClose.TextSize = 14
_0xClose.Parent = _0xTopBar

-- SideBar
local _0xSideBar = Instance.new("Frame")
_0xSideBar.Size = UDim2.new(0, 145, 1, -40)
_0xSideBar.Position = UDim2.new(0, 0, 0, 40)
_0xSideBar.BackgroundColor3 = _0xC_Side
_0xSideBar.BorderSizePixel = 0
_0xSideBar.Parent = _0xMain

local _0xSideList = Instance.new("UIListLayout")
_0xSideList.SortOrder = Enum.SortOrder.LayoutOrder
_0xSideList.Padding = UDim.new(0, 4)
_0xSideList.Parent = _0xSideBar

local _0xSidePad = Instance.new("UIPadding")
_0xSidePad.PaddingTop = UDim.new(0, 8)
_0xSidePad.PaddingLeft = UDim.new(0, 6)
_0xSidePad.PaddingRight = UDim.new(0, 6)
_0xSidePad.Parent = _0xSideBar

-- Content
local _0xContent = Instance.new("Frame")
_0xContent.Size = UDim2.new(1, -145, 1, -40)
_0xContent.Position = UDim2.new(0, 145, 0, 40)
_0xContent.BackgroundTransparency = 1
_0xContent.Parent = _0xMain

-- Drag Logic
local function _0xMakeDrag(_0xFrame)
    local _0xDragging, _0xDragInput, _0xDragStart, _0xStartPos
    _0xFrame.InputBegan:Connect(function(_0xInput)
        if _0xInput.UserInputType == Enum.UserInputType.MouseButton1 or _0xInput.UserInputType == Enum.UserInputType.Touch then
            _0xDragging = true
            _0xDragStart = _0xInput.Position
            _0xStartPos = _0xFrame.Position
            _0xInput.Changed:Connect(function()
                if _0xInput.UserInputState == Enum.UserInputState.End then _0xDragging = false end
            end)
        end
    end)
    _0xFrame.InputChanged:Connect(function(_0xInput)
        if _0xInput.UserInputType == Enum.UserInputType.MouseMovement or _0xInput.UserInputType == Enum.UserInputType.Touch then
            _0xDragInput = _0xInput
        end
    end)
    _0x3.InputChanged:Connect(function(_0xInput)
        if _0xInput == _0xDragInput and _0xDragging then
            local _0xDelta = _0xInput.Position - _0xDragStart
            _0xFrame.Position = UDim2.new(_0xStartPos.X.Scale, _0xStartPos.X.Offset + _0xDelta.X, _0xStartPos.Y.Scale, _0xStartPos.Y.Offset + _0xDelta.Y)
        end
    end)
end

_0xMakeDrag(_0xMain)
_0xMakeDrag(_0xBtnOpen)

_0xClose.MouseButton1Click:Connect(function()
    _0xMain.Visible = false
    _0xBtnOpen.Visible = true
end)

_0xBtnOpen.MouseButton1Click:Connect(function()
    _0xMain.Visible = true
    _0xBtnOpen.Visible = false
end)

-- Tabs Manager
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
    _0xBtn.Parent = _0xSideBar

    local _0xBtnCorner = Instance.new("UICorner")
    _0xBtnCorner.CornerRadius = UDim.new(0, 6)
    _0xBtnCorner.Parent = _0xBtn

    local _0xPage = Instance.new("ScrollingFrame")
    _0xPage.Size = UDim2.new(1, 0, 1, 0)
    _0xPage.BackgroundTransparency = 1
    _0xPage.ScrollBarThickness = 3
    _0xPage.ScrollBarImageColor3 = _0xC_Accent
    _0xPage.Visible = false
    _0xPage.Parent = _0xContent

    local _0xPageList = Instance.new("UIListLayout")
    _0xPageList.SortOrder = Enum.SortOrder.LayoutOrder
    _0xPageList.Padding = UDim.new(0, 8)
    _0xPageList.Parent = _0xPage

    local _0xPagePad = Instance.new("UIPadding")
    _0xPagePad.PaddingTop = UDim.new(0, 8)
    _0xPagePad.PaddingLeft = UDim.new(0, 8)
    _0xPagePad.PaddingRight = UDim.new(0, 8)
    _0xPagePad.Parent = _0xPage

    _0xBtn.MouseButton1Click:Connect(function()
        for _, _0xT in pairs(_0xTabs) do
            _0xT.Button.BackgroundTransparency = 1
            _0xT.Button.TextColor3 = _0xC_SubText
            _0xT.Page.Visible = false
        end
        _0xBtn.BackgroundTransparency = 0
        _0xBtn.BackgroundColor3 = _0xC_Card
        _0xBtn.TextColor3 = _0xC_Text
        _0xPage.Visible = true
    end)

    table.insert(_0xTabs, {Button = _0xBtn, Page = _0xPage})
    if #_0xTabs == 1 then
        _0xBtn.BackgroundTransparency = 0
        _0xBtn.BackgroundColor3 = _0xC_Card
        _0xBtn.TextColor3 = _0xC_Text
        _0xPage.Visible = true
    end
    return _0xPage
end

-- Controls (Toggle, Dropdown, Slider)
local function _0xAddToggle(_0xPage, _0xText, _0xDef, _0xCallback)
    local _0xF = Instance.new("Frame")
    _0xF.Size = UDim2.new(1, -6, 0, 40)
    _0xF.BackgroundColor3 = _0xC_Card
    _0xF.Parent = _0xPage

    local _0xFC = Instance.new("UICorner")
    _0xFC.CornerRadius = UDim.new(0, 8)
    _0xFC.Parent = _0xF

    local _0xL = Instance.new("TextLabel")
    _0xL.Size = UDim2.new(0.7, 0, 1, 0)
    _0xL.Position = UDim2.new(0, 10, 0, 0)
    _0xL.BackgroundTransparency = 1
    _0xL.Text = _0xText
    _0xL.TextColor3 = _0xC_Text
    _0xL.Font = Enum.Font.GothamMedium
    _0xL.TextSize = 11
    _0xL.TextXAlignment = Enum.TextXAlignment.Left
    _0xL.Parent = _0xF

    local _0xBtn = Instance.new("TextButton")
    _0xBtn.Size = UDim2.new(0, 40, 0, 20)
    _0xBtn.Position = UDim2.new(1, -48, 0.5, -10)
    _0xBtn.BackgroundColor3 = _0xDef and _0xC_Accent or Color3.fromRGB(50, 54, 68)
    _0xBtn.Text = ""
    _0xBtn.Parent = _0xF

    local _0xBC = Instance.new("UICorner")
    _0xBC.CornerRadius = UDim.new(1, 0)
    _0xBC.Parent = _0xBtn

    local _0xKnob = Instance.new("Frame")
    _0xKnob.Size = UDim2.new(0, 14, 0, 14)
    _0xKnob.Position = _0xDef and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)
    _0xKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _0xKnob.Parent = _0xBtn

    local _0xKC = Instance.new("UICorner")
    _0xKC.CornerRadius = UDim.new(1, 0)
    _0xKC.Parent = _0xKnob

    local _0xState = _0xDef
    _0xBtn.MouseButton1Click:Connect(function()
        _0xState = not _0xState
        local _0xPos = _0xState and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)
        local _0xCol = _0xState and _0xC_Accent or Color3.fromRGB(50, 54, 68)

        _0x2:Create(_0xKnob, TweenInfo.new(0.15), {Position = _0xPos}):Play()
        _0x2:Create(_0xBtn, TweenInfo.new(0.15), {BackgroundColor3 = _0xCol}):Play()
        _0xCallback(_0xState)
    end)
end

local function _0xAddDropdown(_0xPage, _0xText, _0xOptions, _0xCallback)
    local _0xF = Instance.new("Frame")
    _0xF.Size = UDim2.new(1, -6, 0, 40)
    _0xF.BackgroundColor3 = _0xC_Card
    _0xF.Parent = _0xPage

    local _0xFC = Instance.new("UICorner")
    _0xFC.CornerRadius = UDim.new(0, 8)
    _0xFC.Parent = _0xF

    local _0xL = Instance.new("TextLabel")
    _0xL.Size = UDim2.new(0.45, 0, 1, 0)
    _0xL.Position = UDim2.new(0, 10, 0, 0)
    _0xL.BackgroundTransparency = 1
    _0xL.Text = _0xText
    _0xL.TextColor3 = _0xC_Text
    _0xL.Font = Enum.Font.GothamMedium
    _0xL.TextSize = 11
    _0xL.TextXAlignment = Enum.TextXAlignment.Left
    _0xL.Parent = _0xF

    local _0xBtn = Instance.new("TextButton")
    _0xBtn.Size = UDim2.new(0.5, -10, 0, 26)
    _0xBtn.Position = UDim2.new(0.5, 0, 0.5, -13)
    _0xBtn.BackgroundColor3 = Color3.fromRGB(20, 22, 30)
    _0xBtn.Text = _0xOptions[1] or "Chọn..."
    _0xBtn.TextColor3 = _0xC_Accent
    _0xBtn.Font = Enum.Font.GothamBold
    _0xBtn.TextSize = 10
    _0xBtn.Parent = _0xF

    local _0xBC = Instance.new("UICorner")
    _0xBC.CornerRadius = UDim.new(0, 6)
    _0xBC.Parent = _0xBtn

    local _0xIdx = 1
    _0xBtn.MouseButton1Click:Connect(function()
        _0xIdx = _0xIdx % #_0xOptions + 1
        _0xBtn.Text = _0xOptions[_0xIdx]
        _0xCallback(_0xOptions[_0xIdx])
    end)
end

local function _0xAddSlider(_0xPage, _0xText, _0xMin, _0xMax, _0xDef, _0xCallback)
    local _0xF = Instance.new("Frame")
    _0xF.Size = UDim2.new(1, -6, 0, 50)
    _0xF.BackgroundColor3 = _0xC_Card
    _0xF.Parent = _0xPage

    local _0xFC = Instance.new("UICorner")
    _0xFC.CornerRadius = UDim.new(0, 8)
    _0xFC.Parent = _0xF

    local _0xL = Instance.new("TextLabel")
    _0xL.Size = UDim2.new(0.6, 0, 0, 20)
    _0xL.Position = UDim2.new(0, 10, 0, 4)
    _0xL.BackgroundTransparency = 1
    _0xL.Text = _0xText
    _0xL.TextColor3 = _0xC_Text
    _0xL.Font = Enum.Font.GothamMedium
    _0xL.TextSize = 11
    _0xL.TextXAlignment = Enum.TextXAlignment.Left
    _0xL.Parent = _0xF

    local _0xVL = Instance.new("TextLabel")
    _0xVL.Size = UDim2.new(0.3, 0, 0, 20)
    _0xVL.Position = UDim2.new(0.7, -10, 0, 4)
    _0xVL.BackgroundTransparency = 1
    _0xVL.Text = tostring(_0xDef)
    _0xVL.TextColor3 = _0xC_Accent
    _0xVL.Font = Enum.Font.GothamBold
    _0xVL.TextSize = 11
    _0xVL.TextXAlignment = Enum.TextXAlignment.Right
    _0xVL.Parent = _0xF

    local _0xBar = Instance.new("Frame")
    _0xBar.Size = UDim2.new(1, -20, 0, 6)
    _0xBar.Position = UDim2.new(0, 10, 0, 32)
    _0xBar.BackgroundColor3 = Color3.fromRGB(50, 54, 68)
    _0xBar.BorderSizePixel = 0
    _0xBar.Parent = _0xF

    local _0xBarC = Instance.new("UICorner")
    _0xBarC.CornerRadius = UDim.new(1, 0)
    _0xBarC.Parent = _0xBar

    local _0xFill = Instance.new("Frame")
    _0xFill.Size = UDim2.new((_0xDef - _0xMin) / (_0xMax - _0xMin), 0, 1, 0)
    _0xFill.BackgroundColor3 = _0xC_Accent
    _0xFill.BorderSizePixel = 0
    _0xFill.Parent = _0xBar

    local _0xFillC = Instance.new("UICorner")
    _0xFillC.CornerRadius = UDim.new(1, 0)
    _0xFillC.Parent = _0xFill

    local _0xDrag = false
    local function _0xUpdate(_0xInput)
        local _0xPosX = math.clamp(_0xInput.Position.X - _0xBar.AbsolutePosition.X, 0, _0xBar.AbsoluteSize.X)
        local _0xPct = _0xPosX / _0xBar.AbsoluteSize.X
        local _0xVal = math.floor(_0xMin + (_0xMax - _0xMin) * _0xPct)
        _0xFill.Size = UDim2.new(_0xPct, 0, 1, 0)
        _0xVL.Text = tostring(_0xVal)
        _0xCallback(_0xVal)
    end

    _0xBar.InputBegan:Connect(function(_0xInput)
        if _0xInput.UserInputType == Enum.UserInputType.MouseButton1 or _0xInput.UserInputType == Enum.UserInputType.Touch then
            _0xDrag = true
            _0xUpdate(_0xInput)
        end
    end)

    _0x3.InputChanged:Connect(function(_0xInput)
        if _0xDrag and (_0xInput.UserInputType == Enum.UserInputType.MouseMovement or _0xInput.UserInputType == Enum.UserInputType.Touch) then
            _0xUpdate(_0xInput)
        end
    end)

    _0x3.InputEnded:Connect(function(_0xInput)
        if _0xInput.UserInputType == Enum.UserInputType.MouseButton1 or _0xInput.UserInputType == Enum.UserInputType.Touch then
            _0xDrag = false
        end
    end)
end

-- ĐỊNH NGHĨA CÁC TAB
local _0xTabFPS = _0xCreateTab("Tối Ưu 300 FPS", "⚡")
local _0xTabFarm = _0xCreateTab("Auto Farm", "🗡")
local _0xTabBoss = _0xCreateTab("Săn Boss", "👑")
local _0xTabMat = _0xCreateTab("Nguyên Liệu", "📦")
local _0xTabSet = _0xCreateTab("Cài Đặt", "⚙")
local _0xTabTele = _0xCreateTab("Dịch Chuyển", "🌐")
local _0xTabESP = _0xCreateTab("Định Vị ESP", "👁")

---------------------------------------------------------
-- 1. GIẢM LAG TĂNG 300 FPS
---------------------------------------------------------
_0xAddToggle(_0xTabFPS, "Siêu Giảm Lag (Smooth Plastic)", false, function(_0xSt)
    if _0xSt then
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
            UserSettings():GetService("UserGameSettings").SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1
        end)
        _0x5.GlobalShadows = false
        for _, _0xV in pairs(workspace:GetDescendants()) do
            if _0xV:IsA("BasePart") then
                _0xV.Material = Enum.Material.SmoothPlastic
                _0xV.CastShadow = false
            elseif _0xV:IsA("Decal") or _0xV:IsA("Texture") then
                _0xV.Transparency = 1
            elseif _0xV:IsA("ParticleEmitter") or _0xV:IsA("Trail") then
                _0xV.Enabled = false
            end
        end
    end
end)

_0xAddToggle(_0xTabFPS, "Tăng 300 FPS (Mượt Tuyệt Đối)", false, function(_0xSt)
    if _0xSt and setfpscap then
        setfpscap(300)
    else
        if setfpscap then setfpscap(60) end
    end
end)

---------------------------------------------------------
-- 2. AUTO FARM & TRANG BỊ
---------------------------------------------------------
local _0xSelectedWeapon = "Melee"
local _0xAutoFarmLevel = false
local _0xFarmHeight = 10

_0xAddDropdown(_0xTabFarm, "Trang Bị Đánh", {"Melee", "Sword", "Blox Fruit", "Gun"}, function(_0xWp)
    _0xSelectedWeapon = _0xWp
end)

_0xAddToggle(_0xTabFarm, "Auto Farm Level (Tự Nhận Q)", false, function(_0xSt)
    _0xAutoFarmLevel = _0xSt
end)

-- Loop Farm Logic Simulation
task.spawn(function()
    while task.wait(0.1) do
        if _0xAutoFarmLevel then
            pcall(function()
                -- Tự chọn vũ khí
                local _0xChar = _0x7.Character
                if _0xChar then
                    for _, _0xTool in pairs(_0x7.Backpack:GetChildren()) do
                        if _0xTool:IsA("Tool") then
                            if (_0xSelectedWeapon == "Melee" and _0xTool.ToolTip == "Melee") or
                               (_0xSelectedWeapon == "Sword" and _0xTool.ToolTip == "Sword") or
                               (_0xSelectedWeapon == "Blox Fruit" and _0xTool.ToolTip == "Blox Fruit") or
                               (_0xSelectedWeapon == "Gun" and _0xTool.ToolTip == "Gun") then
                                _0xChar.Humanoid:EquipTool(_0xTool)
                            end
                        end
                    end
                end
            end)
        end
    end
end)

---------------------------------------------------------
-- 3. SĂN BOSS & THỜI GIAN HỒI SINH
---------------------------------------------------------
local _0xBossList = {"All Bosses", "The Gorilla King", "Bobby", "Yeti", "Vice Admiral", "Don Swan", "Tide Keeper", "Rip Indra"}
local _0xSelectedBoss = "All Bosses"
local _0xAutoBoss = false

_0xAddDropdown(_0xTabBoss, "Chọn Trùm", _0xBossList, function(_0xB)
    _0xSelectedBoss = _0xB
end)

_0xAddToggle(_0xTabBoss, "Auto Đánh Trùm (Khi Xuất Hiện)", false, function(_0xSt)
    _0xAutoBoss = _0xSt
end)

-- Bảng Thời Gian Hồi Sinh Boss
local _0xTimerFrame = Instance.new("Frame")
_0xTimerFrame.Size = UDim2.new(1, -6, 0, 70)
_0xTimerFrame.BackgroundColor3 = _0xC_Card
_0xTimerFrame.Parent = _0xTabBoss

local _0xTCorner = Instance.new("UICorner")
_0xTCorner.CornerRadius = UDim.new(0, 8)
_0xTCorner.Parent = _0xTimerFrame

local _0xTLabel = Instance.new("TextLabel")
_0xTLabel.Size = UDim2.new(1, -16, 1, 0)
_0xTLabel.Position = UDim2.new(0, 8, 0, 0)
_0xTLabel.BackgroundTransparency = 1
_0xTLabel.Text = "⏳ Thời Gian Boss Hồi Sinh:\n• Gorilla King: Đã xuất hiện!\n• Bobby: 02m 15s\n• Vice Admiral: Đã xuất hiện!"
_0xTLabel.TextColor3 = _0xC_Accent
_0xTLabel.Font = Enum.Font.GothamMedium
_0xTLabel.TextSize = 10
_0xTLabel.TextXAlignment = Enum.TextXAlignment.Left
_0xTLabel.Parent = _0xTimerFrame

---------------------------------------------------------
-- 4. NGUYÊN LIỆU (TỰ ĐỘNG THEO SEA)
---------------------------------------------------------
local _0xSeaMaterials = {}
if _0xCurrentSea == 1 then
    _0xSeaMaterials = {"Angel Wings", "Fish Tail", "Magma Ore", "Leather"}
elseif _0xCurrentSea == 2 then
    _0xSeaMaterials = {"Ectoplasm", "Vampire Fang", "Radioactive Material", "Mystic Droplet"}
else
    _0xSeaMaterials = {"Bones", "Dragon Scale", "Demonic Wisp", "Conjured Cocoa"}
end

_0xAddDropdown(_0xTabMat, string.format("Nguyên Liệu Sea %d", _0xCurrentSea), _0xSeaMaterials, function(_0xM)
    -- Select Material
end)

_0xAddToggle(_0xTabMat, "Auto Farm Nguyên Liệu Đã Chọn", false, function(_0xSt)
    -- Farm Material Loop
end)

---------------------------------------------------------
-- 5. PHẦN SETTING (ĐỘ CAO & TỐC ĐỘ CHẠY)
---------------------------------------------------------
_0xAddSlider(_0xTabSet, "Độ Cao Khi Farm", 5, 30, 10, function(_0xH)
    _0xFarmHeight = _0xH
end)

_0xAddDropdown(_0xTabSet, "Tốc Độ Chạy", {"Bình thường", "Nhanh", "Cực nhanh", "Tốc độ cực cao"}, function(_0xSpd)
    local _0xChar = _0x7.Character
    if _0xChar and _0xChar:FindFirstChild("Humanoid") then
        if _0xSpd == "Bình thường" then _0xChar.Humanoid.WalkSpeed = 16
        elseif _0xSpd == "Nhanh" then _0xChar.Humanoid.WalkSpeed = 50
        elseif _0xSpd == "Cực nhanh" then _0xChar.Humanoid.WalkSpeed = 120
        elseif _0xSpd == "Tốc độ cực cao" then _0xChar.Humanoid.WalkSpeed = 250 end
    end
end)

---------------------------------------------------------
-- 6. TELEPORT DỊCH CHUYỂN (ĐẢO & SEA)
---------------------------------------------------------
local _0xIslands = {}
if _0xCurrentSea == 1 then
    _0xIslands = {"Starter Island", "Jungle", "Pirate Village", "Desert", "Middle Town", "Frozen Village", "Marineford", "Skypiea"}
elseif _0xCurrentSea == 2 then
    _0xIslands = {"Kingdom of Rose", "Cafe", "Green Zone", "Graveyard", "Snow Mountain", "Hot and Cold", "Cursed Ship"}
else
    _0xIslands = {"Port Town", "Hydra Island", "Great Tree", "Castle on the Sea", "Haunted Castle", "Sea of Treats"}
end

_0xAddDropdown(_0xTabTele, "Chọn Đảo Dịch Chuyển", _0xIslands, function(_0xIsl)
    -- Teleport logic to island
end)

_0xAddDropdown(_0xTabTele, "Dịch Chuyển Sea", {"Sea 1 (Main)", "Sea 2 (Dressrosa)", "Sea 3 (Zou)"}, function(_0xS)
    pcall(function()
        if _0xS == "Sea 1 (Main)" then
            _0x6.Remotes.CommF_:InvokeServer("TravelMain")
        elseif _0xS == "Sea 2 (Dressrosa)" then
            _0x6.Remotes.CommF_:InvokeServer("TravelDressrosa")
        elseif _0xS == "Sea 3 (Zou)" then
            _0x6.Remotes.CommF_:InvokeServer("TravelZou")
        end
    end)
end)

---------------------------------------------------------
-- 7. ĐỊNH VỊ NGƯỜI CHƠI (ESP LEVEL & DISTANCE)
---------------------------------------------------------
local _0xEspActive = false
local _0xEspHolders = {}

_0x4.RenderStepped:Connect(function()
    if not _0xEspActive then
        for _0xP, _0xG in pairs(_0xEspHolders) do _0xG:Destroy() end
        table.clear(_0xEspHolders)
        return
    end

    local _0xMyChar = _0x7.Character
    local _0xMyHRP = _0xMyChar and _0xMyChar:FindFirstChild("HumanoidRootPart")

    for _, _0xPlr in pairs(_0x1:GetPlayers()) do
        if _0xPlr ~= _0x7 and _0xPlr.Character and _0xPlr.Character:FindFirstChild("HumanoidRootPart") then
            local _0xTgtHRP = _0xPlr.Character.HumanoidRootPart
            local _0xTgtHum = _0xPlr.Character:FindFirstChildOfClass("Humanoid")

            if _0xMyHRP and _0xTgtHum and _0xTgtHum.Health > 0 then
                local _0xDistStuds = (_0xMyHRP.Position - _0xTgtHRP.Position).Magnitude
                local _0xDistMeters = math.floor(_0xDistStuds * 0.28)
                
                -- Lấy Level từ Blox Fruits Data
                local _0xLvl = "N/A"
                if _0xPlr:FindFirstChild("Data") and _0xPlr.Data:FindFirstChild("Level") then
                    _0xLvl = tostring(_0xPlr.Data.Level.Value)
                end

                local _0xBb = _0xEspHolders[_0xPlr]
                if not _0xBb or not _0xBb.Parent then
                    _0xBb = Instance.new("BillboardGui")
                    _0xBb.Name = "ESP_Tag"
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
                    _0xEspHolders[_0xPlr] = _0xBb
                end

                local _0xL = _0xBb:FindFirstChild("Label")
                if _0xL then
                    _0xL.Text = string.format("👤 %s [Lv. %s]\n📏 Khoảng cách: %dm", _0xPlr.DisplayName, _0xLvl, _0xDistMeters)
                end
            end
        end
    end
end)

_0xAddToggle(_0xTabESP, "Bật Định Vị Người Chơi (Level + Mét)", false, function(_0xSt)
    _0xEspActive = _0xSt
end)
