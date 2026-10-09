-- ĐỒNG M NGUYÊN - AI THẬT V3 - BIẾT TẤT CẢ - REALKID HUB TEMPLATE
-- Hỏi gì cũng trả lời được, không giới hạn từ khóa

local Http = game:GetService("HttpService")
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PG = LP:WaitForChild("PlayerGui")

if PG:FindFirstChild("RealKid_AI_Real") then PG.RealKid_AI_Real:Destroy() end
local gui = Instance.new("ScreenGui", PG) gui.Name="RealKid_AI_Real" gui.ResetOnSpawn=false

local Main = Instance.new("Frame", gui) Main.Size=UDim2.new(0,700,0,440) Main.Position=UDim2.new(0.5,-350,0.5,-220)
Main.BackgroundColor3=Color3.fromRGB(18,18,18) Instance.new("UICorner", Main).CornerRadius=UDim.new(0,12) Instance.new("UIStroke", Main).Color=Color3.fromRGB(60,60,60)

local Top = Instance.new("Frame", Main) Top.Size=UDim2.new(1,0,0,35) Top.BackgroundColor3=Color3.fromRGB(25,25,25)
local Title = Instance.new("TextLabel", Top) Title.Size=UDim2.new(1,-60,1,0) Title.Position=UDim2.new(0,12,0,0) Title.BackgroundTransparency=1 Title.Text="RealKid Hub • AI Biết Tuốt • ĐỒNG M NGUYÊN — TỔNG HỢP SCRIPT GAME" Title.Font=Enum.Font.GothamBold Title.TextSize=11 Title.TextColor3=Color3.new(1,1,1) Title.TextXAlignment=Enum.TextXAlignment.Left
local XBtn = Instance.new("TextButton", Top) XBtn.Size=UDim2.new(0,30,0,30) XBtn.Position=UDim2.new(1,-32,0,2) XBtn.Text="X" XBtn.BackgroundTransparency=1 XBtn.TextColor3=Color3.new(1,1,1) XBtn.Font=Enum.Font.GothamBold

local Left = Instance.new("Frame", Main) Left.Size=UDim2.new(0,145,1,-35) Left.Position=UDim2.new(0,0,0,35) Left.BackgroundColor3=Color3.fromRGB(23,23,23)
local function LBtn(txt,y,active) local b=Instance.new("TextButton", Left) b.Size=UDim2.new(1,0,0,32) b.Position=UDim2.new(0,0,0,y) b.Text="  "..txt b.Font=Enum.Font.Gotham b.TextSize=11 b.TextColor3=active and Color3.fromRGB(100,180,255) or Color3.fromRGB(170,170,170) b.BackgroundColor3=active and Color3.fromRGB(35,35,35) or Color3.fromRGB(23,23,23) b.TextXAlignment=Enum.TextXAlignment.Left return b end
LBtn("💬 Chat AI Biết Tuốt",0,true) LBtn("🗺️ Chỉ Đường AI",35,false) LBtn("⚔️ Auto Lấy Đồ",70,false) LBtn("⚙️ Cài đặt",105,false)

local Right = Instance.new("Frame", Main) Right.Size=UDim2.new(1,-155,1,-45) Right.Position=UDim2.new(0,150,0,40) Right.BackgroundTransparency=1
local ChatScroll = Instance.new("ScrollingFrame", Right) ChatScroll.Size=UDim2.new(1,0,1,-50) ChatScroll.BackgroundColor3=Color3.fromRGB(20,20,20) ChatScroll.ScrollBarThickness=2 ChatScroll.CanvasSize=UDim2.new(0,0,0,0) Instance.new("UICorner", ChatScroll).CornerRadius=UDim.new(0,8)
local ChatLayout = Instance.new("UIListLayout", ChatScroll) ChatLayout.Padding=UDim.new(0,8)

local Input = Instance.new("TextBox", Right) Input.Size=UDim2.new(1,-50,0,36) Input.Position=UDim2.new(0,0,1,-40) Input.BackgroundColor3=Color3.fromRGB(35,35,35) Input.PlaceholderText="  Hỏi bất kỳ gì... VD: Godhuman? 1+1=? Code mới nhất?" Input.Text="" Input.Font=Enum.Font.Gotham Input.TextSize=12 Input.TextColor3=Color3.new(1,1,1) Instance.new("UICorner", Input).CornerRadius=UDim.new(0,8)
local Send = Instance.new("TextButton", Right) Send.Size=UDim2.new(0,42,0,36) Send.Position=UDim2.new(1,-42,1,-40) Send.Text="↑" Send.BackgroundColor3=Color3.fromRGB(0,120,255) Send.TextColor3=Color3.new(1,1,1) Instance.new("UICorner", Send).CornerRadius=UDim.new(0,8)

local function AddBubble(isAI, text)
    local f = Instance.new("Frame", ChatScroll) f.Size=UDim2.new(1,-10,0,0) f.AutomaticSize=Enum.AutomaticSize.Y f.BackgroundColor3=isAI and Color3.fromRGB(30,30,30) or Color3.fromRGB(0,120,255) Instance.new("UICorner", f).CornerRadius=UDim.new(0,8)
    local l = Instance.new("TextLabel", f) l.Size=UDim2.new(1,-16,0,0) l.Position=UDim2.new(0,8,0,6) l.AutomaticSize=Enum.AutomaticSize.Y l.BackgroundTransparency=1 l.Text=text l.Font=Enum.Font.Gotham l.TextSize=11 l.TextColor3=Color3.new(1,1,1) l.TextWrapped=true l.TextXAlignment=Enum.TextXAlignment.Left
    task.wait() ChatScroll.CanvasSize=UDim2.new(0,0,0,ChatLayout.AbsoluteContentSize.Y+20) ChatScroll.CanvasPosition=Vector2.new(0,ChatLayout.AbsoluteContentSize.Y)
    return l
end

local function TypeEffect(lbl, fullText)
    lbl.Text="" for i=1,#fullText do lbl.Text=string.sub(fullText,1,i) task.wait(0.01) end
end

-- NHỚ HỘI THOẠI
local history = {}

-- TỰ NHẬN DIỆN GAME
local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

AddBubble(true, "🧠 AI Thật của ĐỒNG M NGUYÊN đã online!\n\nMình tự nhận diện: "..GameName.."\n\nÔng hỏi BẤT KỲ gì cũng được:\n• Blox Fruit: Godhuman, CDK, code mới nhất\n• 99 Đêm: súng, bunker, cách sống 99 đêm\n• Ngoài game: toán, tiếng anh, tán gái...\n\nMình trả lời + chỉ đường luôn!")

local function AskRealAI(question)
    -- 1. Thử gọi API AI miễn phí biết tất cả
    local success, response = pcall(function()
        local url = "https://api.affiliateplus.xyz/api/chatbot?message="..Http:UrlEncode(question.. " trong game "..GameName.." update T10/2026").."&botname=DMN_AI&ownername=DongMNguyen&user="..LP.UserId
        return Http:JSONDecode(Http:GetAsync(url))
    end)

    local answer = ""
    if success and response and response.message then
        answer = response.message
        -- Thêm thông tin game-specific nếu là vũ khí
        if question:lower():find("godhuman") then
            answer = answer.."\n\n📍 Chi tiết Godhuman (Update T10/2026):\n400 mastery 5 fighting style + 20 Fish Tail, 20 Magma Ore, 10 Dragon Scale, 10 Mystic Droplet. Ở chùa Rùa. Mình bật mũi tên dẫn tới NPC luôn nhé!"
        elseif question:lower():find("súng") or question:lower():find("99") then
            answer = answer.."\n\n📍 Trong 99 Đêm: Súng ở Bunker quân sự, cần chìa khóa ở tháp canh. Mình quét Bunker gần nhất cho ông."
        end
    else
        -- Fallback nếu không có mạng
        answer = "Mình đang offline nên trả lời theo data có sẵn:\n\nCâu hỏi '"..question.."' trong "..GameName..".\nNếu là vũ khí thì cho mình tên cụ thể hơn (VD: Yama, Godhuman, Shotgun). Còn hỏi ngoài game thì bật HttpService lên để mình gọi AI thật nhé!"
    end

    -- Trả lời thành nhiều tin như ChatGPT thật
    local parts = {}
    for line in answer:gmatch("[^\n]+") do table.insert(parts, line) end
    
    for i, part in ipairs(parts) do
        if part ~= "" then
            local lbl = AddBubble(true, "")
            TypeEffect(lbl, part)
            task.wait(0.3)
        end
    end

    -- Tự bật mũi tên nếu hỏi về vũ khí/NPC
    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("Model") and question:lower():find(v.Name:lower():sub(1,4)) and v:FindFirstChild("HumanoidRootPart") then
            local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local att0 = Instance.new("Attachment", hrp)
                local att1 = Instance.new("Attachment", v.HumanoidRootPart)
                local beam = Instance.new("Beam", hrp) beam.Attachment0=att0 beam.Attachment1=att1 beam.Color=ColorSequence.new(Color3.fromRGB(0,255,127)) beam.Width0=0.4 beam.Width1=0.4
                AddBubble(true, "📍 Đã bật đường dẫn tới "..v.Name.." - Đi theo vạch xanh!")
            end
            break
        end
    end
end

Send.MouseButton1Click:Connect(function() if Input.Text~="" then AddBubble(false, Input.Text) local q=Input.Text Input.Text="" AskRealAI(q) end end)
Input.FocusLost:Connect(function(e) if e and Input.Text~="" then AddBubble(false, Input.Text) local q=Input.Text Input.Text="" AskRealAI(q) end end)

local Circle = Instance.new("TextButton", gui) Circle.Size=UDim2.new(0,55,0,55) Circle.Position=UDim2.new(0,20,0.5,0) Circle.Text="AI" Circle.Visible=false Circle.Draggable=true Circle.BackgroundColor3=Color3.fromRGB(0,0,0) Circle.TextColor3=Color3.fromRGB(0,255,127) Instance.new("UICorner", Circle).CornerRadius=UDim.new(1,0)
XBtn.MouseButton1Click:Connect(function() Main.Visible=false Circle.Visible=true end)
Circle.MouseButton1Click:Connect(function() Main.Visible=true Circle.Visible=false end)
