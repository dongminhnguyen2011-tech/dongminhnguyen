-- 99 ĐÊM V7 ULTRA PRO - CHUẨN PRO - 0 LAG - 0 LỖI - BY ĐỒNG M NGUYÊN
for _,v in pairs((gethui and gethui() or game.CoreGui):GetChildren()) do if v.Name:find("99DMN") then v:Destroy() end end
getgenv().DMN99 = {Tab="ESP", FPS=false, Night=false, Invi=false, Fly=false, ESPChest=false, ESPKid=false, ESPMon=false, Chest=500, Kid=1000, Mon=300}
local gui = Instance.new("ScreenGui", gethui and gethui() or game.CoreGui)
gui.Name = "99DMN_V7"
local circle = Instance.new("TextButton", gui)
circle.Size = UDim2.new(0,50,0,50)
circle.Position = UDim2.new(0,15,0.5,0)
circle.Text = "99"
circle.Font = Enum.Font.GothamBold
circle.BackgroundColor3 = Color3.fromRGB(15,15,20)
circle.TextColor3 = Color3.fromRGB(255,140,0)
circle.Visible = false
circle.Active = true
circle.Draggable = true
Instance.new("UICorner", circle).CornerRadius = UDim.new(1,0)
Instance.new("UIStroke", circle).Color = Color3.fromRGB(255,140,0)
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,340,0,360)
main.Position = UDim2.new(0.15,0,0.2,0)
main.BackgroundColor3 = Color3.fromRGB(12,12,16)
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,10)
Instance.new("UIStroke", main).Color = Color3.fromRGB(255,140,0)
local head = Instance.new("Frame", main)
head.Size = UDim2.new(1,0,0,40)
head.BackgroundColor3 = Color3.fromRGB(20,18,14)
Instance.new("UICorner", head)
local marquee = Instance.new("Frame", head)
marquee.Size = UDim2.new(1,-55,0,14)
marquee.Position = UDim2.new(0,6,0,3)
marquee.BackgroundColor3 = Color3.fromRGB(8,8,8)
marquee.ClipsDescendants = true
Instance.new("UICorner", marquee)
local mText = Instance.new("TextLabel", marquee)
mText.Size = UDim2.new(0,600,1,0)
mText.Position = UDim2.new(1,0,0,0)
mText.Text = " ĐỒNG M NGUYÊN — V7 ULTRA PRO — MƯỢT NHƯ NGƯỜI TA — 0 LAG 0 LỖI "
mText.Font = Enum.Font.GothamBold
mText.TextColor3 = Color3.fromRGB(255,215,0)
mText.BackgroundTransparency = 1
mText.TextSize = 8
task.spawn(function() while task.wait(0.05) do pcall(function() mText.Position-=UDim2.new(0,1,0,0) if mText.Position.X.Offset<-600 then mText.Position=UDim2.new(1,0,0,0) end end) end end)
local title = Instance.new("TextLabel", head)
title.Position = UDim2.new(0,6,0,18)
title.Size = UDim2.new(1,-40,0,18)
title.Text = "99 ĐÊM V7 - PRO MAX MƯỢT"
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.new(1,1,1)
title.TextXAlignment = Enum.TextXAlignment.Left
title.BackgroundTransparency = 1
title.TextSize = 10
local close = Instance.new("TextButton", head)
close.Size = UDim2.new(0,26,0,26)
close.Position = UDim2.new(1,-30,0,5)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(200,0,0)
close.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", close)
close.MouseButton1Click:Connect(function() main.Visible=false circle.Visible=true end)
circle.MouseButton1Click:Connect(function() main.Visible=true circle.Visible=false end)

local tabs = Instance.new("Frame", main)
tabs.Position = UDim2.new(0,6,0,46)
tabs.Size = UDim2.new(1,-12,0,26)
tabs.BackgroundColor3 = Color3.fromRGB(20,20,26)
Instance.new("UICorner", tabs)
local function Tab(name, x, id)
    local b = Instance.new("TextButton", tabs)
    b.Size = UDim2.new(0,100,0,18)
    b.Position = UDim2.new(0,4+x*108,0,4)
    b.Text = name
    b.Font = Enum.Font.GothamBold
    b.TextSize = 8
    b.BackgroundColor3 = getgenv().DMN99.Tab==id and Color3.fromRGB(255,140,0) or Color3.fromRGB(40,40,50)
    b.TextColor3 = getgenv().DMN99.Tab==id and Color3.new(0,0,0) or Color3.new(1,1,1)
    Instance.new("UICorner", b)
    return b
end
local bESP = Tab("ESP",0,"ESP")
local bVIS = Tab("VISUAL",1,"VISUAL")
local bMOV = Tab("MOVE",2,"MOVE")
local cESP = Instance.new("Frame", main)
cESP.Position = UDim2.new(0,6,0,78)
cESP.Size = UDim2.new(1,-12,0,276)
cESP.BackgroundColor3 = Color3.fromRGB(18,18,22)
Instance.new("UICorner", cESP)
local cVIS = cESP:Clone()
cVIS.Parent = main
cVIS.Visible = false
local cMOV = cESP:Clone()
cMOV.Parent = main
cMOV.Visible = false
local function Switch(t) getgenv().DMN99.Tab=t cESP.Visible=t=="ESP" cVIS.Visible=t=="VISUAL" cMOV.Visible=t=="MOVE" bESP.BackgroundColor3=t=="ESP" and Color3.fromRGB(255,140,0) or Color3.fromRGB(40,40,50) bVIS.BackgroundColor3=t=="VISUAL" and Color3.fromRGB(255,140,0) or Color3.fromRGB(40,40,50) bMOV.BackgroundColor3=t=="MOVE" and Color3.fromRGB(255,140,0) or Color3.fromRGB(40,40,50) end
bESP.MouseButton1Click:Connect(function() Switch("ESP") end)
bVIS.MouseButton1Click:Connect(function() Switch("VISUAL") end)
bMOV.MouseButton1Click:Connect(function() Switch("MOVE") end)
local function Noti(a,b) pcall(function() game.StarterGui:SetCore("SendNotification",{Title=a, Text=b, Duration=2}) end) end
local function AddToggle(p, txt, y, key, col)
    local f = Instance.new("Frame", p)
    f.Size = UDim2.new(1,-8,0,26)
    f.Position = UDim2.new(0,4,0,y)
    f.BackgroundColor3 = Color3.fromRGB(28,28,34)
    Instance.new("UICorner", f)
    local l = Instance.new("TextLabel", f)
    l.Size = UDim2.new(0.6,0,1,0)
    l.Position = UDim2.new(0,6,0,0)
    l.Text = txt
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Font = Enum.Font.GothamBold
    l.TextSize = 7
    l.TextColor3 = Color3.new(1,1,1)
    l.BackgroundTransparency = 1
    local btn = Instance.new("TextButton", f)
    btn.Size = UDim2.new(0,50,0,16)
    btn.Position = UDim2.new(1,-54,0,5)
    btn.Text = getgenv().DMN99[key] and "ON" or "OFF"
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 7
    btn.BackgroundColor3 = getgenv().DMN99[key] and col or Color3.fromRGB(65,65,65)
    btn.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(function()
        getgenv().DMN99[key]=not getgenv().DMN99[key]
        btn.Text=getgenv().DMN99[key] and "ON" or "OFF"
        btn.BackgroundColor3=getgenv().DMN99[key] and col or Color3.fromRGB(65,65,65)
        Noti(btn.Text=="ON" and "Bật" or "Tắt", txt.." "..btn.Text)
    end)
    return f
end
local function AddESP(p, txt, y, key, dkey, def, col)
    local f = Instance.new("Frame", p)
    f.Size = UDim2.new(1,-8,0,48)
    f.Position = UDim2.new(0,4,0,y)
    f.BackgroundColor3 = Color3.fromRGB(28,28,34)
    Instance.new("UICorner", f)
    local l = Instance.new("TextLabel", f)
    l.Size = UDim2.new(0.5,0,0,16)
    l.Position = UDim2.new(0,6,0,2)
    l.Text = txt
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Font = Enum.Font.GothamBold
    l.TextSize = 7
    l.TextColor3 = Color3.new(1,1,1)
    l.BackgroundTransparency = 1
    local btn = Instance.new("TextButton", f)
    btn.Size = UDim2.new(0,50,0,14)
    btn.Position = UDim2.new(1,-54,0,2)
    btn.Text = getgenv().DMN99[key] and "ON" or "OFF"
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 7
    btn.BackgroundColor3 = getgenv().DMN99[key] and col or Color3.fromRGB(65,65,65)
    btn.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(function() getgenv().DMN99[key]=not getgenv().DMN99[key] btn.Text=getgenv().DMN99[key] and "ON" or "OFF" btn.BackgroundColor3=getgenv().DMN99[key] and col or Color3.fromRGB(65,65,65) Noti("ESP",txt.." "..btn.Text) end)
    local box = Instance.new("TextBox", f)
    box.Size = UDim2.new(1,-12,0,16)
    box.Position = UDim2.new(0,6,0,26)
    box.Text = tostring(def)
    box.PlaceholderText = "1-1000000 mét"
    box.TextSize = 7
    box.BackgroundColor3 = Color3.fromRGB(18,18,22)
    box.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", box)
    box.FocusLost:Connect(function() local n=tonumber(box.Text) if n and n>=1 and n<=1000000 then getgenv().DMN99[dkey]=n Noti("Khoảng cách",n.."m") end end)
end
AddESP(cESP, "📦 ESP Rương", 4, "ESPChest", "Chest", 500, Color3.fromRGB(0,200,200))
AddESP(cESP, "👶 ESP Trẻ", 56, "ESPKid", "Kid", 1000, Color3.fromRGB(200,180,0))
AddESP(cESP, "👹 ESP Quái+Thỏ", 108, "ESPMon", "Mon", 300, Color3.fromRGB(200,50,50))
AddToggle(cVIS, "💡 Nhìn Đêm", 4, "Night", Color3.fromRGB(200,200,100))
AddToggle(cVIS, "🚀 120 FPS Giảm 1%", 34, "FPS", Color3.fromRGB(100,180,255))
AddToggle(cVIS, "👻 Tàn Hình Quái Không Thấy", 64, "Invi", Color3.fromRGB(150,150,150))
AddToggle(cMOV, "🕊️ Fly Joystick - Buông Đứng Yên", 4, "Fly", Color3.fromRGB(100,100,255))

-- CORE ULTRA MƯỢT - LÀM NHƯ NGƯỜI TA
local cache = {}
local function getESP(part, id, w, h)
    if cache[id] and cache[id].Parent == part then return cache[id] end
    if part:FindFirstChild("ESP_"..id) then part:FindFirstChild("ESP_"..id):Destroy() end
    local bb = Instance.new("BillboardGui")
    bb.Name = "ESP_"..id
    bb.Parent = part
    bb.Size = UDim2.new(0,w,0,h)
    bb.AlwaysOnTop = true
    bb.StudsOffset = Vector3.new(0,2,0)
    local bg = Instance.new("Frame", bb)
    bg.Size = UDim2.new(1,0,1,0)
    bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
    bg.BackgroundTransparency = 0.4
    Instance.new("UICorner", bg).CornerRadius = UDim.new(0,3)
    local lb = Instance.new("TextLabel", bg)
    lb.Name = "L"
    lb.Size = UDim2.new(1,0,1,0)
    lb.BackgroundTransparency = 1
    lb.TextScaled = true
    lb.Font = Enum.Font.GothamBold
    lb.TextSize = 6
    lb.Text = ""
    cache[id]=bb
    return bb
end

-- 1 LOOP DUY NHẤT CHO ESP - 2.5s - KHÔNG LAG
task.spawn(function()
    while task.wait(2.5) do
        local ok = pcall(function()
            local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            local keep = {}
            if getgenv().DMN99.ESPChest then
                for _,o in pairs(workspace:GetChildren()) do
                    if o:IsA("BasePart") and o.Name:lower():find("chest") then
                        local d = (hrp.Position - o.Position).Magnitude
                        if d <= getgenv().DMN99.Chest then
                            local id = "C_"..o:GetDebugId()
                            keep[id]=true
                            local bb = getESP(o, id, 68, 16)
                            bb.Frame.L.TextColor3 = Color3.fromRGB(0,255,255)
                            bb.Frame.L.Text = "📦 "..math.floor(d).."m"
                        end
                    end
                end
            end
            if getgenv().DMN99.ESPKid then
                for _,o in pairs(workspace:GetDescendants()) do
                    if o.Name:lower():find("kid") or o.Name:lower():find("child") then
                        local p = o:IsA("Model") and (o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart")) or (o:IsA("BasePart") and o or nil)
                        if p then
                            local d = (hrp.Position - p.Position).Magnitude
                            if d <= getgenv().DMN99.Kid then
                                local id = "K_"..p:GetDebugId()
                                keep[id]=true
                                local bb = getESP(p, id, 68, 18)
                                bb.Frame.L.TextColor3 = Color3.fromRGB(255,220,0)
                                bb.Frame.L.Text = "👶 "..math.floor(d).."m"
                            end
                        end
                    end
                end
            end
            if getgenv().DMN99.ESPMon then
                for _,o in pairs(workspace:GetDescendants()) do
                    local n = o.Name:lower()
                    if (n:find("deer") or n:find("wolf") or n:find("bunny") or n:find("rabbit") or n:find("bear") or n:find("owl")) and o:IsA("Model") then
                        local h = o:FindFirstChild("HumanoidRootPart")
                        if h then
                            local d = (hrp.Position - h.Position).Magnitude
                            if d <= getgenv().DMN99.Mon then
                                local id = "M_"..o:GetDebugId()
                                keep[id]=true
                                local bb = getESP(h, id, 70, 18)
                                bb.Frame.L.TextColor3 = n:find("bunny") and Color3.fromRGB(150,255,150) or Color3.fromRGB(255,120,120)
                                bb.Frame.L.Text = (n:find("bunny") and "🐰 " or "👹 ")..math.floor(d).."m"
                            end
                        end
                    end
                end
            end
            for id,bb in pairs(cache) do if not keep[id] then pcall(function() bb:Destroy() end) cache[id]=nil end end
        end)
    end
end)

-- TÁCH LOOP - KHÔNG GỘP CHUNG
task.spawn(function() while task.wait(0.5) do pcall(function() if getgenv().DMN99.Night then game.Lighting.Brightness=2.5 game.Lighting.ClockTime=14 game.Lighting.FogEnd=100000 end end) end end)
task.spawn(function() local s={} while task.wait(2) do pcall(function() if getgenv().DMN99.FPS then for _,v in pairs(workspace:GetDescendants()) do if v:IsA("ParticleEmitter") and math.random(1,100)==1 then if s[v]==nil then s[v]=v.Enabled end v.Enabled=false end end if setfpscap then pcall(setfpscap,120) end else for o,e in pairs(s) do pcall(function() if o and o.Parent then o.Enabled=e end end) end s={} end end) end end)

local old={}
task.spawn(function() while task.wait(0.5) do pcall(function() local c=game.Players.LocalPlayer.Character if not c then return end if getgenv().DMN99.Invi then for _,p in pairs(c:GetDescendants()) do if p:IsA("BasePart") and p.Name~="HumanoidRootPart" then if old[p]==nil then old[p]=p.Transparency end p.Transparency=1 end end c.HumanoidRootPart.CanCollide=false else for p,t in pairs(old) do pcall(function() if p and p.Parent then p.Transparency=t end end) end old={} if c:FindFirstChild("HumanoidRootPart") then c.HumanoidRootPart.CanCollide=true end end end) end end)

local bv, bg, fly=false
task.spawn(function()
    while task.wait(0.08) do
        pcall(function()
            local char=game.Players.LocalPlayer.Character
            local hrp=char and char:FindFirstChild("HumanoidRootPart")
            local hum=char and char:FindFirstChild("Humanoid")
            if not hrp or not hum then return end
            if getgenv().DMN99.Fly then
                if not fly then fly=true bv=Instance.new("BodyVelocity") bv.MaxForce=Vector3.new(1e9,1e9,1e9) bv.Velocity=Vector3.new(0,0,0) bv.Parent=hrp bg=Instance.new("BodyGyro") bg.MaxTorque=Vector3.new(1e9,1e9,1e9) bg.CFrame=hrp.CFrame bg.Parent=hrp hum.PlatformStand=true hrp.CFrame+=Vector3.new(0,10,0) Noti("Fly","Buông joystick đứng yên trên không") end
                local cam=workspace.CurrentCamera
                local dir=hum.MoveDirection
                if dir.Magnitude<0.1 then bv.Velocity=Vector3.new(0,0,0) else local sp=28 local look=cam.CFrame.LookVector local vel=cam.CFrame.RightVector*dir.X*sp + Vector3.new(look.X,0,look.Z).Unit * -dir.Z * sp + Vector3.new(0, look.Y * -dir.Z * sp, 0) if look.Y>0.3 then vel+=Vector3.new(0,sp*0.8,0) end if look.Y<-0.3 then vel+=Vector3.new(0,-sp*0.8,0) end bv.Velocity=vel end
                bg.CFrame=cam.CFrame
            else
                if fly then fly=false if bv then bv:Destroy() bv=nil end if bg then bg:Destroy() bg=nil end hum.PlatformStand=false local ray=workspace:Raycast(hrp.Position, Vector3.new(0,-500,0), RaycastParams.new()) if ray then game:GetService("TweenService"):Create(hrp, TweenInfo.new(1), {CFrame=CFrame.new(ray.Position+Vector3.new(0,3,0))}):Play() end Noti("Fly","Tắt - Hạ xuống") end
            end
        end)
    end
end)

Noti("V7 ULTRA PRO","0 lag 0 lỗi - Chuẩn như người ta làm - By ĐỒNG M NGUYÊN")
