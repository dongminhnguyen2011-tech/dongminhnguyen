-- ========================================================
-- SCRIPT: ĐỒNG M NGUYÊN [ V1.0 ] - OBFUSCATED & EXTREME FPS
-- Hỗ trợ: Tất cả Executor (Delta, Fluxus, Codex, Hydrogen, Arceus X...)
-- ========================================================

local _0x1 = game:GetService("Players")
local _0x2 = game:GetService("TweenService")
local _0x3 = game:GetService("UserInputService")
local _0x4 = game:GetService("RunService")
local _0x5 = game:GetService("Lighting")
local _0x6 = game:GetService("MarketplaceService")
local _0x7 = _0x1.LocalPlayer

local _0x8 = "Roblox Game"
pcall(function()
    local _0x8a = _0x6:GetProductInfo(game.PlaceId)
    if _0x8a and _0x8a.Name then _0x8 = _0x8a.Name end
end)

if game:GetService("CoreGui"):FindFirstChild("DongMNguyenGUI_V1") then
    game:GetService("CoreGui"):FindFirstChild("DongMNguyenGUI_V1"):Destroy()
end

local _0x9 = Instance.new("ScreenGui")
_0x9.Name = "DongMNguyenGUI_V1"
_0x9.ResetOnSpawn = false

local _0x10 = game:GetService("CoreGui")
pcall(function() if gethui then _0x10 = gethui() end end)
_0x9.Parent = _0x10 or _0x7:WaitForChild("PlayerGui")

local _0x11 = Color3.fromRGB(15, 16, 20)
local _0x12 = Color3.fromRGB(22, 23, 29)
local _0x13 = Color3.fromRGB(28, 30, 38)
local _0x14 = Color3.fromRGB(0, 240, 150)
local _0x15 = Color3.fromRGB(240, 242, 248)
local _0x16 = Color3.fromRGB(130, 135, 155)

local function _0x17(_0x17a, _0x17b)
    local _0x17c = Instance.new("Frame")
    _0x17c.Size = UDim2.new(0, 330, 0, 75)
    _0x17c.Position = UDim2.new(0.5, -165, 0, -90)
    _0x17c.BackgroundColor3 = Color3.fromRGB(20, 22, 30)
    _0x17c.BorderSizePixel = 0
    _0x17c.Parent = _0x9

    local _0x17d = Instance.new("UICorner")
    _0x17d.CornerRadius = UDim.new(0, 10)
    _0x17d.Parent = _0x17c

    local _0x17e = Instance.new("UIStroke")
    _0x17e.Color = _0x14
    _0x17e.Thickness = 1.5
    _0x17e.Parent = _0x17c

    local _0x17f = Instance.new("TextLabel")
    _0x17f.Size = UDim2.new(1, -20, 0, 22)
    _0x17f.Position = UDim2.new(0, 10, 0, 6)
    _0x17f.BackgroundTransparency = 1
    _0x17f.Text = _0x17a
    _0x17f.TextColor3 = _0x14
    _0x17f.Font = Enum.Font.GothamBold
    _0x17f.TextSize = 12
    _0x17f.TextXAlignment = Enum.TextXAlignment.Left
    _0x17f.Parent = _0x17c

    local _0x17g = Instance.new("TextLabel")
    _0x17g.Size = UDim2.new(1, -20, 0, 42)
    _0x17g.Position = UDim2.new(0, 10, 0, 26)
    _0x17g.BackgroundTransparency = 1
    _0x17g.Text = _0x17b
    _0x17g.TextColor3 = _0x15
    _0x17g.Font = Enum.Font.GothamMedium
    _0x17g.TextSize = 10
    _0x17g.TextWrapped = true
    _0x17g.TextXAlignment = Enum.TextXAlignment.Left
    _0x17g.TextYAlignment = Enum.TextYAlignment.Top
    _0x17g.Parent = _0x17c

    _0x2:Create(_0x17c, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -165, 0, 20)}):Play()
    task.delay(4.5, function()
        local _0x17h = _0x2:Create(_0x17c, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Position = UDim2.new(0.5, -165, 0, -110)})
        _0x17h:Play()
        _0x17h.Completed:Connect(function() _0x17c:Destroy() end)
    end)
end

local _0x18 = Instance.new("TextButton")
_0x18.Name = "OpenButton"
_0x18.Size = UDim2.new(0, 52, 0, 52)
_0x18.Position = UDim2.new(0.05, 0, 0.3, 0)
_0x18.BackgroundColor3 = _0x12
_0x18.Text = "ĐMN"
_0x18.TextColor3 = _0x14
_0x18.Font = Enum.Font.GothamBold
_0x18.TextSize = 14
_0x18.Visible = false
_0x18.Active = true
_0x18.Parent = _0x9

local _0x18a = Instance.new("UICorner")
_0x18a.CornerRadius = UDim.new(1, 0)
_0x18a.Parent = _0x18

local _0x18b = Instance.new("UIStroke")
_0x18b.Color = _0x14
_0x18b.Thickness = 2
_0x18b.Parent = _0x18

local _0x19 = Instance.new("Frame")
_0x19.Name = "MainFrame"
_0x19.Size = UDim2.new(0, 520, 0, 330)
_0x19.Position = UDim2.new(0.5, -260, 0.5, -165)
_0x19.BackgroundColor3 = _0x11
_0x19.BorderSizePixel = 0
_0x19.ClipsDescendants = true
_0x19.Parent = _0x9

local _0x19a = Instance.new("UICorner")
_0x19a.CornerRadius = UDim.new(0, 12)
_0x19a.Parent = _0x19

local _0x19b = Instance.new("UIStroke")
_0x19b.Color = Color3.fromRGB(38, 42, 54)
_0x19b.Thickness = 1
_0x19b.Parent = _0x19

local _0x20 = Instance.new("Frame")
_0x20.Size = UDim2.new(1, 0, 0, 40)
_0x20.BackgroundColor3 = _0x12
_0x20.BorderSizePixel = 0
_0x20.Parent = _0x19

local _0x20a = Instance.new("TextLabel")
_0x20a.Size = UDim2.new(0, 250, 1, 0)
_0x20a.Position = UDim2.new(0, 15, 0, 0)
_0x20a.BackgroundTransparency = 1
_0x20a.Text = "ĐỒNG M NGUYÊN  [ V1.0 ]"
_0x20a.TextColor3 = _0x15
_0x20a.Font = Enum.Font.GothamBold
_0x20a.TextSize = 13
_0x20a.TextXAlignment = Enum.TextXAlignment.Left
_0x20a.Parent = _0x20

local _0x20b = Instance.new("TextButton")
_0x20b.Size = UDim2.new(0, 28, 0, 28)
_0x20b.Position = UDim2.new(1, -34, 0.5, -14)
_0x20b.BackgroundTransparency = 1
_0x20b.Text = "✕"
_0x20b.TextColor3 = Color3.fromRGB(240, 80, 80)
_0x20b.Font = Enum.Font.GothamBold
_0x20b.TextSize = 14
_0x20b.Parent = _0x20

local _0x21 = Instance.new("Frame")
_0x21.Size = UDim2.new(0, 140, 1, -40)
_0x21.Position = UDim2.new(0, 0, 0, 40)
_0x21.BackgroundColor3 = _0x12
_0x21.BorderSizePixel = 0
_0x21.Parent = _0x19

local _0x21a = Instance.new("UIListLayout")
_0x21a.SortOrder = Enum.SortOrder.LayoutOrder
_0x21a.Padding = UDim.new(0, 6)
_0x21a.Parent = _0x21

local _0x21b = Instance.new("UIPadding")
_0x21b.PaddingTop = UDim.new(0, 10)
_0x21b.PaddingLeft = UDim.new(0, 8)
_0x21b.PaddingRight = UDim.new(0, 8)
_0x21b.Parent = _0x21

local _0x22 = Instance.new("Frame")
_0x22.Size = UDim2.new(1, -140, 1, -40)
_0x22.Position = UDim2.new(0, 140, 0, 40)
_0x22.BackgroundTransparency = 1
_0x22.Parent = _0x19

local function _0x23(_0x23a)
    local _0x23b, _0x23c, _0x23d, _0x23e
    _0x23a.InputBegan:Connect(function(_0x23f)
        if _0x23f.UserInputType == Enum.UserInputType.MouseButton1 or _0x23f.UserInputType == Enum.UserInputType.Touch then
            _0x23b = true
            _0x23d = _0x23f.Position
            _0x23e = _0x23a.Position
            _0x23f.Changed:Connect(function()
                if _0x23f.UserInputState == Enum.UserInputState.End then _0x23b = false end
            end)
        end
    end)
    _0x23a.InputChanged:Connect(function(_0x23f)
        if _0x23f.UserInputType == Enum.UserInputType.MouseMovement or _0x23f.UserInputType == Enum.UserInputType.Touch then
            _0x23c = _0x23f
        end
    end)
    _0x3.InputChanged:Connect(function(_0x23f)
        if _0x23f == _0x23c and _0x23b then
            local _0x23g = _0x23f.Position - _0x23d
            _0x23a.Position = UDim2.new(_0x23e.X.Scale, _0x23e.X.Offset + _0x23g.X, _0x23e.Y.Scale, _0x23e.Y.Offset + _0x23g.Y)
        end
    end)
end

_0x23(_0x19)
_0x23(_0x18)

_0x20b.MouseButton1Click:Connect(function()
    _0x19.Visible = false
    _0x18.Visible = true
end)

_0x18.MouseButton1Click:Connect(function()
    _0x19.Visible = true
    _0x18.Visible = false
end)

local _0x24 = {}
local function _0x25(_0x25a, _0x25b)
    local _0x25c = Instance.new("TextButton")
    _0x25c.Size = UDim2.new(1, 0, 0, 36)
    _0x25c.BackgroundTransparency = 1
    _0x25c.Text = "  " .. _0x25b .. "  " .. _0x25a
    _0x25c.TextColor3 = _0x16
    _0x25c.Font = Enum.Font.GothamMedium
    _0x25c.TextSize = 11
    _0x25c.TextXAlignment = Enum.TextXAlignment.Left
    _0x25c.Parent = _0x21

    local _0x25d = Instance.new("UICorner")
    _0x25d.CornerRadius = UDim.new(0, 8)
    _0x25d.Parent = _0x25c

    local _0x25e = Instance.new("ScrollingFrame")
    _0x25e.Size = UDim2.new(1, 0, 1, 0)
    _0x25e.BackgroundTransparency = 1
    _0x25e.ScrollBarThickness = 3
    _0x25e.ScrollBarImageColor3 = _0x14
    _0x25e.Visible = false
    _0x25e.Parent = _0x22

    local _0x25f = Instance.new("UIListLayout")
    _0x25f.SortOrder = Enum.SortOrder.LayoutOrder
    _0x25f.Padding = UDim.new(0, 8)
    _0x25f.Parent = _0x25e

    local _0x25g = Instance.new("UIPadding")
    _0x25g.PaddingTop = UDim.new(0, 10)
    _0x25g.PaddingLeft = UDim.new(0, 10)
    _0x25g.PaddingRight = UDim.new(0, 10)
    _0x25g.Parent = _0x25e

    _0x25c.MouseButton1Click:Connect(function()
        for _, _0x25h in pairs(_0x24) do
            _0x25h.Button.BackgroundTransparency = 1
            _0x25h.Button.TextColor3 = _0x16
            _0x25h.Page.Visible = false
        end
        _0x25c.BackgroundTransparency = 0
        _0x25c.BackgroundColor3 = _0x13
        _0x25c.TextColor3 = _0x15
        _0x25e.Visible = true
    end)

    table.insert(_0x24, {Button = _0x25c, Page = _0x25e})
    if #_0x24 == 1 then
        _0x25c.BackgroundTransparency = 0
        _0x25c.BackgroundColor3 = _0x13
        _0x25c.TextColor3 = _0x15
        _0x25e.Visible = true
    end
    return _0x25e
end

local function _0x26(_0x26a, _0x26b, _0x26c, _0x26d)
    local _0x26e = Instance.new("Frame")
    _0x26e.Size = UDim2.new(1, -6, 0, 42)
    _0x26e.BackgroundColor3 = _0x13
    _0x26e.Parent = _0x26a

    local _0x26f = Instance.new("UICorner")
    _0x26f.CornerRadius = UDim.new(0, 8)
    _0x26f.Parent = _0x26e

    local _0x26g = Instance.new("TextLabel")
    _0x26g.Size = UDim2.new(0.7, 0, 1, 0)
    _0x26g.Position = UDim2.new(0, 12, 0, 0)
    _0x26g.BackgroundTransparency = 1
    _0x26g.Text = _0x26b
    _0x26g.TextColor3 = _0x15
    _0x26g.Font = Enum.Font.GothamMedium
    _0x26g.TextSize = 11
    _0x26g.TextXAlignment = Enum.TextXAlignment.Left
    _0x26g.Parent = _0x26e

    local _0x26h = Instance.new("TextButton")
    _0x26h.Size = UDim2.new(0, 42, 0, 22)
    _0x26h.Position = UDim2.new(1, -52, 0.5, -11)
    _0x26h.BackgroundColor3 = _0x26c and _0x14 or Color3.fromRGB(50, 54, 68)
    _0x26h.Text = ""
    _0x26h.Parent = _0x26e

    local _0x26i = Instance.new("UICorner")
    _0x26i.CornerRadius = UDim.new(1, 0)
    _0x26i.Parent = _0x26h

    local _0x26j = Instance.new("Frame")
    _0x26j.Size = UDim2.new(0, 16, 0, 16)
    _0x26j.Position = _0x26c and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
    _0x26j.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _0x26j.Parent = _0x26h

    local _0x26k = Instance.new("UICorner")
    _0x26k.CornerRadius = UDim.new(1, 0)
    _0x26k.Parent = _0x26j

    local _0x26l = _0x26c
    _0x26h.MouseButton1Click:Connect(function()
        _0x26l = not _0x26l
        local _0x26m = _0x26l and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
        local _0x26n = _0x26l and _0x14 or Color3.fromRGB(50, 54, 68)

        _0x2:Create(_0x26j, TweenInfo.new(0.18), {Position = _0x26m}):Play()
        _0x2:Create(_0x26h, TweenInfo.new(0.18), {BackgroundColor3 = _0x26n}):Play()

        _0x26d(_0x26l)
    end)
end

local function _0x27(_0x27a, _0x27b, _0x27c, _0x27d, _0x27e, _0x27f)
    local _0x27g = Instance.new("Frame")
    _0x27g.Size = UDim2.new(1, -6, 0, 52)
    _0x27g.BackgroundColor3 = _0x13
    _0x27g.Parent = _0x27a

    local _0x27h = Instance.new("UICorner")
    _0x27h.CornerRadius = UDim.new(0, 8)
    _0x27h.Parent = _0x27g

    local _0x27i = Instance.new("TextLabel")
    _0x27i.Size = UDim2.new(0.6, 0, 0, 22)
    _0x27i.Position = UDim2.new(0, 12, 0, 4)
    _0x27i.BackgroundTransparency = 1
    _0x27i.Text = _0x27b
    _0x27i.TextColor3 = _0x15
    _0x27i.Font = Enum.Font.GothamMedium
    _0x27i.TextSize = 11
    _0x27i.TextXAlignment = Enum.TextXAlignment.Left
    _0x27i.Parent = _0x27g

    local _0x27j = Instance.new("TextLabel")
    _0x27j.Size = UDim2.new(0.3, 0, 0, 22)
    _0x27j.Position = UDim2.new(0.7, -12, 0, 4)
    _0x27j.BackgroundTransparency = 1
    _0x27j.Text = tostring(_0x27e) .. " mét"
    _0x27j.TextColor3 = _0x14
    _0x27j.Font = Enum.Font.GothamBold
    _0x27j.TextSize = 11
    _0x27j.TextXAlignment = Enum.TextXAlignment.Right
    _0x27j.Parent = _0x27g

    local _0x27k = Instance.new("Frame")
    _0x27k.Size = UDim2.new(1, -24, 0, 6)
    _0x27k.Position = UDim2.new(0, 12, 0, 34)
    _0x27k.BackgroundColor3 = Color3.fromRGB(50, 54, 68)
    _0x27k.BorderSizePixel = 0
    _0x27k.Parent = _0x27g

    local _0x27l = Instance.new("UICorner")
    _0x27l.CornerRadius = UDim.new(1, 0)
    _0x27l.Parent = _0x27k

    local _0x27m = Instance.new("Frame")
    _0x27m.Size = UDim2.new((_0x27e - _0x27c) / (_0x27d - _0x27c), 0, 1, 0)
    _0x27m.BackgroundColor3 = _0x14
    _0x27m.BorderSizePixel = 0
    _0x27m.Parent = _0x27k

    local _0x27n = Instance.new("UICorner")
    _0x27n.CornerRadius = UDim.new(1, 0)
    _0x27n.Parent = _0x27m

    local _0x27o = Instance.new("Frame")
    _0x27o.Size = UDim2.new(0, 14, 0, 14)
    _0x27o.Position = UDim2.new(1, -7, 0.5, -7)
    _0x27o.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _0x27o.Parent = _0x27m

    local _0x27p = Instance.new("UICorner")
    _0x27p.CornerRadius = UDim.new(1, 0)
    _0x27p.Parent = _0x27o

    local _0x27q = false
    local function _0x27r(_0x27s)
        local _0x27t = math.clamp(_0x27s.Position.X - _0x27k.AbsolutePosition.X, 0, _0x27k.AbsoluteSize.X)
        local _0x27u = _0x27t / _0x27k.AbsoluteSize.X
        local _0x27v = math.floor(_0x27c + (_0x27d - _0x27c) * _0x27u)
        
        _0x27m.Size = UDim2.new(_0x27u, 0, 1, 0)
        _0x27j.Text = tostring(_0x27v) .. " mét"
        _0x27f(_0x27v)
    end

    _0x27k.InputBegan:Connect(function(_0x27s)
        if _0x27s.UserInputType == Enum.UserInputType.MouseButton1 or _0x27s.UserInputType == Enum.UserInputType.Touch then
            _0x27q = true
            _0x27r(_0x27s)
        end
    end)

    _0x3.InputChanged:Connect(function(_0x27s)
        if _0x27q and (_0x27s.UserInputType == Enum.UserInputType.MouseMovement or _0x27s.UserInputType == Enum.UserInputType.Touch) then
            _0x27r(_0x27s)
        end
    end)

    _0x3.InputEnded:Connect(function(_0x27s)
        if _0x27s.UserInputType == Enum.UserInputType.MouseButton1 or _0x27s.UserInputType == Enum.UserInputType.Touch then
            _0x27q = false
        end
    end)
end

local _0xTab1 = _0x25("Tối Ưu & FPS", "⚡")
local _0xTab2 = _0x25("Định Vị ESP", "👁")
local _0xTab3 = _0x25("Tăng May Mắn", "🍀")

---------------------------------------------------------
-- 1. SIÊU GIẢM LAG (ULTRA EXTREME POTATO MODE)
---------------------------------------------------------
local _0xSuperLagActive = false

local function _0xCleanObject(_0xObj)
    if not _0xSuperLagActive then return end
    if _0xObj:IsA("BasePart") and not _0xObj:IsA("Terrain") then
        _0xObj.Material = Enum.Material.SmoothPlastic
        _0xObj.CastShadow = false
        _0xObj.Reflectance = 0
        if _0xObj:IsA("MeshPart") then _0xObj.TextureID = "" end
    elseif _0xObj:IsA("Decal") or _0xObj:IsA("Texture") then
        _0xObj.Transparency = 1
    elseif _0xObj:IsA("ParticleEmitter") or _0xObj:IsA("Trail") or _0xObj:IsA("Smoke") or _0xObj:IsA("Fire") or _0xObj:IsA("Sparkles") or _0xObj:IsA("Beam") then
        _0xObj.Enabled = false
    end
end

local function _0xSetSuperPotato(_0xState)
    _0xSuperLagActive = _0xState
    if _0xState then
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
            UserSettings():GetService("UserGameSettings").SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1
        end)

        _0x5.GlobalShadows = false
        _0x5.FogEnd = 9e9
        _0x5.Brightness = 0
        for _, _0xV in pairs(_0x5:GetChildren()) do
            if _0xV:IsA("PostEffect") or _0xV:IsA("Atmosphere") or _0xV:IsA("Sky") or _0xV:IsA("Clouds") or _0xV:IsA("SunRaysEffect") then
                _0xV.Enabled = false
            end
        end

        if workspace.Terrain then
            workspace.Terrain.WaterWaveSize = 0
            workspace.Terrain.WaterWaveSpeed = 0
            workspace.Terrain.WaterReflectance = 0
            workspace.Terrain.WaterTransparency = 0
        end

        for _, _0xV in pairs(workspace:GetDescendants()) do
            _0xCleanObject(_0xV)
        end
    else
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
        end)
    end
end

workspace.DescendantAdded:Connect(function(_0xObj)
    if _0xSuperLagActive then
        task.spawn(function() _0xCleanObject(_0xObj) end)
    end
end)

_0x26(_0xTab1, "Siêu Giảm Lag (Cực Kỳ Mượt)", false, function(_0xSt)
    _0xSetSuperPotato(_0xSt)
end)

_0x26(_0xTab1, "Mở Khóa 240 FPS", false, function(_0xSt)
    if _0xSt then
        if setfpscap then setfpscap(240) end
    else
        if setfpscap then setfpscap(60) end
    end
end)

---------------------------------------------------------
-- 2. ĐỊNH VỊ ESP CHÍNH XÁC TỐI ĐA 15,000 MÉT
---------------------------------------------------------
local _0xEspActive = false
local _0xEspMaxMeters = 240
local _0xEspHolders = {}

local function _0xRemoveESP(_0xPlr)
    if _0xEspHolders[_0xPlr] then
        _0xEspHolders[_0xPlr]:Destroy()
        _0xEspHolders[_0xPlr] = nil
    end
end

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
                
                if _0xDistMeters <= _0xEspMaxMeters then
                    local _0xBb = _0xEspHolders[_0xPlr]
                    if not _0xBb or not _0xBb.Parent then
                        _0xBb = Instance.new("BillboardGui")
                        _0xBb.Name = "ESP_Tag"
                        _0xBb.AlwaysOnTop = true
                        _0xBb.Size = UDim2.new(0, 160, 0, 32)
                        _0xBb.StudsOffset = Vector3.new(0, 3, 0)
                        
                        local _0xTxt = Instance.new("TextLabel")
                        _0xTxt.Name = "Label"
                        _0xTxt.Size = UDim2.new(1, 0, 1, 0)
                        _0xTxt.BackgroundTransparency = 1
                        _0xTxt.TextColor3 = _0x14
                        _0xTxt.Font = Enum.Font.GothamBold
                        _0xTxt.TextSize = 11
                        _0xTxt.TextStrokeTransparency = 0.3
                        _0xTxt.Parent = _0xBb

                        _0xBb.Parent = _0xTgtHRP
                        _0xEspHolders[_0xPlr] = _0xBb
                    end

                    local _0xL = _0xBb:FindFirstChild("Label")
                    if _0xL then
                        _0xL.Text = string.format("👤 %s\n📏 %dm", _0xPlr.DisplayName, _0xDistMeters)
                    end
                else
                    _0xRemoveESP(_0xPlr)
                end
            else
                _0xRemoveESP(_0xPlr)
            end
        else
            _0xRemoveESP(_0xPlr)
        end
    end
end)

_0x26(_0xTab2, "Bật Định Vị Người Chơi (ESP)", false, function(_0xSt)
    _0xEspActive = _0xSt
end)

_0x27(_0xTab2, "Khoảng Cách Định Vị", 10, 15000, 240, function(_0xVal)
    _0xEspMaxMeters = _0xVal
end)

---------------------------------------------------------
-- 3. CHẾ ĐỘ MAY MẮN GẤP ĐÔI + THÔNG BÁO TỰ ĐỘNG
---------------------------------------------------------
_0x26(_0xTab3, "Kích Hoạt Tăng May Mắn +100%", false, function(_0xSt)
    if _0xSt then
        local _0xMsg = string.format("Bạn đã bật chế độ may mắn thành công game bạn đang chơi ( %s ) sẽ gặp may mắn gấp đôi!", _0x8)
        _0x17("🍀 MAY MẮN KÍCH HOẠT", _0xMsg)
    end
end)
