-- ĐỒNG M NGUYÊN
-- LocalScript: StarterPlayer > StarterPlayerScripts

local P=game:GetService("Players")
local R=game:GetService("RunService")
local L=game:GetService("Lighting")
local W=game:GetService("Workspace")

local p=P.LocalPlayer
local g=p:WaitForChild("PlayerGui")

local A=false -- smooth
local B=false -- ESP
local C=false -- Luck

local S=Instance.new("ScreenGui")
S.Name="DMN_NGUYEN"
S.ResetOnSpawn=false
S.Parent=g

local M=Instance.new("Frame")
M.Size=UDim2.fromOffset(285,205)
M.Position=UDim2.new(.5,-142,.5,-102)
M.BackgroundColor3=Color3.fromRGB(20,20,20)
M.BorderSizePixel=0
M.Active=true
M.Parent=S

local MC=Instance.new("UICorner")
MC.CornerRadius=UDim.new(0,14)
MC.Parent=M

local H=Instance.new("Frame")
H.Size=UDim2.new(1,0,0,43)
H.BackgroundColor3=Color3.fromRGB(10,10,10)
H.BorderSizePixel=0
H.Active=true
H.Parent=M

local HC=Instance.new("UICorner")
HC.CornerRadius=UDim.new(0,14)
HC.Parent=H

local T=Instance.new("TextLabel")
T.Size=UDim2.new(1,-55,1,0)
T.Position=UDim2.fromOffset(12,0)
T.BackgroundTransparency=1
T.Text="ĐỒNG M NGUYÊN"
T.TextColor3=Color3.new(1,1,1)
T.TextSize=16
T.Font=Enum.Font.GothamBold
T.TextXAlignment=Enum.TextXAlignment.Left
T.Parent=H

local X=Instance.new("TextButton")
X.Size=UDim2.fromOffset(35,31)
X.Position=UDim2.new(1,-40,0,6)
X.Text="×"
X.TextSize=21
X.TextColor3=Color3.new(1,1,1)
X.BackgroundColor3=Color3.fromRGB(90,40,40)
X.BorderSizePixel=0
X.Parent=H

local XC=Instance.new("UICorner")
XC.CornerRadius=UDim.new(0,8)
XC.Parent=X

local function button(y,text)
	local b=Instance.new("TextButton")
	b.Size=UDim2.new(1,-24,0,40)
	b.Position=UDim2.fromOffset(12,y)
	b.BackgroundColor3=Color3.fromRGB(55,55,55)
	b.BorderSizePixel=0
	b.Text=text
	b.TextColor3=Color3.new(1,1,1)
	b.TextSize=13
	b.Font=Enum.Font.GothamBold
	b.Parent=M

	local c=Instance.new("UICorner")
	c.CornerRadius=UDim.new(0,9)
	c.Parent=b

	return b
end

local F=button(52,"⚡ TĂNG ĐỘ MƯỢT 200 FPS: TẮT")
local E=button(99,"👁 TĂNG ESP 180: TẮT")
local K=button(146,"🍀 LUCK 100%: TẮT")

--==================================================
-- KÉO MENU TRÊN ĐIỆN THOẠI
--==================================================

local drag=false
local ds
local dp

H.InputBegan:Connect(function(i)
	if i.UserInputType==Enum.UserInputType.Touch
	or i.UserInputType==Enum.UserInputType.MouseButton1 then

		drag=true
		ds=i.Position
		dp=M.Position

		i.Changed:Connect(function()
			if i.UserInputState==Enum.UserInputState.End then
				drag=false
			end
		end)
	end
end)

H.InputChanged:Connect(function(i)
	if not drag then return end

	if i.UserInputType==Enum.UserInputType.Touch
	or i.UserInputType==Enum.UserInputType.MouseMovement then

		local d=i.Position-ds

		M.Position=UDim2.new(
			dp.X.Scale,
			dp.X.Offset+d.X,
			dp.Y.Scale,
			dp.Y.Offset+d.Y
		)
	end
end)

--==================================================
-- NÚT TRÒN KHI ĐÓNG
--==================================================

local function openCircle()

	local Q=Instance.new("TextButton")
	Q.Size=UDim2.fromOffset(58,58)
	Q.Position=UDim2.new(0,15,.5,-29)
	Q.Text="ĐM"
	Q.TextSize=15
	Q.Font=Enum.Font.GothamBold
	Q.TextColor3=Color3.new(1,1,1)
	Q.BackgroundColor3=Color3.fromRGB(20,20,20)
	Q.BorderSizePixel=0
	Q.Active=true
	Q.Parent=S

	local QC=Instance.new("UICorner")
	QC.CornerRadius=UDim.new(1,0)
	QC.Parent=Q

	-- Kéo nút tròn
	local qdrag=false
	local qstart
	local qpos

	Q.InputBegan:Connect(function(i)
		if i.UserInputType==Enum.UserInputType.Touch
		or i.UserInputType==Enum.UserInputType.MouseButton1 then

			qdrag=true
			qstart=i.Position
			qpos=Q.Position

			i.Changed:Connect(function()
				if i.UserInputState==Enum.UserInputState.End then
					qdrag=false
				end
			end)
		end
	end)

	Q.InputChanged:Connect(function(i)
		if not qdrag then return end

		if i.UserInputType==Enum.UserInputType.Touch
		or i.UserInputType==Enum.UserInputType.MouseMovement then

			local d=i.Position-qstart

			Q.Position=UDim2.new(
				qpos.X.Scale,
				qpos.X.Offset+d.X,
				qpos.Y.Scale,
				qpos.Y.Offset+d.Y
			)
		end
	end)

	Q.Activated:Connect(function()
		if qdrag then return end

		M.Visible=true
		Q:Destroy()
	end)
end

X.Activated:Connect(function()
	M.Visible=false
	openCircle()
end)

--==================================================
-- 200 FPS / PERFORMANCE
--==================================================

local function performance()

	if not A then return end

	pcall(function()
		L.GlobalShadows=false
		L.EnvironmentDiffuseScale=.85
		L.EnvironmentSpecularScale=.85
	end)

	for _,v in ipairs(W:GetDescendants()) do

		if v:IsA("ParticleEmitter") then
			pcall(function()
				v.Rate=v.Rate*.85
			end)

		elseif v:IsA("Trail") then
			pcall(function()
				v.Lifetime=math.min(v.Lifetime,.8)
			end)

		elseif v:IsA("Beam") then
			pcall(function()
				v.Segments=math.min(v.Segments,8)
			end)
		end
	end
end

-- Không thể ép phần cứng đạt 200 FPS.
-- Chức năng này chỉ tối ưu để FPS đạt mức cao nhất thiết bị có thể.

F.Activated:Connect(function()

	A=not A

	if A then
		F.Text="⚡ TĂNG ĐỘ MƯỢT 200 FPS: BẬT"
		F.BackgroundColor3=Color3.fromRGB(35,100,55)
		performance()
	else
		F.Text="⚡ TĂNG ĐỘ MƯỢT 200 FPS: TẮT"
		F.BackgroundColor3=Color3.fromRGB(55,55,55)
	end
end)

--==================================================
-- ESP 180
--==================================================

local tags={}

local function removeESP(plr)

	if tags[plr] then
		tags[plr]:Destroy()
		tags[plr]=nil
	end
end

local function makeESP(plr)

	if plr==p or not B then return end

	local char=plr.Character
	if not char then return end

	local root=char:FindFirstChild("HumanoidRootPart")
	if not root then return end

	removeESP(plr)

	local h=Instance.new("Highlight")
	h.Name="DMN_ESP"
	h.FillTransparency=.8
	h.OutlineTransparency=0
	h.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
	h.Adornee=char
	h.Parent=char

	tags[plr]=h
end

local function espUpdate()

	if not B then
		for plr in pairs(tags) do
			removeESP(plr)
		end
		return
	end

	local myChar=p.Character
	if not myChar then return end

	local myRoot=myChar:FindFirstChild("HumanoidRootPart")
	if not myRoot then return end

	for _,plr in ipairs(P:GetPlayers()) do

		if plr~=p and plr.Character then

			local root=plr.Character:FindFirstChild("HumanoidRootPart")

			if root then

				local d=(root.Position-myRoot.Position).Magnitude

				if d<=180 then
					makeESP(plr)
				else
					removeESP(plr)
				end
			end
		end
	end
end

E.Activated:Connect(function()

	B=not B

	if B then
		E.Text="👁 TĂNG ESP 180: BẬT"
		E.BackgroundColor3=Color3.fromRGB(35,100,55)
		espUpdate()
	else
		E.Text="👁 TĂNG ESP 180: TẮT"
		E.BackgroundColor3=Color3.fromRGB(55,55,55)
		espUpdate()
	end
end)

P.PlayerRemoving:Connect(function(plr)
	removeESP(plr)
end)

task.spawn(function()
	while task.wait(.5) do
		espUpdate()
	end
end)

--==================================================
-- LUCK 100%
--==================================================

local luck=p:FindFirstChild("DMN_LUCK")

if not luck then
	luck=Instance.new("NumberValue")
	luck.Name="DMN_LUCK"
	luck.Value=1
	luck.Parent=p
end

K.Activated:Connect(function()

	C=not C

	if C then
		luck.Value=2
		K.Text="🍀 LUCK 100%: BẬT"
		K.BackgroundColor3=Color3.fromRGB(35,100,55)
	else
		luck.Value=1
		K.Text="🍀 LUCK 100%: TẮT"
		K.BackgroundColor3=Color3.fromRGB(55,55,55)
	end
end)

print("ĐỒNG M NGUYÊN LOADED")
