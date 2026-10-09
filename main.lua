-- ĐỒNG M NGUYÊN — TỔNG HỢP SCRIPT GAME - V7 NO LAG
local LP = game.Players.LocalPlayer
local PG = LP:WaitForChild("PlayerGui")

if PG:FindFirstChild("DongMNguyenHub") then PG.DongMNguyenHub:Destroy() end

local gui = Instance.new("ScreenGui", PG)
gui.Name = "DongMNguyenHub"
gui.ResetOnSpawn = false

-- NÚT TRÒN KHI ẨN
local Circle = Instance.new("TextButton", gui)
Circle.Size = UDim2.new(0,60,0,60)
Circle.Position = UDim2.new(0,20,0.5,0)
Circle.BackgroundColor3 = Color3.fromRGB(0,0,0)
Circle.Text = "DMN"
Circle.TextColor3 = Color3.fromRGB(0,255,127)
Circle.TextScaled = true
Circle.Font = Enum.Font.GothamBlack
Circle.Visible = false
Circle.Draggable = true
Instance.new("UICorner", Circle).CornerRadius = UDim.new(1,0)
local s1 = Instance.new("UIStroke", Circle) s1.Color=Color3.fromRGB(0,255,127) s1.Thickness=2

-- KHUNG CHÍNH
local Main = Instance.new("Frame", gui)
Main.Size = UDim2.new(0,360,0,260)
Main.Position = UDim2.new(0.5,-180,0.5,-130)
Main.BackgroundColor3 = Color3.fromRGB(20,20,20)
Main.Draggable = true
Main.Active = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,10)
Instance.new("UIStroke", Main).Color = Color3.fromRGB(0,255,127)

-- THANH TIÊU ĐỀ
local TopBar = Instance.new("Frame", Main)
TopBar.Size = UDim2.new(1,0,0,35)
TopBar.BackgroundColor3 = Color3.fromRGB(30,30,30)
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0,10)

-- CHỮ CHẠY
local RunningText = Instance.new("TextLabel", TopBar)
RunningText.Size = UDim2.new(1,-40,1,0)
RunningText.Position = UDim2.new(0,10,0,0)
RunningText.BackgroundTransparency = 1
RunningText.Text = "       ĐỒNG M NGUYÊN — TỔNG HỢP SCRIPT GAME — ĐỒNG M NGUYÊN — TỔNG HỢP SCRIPT GAME       "
RunningText.TextColor3 = Color3.fromRGB(0,255,127)
RunningText.Font = Enum.Font.GothamBold
RunningText.TextSize = 14
RunningText.TextXAlignment = Enum.TextXAlignment.Left
RunningText.ClipsDescendants = true

-- NÚT X
local XBtn = Instance.new("TextButton", TopBar)
XBtn.Size = UDim2.new(0,30,0,30)
XBtn.Position = UDim2.new(1,-32,0,2)
XBtn.BackgroundColor3 = Color3.fromRGB(255,50,50)
XBtn.Text = "X"
XBtn.TextColor3 = Color3.new(1,1,1)
XBtn.Font = Enum.Font.GothamBold
XBtn.TextSize = 14
Instance.new("UICorner", XBtn).CornerRadius = UDim.new(0,6)

-- NỘI DUNG
local List = Instance.new("ScrollingFrame", Main)
List.Size = UDim2.new(1,-10,1,-40)
List.Position = UDim2.new(0,5,0,38)
List.BackgroundTransparency = 1
List.ScrollBarThickness = 3
List.CanvasSize = UDim2.new(0,0,0,400)
local Lay = Instance.new("UIListLayout", List) Lay.Padding = UDim.new(0,6)

local function AddBtn(txt, func)
    local b = Instance.new("TextButton", List)
    b.Size = UDim2.new(1,-5,0,40)
    b.BackgroundColor3 = Color3.fromRGB(35,35,35)
    b.Text = txt
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 12
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
    b.MouseButton1Click:Connect(func)
end

AddBtn("📉 BẬT GIẢM LAG / TĂNG FPS", function()
    game.Lighting.GlobalShadows = false
    for _,v in pairs(game:GetDescendants()) do
        if v:IsA("ParticleEmitter") then v.Enabled=false end
    end
    game.StarterGui:SetCore("SendNotification",{Title="ĐỒNG M NGUYÊN",Text="Đã bật giảm lag",Duration=2})
end)

AddBtn("↩️ TẮT GIẢM LAG - TRẢ VỀ MẶC ĐỊNH", function()
    game.Lighting.GlobalShadows = true
    game.StarterGui:SetCore("SendNotification",{Title="ĐỒNG M NGUYÊN",Text="Đã trả về mặc định",Duration=2})
end)

AddBtn("🍎 BLOX FRUIT - REDZ HUB NO KEY", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLib/main/ROBLOX/BloxFruits.lua"))()
end)

AddBtn("🌲 99 ĐÊM - VOIDWARE VIP", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua",true))()
end)

AddBtn("🌲 99 ĐÊM - BLUE X HUB", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/main/Main.lua"))()
end)

AddBtn("👑 KING LEGACY - BLACK HUB", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0ytan/BlackHub/main/Loader.lua"))()
end)

-- LOGIC X -> TRÒN
XBtn.MouseButton1Click:Connect(function()
    Main.Visible = false
    Circle.Visible = true
end)

Circle.MouseButton1Click:Connect(function()
    Main.Visible = true
    Circle.Visible = false
end)

-- CHỮ CHẠY LIÊN TỤC
task.spawn(function()
    while true do
        task.wait(0.03)
        if RunningText.Parent then
            -- Tạo hiệu ứng chạy
            local txt = RunningText.Text
            RunningText.Text = string.sub(txt, 2) .. string.sub(txt, 1, 1)
        end
    end
end)

game.StarterGui:SetCore("SendNotification",{Title="ĐỒNG M NGUYÊN HUB",Text="Đã load! Nếu không thấy bấm nút DMN",Duration=3})
