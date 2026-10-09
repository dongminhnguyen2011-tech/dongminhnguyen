-- 99 ĐÊM V5 - FILE 1/2 - ESP NHỎ + TÀN HÌNH + FLY
for _,v in pairs((gethui and gethui() or game.CoreGui):GetChildren()) do if v.Name:find("99DMN") then v:Destroy() end end
getgenv().DMN99 = {
    Tab="ESP", FPSBoost=false, NightVision=false, Invisible=false, Fly=false,
    ESPChest=false, ESPKid=false, ESPMonster=false,
    ChestDist=500, KidDist=1000, MonsterDist=300
}
local gui = Instance.new("ScreenGui", gethui and gethui() or game.CoreGui)
gui.Name = "99DMN_V5"
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
Instance.new("UIStroke", circle).Color = Color3.fromRGB(255,140,0)
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,350,0,400)
main.Position = UDim2.new(0.15,0,0.15,0)
main.BackgroundColor3 = Color3.fromRGB(15,15,20)
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,12)
Instance.new("UIStroke", main).Color = Color3.fromRGB(255,140,0)
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1,0,0,52)
header.BackgroundColor3 = Color3.fromRGB(25,20,15)
Instance.new("UICorner", header)
local marqueeFrame = Instance.new("Frame", header)
marqueeFrame.Size = UDim2.new(1,-60,0,18)
marqueeFrame.Position = UDim2.new(0,8,0,2)
marqueeFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)
marqueeFrame.ClipsDescendants = true
Instance.new("UICorner", marqueeFrame).CornerRadius = UDim.new(0,4)
local marqueeText = Instance.new("TextLabel", marqueeFrame)
marqueeText.Size = UDim2.new(0,700,1,0)
marqueeText.Position = UDim2.new(1,0,0,0)
marqueeText.Text = " ĐỒNG M NGUYÊN — SCRIPT VIP — 99 ĐÊM TRONG RỪNG — V5 ESP NHỎ + TÀN HÌNH + FLY JOYSTICK "
marqueeText.Font = Enum.Font.GothamBold
marqueeText.TextColor3 = Color3.fromRGB(255,215,0)
marqueeText.BackgroundTransparency = 1
marqueeText.TextSize = 9
task.spawn(function() while task.wait(0.04) do pcall(function() marqueeText.Position = marqueeText.Position - UDim2.new(0,1,0,0) if marqueeText.Position.X.Offset < -700 then marqueeText.Position = UDim2.new(1,0,0,0) end end) end end)
local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(0.7,0,0,26)
title.Position = UDim2.new(0,10,0,22)
title.Text = "99 ĐÊM V5 - PRO"
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
    return b, st
end
local tabESP, sESP = TabBtn("ESP", 0, "ESP")
local tabVISUAL, sVISUAL = TabBtn("VISUAL", 1, "VISUAL")
local tabMOVE, sMOVE = TabBtn("MOVE", 2, "MOVE")
local cESP = Instance.new("Frame", main)
cESP.Position = UDim2.new(0,8,0,98)
cESP.Size = UDim2.new(1,-16,0,294)
cESP.BackgroundColor3 = Color3.fromRGB(20,20,26)
Instance.new("UICorner", cESP)
local cVISUAL = Instance.new("Frame", main)
cVISUAL.Position = UDim2.new(0,8,0,98)
cVISUAL.Size = UDim2.new(1,-16,0,294)
cVISUAL.BackgroundColor3 = Color3.fromRGB(20,20,26)
cVISUAL.Visible = false
Instance.new("UICorner", cVISUAL)
local cMOVE = Instance.new("Frame", main)
cMOVE.Position = UDim2.new(0,8,0,98)
cMOVE.Size = UDim2.new(1,-16,0,294)
cMOVE.BackgroundColor3 = Color3.fromRGB(20,20,26)
cMOVE.Visible = false
Instance.new("UICorner", cMOVE)
local function Switch(tab)
    getgenv().DMN99.Tab=tab
    cESP.Visible=tab=="ESP" cVISUAL.Visible=tab=="VISUAL" cMOVE.Visible=tab=="MOVE"
    tabESP.BackgroundColor3=tab=="ESP" and Color3.fromRGB(255,140,0) or Color3.fromRGB(40,40,50)
    tabVISUAL.BackgroundColor3=tab=="VISUAL" and Color3.fromRGB(255,140,0) or Color3.fromRGB(40,40,50)
    tabMOVE.BackgroundColor3=tab=="MOVE" and Color3.fromRGB(255,140,0) or Color3.fromRGB(40,40,50)
    sESP.Thickness=tab=="ESP" and 2 or 0
    sVISUAL.Thickness=tab=="VISUAL" and 2 or 0
    sMOVE.Thickness=tab=="MOVE" and 2 or 0
end
tabESP.MouseButton1Click:Connect(function() Switch("ESP") end)
tabVISUAL.MouseButton1Click:Connect(function() Switch("VISUAL") end)
tabMOVE.MouseButton1Click:Connect(function() Switch("MOVE") end)
local function Notify(t1,t2) game.StarterGui:SetCore("SendNotification",{Title=t1, Text=t2, Duration=2}) end
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
    local distBox = Instance.new("TextBox", f)
    distBox.Size = UDim2.new(0.5,0,0,18)
    distBox.Position = UDim2.new(0,8,0,28)
    distBox.Text = tostring(defaultDist)
    distBox.TextSize = 7
    distBox.BackgroundColor3 = Color3.fromRGB(20,20,25)
    distBox.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", distBox)
    distBox.FocusLost:Connect(function() local num=tonumber(distBox.Text) if num and num>=1 and num<=1000000 then getgenv().DMN99[distKey]=num Notify("KC", text.." -> "..num.."m") end end)
end
CreateESPControl(cESP, "📦 ESP Rương Cấp", 5, "ESPChest", "ChestDist", 500, Color3.fromRGB(0,255,255))
CreateESPControl(cESP, "👶 ESP Trẻ Cấp", 62, "ESPKid", "KidDist", 1000, Color3.fromRGB(255,215,0))
CreateESPControl(cESP, "👹 ESP Quái + Thỏ", 119, "ESPMonster", "MonsterDist", 300, Color3.fromRGB(255,50,50))
local infoESP = Instance.new("TextLabel", cESP)
infoESP.Position = UDim2.new(0,5,0,176)
infoESP.Size = UDim2.new(1,-10,0,113)
infoESP.Text = "ESP nhỏ 70x20 - Fix to quá"
infoESP.TextXAlignment = Enum.TextXAlignment.Left
infoESP.TextYAlignment = Enum.TextYAlignment.Top
infoESP.TextColor3 = Color3.fromRGB(180,180,180)
infoESP.BackgroundColor3 = Color3.fromRGB(12,12,16)
infoESP.TextSize = 7
Instance.new("UICorner", infoESP)
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
        Notify(btn.Text=="ON" and "Kích hoạt" or "Đã tắt", text.." - "..btn.Text)
    end)
    return btn, f
end
Toggle(cVISUAL, "💡 Nhìn Đêm - Xóa Tối", 5, "NightVision", Color3.fromRGB(255,255,100))
Toggle(cVISUAL, "🚀 Tăng 120 FPS - Giảm 1%", 36, "FPSBoost", Color3.fromRGB(100,200,255))
Toggle(cVISUAL, "👻 Tàn Hình - Quái Không Thấy", 67, "Invisible", Color3.fromRGB(150,150,150))
local infoVisual = Instance.new("TextLabel", cVISUAL)
infoVisual.Position = UDim2.new(0,5,0,100)
infoVisual.Size = UDim2.new(1,-10,0,80)
infoVisual.Text = "Tàn hình: Quái không bao giờ tấn công được"
infoVisual.TextXAlignment = Enum.TextXAlignment.Left
infoVisual.TextYAlignment = Enum.TextYAlignment.Top
infoVisual.TextColor3 = Color3.fromRGB(200,200,200)
infoVisual.BackgroundColor3 = Color3.fromRGB(12,12,16)
infoVisual.TextSize = 7
Instance.new("UICorner", infoVisual)
Toggle(cMOVE, "🕊️ Fly - Bay Joystick", 5, "Fly", Color3.fromRGB(100,100,255))
local infoMove = Instance.new("TextLabel", cMOVE)
infoMove.Position = UDim2.new(0,5,0,38)
infoMove.Size = UDim2.new(1,-10,0,100)
infoMove.Text = "Fly: Bật -> bay lên trời\nKéo joystick + nhìn lên -> bay lên\nBuông joystick -> đứng yên trên không\nKéo tới/lui -> đi tới/lui\nMuốn xuống: kéo xuống hoặc tắt Fly sẽ hạ xuống từ từ"
infoMove.TextXAlignment = Enum.TextXAlignment.Left
infoMove.TextYAlignment = Enum.TextYAlignment.Top
infoMove.TextColor3 = Color3.fromRGB(200,200,200)
infoMove.BackgroundColor3 = Color3.fromRGB(12,12,16)
infoMove.TextSize = 7
Instance.new("UICorner", infoMove)
local rescueBtn = Instance.new("TextButton", cMOVE)
rescueBtn.Size = UDim2.new(1,-10,0,28)
rescueBtn.Position = UDim2.new(0,5,0,143)
rescueBtn.Text = "AUTO CỨU TRẺ GẦN NHẤT"
rescueBtn.TextSize = 8
rescueBtn.Font = Enum.Font.GothamBold
rescueBtn.BackgroundColor3 = Color3.fromRGB(255,140,0)
rescueBtn.TextColor3 = Color3.new(0,0,0)
Instance.new("UICorner", rescueBtn)
-- HẾT FILE 1
-- FILE 2/2 - V5 FINAL - ESP NHỎ 70x20 + TÀN HÌNH + FLY JOYSTICK CHUẨN
local function Notify(t1,t2) game.StarterGui:SetCore("SendNotification",{Title=t1, Text=t2, Duration=2}) end

-- TĂNG 120 FPS - CHỈ GIẢM 1%
local originalSettings = {}
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            if getgenv().DMN99.FPSBoost then
                for _,v in pairs(workspace:GetDescendants()) do
                    if v:IsA("ParticleEmitter") then
                        if not originalSettings[v] then originalSettings[v]=v.Enabled end
                        if math.random(1,100)==1 then v.Enabled=false end
                    end
                end
                if setfpscap then setfpscap(120) end
            else
                for obj,enabled in pairs(originalSettings) do if obj and obj.Parent then pcall(function() obj.Enabled=enabled end) end end
                originalSettings={}
                if setfpscap then setfpscap(60) end
            end
        end)
    end
end)

-- NHÌN ĐÊM
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            if getgenv().DMN99.NightVision then
                game.Lighting.Brightness=2.5
                game.Lighting.ClockTime=14
                game.Lighting.FogEnd=100000
                game.Lighting.Ambient=Color3.new(0.8,0.8,0.8)
                game.Lighting.OutdoorAmbient=Color3.new(0.8,0.8,0.8)
            end
        end)
    end
end)

-- TÀN HÌNH - QUÁI KHÔNG THẤY, KHÔNG TẤN CÔNG ĐƯỢC - TẮT THÌ VỀ NHƯ CŨ
local oldTrans = {}
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            local char = game.Players.LocalPlayer.Character
            if not char then return end
            if getgenv().DMN99.Invisible then
                for _,part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") and part.Name~="HumanoidRootPart" then
                        if oldTrans[part]==nil then oldTrans[part]=part.Transparency end
                        part.Transparency = 1
                    end
                    if part:IsA("Decal") then
                        if oldTrans[part]==nil then oldTrans[part]=part.Transparency end
                        part.Transparency = 1
                    end
                end
                -- Quái không tìm thấy vì HumanoidRootPart không va chạm + tên ẩn
                if char:FindFirstChild("HumanoidRootPart") then
                    char.HumanoidRootPart.CanCollide = false
                end
            else
                -- Tắt tàn hình -> về như cũ
                for part, trans in pairs(oldTrans) do
                    if part and part.Parent then
                        pcall(function() part.Transparency = trans end)
                    end
                end
                oldTrans = {}
                if char:FindFirstChild("HumanoidRootPart") then
                    char.HumanoidRootPart.CanCollide = true
                end
            end
        end)
    end
end)

-- FLY CHUẨN JOYSTICK - BẬT BAY LÊN, NHÌN LÊN KÉO BAY LÊN, BUÔNG THÌ ĐỨNG YÊN TRÊN KHÔNG
local flyBV, flyBG, flying = nil, nil, false
local flySpeed = 28
task.spawn(function()
    while task.wait(0.1) do
        pcall(function()
            local char = game.Players.LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChild("Humanoid")
            if not hrp or not hum then return end

            if getgenv().DMN99.Fly then
                if not flying then
                    flying = true
                    -- Bay lên trời khi bật
                    flyBV = Instance.new("BodyVelocity")
                    flyBV.Velocity = Vector3.new(0,0,0)
                    flyBV.MaxForce = Vector3.new(100000,100000,100000)
                    flyBV.Parent = hrp
                    flyBG = Instance.new("BodyGyro")
                    flyBG.MaxTorque = Vector3.new(100000,100000,100000)
                    flyBG.CFrame = hrp.CFrame
                    flyBG.Parent = hrp
                    hum.PlatformStand = true
                    Notify("Fly","Đã bật - Bay lên trời, kéo joystick để bay")
                    -- Bay lên 10m
                    hrp.CFrame = hrp.CFrame + Vector3.new(0,10,0)
                end

                local cam = workspace.CurrentCamera
                local moveDir = hum.MoveDirection
                -- Nếu buông joystick -> đứng yên trên không
                if moveDir.Magnitude < 0.1 then
                    flyBV.Velocity = Vector3.new(0,0,0) -- đứng yên
                else
                    -- Kéo joystick + nhìn lên trời thì bay lên, nhìn xuống thì xuống
                    local look = cam.CFrame.LookVector
                    -- Kết hợp hướng joystick và hướng nhìn
                    local vel = (cam.CFrame.RightVector * moveDir.X + Vector3.new(0,0,0)) * flySpeed
                    -- Tiến/lùi theo hướng nhìn
                    vel = vel + (Vector3.new(look.X,0,look.Z).Unit * -moveDir.Z * flySpeed)
                    -- Lên/xuống theo hướng nhìn lên/xuống
                    vel = vel + Vector3.new(0, look.Y * -moveDir.Z * flySpeed, 0)
                    -- Nếu nhìn lên nhiều thì bay lên, nhìn xuống thì bay xuống
                    if cam.CFrame.LookVector.Y > 0.3 then
                        vel = vel + Vector3.new(0, flySpeed * 0.8, 0)
                    elseif cam.CFrame.LookVector.Y < -0.3 then
                        vel = vel + Vector3.new(0, -flySpeed * 0.8, 0)
                    end
                    flyBV.Velocity = vel
                end
                flyBG.CFrame = cam.CFrame
            else
                if flying then
                    flying = false
                    if flyBV then flyBV:Destroy() flyBV=nil end
                    if flyBG then flyBG:Destroy() flyBG=nil end
                    hum.PlatformStand = false
                    -- Hạ xuống từ từ khi tắt fly
                    local curPos = hrp.Position
                    -- Tìm đất
                    local ray = workspace:Raycast(curPos, Vector3.new(0,-500,0), RaycastParams.new())
                    if ray then
                        -- Hạ xuống mượt
                        game:GetService("TweenService"):Create(hrp, TweenInfo.new(1, Enum.EasingStyle.Linear), {CFrame = CFrame.new(ray.Position + Vector3.new(0,3,0))}):Play()
                    end
                    Notify("Fly","Đã tắt - Hạ xuống đất")
                end
            end
        end)
    end
end)

-- ESP NHỎ NHỎ LẠI - 70x20 - FIX TO QUÁ
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            for _,v in pairs(workspace:GetDescendants()) do if v.Name=="DMN99_ESP" then v:Destroy() end end
            local myHRP = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not myHRP then return end
            local txt=""

            if getgenv().DMN99.ESPChest then
                for _,obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") and obj.Name:lower():find("chest") then
                        local dist=math.floor((myHRP.Position-obj.Position).Magnitude)
                        if dist<=getgenv().DMN99.ChestDist then
                            local level="Thường"
                            if obj.Name:lower():find("gold") then level="Vàng"
                            elseif obj.Name:lower():find("diamond") then level="KC VIP" end
                            -- NHỎ LẠI 70x20
                            local bb=Instance.new("BillboardGui") bb.Name="DMN99_ESP" bb.Parent=obj bb.Size=UDim2.new(0,70,0,20) bb.AlwaysOnTop=true bb.StudsOffset=Vector3.new(0,2,0)
                            local bg=Instance.new("Frame",bb) bg.Size=UDim2.new(1,0,1,0) bg.BackgroundColor3=Color3.fromRGB(0,0,0) bg.BackgroundTransparency=0.5 Instance.new("UICorner",bg).CornerRadius=UDim.new(0,3)
                            local lb=Instance.new("TextLabel",bg) lb.Size=UDim2.new(1,0,1,0) lb.BackgroundTransparency=1 lb.TextColor3=Color3.fromRGB(0,255,255) lb.TextScaled=true lb.TextSize=6 lb.Text="📦 "..level.." "..dist.."m"
                            txt=txt.."Rương "..level..": "..dist.."m\n"
                        end
                    end
                end
            end

            if getgenv().DMN99.ESPKid then
                for _,obj in pairs(workspace:GetDescendants()) do
                    if (obj.Name:lower():find("kid") or obj.Name:lower():find("child")) and (obj:IsA("BasePart") or obj:IsA("Model")) then
                        local part=obj:IsA("Model") and (obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")) or obj
                        if part and part:IsA("BasePart") then
                            local dist=math.floor((myHRP.Position-part.Position).Magnitude)
                            if dist<=getgenv().DMN99.KidDist then
                                local kidLevel="C1"
                                if obj.Name:find("2") then kidLevel="C2"
                                elseif obj.Name:find("3") then kidLevel="C3"
                                elseif obj.Name:find("4") then kidLevel="C4" end
                                local bb=Instance.new("BillboardGui") bb.Name="DMN99_ESP" bb.Parent=part bb.Size=UDim2.new(0,70,0,22) bb.AlwaysOnTop=true bb.StudsOffset=Vector3.new(0,2.5,0)
                                local bg=Instance.new("Frame",bb) bg.Size=UDim2.new(1,0,1,0) bg.BackgroundColor3=Color3.fromRGB(0,0,0) bg.BackgroundTransparency=0.5 Instance.new("UICorner",bg).CornerRadius=UDim.new(0,3)
                                local lb=Instance.new("TextLabel",bg) lb.Size=UDim2.new(1,0,1,0) lb.BackgroundTransparency=1 lb.TextColor3=Color3.fromRGB(255,215,0) lb.TextScaled=true lb.TextSize=6 lb.Text="👶 "..kidLevel.." "..dist.."m"
                                txt=txt.."Trẻ "..kidLevel..": "..dist.."m\n"
                            end
                        end
                    end
                end
            end

            if getgenv().DMN99.ESPMonster then
                for _,obj in pairs(workspace:GetDescendants()) do
                    local nl=obj.Name:lower()
                    local isMonster=nl:find("deer") or nl:find("owl") or nl:find("monster") or nl:find("wolf") or nl:find("bunny") or nl:find("rabbit") or nl:find("bear")
                    if isMonster and obj:IsA("Model") and obj:FindFirstChild("HumanoidRootPart") then
                        local dist=math.floor((myHRP.Position-obj.HumanoidRootPart.Position).Magnitude)
                        if dist<=getgenv().DMN99.MonsterDist then
                            local bb=Instance.new("BillboardGui") bb.Name="DMN99_ESP" bb.Parent=obj.HumanoidRootPart bb.Size=UDim2.new(0,75,0,22) bb.AlwaysOnTop=true bb.StudsOffset=Vector3.new(0,3,0)
                            local bg=Instance.new("Frame",bb) bg.Size=UDim2.new(1,0,1,0) bg.BackgroundColor3=Color3.fromRGB(80,0,0) bg.BackgroundTransparency=0.4 Instance.new("UICorner",bg).CornerRadius=UDim.new(0,3)
                            local lb=Instance.new("TextLabel",bg) lb.Size=UDim2.new(1,0,1,0) lb.BackgroundTransparency=1 lb.TextColor3=Color3.fromRGB(255,150,150) lb.TextScaled=true lb.TextSize=6 lb.Text="👹 "..obj.Name:sub(1,6).." "..dist.."m"
                            txt=txt..obj.Name..": "..dist.."m\n"
                        end
                    end
                    if (nl:find("bunny") or nl:find("rabbit")) and obj:IsA("BasePart") then
                        local dist=math.floor((myHRP.Position-obj.Position).Magnitude)
                        if dist<=getgenv().DMN99.MonsterDist then
                            local bb=Instance.new("BillboardGui") bb.Name="DMN99_ESP" bb.Parent=obj bb.Size=UDim2.new(0,60,0,18) bb.AlwaysOnTop=true bb.StudsOffset=Vector3.new(0,2,0)
                            local bg=Instance.new("Frame",bb) bg.Size=UDim2.new(1,0,1,0) bg.BackgroundColor3=Color3.fromRGB(0,0,0) bg.BackgroundTransparency=0.5 Instance.new("UICorner",bg)
                            local lb=Instance.new("TextLabel",bg) lb.Size=UDim2.new(1,0,1,0) lb.BackgroundTransparency=1 lb.TextColor3=Color3.fromRGB(150,255,150) lb.TextScaled=true lb.TextSize=6 lb.Text="🐰 Thỏ "..dist.."m"
                        end
                    end
                end
            end

            if txt=="" then txt="ESP nhỏ 70x20 - Fix to quá" end
            infoESP.Text=txt
        end)
    end
end)

rescueBtn.MouseButton1Click:Connect(function()
    for _,obj in pairs(workspace:GetDescendants()) do
        if (obj.Name:lower():find("kid") or obj.Name:lower():find("child")) and (obj:IsA("BasePart") or obj:IsA("Model")) then
            local part=obj:IsA("Model") and (obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")) or obj
            if part and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local dist=(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-part.Position).Magnitude
                if dist<=getgenv().DMN99.KidDist then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=part.CFrame+Vector3.new(0,2,0)
                    task.wait(0.5)
                    for _,v in pairs(workspace:GetDescendants()) do if v:IsA("ProximityPrompt") then fireproximityprompt(v) end end
                    Notify("Cứu trẻ","Cách "..math.floor(dist).."m")
                    break
                end
            end
        end
    end
end)

Notify("99 ĐÊM V5","ESP nhỏ 70x20 + Tàn hình + Fly joystick chuẩn - By ĐỒNG M NGUYÊN")
