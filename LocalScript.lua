local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local localPlayer = Players.LocalPlayer
local url = "https://ryzen-admin-default-rtdb.europe-west1.firebasedatabase.app/Users/" .. localPlayer.Name .. ".json"

-- ====================================================================
-- 1. СТВОРЕННЯ ГУІ (Повна структура з твого скріншоту 1 в 1)
-- ====================================================================

local RYZEN_ADMIN = Instance.new("ScreenGui")
RYZEN_ADMIN.Name = "RYZEN ADMIN"
RYZEN_ADMIN.ResetOnSpawn = false
RYZEN_ADMIN.Parent = localPlayer:WaitForChild("PlayerGui")

-- AdminFrame
local AdminFrame = Instance.new("Frame")
AdminFrame.Name = "AdminFrame"
AdminFrame.Size = UDim2.new(0, 420, 0, 45)
AdminFrame.Position = UDim2.new(0.5, -210, 0, 15)
AdminFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
AdminFrame.BackgroundTransparency = 0.1
AdminFrame.Parent = RYZEN_ADMIN

local AdminCorner = Instance.new("UICorner")
AdminCorner.CornerRadius = UDim.new(1, 0)
AdminCorner.Parent = AdminFrame

-- ScrollingFrame всередині AdminFrame
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Name = "ScrollingFrame"
ScrollingFrame.Size = UDim2.new(1, -10, 1, -10)
ScrollingFrame.Position = UDim2.new(0, 5, 0, 5)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.ScrollBarThickness = 0
ScrollingFrame.Parent = AdminFrame

-- Settings (Кнопка-Шестерня)
local Settings = Instance.new("ImageButton")
Settings.Name = "Settings"
Settings.Size = UDim2.new(0, 25, 0, 25)
Settings.Position = UDim2.new(1, -35, 0.5, -12)
Settings.BackgroundTransparency = 1
Settings.Image = "rbxassetid://7072718840"
Settings.Parent = AdminFrame

local SettingsCorner = Instance.new("UICorner")
SettingsCorner.CornerRadius = UDim.new(1, 0)
SettingsCorner.Parent = Settings

-- Фрейм "osnovnoi"
local osnovnoi = Instance.new("Frame")
osnovnoi.Name = "osnovnoi"
osnovnoi.Size = UDim2.new(0, 140, 0, 35)
osnovnoi.Position = UDim2.new(0, 45, 0.5, -17)
osnovnoi.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
osnovnoi.BackgroundTransparency = 0.3
osnovnoi.Parent = AdminFrame

local OsnovnoiCorner = Instance.new("UICorner")
OsnovnoiCorner.CornerRadius = UDim.new(0, 8)
OsnovnoiCorner.Parent = osnovnoi

-- Картинка RYZEN (ImageLabel всередині AdminFrame)
local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Name = "ImageLabel"
ImageLabel.Size = UDim2.new(0, 35, 0, 35)
ImageLabel.Position = UDim2.new(0, 5, 0.5, -17)
ImageLabel.BackgroundTransparency = 1
ImageLabel.Image = "rbxassetid://18917822456" 
ImageLabel.Parent = AdminFrame

-- SettingsFrame
local SettingsFrame = Instance.new("Frame")
SettingsFrame.Name = "SettingsFrame"
SettingsFrame.Size = UDim2.new(0, 150, 0, 35)
SettingsFrame.Position = UDim2.new(0, 195, 0.5, -17)
SettingsFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
SettingsFrame.BackgroundTransparency = 0.3
SettingsFrame.Parent = AdminFrame

local SettingsFrameCorner = Instance.new("UICorner")
SettingsFrameCorner.CornerRadius = UDim.new(0, 8)
SettingsFrameCorner.Parent = SettingsFrame

-- Текст імені (name)
local name = Instance.new("TextLabel")
name.Name = "name"
name.Size = UDim2.new(1, -10, 0.5, 0)
name.Position = UDim2.new(0, 5, 0, 2)
name.BackgroundTransparency = 1
name.Text = "Welcome, @" .. localPlayer.Name
name.TextColor3 = Color3.fromRGB(255, 255, 255)
name.TextSize = 13
name.Font = Enum.Font.SourceSansBold
name.TextXAlignment = Enum.TextXAlignment.Left
name.Parent = SettingsFrame

-- Текст для виведення Дискорду та Ролі (буде оновлюватись скриптом)
local RoleLabel = Instance.new("TextLabel")
RoleLabel.Name = "RoleLabel"
RoleLabel.Size = UDim2.new(1, -10, 0.5, 0)
RoleLabel.Position = UDim2.new(0, 5, 0.5, -2)
RoleLabel.BackgroundTransparency = 1
RoleLabel.Text = "Role: Loading..."
RoleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
RoleLabel.TextSize = 11
RoleLabel.Font = Enum.Font.SourceSans
RoleLabel.TextXAlignment = Enum.TextXAlignment.Left
RoleLabel.Parent = SettingsFrame


-- ====================================================================
-- 2. СКРИПТИ (Всі твої внутрішні скрипти перенесені сюди)
-- ====================================================================

-- [1] DragScript — Логіка перетягування панелі мишкою/пальцем
task.spawn(function()
	local dragging, dragInput, dragStart, startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		AdminFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	AdminFrame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = AdminFrame.Position
			
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	AdminFrame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end)


-- [2] Твій оригінальний скрипт "setemd" (Логіка взаємодії з кнопками/панеллю)
task.spawn(function()
	-- Сюди ти можеш вставити чистий код, який був у твоєму скрипті "setemd"
	-- Зараз він налаштований на зчитування бази Firebase
	local function checkFirebase()
		local success, result = pcall(function()
			return game:HttpGet(url)
		end)
		
		if success and result and result ~= "null" then
			local data = HttpService:JSONDecode(result)
			RoleLabel.Text = "Role: " .. (data.HighestRole or "Player")
			
			if data.HighestRole == "Owner" or data.HighestRole == "Создатель" or data.HighestRole == "Admin" then
				RoleLabel.TextColor3 = Color3.fromRGB(255, 215, 0) -- Золотий для адмінів
			end
		else
			RoleLabel.Text = "Role: Player"
		end
	end
	
	checkFirebase()
end)


-- [3] Твій оригінальний "LocalScript" (Керування анімацією та кліками)
task.spawn(function()
	Settings.MouseButton1Click:Connect(function()
		-- Красива анімація обертання шестерні при натисканні
		Settings.Rotation = 0
		local tween = TweenService:Create(Settings, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 180})
		tween:Play()
		
		-- Додаткова логіка: оновлення даних при кліку
		local success, result = pcall(function() return game:HttpGet(url) end)
		if success and result and result ~= "null" then
			local data = HttpService:JSONDecode(result)
			print("Синхронізовано! Твій Discord: " .. tostring(data.DiscordName))
		end
	end)
end)


-- [4] Твій скрипт "script" (Автоматичне фонове оновлення бази кожні 15 секунд)
task.spawn(function()
	while task.wait(15) do
		local success, result = pcall(function()
			return game:HttpGet(url)
		end)
		if success and result and result ~= "null" then
			local data = HttpService:JSONDecode(result)
			RoleLabel.Text = "Role: " .. (data.HighestRole or "Player")
		end
	end
end)
