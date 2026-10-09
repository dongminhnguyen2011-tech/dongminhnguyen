-- 99 ĐÊM V8 FIX TÀN HÌNH + ESP TÊN + FLY NÚT LÊN XUỐNG - BY ĐỒNG M NGUYÊN
for _,v in pairs((gethui and gethui() or game.CoreGui):GetChildren()) do if v.Name:find("99DMN") then v:Destroy() end end
getgenv().DMN99 = {Tab="ESP", FPS=false, Night=false, Invi=false, Fly=false, ESPChest=false, ESPKid=false, ESPMon=false, Chest=500, Kid=1000, Mon=400, FlyUp=false, FlyDown=false}
local gui = Instance.new("ScreenGui", gethui and gethui() or game.CoreGui)
gui.Name = "99DMN_V8"
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
main.Size = UDim2.new(0,350,0,400)
main.Position = UDim2.new(0.15,0,0.15,0)
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
mText.Size = UDim2.new(0,700,1,0)
mText.Position = UDim2.new(1,0,0,0)
mText.Text = " ĐỒNG M NGUYÊN — V8 FIX TÀN HÌNH QUÁI ĐỨNG YÊN — ESP CÓ TÊN — FLY CÓ NÚT LÊN XUỐNG "
mText.Font = Enum.Font.GothamBold
mText.TextColor3 = Color3.fromRGB(255,215,0)
mText.BackgroundTransparency = 1
mText.TextSize = 8
task.spawn(function() while task.wait(0.05) do pcall(function() mText.Position-=UDim2.new(0,1,0,0) if mText.Position.X.Offset<-700 then mText.Position=UDim2.new(1,0,0,0) end end) end end)
local title = Instance.new("TextLabel", head)
title.Position = UDim2.new(0,6,0,18)
title.Size = UDim2.new(1,-40,0,18)
title.Text = "V8 FIX TÀN HÌNH + TÊN + FLY"
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
    btn.MouseButton1Click:Connect(function() getgenv().DMN99[key]=not getgenv().DMN99[key] btn.Text=getgenv().DMN99[key] and "ON" or "OFF" btn.BackgroundColor3=getgenv().DMN99[key] and col or Color3.fromRGB(65,65,65) Noti(btn.Text=="ON" and "Bật" or "Tắt", txt.." "..btn.Text) end)
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
    box.TextSize = 7
    box.BackgroundColor3 = Color3.fromRGB(18,18,22)
    box.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", box)
    box.FocusLost:Connect(function() local n=tonumber(box.Text) if n and n>=1 and n<=1000000 then getgenv().DMN99[dkey]=n Noti("KC",n.."m") end end)
end
AddESP(cESP, "📦 ESP Rương CÓ TÊN", 4, "ESPChest", "Chest", 500, Color3.fromRGB(0,200,200))
AddESP(cESP, "👶 ESP Trẻ CÓ TÊN", 56, "ESPKid", "Kid", 1000, Color3.fromRGB(200,180,0))
AddESP(cESP, "👹 ESP Quái+Thỏ CÓ TÊN", 108, "ESPMon", "Mon", 400, Color3.fromRGB(200,50,50))
AddToggle(cVIS, "💡 Nhìn Đêm", 4, "Night", Color3.fromRGB(200,200,100))
AddToggle(cVIS, "🚀 120 FPS Giảm 1%", 34, "FPS", Color3.fromRGB(100,180,255))
AddToggle(cVIS, "👻 Tàn Hình Đóng Băng Quái", 64, "Invi", Color3.fromRGB(150,150,150))
AddToggle(cMOV, "🕊️ Fly Joystick", 4, "Fly", Color3.fromRGB(100,100,255))

-- NÚT LÊN / XUỐNG CHO FLY - HIỆN KHI BẬT FLY
local upBtn = Instance.new("TextButton", gui)
upBtn.Size = UDim2.new(0,60,0,60)
upBtn.Position = UDim2.new(1,-70,0.6,0)
upBtn.Text = "LÊN"
upBtn.Font = Enum.Font.GothamBold
upBtn.TextSize = 10
upBtn.BackgroundColor3 = Color3.fromRGB(0,200,0)
upBtn.TextColor3 = Color3.new(1,1,1)
upBtn.Visible = false
Instance.new("UICorner", upBtn).CornerRadius = UDim.new(0,12)
local downBtn = Instance.new("TextButton", gui)
downBtn.Size = UDim2.new(0,60,0,60)
downBtn.Position = UDim2.new(1,-70,0.6,70)
downBtn.Text = "XUỐNG"
downBtn.Font = Enum.Font.GothamBold
downBtn.TextSize = 8
downBtn.BackgroundColor3 = Color3.fromRGB(200,0,0)
downBtn.TextColor3 = Color3.new(1,1,1)
downBtn.Visible = false
Instance.new("UICorner", downBtn).CornerRadius = UDim.new(0,12)
upBtn.MouseButton1Down:Connect(function() getgenv().DMN99.FlyUp=true end)
upBtn.MouseButton1Up:Connect(function() getgenv().DMN99.FlyUp=false end)
downBtn.MouseButton1Down:Connect(function() getgenv().DMN99.FlyDown=true end)
downBtn.MouseButton1Up:Connect(function() getgenv().DMN99.FlyDown=false end)

local cache={}
local function getESP(part, id, w, h)
    if cache[id] and cache[id].Parent==part then return cache[id] end
    if part:FindFirstChild("ESP_"..id) then part:FindFirstChild("ESP_"..id):Destroy() end
    local bb=Instance.new("BillboardGui")
    bb.Name="ESP_"..id
    bb.Parent=part
    bb.Size=UDim2.new(0,w,0,h)
    bb.AlwaysOnTop=true
    bb.StudsOffset=Vector3.new(0,2.2,0)
    local bg=Instance.new("Frame",bb)
    bg.Size=UDim2.new(1,0,1,0)
    bg.BackgroundColor3=Color3.fromRGB(0,0,0)
    bg.BackgroundTransparency=0.35
    Instance.new("UICorner",bg).CornerRadius=UDim.new(0,4)
    local lb=Instance.new("TextLabel",bg)
    lb.Name="L"
    lb.Size=UDim2.new(1,0,1,0)
    lb.BackgroundTransparency=1
    lb.TextScaled=true
    lb.Font=Enum.Font.GothamBold
    lb.TextSize=7
    lb.Text=""
    cache[id]=bb
    return bb
end

-- ESP CÓ TÊN - FIX CHỈ HIỆN ẢNH
task.spawn(function()
    while task.wait(2) do
        pcall(function()
            local hrp=game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            local keep={}
            if getgenv().DMN99.ESPChest then
                for _,o in pairs(workspace:GetChildren()) do
                    if o:IsA("BasePart") and o.Name:lower():find("chest") then
                        local d=(hrp.Position-o.Position).Magnitude
                        if d<=getgenv().DMN99.Chest then
                            local id="C_"..o:GetDebugId()
                            keep[id]=true
                            local bb=getESP(o,id,110,20)
                            local name=o.Name
                            bb.Frame.L.TextColor3=Color3.fromRGB(0,255,255)
                            bb.Frame.L.Text="📦 "..name.." "..math.floor(d).."m"
                        end
                    end
                end
            end
            if getgenv().DMN99.ESPKid then
                for _,o in pairs(workspace:GetDescendants()) do
                    if o.Name:lower():find("kid") or o.Name:lower():find("child") then
                        local p=o:IsA("Model") and (o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart")) or (o:IsA("BasePart") and o or nil)
                        if p then
                            local d=(hrp.Position-p.Position).Magnitude
                            if d<=getgenv().DMN99.Kid then
                                local id="K_"..p:GetDebugId()
                                keep[id]=true
                                local bb=getESP(p,id,110,20)
                                bb.Frame.L.TextColor3=Color3.fromRGB(255,220,0)
                                bb.Frame.L.Text="👶 "..o.Name.." "..math.floor(d).."m"
                            end
                        end
                    end
                end
            end
            if getgenv().DMN99.ESPMon then
                for _,o in pairs(workspace:GetDescendants()) do
                    local n=o.Name
                    local nl=n:lower()
                    if (nl:find("deer") or nl:find("wolf") or nl:find("bunny") or nl:find("rabbit") or nl:find("bear") or nl:find("owl") or nl:find("monster")) and o:IsA("Model") then
                        local h=o:FindFirstChild("HumanoidRootPart")
                        if h then
                            local d=(hrp.Position-h.Position).Magnitude
                            if d<=getgenv().DMN99.Mon then
                                local id="M_"..o:GetDebugId()
                                keep[id]=true
                                local bb=getESP(h,id,120,22)
                                local icon=nl:find("bunny") and "🐰 Thỏ" or nl:find("wolf") and "🐺 Sói" or nl:find("deer") and "🦌 Hươu" or nl:find("bear") and "🐻 Gấu" or "👹 Quái"
                                bb.Frame.L.TextColor3=nl:find("bunny") and Color3.fromRGB(150,255,150) or Color3.fromRGB(255,150,150)
                                bb.Frame.L.Text=icon.." "..n.." "..math.floor(d).."m"
                            end
                        end
                    end
                end
            end
            for id,bb in pairs(cache) do if not keep[id] then pcall(function() bb:Destroy() end) cache[id]=nil end end
        end)
    end
end)

-- FIX TÀN HÌNH THẬT - ĐÓNG BĂNG QUÁI - QUÁI KHÔNG BAO GIỜ BIẾT
task.spawn(function()
    local old={}
    while task.wait(0.3) do
        pcall(function()
            local char=game.Players.LocalPlayer.Character
            if not char then return end
            local hrp=char:FindFirstChild("HumanoidRootPart")
            if getgenv().DMN99.Invi then
                -- 1. Cho nhân vật tàng hình
                for _,p in pairs(char:GetDescendants()) do
                    if p:IsA("BasePart") and p.Name~="HumanoidRootPart" then
                        if old[p]==nil then old[p]=p.Transparency end
                        p.Transparency=1
                    end
                    if p:IsA("Decal") then
                        if old[p]==nil then old[p]=p.Transparency end
                        p.Transparency=1
                    end
                end
                if hrp then hrp.CanCollide=false end
                -- 2. FIX QUÁI VẪN PHÁT HIỆN - ĐÓNG BĂNG HẾT QUÁI GẦN
                for _,m in pairs(workspace:GetDescendants()) do
                    local nl=m.Name:lower()
                    if (nl:find("deer") or nl:find("wolf") or nl:find("bunny") or nl:find("bear") or nl:find("owl") or nl:find("monster")) and m:IsA("Model") then
                        local mhrp=m:FindFirstChild("HumanoidRootPart")
                        local mhum=m:FindFirstChildWhichIsA("Humanoid")
                        if mhrp and mhum and hrp then
                            local d=(hrp.Position-mhrp.Position).Magnitude
                            if d<150 then -- Quái gần 150m thì đóng băng
                                mhum.WalkSpeed=0
                                mhum.JumpPower=0
                                -- Ngừng dí
                                pcall(function() mhum:MoveTo(mhrp.Position) end)
                            end
                        end
                    end
                end
            else
                for p,t in pairs(old) do pcall(function() if p and p.Parent then p.Transparency=t end end) end
                old={}
                if hrp then hrp.CanCollide=true end
                -- Trả lại tốc độ cho quái khi tắt tàn hình
                for _,m in pairs(workspace:GetDescendants()) do
                    local mhum=m:FindFirstChildWhichIsA("Humanoid")
                    if mhum and (m.Name:lower():find("deer") or m.Name:lower():find("wolf") or m.Name:lower():find("bear")) then
                        mhum.WalkSpeed=16
                        mhum.JumpPower=50
                    end
                end
            end
        end)
    end
end)

task.spawn(function() while task.wait(0.5) do pcall(function() if getgenv().DMN99.Night then game.Lighting.Brightness=2.5 game.Lighting.ClockTime=14 game.Lighting.FogEnd=100000 end end) end end)
task.spawn(function() local s={} while task.wait(2) do pcall(function() if getgenv().DMN99.FPS then for _,v in pairs(workspace:GetDescendants()) do if v:IsA("ParticleEmitter") and math.random(1,100)==1 then if s[v]==nil then s[v]=v.Enabled end v.Enabled=false end end if setfpscap then pcall(setfpscap,120) end else for o,e in pairs(s) do pcall(function() if o and o.Parent then o.Enabled=e end end) end s={} end end) end end)

-- FLY V8 CÓ NÚT LÊN XUỐNG - BUÔNG JOYSTICK ĐỨNG YÊN 100%
local bv, bg, fly=false
task.spawn(function()
    while task.wait(0.07) do
        pcall(function()
            local char=game.Players.LocalPlayer.Character
            local hrp=char and char:FindFirstChild("HumanoidRootPart")
            local hum=char and char:FindFirstChild("Humanoid")
            if not hrp or not hum then return end
            if getgenv().DMN99.Fly then
                if not fly then
                    fly=true
                    bv=Instance.new("BodyVelocity")
                    bv.MaxForce=Vector3.new(1e9,1e9,1e9)
                    bv.Velocity=Vector3.new(0,0,0)
                    bv.Parent=hrp
                    bg=Instance.new("BodyGyro")
                    bg.MaxTorque=Vector3.new(1e9,1e9,1e9)
                    bg.CFrame=hrp.CFrame
                    bg.Parent=hrp
                    hum.PlatformStand=true
                    hrp.CFrame+=Vector3.new(0,12,0)
                    upBtn.Visible=true
                    downBtn.Visible=true
                    Noti("Fly","Bật - Có nút LÊN/XUỐNG - Buông joystick đứng yên")
                end
                local cam=workspace.CurrentCamera
                local dir=hum.MoveDirection
                local vel=Vector3.new(0,0,0)
                if dir.Magnitude>0.1 then
                    local sp=32
                    local look=cam.CFrame.LookVector
                    vel=cam.CFrame.RightVector*dir.X*sp + Vector3.new(look.X,0,look.Z).Unit * -dir.Z * sp
                    vel+=Vector3.new(0, look.Y * -dir.Z * sp * 0.8, 0)
                end
                -- NÚT LÊN XUỐNG
                if getgenv().DMN99.FlyUp then vel+=Vector3.new(0,32,0) end
                if getgenv().DMN99.FlyDown then vel+=Vector3.new(0,-32,0) end
                -- Nếu không bấm gì thì đứng yên trên không 100%
                bv.Velocity=vel
                bg.CFrame=cam.CFrame
            else
                if fly then
                    fly=false
                    if bv then bv:Destroy() bv=nil end
                    if bg then bg:Destroy() bg=nil end
                    hum.PlatformStand=false
                    upBtn.Visible=false
                    downBtn.Visible=false
                    local ray=workspace:Raycast(hrp.Position, Vector3.new(0,-500,0), RaycastParams.new())
                    if ray then game:GetService("TweenService"):Create(hrp, TweenInfo.new(1), {CFrame=CFrame.new(ray.Position+Vector3.new(0,3,0))}):Play() end
                    Noti("Fly","Tắt - Hạ xuống")
                end
            end
        end)
    end
end)

Noti("V8 FIX XONG","Tàn hình đóng băng quái + ESP có tên + Fly có nút lên xuống - By ĐỒNG M NGUYÊN")
