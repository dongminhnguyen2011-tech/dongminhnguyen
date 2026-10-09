-- TÀNG HÌNH VIP PRO - GIAO DIỆN PRO + KHÓA QUÁI SERVER - BY ĐỒNG M NGUYÊN
for _,v in pairs((gethui and gethui() or game.CoreGui):GetChildren()) do if v.Name:find("VIPINVI") then v:Destroy() end end

local gui = Instance.new("ScreenGui", gethui and gethui() or game.CoreGui)
gui.Name = "VIPINVI_PRO"
gui.ResetOnSpawn = false

-- NÚT TRÒN NHỎ KHI THU GỌN - GIỐNG PRO
local circle = Instance.new("TextButton", gui)
circle.Size = UDim2.new(0,52,0,52)
circle.Position = UDim2.new(0,15,0.5,0)
circle.Text = "👁️"
circle.TextSize = 20
circle.Font = Enum.Font.GothamBold
circle.BackgroundColor3 = Color3.fromRGB(15,15,20)
circle.TextColor3 = Color3.fromRGB(130,90,255)
circle.Visible = false
circle.Active = true
circle.Draggable = true
Instance.new("UICorner", circle).CornerRadius = UDim.new(1,0)
local sCircle = Instance.new("UIStroke", circle)
sCircle.Color = Color3.fromRGB(130,90,255)
sCircle.Thickness = 2

-- MAIN FRAME - GIAO DIỆN PRO
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,300,0,170)
main.Position = UDim2.new(0.5,-150,0.5,-85)
main.BackgroundColor3 = Color3.fromRGB(18,18,22)
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,14)
local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(130,90,255)
stroke.Thickness = 1.5

-- HEADER PRO
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1,0,0,38)
header.BackgroundColor3 = Color3.fromRGB(25,25,30)
Instance.new("UICorner", header).CornerRadius = UDim.new(0,14)
local headerFix = Instance.new("Frame", header)
headerFix.Size = UDim2.new(1,0,0,14)
headerFix.Position = UDim2.new(0,0,1,-7)
headerFix.BackgroundColor3 = Color3.fromRGB(25,25,30)
headerFix.BorderSizePixel = 0

local icon = Instance.new("TextLabel", header)
icon.Size = UDim2.new(0,32,0,32)
icon.Position = UDim2.new(0,8,0,3)
icon.Text = "🥷"
icon.TextSize = 18
icon.BackgroundTransparency = 1

local title = Instance.new("TextLabel", header)
title.Position = UDim2.new(0,38,0,2)
title.Size = UDim2.new(1,-90,0,16)
title.Text = "TÀNG HÌNH VIP PRO"
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.new(1,1,1)
title.TextXAlignment = Enum.TextXAlignment.Left
title.BackgroundTransparency = 1
title.TextSize = 11

local sub = Instance.new("TextLabel", header)
sub.Position = UDim2.new(0,38,0,18)
sub.Size = UDim2.new(1,-90,0,12)
sub.Text = "Khóa quái server - Đánh không bị thấy"
sub.Font = Enum.Font.Gotham
sub.TextColor3 = Color3.fromRGB(150,150,150)
sub.TextXAlignment = Enum.TextXAlignment.Left
sub.BackgroundTransparency = 1
sub.TextSize = 8

local close = Instance.new("TextButton", header)
close.Size = UDim2.new(0,28,0,28)
close.Position = UDim2.new(1,-32,0,5)
close.Text = "—"
close.Font = Enum.Font.GothamBold
close.TextSize = 12
close.BackgroundColor3 = Color3.fromRGB(40,40,45)
close.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", close).CornerRadius = UDim.new(0,8)
close.MouseButton1Click:Connect(function() main.Visible=false circle.Visible=true end)
circle.MouseButton1Click:Connect(function() main.Visible=true circle.Visible=false end)

-- CONTENT
local content = Instance.new("Frame", main)
content.Position = UDim2.new(0,8,0,46)
content.Size = UDim2.new(1,-16,0,116)
content.BackgroundColor3 = Color3.fromRGB(24,24,28)
Instance.new("UICorner", content).CornerRadius = UDim.new(0,10)

local toggleFrame = Instance.new("Frame", content)
toggleFrame.Size = UDim2.new(1,-12,0,42)
toggleFrame.Position = UDim2.new(0,6,0,6)
toggleFrame.BackgroundColor3 = Color3.fromRGB(32,32,38)
Instance.new("UICorner", toggleFrame).CornerRadius = UDim.new(0,8)

local tIcon = Instance.new("TextLabel", toggleFrame)
tIcon.Size = UDim2.new(0,36,0,36)
tIcon.Position = UDim2.new(0,6,0,3)
tIcon.Text = "👁️"
tIcon.TextSize = 18
tIcon.BackgroundColor3 = Color3.fromRGB(130,90,255)
tIcon.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", tIcon).CornerRadius = UDim.new(0,8)

local tTitle = Instance.new("TextLabel", toggleFrame)
tTitle.Position = UDim2.new(0,48,0,4)
tTitle.Size = UDim2.new(0,120,0,14)
tTitle.Text = "Tàng Hình VIP"
tTitle.Font = Enum.Font.GothamBold
tTitle.TextColor3 = Color3.new(1,1,1)
tTitle.TextXAlignment = Enum.TextXAlignment.Left
tTitle.BackgroundTransparency = 1
tTitle.TextSize = 10

local tSub = Instance.new("TextLabel", toggleFrame)
tSub.Position = UDim2.new(0,48,0,20)
tSub.Size = UDim2.new(0,120,0,12)
tSub.Text = "Quái không thấy - Không chết"
tSub.Font = Enum.Font.Gotham
tSub.TextColor3 = Color3.fromRGB(140,140,140)
tSub.TextXAlignment = Enum.TextXAlignment.Left
tSub.BackgroundTransparency = 1
tSub.TextSize = 8

-- SWITCH PRO GIỐNG IOS
local switchBG = Instance.new("Frame", toggleFrame)
switchBG.Size = UDim2.new(0,48,0,24)
switchBG.Position = UDim2.new(1,-56,0,9)
switchBG.BackgroundColor3 = Color3.fromRGB(55,55,60)
Instance.new("UICorner", switchBG).CornerRadius = UDim.new(1,0)

local switchDot = Instance.new("Frame", switchBG)
switchDot.Size = UDim2.new(0,20,0,20)
switchDot.Position = UDim2.new(0,2,0,2)
switchDot.BackgroundColor3 = Color3.new(1,1,1)
Instance.new("UICorner", switchDot).CornerRadius = UDim.new(1,0)

local status = Instance.new("TextLabel", content)
status.Position = UDim2.new(0,6,0,54)
status.Size = UDim2.new(1,-12,0,56)
status.Text = "Trạng thái: TẮT\nBật lên sẽ dịch chuyển hết sói/hươu/gấu ra xa 10.000m nên không bao giờ giết được bạn. Đánh thoải mái không bị phát hiện."
status.Font = Enum.Font.Gotham
status.TextColor3 = Color3.fromRGB(180,180,180)
status.TextXAlignment = Enum.TextXAlignment.Left
status.TextYAlignment = Enum.TextYAlignment.Top
status.TextWrapped = true
status.BackgroundColor3 = Color3.fromRGB(18,18,22)
status.TextSize = 8
Instance.new("UICorner", status).CornerRadius = UDim.new(0,6)

local function Noti(a,b) pcall(function() game.StarterGui:SetCore("SendNotification",{Title=a, Text=b, Duration=2}) end) end

-- VIP LOGIC - DỊCH CHUYỂN QUÁI RA XA + GOD MODE
local enabled = false
local savedPos = {}
local godConn = nil

local function setToggle(on)
    enabled = on
    if on then
        game:GetService("TweenService"):Create(switchBG, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(130,90,255)}):Play()
        game:GetService("TweenService"):Create(switchDot, TweenInfo.new(0.2), {Position = UDim2.new(0,26,0,2)}):Play()
        status.Text = "Trạng thái: BẬT VIP - ĐANG KHÓA QUÁI\n✅ Đã dịch chuyển hết quái ra xa\n✅ God Mode - Không chết được\n✅ Đánh thoải mái không gọi bầy"
        status.TextColor3 = Color3.fromRGB(150,255,150)
        Noti("Tàng hình VIP", "Đã bật - Quái đã bị dịch chuyển ra xa")
    else
        game:GetService("TweenService"):Create(switchBG, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(55,55,60)}):Play()
        game:GetService("TweenService"):Create(switchDot, TweenInfo.new(0.2), {Position = UDim2.new(0,2,0,2)}):Play()
        status.Text = "Trạng thái: TẮT\nBật lên sẽ dịch chuyển hết sói/hươu/gấu ra xa 10.000m nên không bao giờ giết được bạn."
        status.TextColor3 = Color3.fromRGB(180,180,180)
        Noti("Tàng hình VIP", "Đã tắt - Quái về lại")
    end
end

switchBG.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then setToggle(not enabled) end end)

task.spawn(function()
    while task.wait(0.7) do
        pcall(function()
            local char = game.Players.LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChild("Humanoid")
            if not char or not hrp or not hum then return end

            if enabled then
                -- GOD MODE VIP - Không bao giờ chết như ảnh bạn gửi
                hum.MaxHealth = math.huge
                if hum.Health < math.huge then hum.Health = math.huge end
                if not godConn then
                    godConn = hum.HealthChanged:Connect(function()
                        if enabled and hum.Health < math.huge then
                            hum.Health = math.huge
                        end
                    end)
                end

                -- DỊCH CHUYỂN HẾT QUÁI RA XA 10.000m - SERVER KHÔNG GIẾT ĐƯỢC
                for _,m in pairs(workspace:GetDescendants()) do
                    if m:IsA("Model") then
                        local nl = m.Name:lower()
                        if nl:find("wolf") or nl:find("deer") or nl:find("bear") or nl:find("owl") or nl:find("monster") or nl:find("alpha") then
                            local mhrp = m:FindFirstChild("HumanoidRootPart")
                            local mhum = m:FindFirstChildWhichIsA("Humanoid")
                            if mhrp and mhum then
                                local dist = (hrp.Position - mhrp.Position).Magnitude
                                if dist < 500 then
                                    if not savedPos[m] then
                                        savedPos[m] = mhrp.CFrame
                                    end
                                    -- Dịch ra xa 10k mét lên trời - Không bao giờ tới được bạn
                                    mhrp.CFrame = CFrame.new(0,10000,0)
                                    mhrp.Anchored = true
                                    mhum.WalkSpeed = 0
                                    mhum.PlatformStand = true
                                end
                            end
                        end
                    end
                end
            else
                -- TẮT - TRẢ QUÁI VỀ
                if godConn then godConn:Disconnect() godConn=nil end
                if hum then
                    hum.MaxHealth = 100
                    hum.Health = 100
                end
                for mon, cf in pairs(savedPos) do
                    pcall(function()
                        if mon and mon.Parent then
                            local mhrp = mon:FindFirstChild("HumanoidRootPart")
                            local mhum = mon:FindFirstChildWhichIsA("Humanoid")
                            if mhrp then
                                mhrp.Anchored = false
                                mhrp.CFrame = cf
                            end
                            if mhum then
                                mhum.WalkSpeed = 16
                                mhum.PlatformStand = false
                            end
                        end
                    end)
                end
                savedPos = {}
            end
        end)
    end
end)

Noti("VIP PRO", "Giao diện pro - Tàng hình VIP đã sẵn sàng")
