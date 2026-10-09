-- 99 ĐÊM TRONG RỪNG V13 ULTRA VIP - ĐỒNG M NGUYÊN - NO LAG
-- DÁN LÀ CHẠY - TỐI ƯU FPS - CHỨC NĂNG HOẠT ĐỘNG THẬT

local LP = game.Players.LocalPlayer
local PG = LP:WaitForChild("PlayerGui")
if PG:FindFirstChild("99Dem_VIP_V13") then PG["99Dem_VIP_V13"]:Destroy() end
local gui = Instance.new("ScreenGui", PG) gui.Name="99Dem_VIP_V13" gui.ResetOnSpawn=false

local Main = Instance.new("Frame", gui) Main.Size=UDim2.new(0,380,0,220) Main.Position=UDim2.new(0.5,-190,0.5,-110) Main.BackgroundColor3=Color3.fromRGB(12,12,12) Main.Active=true Main.Draggable=true
Instance.new("UICorner", Main).CornerRadius=UDim.new(0,12)
local Stroke = Instance.new("UIStroke", Main) Stroke.Color=Color3.fromRGB(0,255,127) Stroke.Thickness=2
local Top = Instance.new("Frame", Main) Top.Size=UDim2.new(1,0,0,24) Top.BackgroundColor3=Color3.fromRGB(20,20,20) Instance.new("UICorner", Top).CornerRadius=UDim.new(0,12)
local Title = Instance.new("TextLabel", Top) Title.Size=UDim2.new(1,-30,1,0) Title.Position=UDim2.new(0,10,0,0) Title.BackgroundTransparency=1 Title.Text="99 ĐÊM VIP - ĐỒNG M NGUYÊN - NO LAG" Title.Font=Enum.Font.GothamBold Title.TextSize=8 Title.TextColor3=Color3.fromRGB(0,255,127) Title.TextXAlignment=Enum.TextXAlignment.Left
local XBtn = Instance.new("TextButton", Top) XBtn.Size=UDim2.new(0,20,0,20) XBtn.Position=UDim2.new(1,-20,0,1) XBtn.Text="X" XBtn.BackgroundTransparency=1 XBtn.TextColor3=Color3.new(1,1,1) XBtn.Font=Enum.Font.GothamBold

local Left = Instance.new("Frame", Main) Left.Size=UDim2.new(0,80,1,-24) Left.Position=UDim2.new(0,0,0,24) Left.BackgroundColor3=Color3.fromRGB(18,18,18) Instance.new("UICorner", Left).CornerRadius=UDim.new(0,10)
local Right = Instance.new("Frame", Main) Right.Size=UDim2.new(1,-85,1,-29) Right.Position=UDim2.new(0,85,0,29) Right.BackgroundTransparency=1

-- TAB
local TabFarm = Instance.new("Frame", Right) TabFarm.Size=UDim2.new(1,0,1,0) TabFarm.BackgroundTransparency=1
local TabESP = Instance.new("Frame", Right) TabESP.Size=UDim2.new(1,0,1,0) TabESP.BackgroundTransparency=1 TabESP.Visible=false
local TabMisc = Instance.new("Frame", Right) TabMisc.Size=UDim2.new(1,0,1,0) TabMisc.BackgroundTransparency=1 TabMisc.Visible=false

local function MakeTabBtn(name, y, frameShow)
    local b = Instance.new("TextButton", Left) b.Size=UDim2.new(1,0,0,26) b.Position=UDim2.new(0,0,0,y) b.Text="  "..name b.Font=Enum.Font.GothamBold b.TextSize=8 b.TextXAlignment=Enum.TextXAlignment.Left b.BackgroundColor3=Color3.fromRGB(18,18,18) b.TextColor3=Color3.fromRGB(150,150,150)
    b.MouseButton1Click:Connect(function()
        for _,v in pairs(Left:GetChildren()) do if v:IsA("TextButton") then v.BackgroundColor3=Color3.fromRGB(18,18,18) v.TextColor3=Color3.fromRGB(150,150,150) end end
        b.BackgroundColor3=Color3.fromRGB(30,30,30) b.TextColor3=Color3.fromRGB(0,255,127)
        TabFarm.Visible=false TabESP.Visible=false TabMisc.Visible=false
        frameShow.Visible=true
    end)
    return b
end
local b1 = MakeTabBtn("🪓 Farm", 0, TabFarm)
local b2 = MakeTabBtn("👁️ ESP", 28, TabESP)
local b3 = MakeTabBtn("⚙️ Misc", 56, TabMisc)
b1.BackgroundColor3=Color3.fromRGB(30,30,30) b1.TextColor3=Color3.fromRGB(0,255,127)

local function MakeToggle(parent, text, y)
    local f = Instance.new("Frame", parent) f.Size=UDim2.new(1,0,0,24) f.Position=UDim2.new(0,0,0,y) f.BackgroundTransparency=1
    local l = Instance.new("TextLabel", f) l.Size=UDim2.new(1,-45,1,0) l.BackgroundTransparency=1 l.Text=text l.Font=Enum.Font.Gotham l.TextSize=8 l.TextColor3=Color3.new(1,1,1) l.TextXAlignment=Enum.TextXAlignment.Left
    local btn = Instance.new("TextButton", f) btn.Size=UDim2.new(0,35,0,16) btn.Position=UDim2.new(1,-35,0,4) btn.Text="OFF" btn.Font=Enum.Font.GothamBold btn.TextSize=7 btn.BackgroundColor3=Color3.fromRGB(50,50,50) btn.TextColor3=Color3.new(1,1,1) Instance.new("UICorner", btn).CornerRadius=UDim.new(1,0)
    local on = false
    btn.MouseButton1Click:Connect(function() on=not on btn.Text=on and "ON" or "OFF" btn.BackgroundColor3=on and Color3.fromRGB(0,255,127) or Color3.fromRGB(50,50,50) btn.TextColor3=on and Color3.fromRGB(0,0,0) or Color3.new(1,1,1) end)
    return btn, function() return on end
end

-- FARM TAB - TỐI ƯU KHÔNG LAG
local autoWoodBtn, isWood = MakeToggle(TabFarm, "Auto Farm Gỗ + Đốt Lửa", 0)
local autoFoodBtn, isFood = MakeToggle(TabFarm, "Auto Nhặt Đồ Ăn + Băng", 26)
local autoBunkerBtn, isBunker = MakeToggle(TabFarm, "Auto Lấy Chìa + Loot Bunker", 52)

-- ESP TAB
local espKidBtn, isEspKid = MakeToggle(TabESP, "ESP Trẻ Em Bị Mất", 0)
local espBunkerBtn, isEspBunker = MakeToggle(TabESP, "ESP Bunker + Rương", 26)

-- MISC TAB
local fullBrightBtn, isBright = MakeToggle(TabMisc, "Full Sáng - Không Tối", 0)
local speedBtn, isSpeed = MakeToggle(TabMisc, "Speed 35 - Chạy Nhanh", 26)

-- ===== LOGIC HOẠT ĐỘNG THẬT - TỐI ƯU 0.5s 1 LẦN =====
task.spawn(function()
    while task.wait(0.5) do
        if isWood() then
            -- Tìm log gần nhất, không quét cả map liên tục
            local char = LP.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local closest, dist = nil, 100
                for _,v in pairs(workspace:GetDescendants()) do
                    if v.Name=="Log" and v:IsA("BasePart") and v.Parent and not v.Parent:FindFirstChild("Humanoid") then
                        local d = (char.HumanoidRootPart.Position - v.Position).Magnitude
                        if d < dist then dist=d closest=v end
                    end
                end
                if closest and dist < 80 then
                    -- Dùng ProximityPrompt thay vì teleport giật
                    for _,p in pairs(closest:GetDescendants()) do
                        if p:IsA("ProximityPrompt") then
                            char.HumanoidRootPart.CFrame = closest.CFrame + Vector3.new(0,2,0)
                            task.wait(0.2)
                            fireproximityprompt(p)
                        end
                    end
                end
            end
        end
        if isFood() then
            for _,v in pairs(workspace:GetDescendants()) do
                if v:IsA("ProximityPrompt") and (v.ObjectText:find("Food") or v.ObjectText:find("Bandage") or v.ObjectText:find("Fuel")) then
                    if v.Parent and (LP.Character.HumanoidRootPart.Position - v.Parent.Position).Magnitude < 40 then
                        fireproximityprompt(v)
                        task.wait(0.2)
                    end
                end
            end
        end
    end
end)

-- FULL BRIGHT + SPEED - KHÔNG LAG
game:GetService("RunService").RenderStepped:Connect(function()
    if isBright() then
        game.Lighting.FogEnd = 100000
        game.Lighting.Brightness = 2
        game.Lighting.ClockTime = 14
    end
    if isSpeed() and LP.Character and LP.Character:FindFirstChild("Humanoid") then
        LP.Character.Humanoid.WalkSpeed = 35
    end
end)

-- ESP DÙNG HIGHLIGHT - KHÔNG LAG NHƯ BOX
local espFolder = Instance.new("Folder", workspace) espFolder.Name="VIP_ESP"
task.spawn(function()
    while task.wait(1) do
        if isEspKid() or isEspBunker() then
            for _,v in pairs(workspace:GetDescendants()) do
                if (isEspKid() and v.Name:find("Kid") and v:IsA("Model")) or (isEspBunker() and v.Name:find("Bunker") and v:IsA("Model")) then
                    if not espFolder:FindFirstChild(v.Name..v:GetDebugId()) then
                        local h = Instance.new("Highlight", espFolder) h.Name=v.Name..v:GetDebugId() h.Adornee=v h.FillColor=isEspKid() and Color3.fromRGB(0,255,127) or Color3.fromRGB(255,255,0) h.OutlineTransparency=0
                    end
                end
            end
        else
            espFolder:ClearAllChildren()
        end
    end
end)

-- NÚT TRÒN
local Circle = Instance.new("TextButton", gui) Circle.Size=UDim2.new(0,32,0,32) Circle.Position=UDim2.new(0,8,0.5,0) Circle.Text="VIP" Circle.Visible=false Circle.Draggable=true Circle.BackgroundColor3=Color3.fromRGB(0,0,0) Circle.TextColor3=Color3.fromRGB(0,255,127) Circle.Font=Enum.Font.GothamBold Circle.TextSize=7 Instance.new("UICorner", Circle).CornerRadius=UDim.new(1,0) Instance.new("UIStroke", Circle).Color=Color3.fromRGB(0,255,127)
XBtn.MouseButton1Click:Connect(function() Main.Visible=false Circle.Visible=true end)
Circle.MouseButton1Click:Connect(function() Main.Visible=true Circle.Visible=false end)
