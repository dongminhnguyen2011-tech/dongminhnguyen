-- 99 ĐÊM V2 PRO - FILE 1/2 - BY ĐỒNG M NGUYÊN
for _,v in pairs((gethui and gethui() or game.CoreGui):GetChildren()) do if v.Name:find("99DMN") then v:Destroy() end end
getgenv().DMN99 = {
    Tab="FARM", AutoWood=false, FPSBoost=false, NightVision=false,
    ESPChest=false, ESPKid=false, ESPMonster=false,
    ChestDist=500, KidDist=1000, MonsterDist=300,
    WoodHeight=15
}

local gui = Instance.new("ScreenGui", gethui and gethui() or game.CoreGui)
gui.Name = "99DMN_V2"
-- NÚT TRÒN
local circle = Instance.new("TextButton", gui)
circle.Size = UDim2.new(0,55,0,55)
circle.Position = UDim2.new(0,15,0.5,0)
circle.Text = "99"
circle.TextSize = 11
circle.Font = Enum.Font.GothamBold
circle.BackgroundColor3 = Color3.fromRGB(20,20,30)
circle.TextColor3 = Color3.fromRGB(255,140,0)
circle.Visible = false
circle.Active = true
circle.Draggable = true
Instance.new("UICorner", circle).CornerRadius = UDim.new(1,0)
local cStroke = Instance.new("UIStroke", circle)
cStroke.Color = Color3.fromRGB(255,140,0)
cStroke.Thickness = 3

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,350,0,380)
main.Position = UDim2.new(0.15,0,0.15,0)
main.BackgroundColor3 = Color3.fromRGB(15,15,20)
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,12)
local mainStroke = Instance.new("UIStroke", main)
mainStroke.Color = Color3.fromRGB(255,140,0)
mainStroke.Thickness = 2

local header = Instance.new("Frame", main)
header.Size = UDim2.new(1,0,0,52)
header.BackgroundColor3 = Color3.fromRGB(25,20,15)
Instance.new("UICorner", header)
-- CHỮ CHẠY CHẬM Ở TRÊN
local marqueeFrame = Instance.new("Frame", header)
marqueeFrame.Size = UDim2.new(1,-60,0,18)
marqueeFrame.Position = UDim2.new(0,8,0,2)
marqueeFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)
marqueeFrame.ClipsDescendants = true
Instance.new("UICorner", marqueeFrame).CornerRadius = UDim.new(0,4)
local marqueeText = Instance.new("TextLabel", marqueeFrame)
marqueeText.Size = UDim2.new(0,600,1,0)
marqueeText.Position = UDim2.new(1,0,0,0)
marqueeText.Text = " ĐỒNG M NGUYÊN — SCRIPT VIP — 99 ĐÊM TRONG RỪNG — MƯỢT 120 FPS — KHÔNG LAG "
marqueeText.Font = Enum.Font.GothamBold
marqueeText.TextColor3 = Color3.fromRGB(255,215,0)
marqueeText.BackgroundTransparency = 1
marqueeText.TextSize = 9
marqueeText.TextXAlignment = Enum.TextXAlignment.Left
-- Chạy chậm
task.spawn(function()
    while task.wait(0.03) do
        pcall(function()
            marqueeText.Position = marqueeText.Position - UDim2.new(0,1,0,0)
            if marqueeText.Position.X.Offset < -600 then
                marqueeText.Position = UDim2.new(1,0,0,0)
            end
        end)
    end
end)

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(0.7,0,0,26)
title.Position = UDim2.new(0,10,0,22)
title.Text = "99 ĐÊM V2 PRO - FULL"
title.TextXAlignment = Enum.TextXAlignment.Left
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255,255,255)
title.BackgroundTransparency = 1
title.TextSize = 11

local closeX = Instance.new("TextButton", header)
closeX.Size = UDim2.new(0,28,0,28)
closeX.Position = UDim2.new(1,-34,0,8)
closeX.Text = "X"
closeX.TextSize = 11
closeX.Font = Enum.Font.GothamBold
closeX.BackgroundColor3 = Color3.fromRGB(200,0,0)
closeX.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", closeX).CornerRadius = UDim.new(0,6)
closeX.MouseButton1Click:Connect(function() main.Visible=false circle.Visible=true end)
circle.MouseButton1Click:Connect(function() main.Visible=true circle.Visible=false end)

local tabBar = Instance.new("Frame", main)
tabBar.Position = UDim2.new(0,8,0,60)
tabBar.Size = UDim2.new(1,-16,0,30)
tabBar.BackgroundColor3 = Color3.fromRGB(22,22,28)
Instance.new("UICorner", tabBar).CornerRadius = UDim.new(0,8)

local function TabBtn(name, x, tabName)
    local b = Instance.new("TextButton", tabBar)
    b.Size = UDim2.new(0,102,0,22)
    b.Position = UDim2.new(0,5 + x*109,0,4)
    b.Text = name
    b.TextSize = 8
    b.Font = Enum.Font.GothamBold
    b.BackgroundColor3 = getgenv().DMN99.Tab==tabName and Color3.fromRGB(255,140,0) or Color3.fromRGB(40,40,50)
    b.TextColor3 = getgenv().DMN99.Tab==tabName and Color3.new(0,0,0) or Color3.new(1,1,1)
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,6)
    local st = Instance.new("UIStroke", b)
    st.Thickness = getgenv().DMN99.Tab==tabName and 2 or 0
    st.Color = Color3.fromRGB(255,255,255)
    return b, st
end
local tabFARM, sFARM = TabBtn("FARM", 0, "FARM")
local tabESP, sESP = TabBtn("ESP", 1, "ESP")
local tabVISUAL, sVISUAL = TabBtn("VISUAL", 2, "VISUAL")

local cFARM = Instance.new("Frame", main)
cFARM.Position = UDim2.new(0,8,0,98)
cFARM.Size = UDim2.new(1,-16,0,274)
cFARM.BackgroundColor3 = Color3.fromRGB(20,20,26)
Instance.new("UICorner", cFARM)
local cESP = Instance.new("Frame", main)
cESP.Position = UDim2.new(0,8,0,98)
cESP.Size = UDim2.new(1,-16,0,274)
cESP.BackgroundColor3 = Color3.fromRGB(20,20,26)
cESP.Visible = false
Instance.new("UICorner", cESP)
local cVISUAL = Instance.new("Frame", main)
cVISUAL.Position = UDim2.new(0,8,0,98)
cVISUAL.Size = UDim2.new(1,-16,0,274)
cVISUAL.BackgroundColor3 = Color3.fromRGB(20,20,26)
cVISUAL.Visible = false
Instance.new("UICorner", cVISUAL)

local function Switch(tab)
    getgenv().DMN99.Tab=tab
    cFARM.Visible=tab=="FARM" cESP.Visible=tab=="ESP" cVISUAL.Visible=tab=="VISUAL"
    tabFARM.BackgroundColor3=tab=="FARM" and Color3.fromRGB(255,140,0) or Color3.fromRGB(40,40,50)
    tabESP.BackgroundColor3=tab=="ESP" and Color3.fromRGB(255,140,0) or Color3.fromRGB(40,40,50)
    tabVISUAL.BackgroundColor3=tab=="VISUAL" and Color3.fromRGB(255,140,0) or Color3.fromRGB(40,40,50)
    sFARM.Thickness=tab=="FARM" and 2 or 0
    sESP.Thickness=tab=="ESP" and 2 or 0
    sVISUAL.Thickness=tab=="VISUAL" and 2 or 0
    game:GetService("TweenService"):Create(tab=="FARM" and tabFARM or tab=="ESP" and tabESP or tabVISUAL, TweenInfo.new(0.1, Enum.EasingStyle.Back), {Size=UDim2.new(0,108,0,24)}):Play()
    task.wait(0.1)
    game:GetService("TweenService"):Create(tabFARM, TweenInfo.new(0.1), {Size=UDim2.new(0,102,0,22)}):Play()
    game:GetService("TweenService"):Create(tabESP, TweenInfo.new(0.1), {Size=UDim2.new(0,102,0,22)}):Play()
    game:GetService("TweenService"):Create(tabVISUAL, TweenInfo.new(0.1), {Size=UDim2.new(0,102,0,22)}):Play()
end
tabFARM.MouseButton1Click:Connect(function() Switch("FARM") end)
tabESP.MouseButton1Click:Connect(function() Switch("ESP") end)
tabVISUAL.MouseButton1Click:Connect(function() Switch("VISUAL") end)

local function Notify(title, text)
    game.StarterGui:SetCore("SendNotification",{Title=title, Text=text, Duration=2})
end

local function Toggle(parent, text, y, key, color)
    local f = Instance.new("Frame", parent)
    f.Size = UDim2.new(1,-10,0,28)
    f.Position = UDim2.new(0,5,0,y)
    f.BackgroundColor3 = Color3.fromRGB(32,32,40)
    Instance.new("UICorner", f).CornerRadius = UDim.new(0,6)
    local lb = Instance.new("TextLabel", f)
    lb.Size = UDim2.new(0.6,0,1,0)
    lb.Position = UDim2.new(0,8,0,0)
    lb.Text = text
    lb.TextXAlignment = Enum.TextXAlignment.Left
    lb.Font = Enum.Font.GothamBold
    lb.TextColor3 = Color3.new(1,1,1)
    lb.BackgroundTransparency = 1
    lb.TextSize = 8
    local btn = Instance.new("TextButton", f)
    btn.Size = UDim2.new(0,55,0,18)
    btn.Position = UDim2.new(1,-60,0,5)
    btn.Text = getgenv().DMN99[key] and "ON" or "OFF"
    btn.TextSize = 8
    btn.Font = Enum.Font.GothamBold
    btn.BackgroundColor3 = getgenv().DMN99[key] and color or Color3.fromRGB(70,70,70)
    btn.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,5)
    btn.MouseButton1Click:Connect(function()
        getgenv().DMN99[key] = not getgenv().DMN99[key]
        btn.Text = getgenv().DMN99[key] and "ON" or "OFF"
        btn.BackgroundColor3 = getgenv().DMN99[key] and color or Color3.fromRGB(70,70,70)
        if getgenv().DMN99[key] then
            Notify("Kích hoạt", text.." - ON")
        else
            Notify("Đã tắt", text.." - OFF")
        end
    end)
    return btn, f
end

-- FARM UI
Toggle(cFARM, "🪓 Farm Cây Thông Minh", 5, "AutoWood", Color3.fromRGB(0,200,0))
local heightLabel = Instance.new("TextLabel", cFARM)
heightLabel.Position = UDim2.new(0,5,0,38)
heightLabel.Size = UDim2.new(0.5,0,0,20)
heightLabel.Text = "Độ cao tránh quái: 15"
heightLabel.TextXAlignment = Enum.TextXAlignment.Left
heightLabel.TextColor3 = Color3.new(1,1,1)
heightLabel.BackgroundTransparency = 1
heightLabel.TextSize = 7
local heightBox = Instance.new("TextBox", cFARM)
heightBox.Position = UDim2.new(0.55,0,0,38)
heightBox.Size = UDim2.new(0.4,0,0,20)
heightBox.Text = "15"
heightBox.TextSize = 7
heightBox.BackgroundColor3 = Color3.fromRGB(40,40,50)
heightBox.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", heightBox)
heightBox.FocusLost:Connect(function()
    local num = tonumber(heightBox.Text)
    if num then getgenv().DMN99.WoodHeight = num heightLabel.Text = "Độ cao tránh quái: "..num Notify("Độ cao", "Đã đổi thành "..num.."m") end
end)

local infoFarm = Instance.new("TextLabel", cFARM)
infoFarm.Position = UDim2.new(0,5,0,63)
infoFarm.Size = UDim2.new(1,-10,0,50)
infoFarm.Text = "Farm: OFF - Sẽ ưu tiên cây nhỏ -> rìu mạnh chặt cây to"
infoFarm.TextXAlignment = Enum.TextXAlignment.Left
infoFarm.TextYAlignment = Enum.TextYAlignment.Top
infoFarm.TextColor3 = Color3.fromRGB(200,200,200)
infoFarm.BackgroundColor3 = Color3.fromRGB(12,12,16)
infoFarm.TextSize = 7
Instance.new("UICorner", infoFarm)

-- ESP UI - CÓ TÙY CHỈNH KHOẢNG CÁCH RIÊNG
local function CreateESPControl(parent, text, y, key, distKey, defaultDist, color)
    local f = Instance.new("Frame", parent)
    f.Size = UDim2.new(1,-10,0,52)
    f.Position = UDim2.new(0,5,0,y)
    f.BackgroundColor3 = Color3.fromRGB(32,32,40)
    Instance.new("UICorner", f).CornerRadius = UDim.new(0,6)
    local lb = Instance.new("TextLabel", f)
    lb.Size = UDim2.new(0.45,0,0,18)
    lb.Position = UDim2.new(0,8,0,2)
    lb.Text = text
    lb.TextXAlignment = Enum.TextXAlignment.Left
    lb.Font = Enum.Font.GothamBold
    lb.TextColor3 = Color3.new(1,1,1)
    lb.BackgroundTransparency = 1
    lb.TextSize = 8
    local btn = Instance.new("TextButton", f)
    btn.Size = UDim2.new(0,55,0,16)
    btn.Position = UDim2.new(1,-60,0,3)
    btn.Text = getgenv().DMN99[key] and "ON" or "OFF"
    btn.TextSize = 7
    btn.Font = Enum.Font.GothamBold
    btn.BackgroundColor3 = getgenv().DMN99[key] and color or Color3.fromRGB(70,70,70)
    btn.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(function()
        getgenv().DMN99[key] = not getgenv().DMN99[key]
        btn.Text = getgenv().DMN99[key] and "ON" or "OFF"
        btn.BackgroundColor3 = getgenv().DMN99[key] and color or Color3.fromRGB(70,70,70)
        Notify("ESP", text.." "..btn.Text)
    end)
    local distLb = Instance.new("TextLabel", f)
    distLb.Size = UDim2.new(0.4,0,0,14)
    distLb.Position = UDim2.new(0,8,0,22)
    distLb.Text = "Khoảng cách: 1-1.000.000m"
    distLb.TextXAlignment = Enum.TextXAlignment.Left
    distLb.TextColor3 = Color3.fromRGB(180,180,180)
    distLb.BackgroundTransparency = 1
    distLb.TextSize = 6
    local distBox = Instance.new("TextBox", f)
    distBox.Size = UDim2.new(0.5,0,0,18)
    distBox.Position = UDim2.new(0,8,0,36)
    distBox.Text = tostring(defaultDist)
    distBox.TextSize = 7
    distBox.BackgroundColor3 = Color3.fromRGB(20,20,25)
    distBox.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", distBox)
    distBox.FocusLost:Connect(function()
        local num = tonumber(distBox.Text)
        if num and num >=1 and num <=1000000 then
            getgenv().DMN99[distKey] = num
            Notify("Khoảng cách", text.." đổi thành "..num.."m")
        end
    end)
end

CreateESPControl(cESP, "📦 ESP Rương Theo Cấp", 5, "ESPChest", "ChestDist", 500, Color3.fromRGB(0,255,255))
CreateESPControl(cESP, "👶 ESP Trẻ Theo Cấp", 62, "ESPKid", "KidDist", 1000, Color3.fromRGB(255,215,0))
CreateESPControl(cESP, "👹 ESP Quái Tên+KC", 119, "ESPMonster", "MonsterDist", 300, Color3.fromRGB(255,50,50))

local infoESP = Instance.new("TextLabel", cESP)
infoESP.Position = UDim2.new(0,5,0,176)
infoESP.Size = UDim2.new(1,-10,0,93)
infoESP.Text = "ESP: OFF\nChỉnh khoảng cách riêng từng loại"
infoESP.TextXAlignment = Enum.TextXAlignment.Left
infoESP.TextYAlignment = Enum.TextYAlignment.Top
infoESP.TextColor3 = Color3.fromRGB(180,180,180)
infoESP.BackgroundColor3 = Color3.fromRGB(12,12,16)
infoESP.TextSize = 7
Instance.new("UICorner", infoESP)

-- VISUAL UI
Toggle(cVISUAL, "💡 Nhìn Đêm - Xóa Bóng Tối", 5, "NightVision", Color3.fromRGB(255,255,100))
Toggle(cVISUAL, "🚀 Tăng 120 FPS - Mượt", 36, "FPSBoost", Color3.fromRGB(100,200,255))
local infoVisual = Instance.new("TextLabel", cVISUAL)
infoVisual.Position = UDim2.new(0,5,0,67)
infoVisual.Size = UDim2.new(1,-10,0,80)
infoVisual.Text = "Nhìn đêm: OFF\n120 FPS: OFF - Giảm 5% hiệu ứng khi bật"
infoVisual.TextXAlignment = Enum.TextXAlignment.Left
infoVisual.TextYAlignment = Enum.TextYAlignment.Top
infoVisual.TextColor3 = Color3.fromRGB(200,200,200)
infoVisual.BackgroundColor3 = Color3.fromRGB(12,12,16)
infoVisual.TextSize = 7
Instance.new("UICorner", infoVisual)

local rescueBtn = Instance.new("TextButton", cVISUAL)
rescueBtn.Size = UDim2.new(1,-10,0,28)
rescueBtn.Position = UDim2.new(0,5,0,152)
rescueBtn.Text = "AUTO CỨU TRẺ GẦN NHẤT"
rescueBtn.TextSize = 8
rescueBtn.Font = Enum.Font.GothamBold
rescueBtn.BackgroundColor3 = Color3.fromRGB(255,140,0)
rescueBtn.TextColor3 = Color3.new(0,0,0)
Instance.new("UICorner", rescueBtn)
-- HẾT FILE 1, TIẾP FILE 2
-- FILE 2/2 - LOGIC MƯỢT KHÔNG LAG
local function Notify(title, text)
    game.StarterGui:SetCore("SendNotification",{Title=title, Text=text, Duration=2})
end

local function HasStrongAxe()
    for _,tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if tool.Name:lower():find("good") or tool.Name:lower():find("strong") or tool.Name:lower():find("chainsaw") or tool.Name:lower():find("cưa") then
            return true, tool
        end
    end
    if game.Players.LocalPlayer.Character then
        for _,tool in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if tool:IsA("Tool") and (tool.Name:lower():find("good") or tool.Name:lower():find("strong") or tool.Name:lower():find("chainsaw")) then
                return true, tool
            end
        end
    end
    return false, nil
end

local function GetTrees()
    local smallTrees, bigTrees = {}, {}
    local myHRP = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return {}, {} end
    for _,v in pairs(workspace:GetDescendants()) do
        if v.Name:lower():find("tree") and v:IsA("BasePart") then
            local dist = (myHRP.Position - v.Position).Magnitude
            if dist < getgenv().DMN99.ChestDist then
                local size = v.Size.Magnitude
                if size < 15 then
                    table.insert(smallTrees, v)
                else
                    table.insert(bigTrees, v)
                end
            end
        end
    end
    return smallTrees, bigTrees
end

-- FARM CÂY THÔNG MINH - CÂY NHỎ TRƯỚC, CÓ RÌU MẠNH CHẶT CÂY TO + ĐỘ CAO TRÁNH QUÁI
task.spawn(function()
    while task.wait(0.6) do
        pcall(function()
            if not getgenv().DMN99.AutoWood then return end
            local smallTrees, bigTrees = GetTrees()
            local hasStrong, strongTool = HasStrongAxe()
            local target = nil

            if #smallTrees > 0 then
                target = smallTrees[1] -- Ưu tiên cây nhỏ
                infoFarm.Text = "Farm: Đang chặt cây nhỏ - Cao "..getgenv().DMN99.WoodHeight.."m tránh quái"
            elseif hasStrong and #bigTrees > 0 then
                target = bigTrees[1] -- Có rìu mạnh mới chặt cây to
                infoFarm.Text = "Farm: Có rìu mạnh - Chặt cây to - Cao "..getgenv().DMN99.WoodHeight.."m"
            end

            if target and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local myHRP = game.Players.LocalPlayer.Character.HumanoidRootPart
                -- Bay lên độ cao nhất định không cho quái đánh
                myHRP.CFrame = CFrame.new(target.Position + Vector3.new(0, getgenv().DMN99.WoodHeight, 0))

                -- Tự động chuyển qua rìu
                local axe = nil
                for _,tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if tool.Name:lower():find("axe") or tool.Name:lower():find("rìu") then
                        axe = tool
                        break
                    end
                end
                if hasStrong then axe = strongTool end

                if axe then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(axe)
                    task.wait(0.2)
                    -- Chặt
                    if axe:FindFirstChild("Handle") then
                        firetouchinterest(myHRP, target, 0)
                        firetouchinterest(myHRP, target, 1)
                    end
                    -- Bấm tool
                    pcall(function() axe:Activate() end)
                end
            end
        end)
    end
end)

-- TĂNG 120 FPS - MƯỢT HƠN, GIẢM 5% HIỆU ỨNG
task.spawn(function()
    while task.wait(2) do
        pcall(function()
            if getgenv().DMN99.FPSBoost then
                -- Giảm hiệu ứng 5%, tăng FPS
                game.Lighting.GlobalShadows = false
                game.Lighting.FogEnd = 100000
                game.Lighting.Brightness = 1
                for _,v in pairs(workspace:GetDescendants()) do
                    if v:IsA("ParticleEmitter") or v:IsA("Trail") then
                        v.Enabled = false
                    end
                    if v:IsA("BasePart") then
                        v.Material = Enum.Material.SmoothPlastic
                    end
                end
                -- Giữ 120 FPS
                if setfpscap then setfpscap(120) end
                infoVisual.Text = "120 FPS: ON - Đã giảm 5% hiệu ứng\nNhìn đêm: "..(getgenv().DMN99.NightVision and "ON" or "OFF")
            else
                infoVisual.Text = "120 FPS: OFF - Về mặc định\nNhìn đêm: "..(getgenv().DMN99.NightVision and "ON" or "OFF")
            end
        end)
    end
end)

-- CHẾ ĐỘ NHÌN ĐÊM - KHÔNG BỊ BÓNG TỐI CHE
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            if getgenv().DMN99.NightVision then
                game.Lighting.Brightness = 3
                game.Lighting.ClockTime = 14
                game.Lighting.FogEnd = 100000
                game.Lighting.Ambient = Color3.new(1,1,1)
                game.Lighting.OutdoorAmbient = Color3.new(1,1,1)
            end
        end)
    end
end)

-- ESP THEO CẤP + KHOẢNG CÁCH RIÊNG TỪNG LOẠI 1-1.000.000m
task.spawn(function()
    while task.wait(0.8) do
        pcall(function()
            for _,v in pairs(workspace:GetDescendants()) do if v.Name=="DMN99_ESP" then v:Destroy() end end
            local myHRP = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not myHRP then return end
            local txt = ""

            if getgenv().DMN99.ESPChest then
                for _,obj in pairs(workspace:GetDescendants()) do
                    if obj.Name:lower():find("chest") and obj:IsA("BasePart") then
                        local dist = math.floor((myHRP.Position - obj.Position).Magnitude)
                        if dist <= getgenv().DMN99.ChestDist then
                            -- Phân cấp rương
                            local level = "Thường"
                            if obj.Name:lower():find("gold") or obj.Name:lower():find("vàng") then level = "Vàng - Cấp Cao"
                            elseif obj.Name:lower():find("diamond") or obj.Name:lower():find("kim cương") then level = "Kim Cương - Cấp VIP"
                            end
                            local bb = Instance.new("BillboardGui")
                            bb.Name = "DMN99_ESP"
                            bb.Parent = obj
                            bb.Size = UDim2.new(0,110,0,30)
                            bb.AlwaysOnTop = true
                            bb.StudsOffset = Vector3.new(0,2,0)
                            local bg = Instance.new("Frame", bb)
                            bg.Size = UDim2.new(1,0,1,0)
                            bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
                            bg.BackgroundTransparency = 0.4
                            Instance.new("UICorner", bg).CornerRadius = UDim.new(0,4)
                            local lb = Instance.new("TextLabel", bg)
                            lb.Size = UDim2.new(1,0,1,0)
                            lb.BackgroundTransparency = 1
                            lb.TextColor3 = Color3.fromRGB(0,255,255)
                            lb.TextScaled = true
                            lb.TextSize = 7
                            lb.Text = "📦 "..level.."\n"..dist.."m"
                            txt = txt.."Rương "..level..": "..dist.."m\n"
                        end
                    end
                end
            end

            if getgenv().DMN99.ESPKid then
                for _,obj in pairs(workspace:GetDescendants()) do
                    if (obj.Name:lower():find("kid") or obj.Name:lower():find("child")) and (obj:IsA("BasePart") or obj:IsA("Model")) then
                        local part = obj:IsA("Model") and (obj.PrimaryPart or obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChildWhichIsA("BasePart")) or obj
                        if part and part:IsA("BasePart") then
                            local dist = math.floor((myHRP.Position - part.Position).Magnitude)
                            if dist <= getgenv().DMN99.KidDist then
                                local kidLevel = "Cấp 1"
                                if obj.Name:find("2") then kidLevel = "Cấp 2 - Trong hang sâu"
                                elseif obj.Name:find("3") then kidLevel = "Cấp 3 - Cần chìa khóa"
                                elseif obj.Name:find("4") then kidLevel = "Cấp 4 - Boss canh"
                                end
                                local bb = Instance.new("BillboardGui")
                                bb.Name = "DMN99_ESP"
                                bb.Parent = part
                                bb.Size = UDim2.new(0,110,0,32)
                                bb.AlwaysOnTop = true
                                bb.StudsOffset = Vector3.new(0,3,0)
                                local bg = Instance.new("Frame", bb)
                                bg.Size = UDim2.new(1,0,1,0)
                                bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
                                bg.BackgroundTransparency = 0.4
                                Instance.new("UICorner", bg).CornerRadius = UDim.new(0,4)
                                local lb = Instance.new("TextLabel", bg)
                                lb.Size = UDim2.new(1,0,1,0)
                                lb.BackgroundTransparency = 1
                                lb.TextColor3 = Color3.fromRGB(255,215,0)
                                lb.TextScaled = true
                                lb.TextSize = 7
                                lb.Text = "👶 "..kidLevel.."\n"..dist.."m"
                                txt = txt.."Trẻ "..kidLevel..": "..dist.."m\n"
                            end
                        end
                    end
                end
            end

            if getgenv().DMN99.ESPMonster then
                for _,obj in pairs(workspace:GetDescendants()) do
                    if (obj.Name:lower():find("deer") or obj.Name:lower():find("owl") or obj.Name:lower():find("monster") or obj.Name:lower():find("wolf")) and obj:IsA("Model") and obj:FindFirstChild("HumanoidRootPart") then
                        local dist = math.floor((myHRP.Position - obj.HumanoidRootPart.Position).Magnitude)
                        if dist <= getgenv().DMN99.MonsterDist then
                            local bb = Instance.new("BillboardGui")
                            bb.Name = "DMN99_ESP"
                            bb.Parent = obj.HumanoidRootPart
                            bb.Size = UDim2.new(0,120,0,36)
                            bb.AlwaysOnTop = true
                            bb.StudsOffset = Vector3.new(0,3.5,0)
                            local bg = Instance.new("Frame", bb)
                            bg.Size = UDim2.new(1,0,1,0)
                            bg.BackgroundColor3 = Color3.fromRGB(80,0,0)
                            bg.BackgroundTransparency = 0.3
                            Instance.new("UICorner", bg).CornerRadius = UDim.new(0,5)
                            local lb = Instance.new("TextLabel", bg)
                            lb.Size = UDim2.new(1,0,1,0)
                            lb.BackgroundTransparency = 1
                            lb.TextColor3 = Color3.fromRGB(255,100,100)
                            lb.TextScaled = true
                            lb.TextSize = 7
                            lb.Text = "👹 "..obj.Name.."\n"..dist.."m - Nguy hiểm"
                            txt = txt.."Quái "..obj.Name..": "..dist.."m\n"
                        end
                    end
                end
            end

            if txt == "" then txt = "ESP: Đang quét trong phạm vi..." end
            infoESP.Text = txt
        end)
    end
end)

-- THÔNG BÁO ĐẶC BIỆT CHO 120 FPS
local oldFPS = false
task.spawn(function()
    while task.wait(0.5) do
        if getgenv().DMN99.FPSBoost ~= oldFPS then
            oldFPS = getgenv().DMN99.FPSBoost
            if oldFPS then
                Notify("Kích hoạt thành công", "Tăng 120 FPS - Đã giảm 5% hiệu ứng, game mượt hơn!")
            else
                Notify("Đã tắt", "120 FPS OFF - Về mặc định")
            end
        end
    end
end)

rescueBtn.MouseButton1Click:Connect(function()
    for _,obj in pairs(workspace:GetDescendants()) do
        if (obj.Name:lower():find("kid") or obj.Name:lower():find("child")) and (obj:IsA("BasePart") or obj:IsA("Model")) then
            local part = obj:IsA("Model") and (obj.PrimaryPart or obj:FindFirstChild("HumanoidRootPart")) or obj
            if part and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude
                if dist <= getgenv().DMN99.KidDist then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0,2,0)
                    task.wait(0.5)
                    for _,v in pairs(workspace:GetDescendants()) do if v:IsA("ProximityPrompt") then fireproximityprompt(v) end end
                    Notify("Cứu trẻ", "Đang cứu trẻ cách "..math.floor(dist).."m")
                    break
                end
            end
        end
    end
end)

Notify("99 ĐÊM V2 PRO", "Đã gộp 2 file - Full chức năng - By ĐỒNG M NGUYÊN")
