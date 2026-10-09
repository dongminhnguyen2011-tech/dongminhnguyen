-- TÀNG HÌNH THẬT 100% - KHÓA HẾT CODE PHÁT HIỆN - CHỈ 1 CHỨC NĂNG - BY ĐỒNG M NGUYÊN
for _,v in pairs((gethui and gethui() or game.CoreGui):GetChildren()) do if v.Name:find("TANGHINH") then v:Destroy() end end

local gui = Instance.new("ScreenGui", gethui and gethui() or game.CoreGui)
gui.Name = "TANGHINH_TRUE"

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,260,0,85)
main.Position = UDim2.new(0.5,-130,0.5,-40)
main.BackgroundColor3 = Color3.fromRGB(10,10,15)
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,12)
local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(255,140,0)
stroke.Thickness = 2

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,28)
title.Text = "👻 TÀNG HÌNH THẬT 100% - KHÓA HẾT"
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255,215,0)
title.BackgroundTransparency = 1
title.TextSize = 9

local btn = Instance.new("TextButton", main)
btn.Size = UDim2.new(1,-14,0,42)
btn.Position = UDim2.new(0,7,0,32)
btn.Text = "BẬT TÀNG HÌNH - OFF"
btn.Font = Enum.Font.GothamBold
btn.TextSize = 10
btn.BackgroundColor3 = Color3.fromRGB(60,60,60)
btn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", btn).CornerRadius = UDim.new(0,8)

local enabled = false
local saved = {}
local oldTrans = {}

local function Noti(a,b) pcall(function() game.StarterGui:SetCore("SendNotification",{Title=a, Text=b, Duration=2}) end) end

btn.MouseButton1Click:Connect(function()
    enabled = not enabled
    if enabled then
        btn.Text = "TẮT TÀNG HÌNH - ON - ĐANG KHÓA QUÁI"
        btn.BackgroundColor3 = Color3.fromRGB(0,160,0)
        Noti("Tàng hình thật", "Đã khóa hết quái - Đánh không bị phát hiện")
    else
        btn.Text = "BẬT TÀNG HÌNH - OFF"
        btn.BackgroundColor3 = Color3.fromRGB(60,60,60)
        Noti("Tàng hình", "Đã tắt - Quái về như cũ")
    end
end)

-- KHÓA HẾT CODE PHÁT HIỆN CỦA QUÁI - 1s 1 lần cho 0 lag
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            local char = game.Players.LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChild("Humanoid")
            if not char or not hrp or not hum then return end

            if enabled then
                -- 1. Tàng hình nhân vật thật
                for _,p in pairs(char:GetDescendants()) do
                    if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
                        if oldTrans[p] == nil then oldTrans[p] = p.Transparency end
                        p.Transparency = 1
                        p.CanTouch = false
                    end
                    if p:IsA("Decal") or p:IsA("Texture") then
                        if oldTrans[p] == nil then oldTrans[p] = p.Transparency end
                        p.Transparency = 1
                    end
                end
                hrp.CanTouch = false
                -- God mode nhẹ - có bị chạm cũng không mất máu
                if hum.Health < 100 then hum.Health = 100 end

                -- 2. KHÓA HẾT QUÁI - SÓI / HƯƠU / GẤU / CÚ
                for _,m in pairs(workspace:GetDescendants()) do
                    if m:IsA("Model") then
                        local nl = m.Name:lower()
                        if nl:find("wolf") or nl:find("deer") or nl:find("bear") or nl:find("owl") or nl:find("monster") or nl:find("alpha") then
                            local mhrp = m:FindFirstChild("HumanoidRootPart")
                            local mhum = m:FindFirstChildWhichIsA("Humanoid")
                            if mhrp and mhum then
                                local dist = (hrp.Position - mhrp.Position).Magnitude
                                if dist < 300 then
                                    if not saved[m] then
                                        saved[m] = {
                                            WS = mhum.WalkSpeed,
                                            JP = mhum.JumpPower,
                                            Anchored = mhrp.Anchored,
                                            CanTouch = {},
                                            Scripts = {}
                                        }
                                        -- Lưu và tắt hết Script AI phát hiện
                                        for _,s in pairs(m:GetDescendants()) do
                                            if s:IsA("Script") or s:IsA("LocalScript") then
                                                saved[m].Scripts[s] = s.Disabled
                                                s.Disabled = true
                                            end
                                            if s:IsA("BasePart") then
                                                saved[m].CanTouch[s] = s.CanTouch
                                            end
                                        end
                                    end
                                    -- KHÓA CỨNG TỪ GỐC
                                    mhrp.Anchored = true
                                    mhum.WalkSpeed = 0
                                    mhum.JumpPower = 0
                                    mhum.PlatformStand = true
                                    mhum.AutoRotate = false
                                    -- Không cho chạm để không cắn được dù bạn đứng sát
                                    for _,part in pairs(m:GetDescendants()) do
                                        if part:IsA("BasePart") then
                                            part.CanTouch = false
                                            part.CanCollide = false
                                        end
                                    end
                                    -- Xóa target - ngừng dí
                                    pcall(function() mhum:MoveTo(mhrp.Position) end)
                                    -- Khóa không cho nó tự bật lại WalkSpeed
                                    mhum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                                        if enabled and mhum.WalkSpeed ~= 0 then
                                            mhum.WalkSpeed = 0
                                        end
                                    end)
                                end
                            end
                        end
                    end
                end
            else
                -- TẮT - TRẢ VỀ NHƯ CŨ 100%
                for p,t in pairs(oldTrans) do
                    if p and p.Parent then
                        pcall(function()
                            if p:IsA("BasePart") then
                                p.Transparency = t
                                p.CanTouch = true
                            else
                                p.Transparency = t
                            end
                        end)
                    end
                end
                oldTrans = {}
                if hrp then hrp.CanTouch = true end

                for mon, data in pairs(saved) do
                    pcall(function()
                        if mon and mon.Parent then
                            local mhrp = mon:FindFirstChild("HumanoidRootPart")
                            local mhum = mon:FindFirstChildWhichIsA("Humanoid")
                            if mhrp then mhrp.Anchored = data.Anchored end
                            if mhum then
                                mhum.WalkSpeed = data.WS
                                mhum.JumpPower = data.JP
                                mhum.PlatformStand = false
                                mhum.AutoRotate = true
                            end
                            for part, canTouch in pairs(data.CanTouch) do
                                if part and part.Parent then
                                    part.CanTouch = canTouch
                                    part.CanCollide = true
                                end
                            end
                            for s, wasDisabled in pairs(data.Scripts) do
                                if s and s.Parent then s.Disabled = wasDisabled end
                            end
                        end
                    end)
                end
                saved = {}
            end
        end)
    end
end)

Noti("Tàng hình thật", "Chỉ 1 chức năng - Khóa hết quái - Đánh không phát hiện")
