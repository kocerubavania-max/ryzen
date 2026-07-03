local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

-- ====================================================================
-- 1. СТВОРЕННЯ ПОВНОЇ ІЄРАРХІЇ ГУІ (Точно за твоїм Explorer)
-- ====================================================================

-- Головний ScreenGui [RYZEN ADMIN]
local RYZEN_ADMIN = Instance.new("ScreenGui")
RYZEN_ADMIN.Name = "RYZEN ADMIN"
RYZEN_ADMIN.ResetOnSpawn = false
RYZEN_ADMIN.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
RYZEN_ADMIN.Parent = localPlayer:WaitForChild("PlayerGui")

-- ─── [1] AdminFrame ───
local AdminFrame = Instance.new("Frame")
AdminFrame.Name = "AdminFrame"
AdminFrame.Size = UDim2.new(0, 420, 0, 45)
AdminFrame.Position = UDim2.new(0.5, -210, 0, 15)
AdminFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
AdminFrame.BackgroundTransparency = 0.1
AdminFrame.Parent = RYZEN_ADMIN

local AdminFrame_UICorner = Instance.new("UICorner")
AdminFrame_UICorner.CornerRadius = UDim.new(1, 0) -- Повністю кругла видовжена панель
AdminFrame_UICorner.Parent = AdminFrame

-- ─── [2] ScrollingFrame (Всередині AdminFrame) ───
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Name = "ScrollingFrame"
ScrollingFrame.Size = UDim2.new(1, -70, 1, -10)
ScrollingFrame.Position = UDim2.new(0, 45, 0, 5)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.ScrollBarThickness = 0
ScrollingFrame.Parent = AdminFrame

-- ─── [3] Settings (Фрейм кнопки налаштувань) ───
local Settings = Instance.new("Frame")
Settings.Name = "Settings"
Settings.Size = UDim2.new(0, 35, 0, 35)
Settings.Position = UDim2.new(1, -40, 0.5, -17)
Settings.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Settings.BackgroundTransparency = 0.5
Settings.Parent = AdminFrame

local Settings_UICorner = Instance.new("UICorner")
Settings_UICorner.CornerRadius = UDim.new(1, 0) -- Кругла кнопка
Settings_UICorner.Parent = Settings

-- Іконка шестерні всередині Settings
local SettingsIcon = Instance.new("ImageButton")
SettingsIcon.Name = "SettingsIcon"
SettingsIcon.Size = UDim2.new(0, 20, 0, 20)
SettingsIcon.Position = UDim2.new(0.5, -10, 0.5, -10)
SettingsIcon.BackgroundTransparency = 1
SettingsIcon.Image = "rbxassetid://7072718840"
SettingsIcon.Parent = Settings

-- ─── [4] osnovnoi (Фрейм ліворуч) ───
local osnovnoi = Instance.new("Frame")
osnovnoi.Name = "osnovnoi"
osnovnoi.Size = UDim2.new(0, 140, 0, 35)
osnovnoi.Position = UDim2.new(0, 5, 0.5, -17)
osnovnoi.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
osnovnoi.BackgroundTransparency = 0.3
osnovnoi.Parent = ScrollingFrame

local osnovnoi_UICorner = Instance.new("UICorner")
osnovnoi_UICorner.CornerRadius = UDim.new(0, 8)
osnovnoi_UICorner.Parent = osnovnoi

-- Логотип RYZEN всередині osnovnoi
local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Name = "ImageLabel"
ImageLabel.Size = UDim2.new(0, 25, 0, 25)
ImageLabel.Position = UDim2.new(0, 5, 0.5, -12)
ImageLabel.BackgroundTransparency = 1
ImageLabel.Image = "rbxassetid://18917822456" -- Твій ID логотипу RYZEN
ImageLabel.Parent = osnovnoi

-- Текст Welcome / Нік
local WelcomeLabel = Instance.new("TextLabel")
WelcomeLabel.Name = "WelcomeLabel"
WelcomeLabel.Size = UDim2.new(1, -40, 1, 0)
WelcomeLabel.Position = UDim2.new(0, 35, 0, 0)
WelcomeLabel.BackgroundTransparency = 1
WelcomeLabel.Text = "Welcome!"
WelcomeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
WelcomeLabel.TextSize = 12
WelcomeLabel.Font = Enum.Font.SourceSansBold
WelcomeLabel.TextXAlignment = Enum.TextXAlignment.Left
WelcomeLabel.Parent = osnovnoi

-- ─── [5] SettingsFrame (Фрейм по центру) ───
local SettingsFrame = Instance.new("Frame")
SettingsFrame.Name = "SettingsFrame"
SettingsFrame.Size = UDim2.new(0, 160, 0, 35)
SettingsFrame.Position = UDim2.new(0, 150, 0.5, -17)
SettingsFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
SettingsFrame.BackgroundTransparency = 0.3
SettingsFrame.Parent = ScrollingFrame

local SettingsFrame_UICorner = Instance.new("UICorner")
SettingsFrame_UICorner.CornerRadius = UDim.new(0, 8)
SettingsFrame_UICorner.Parent = SettingsFrame

-- ─── [6] script (Фрейм-контейнер для виведення ролі/дискорду) ───
local scriptFrame = Instance.new("Frame")
scriptFrame.Name = "script"
scriptFrame.Size = UDim2.new(1, -10, 1, -10)
scriptFrame.Position = UDim2.new(0, 5, 0, 5)
scriptFrame.BackgroundTransparency = 1
scriptFrame.Parent = SettingsFrame

local scriptFrame_UICorner = Instance.new("UICorner")
scriptFrame_UICorner.CornerRadius = UDim.new(0, 6)
scriptFrame_UICorner.Parent = scriptFrame

-- ─── [7] name (Текстовий блок для відображення даних) ───
local nameFrame = Instance.new("Frame")
nameFrame.Name = "name"
nameFrame.Size = UDim2.new(1, 0, 1, 0)
nameFrame.BackgroundTransparency = 1
nameFrame.Parent = scriptFrame

local nameFrame_UICorner = Instance.new("UICorner")
nameFrame_UICorner.CornerRadius = UDim.new(0, 4)
nameFrame_UICorner.Parent = nameFrame

-- Текст імені/ролі (name)
local nameLabel = Instance.new("TextLabel")
nameLabel.Name = "name"
nameLabel.Size = UDim2.new(1, 0, 1, 0)
nameLabel.BackgroundTransparency = 1
nameLabel.Text = "@" .. localPlayer.Name
nameLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
nameLabel.TextSize = 13
nameLabel.Font = Enum.Font.SourceSansBold
nameLabel.TextXAlignment = Enum.TextXAlignment.Center
nameLabel.Parent = nameFrame


-- ====================================================================
-- 2. ІНТЕГРАЦІЯ НАШИХ СКРИПТІВ (Твої оригінальні скрипти)
-- ====================================================================

-- ─── Скрипт [DragScript] ───
-- (Логіка перетягування всієї панелі по екрану)
task.spawn(function()
	local UserInputService = game:GetService("UserInputService")
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


-- ─── Скрипт [setemd] ───
-- (Сюди ти вставляєш чистий код свого скрипта setemd)
task.spawn(function()
	print("[RYZEN]: Скрипт 'setemd' успішно ініціалізовано!")
	
	-- Твій код з setemd пиши нижче:
	
end)


-- ─── Скрипт [LocalScript] (Кліки та Керування кнопками) ───
-- (Логіка взаємодії з кнопкою Settings)
task.spawn(function()
	SettingsIcon.MouseButton1Click:Connect(function()
		-- Ефектне прокручування шестерні при натисканні
		local TweenService = game:GetService("TweenService")
		SettingsIcon.Rotation = 0
		local tween = TweenService:Create(SettingsIcon, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 180})
		tween:Play()
		
		print("[RYZEN]: Натиснуто кнопку налаштувань!")
		
		-- Твій код з оригінального LocalScript пиши нижче:
		
	end)
end)


-- ─── Скрипт [script] ───
-- (Сюди вставляється код твоєї логіки або перевірок)
task.spawn(function()
	print("[RYZEN]: Внутрішній системний скрипт запущено!")
	
	-- Твій код з оригінального скрипта пиши нижче:
	
end)
