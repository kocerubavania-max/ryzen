-- ============================================================
-- 🎃 RYZEN ADMIN — ПОЛНАЯ КОПИЯ ТВОЕГО ГУИ (РАБОТАЕТ 100%)
-- ============================================================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- ============================================================
-- 1. СОЗДАЁМ ГЛАВНЫЙ ЭКРАН
-- ============================================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RYZENADMIN"
screenGui.ResetOnSpawn = false
screenGui.Parent = player.PlayerGui
screenGui.IgnoreGuiInset = true

-- ============================================================
-- 2. ОСНОВНАЯ ПАНЕЛЬ (osnovnoi)
-- ============================================================
local osnovnoi = Instance.new("Frame")
osnovnoi.Name = "osnovnoi"
osnovnoi.Size = UDim2.new(0, 399, 0, 44)
osnovnoi.Position = UDim2.new(0.328, 0, 0, 0)
osnovnoi.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
osnovnoi.BackgroundTransparency = 0
osnovnoi.BorderSizePixel = 0
osnovnoi.ClipsDescendants = false
osnovnoi.Active = true
osnovnoi.Selectable = true
osnovnoi.Parent = screenGui

-- Скругление osnovnoi
local cornerOsnovnoi = Instance.new("UICorner")
cornerOsnovnoi.CornerRadius = UDim.new(1, 0)
cornerOsnovnoi.Parent = osnovnoi

-- ============================================================
-- 2a. КНОПКА "Настройки" (SettingsFrame)
-- ============================================================
local settingsFrameBtn = Instance.new("TextButton")
settingsFrameBtn.Name = "SettingsFrame"
settingsFrameBtn.Size = UDim2.new(0, 43, 0, 36)
settingsFrameBtn.Position = UDim2.new(0.864, 0, 0.090, 0)
settingsFrameBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
settingsFrameBtn.BackgroundTransparency = 0
settingsFrameBtn.BorderSizePixel = 0
settingsFrameBtn.Text = "⚙️"
settingsFrameBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
settingsFrameBtn.TextScaled = true
settingsFrameBtn.Font = Enum.Font.GothamBold
settingsFrameBtn.Parent = osnovnoi

local cornerSettingsBtn = Instance.new("UICorner")
cornerSettingsBtn.CornerRadius = UDim.new(0, 40)
cornerSettingsBtn.Parent = settingsFrameBtn

-- ============================================================
-- 2b. КНОПКА "Открыть админку" (script)
-- ============================================================
local adminBtn = Instance.new("TextButton")
adminBtn.Name = "script"
adminBtn.Size = UDim2.new(0, 34, 0, 32)
adminBtn.Position = UDim2.new(0.324, 0, 0.136, 0)
adminBtn.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
adminBtn.BackgroundTransparency = 0
adminBtn.BorderSizePixel = 0
adminBtn.Text = "📋"
adminBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
adminBtn.TextScaled = true
adminBtn.Font = Enum.Font.GothamBold
adminBtn.Parent = osnovnoi

local cornerAdminBtn = Instance.new("UICorner")
cornerAdminBtn.CornerRadius = UDim.new(0, 40)
cornerAdminBtn.Parent = adminBtn

-- ============================================================
-- 2c. ИКОНКА (ImageLabel)
-- ============================================================
local icon = Instance.new("ImageLabel")
icon.Name = "ImageLabel"
icon.Size = UDim2.new(0, 45, 0, 44)
icon.Position = UDim2.new(0, 0, 0, 0)
icon.BackgroundTransparency = 0
icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
icon.Image = "rbxassetid://74347438788688"
icon.Parent = osnovnoi

local cornerIcon = Instance.new("UICorner")
cornerIcon.CornerRadius = UDim.new(1, 0)
cornerIcon.Parent = icon

-- ============================================================
-- 2d. ТЕКСТ "Welcome" (name)
-- ============================================================
local welcomeLabel = Instance.new("TextLabel")
welcomeLabel.Name = "name"
welcomeLabel.Size = UDim2.new(0, 52, 0, 18)
welcomeLabel.Position = UDim2.new(0.138, 0, 0.136, 0)
welcomeLabel.BackgroundTransparency = 0
welcomeLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
welcomeLabel.BorderSizePixel = 0
welcomeLabel.Text = "Welcome"
welcomeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
welcomeLabel.TextScaled = false
welcomeLabel.TextSize = 14
welcomeLabel.Font = Enum.Font.SourceSans
welcomeLabel.Parent = osnovnoi

local cornerWelcome = Instance.new("UICorner")
cornerWelcome.CornerRadius = UDim.new(0, 50)
cornerWelcome.Parent = welcomeLabel

-- ============================================================
-- 3. ФРЕЙМ АДМИНКИ (AdminFrame)
-- ============================================================
local adminFrame = Instance.new("Frame")
adminFrame.Name = "AdminFrame"
adminFrame.Size = UDim2.new(0, 199, 0, 237)
adminFrame.Position = UDim2.new(0.354, 0, 0.083, 0)
adminFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
adminFrame.BackgroundTransparency = 0
adminFrame.BorderSizePixel = 0
adminFrame.Visible = false
adminFrame.Parent = screenGui

local cornerAdmin = Instance.new("UICorner")
cornerAdmin.CornerRadius = UDim.new(0, 50)
cornerAdmin.Parent = adminFrame

-- ScrollingFrame внутри AdminFrame
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(0, 199, 0, 236)
scrollFrame.Position = UDim2.new(0, 0, 0.004, 0)
scrollFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
scrollFrame.BackgroundTransparency = 0
scrollFrame.BorderSizePixel = 0
scrollFrame.ClipsDescendants = true
scrollFrame.ScrollBarThickness = 12
scrollFrame.CanvasSize = UDim2.new(0, 0, 2, 0)
scrollFrame.Parent = adminFrame

local cornerScroll = Instance.new("UICorner")
cornerScroll.CornerRadius = UDim.new(0, 50)
cornerScroll.Parent = scrollFrame

-- (Сюда можно добавить кнопки команд в ScrollingFrame)

-- ============================================================
-- 4. ФРЕЙМ НАСТРОЕК (Settings)
-- ============================================================
local settingsFrame = Instance.new("Frame")
settingsFrame.Name = "Settings"
settingsFrame.Size = UDim2.new(0, 179, 0, 172)
settingsFrame.Position = UDim2.new(0.547, 0, 0.074, 0)
settingsFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
settingsFrame.BackgroundTransparency = 0
settingsFrame.BorderSizePixel = 0
settingsFrame.Visible = false
settingsFrame.Parent = screenGui

local cornerSettings = Instance.new("UICorner")
cornerSettings.CornerRadius = UDim.new(0, 40)
cornerSettings.Parent = settingsFrame

-- ============================================================
-- 5. СКРИПТЫ (ЛОГИКА)
-- ============================================================

-- === 5.1. ПРИВЕТСТВИЕ (анимация Welcome → ник) ===
task.spawn(function()
    welcomeLabel.TextTransparency = 1
    welcomeLabel.Text = "Welcome"
    local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local fadeIn = TweenService:Create(welcomeLabel, tweenInfo, {TextTransparency = 0})
    fadeIn:Play()
    fadeIn.Completed:Wait()
    task.wait(0.5)
    local fadeOut = TweenService:Create(welcomeLabel, tweenInfo, {TextTransparency = 1})
    fadeOut:Play()
    fadeOut.Completed:Wait()
    welcomeLabel.Text = player.DisplayName or player.Name
    local fadeInNick = TweenService:Create(welcomeLabel, tweenInfo, {TextTransparency = 0})
    fadeInNick:Play()
end)

-- === 5.2. ОТКРЫТИЕ/ЗАКРЫТИЕ AdminFrame ===
local adminOpen = false
local tweenInfoAdmin = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)

adminBtn.MouseButton1Click:Connect(function()
    adminOpen = not adminOpen
    if adminOpen then
        adminFrame.Visible = true
        adminFrame.BackgroundTransparency = 1
        for _, child in pairs(adminFrame:GetDescendants()) do
            if child:IsA("ImageLabel") or child:IsA("ImageButton") then
                child.ImageTransparency = 1
            elseif child:IsA("TextLabel") or child:IsA("TextButton") then
                child.TextTransparency = 1
            end
        end
        TweenService:Create(adminFrame, tweenInfoAdmin, {BackgroundTransparency = 0}):Play()
        for _, child in pairs(adminFrame:GetDescendants()) do
            if child:IsA("ImageLabel") or child:IsA("ImageButton") then
                TweenService:Create(child, tweenInfoAdmin, {ImageTransparency = 0}):Play()
            elseif child:IsA("TextLabel") or child:IsA("TextButton") then
                TweenService:Create(child, tweenInfoAdmin, {TextTransparency = 0}):Play()
            end
        end
    else
        local closeTween = TweenService:Create(adminFrame, tweenInfoAdmin, {BackgroundTransparency = 1})
        closeTween:Play()
        for _, child in pairs(adminFrame:GetDescendants()) do
            if child:IsA("ImageLabel") or child:IsA("ImageButton") then
                TweenService:Create(child, tweenInfoAdmin, {ImageTransparency = 1}):Play()
            elseif child:IsA("TextLabel") or child:IsA("TextButton") then
                TweenService:Create(child, tweenInfoAdmin, {TextTransparency = 1}):Play()
            end
        end
        closeTween.Completed:Wait()
        if not adminOpen then
            adminFrame.Visible = false
        end
    end
end)

-- === 5.3. ОТКРЫТИЕ/ЗАКРЫТИЕ Settings ===
local settingsOpen = false
local tweenInfoSettings = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

settingsFrameBtn.MouseButton1Click:Connect(function()
    settingsOpen = not settingsOpen
    if settingsOpen then
        settingsFrame.Visible = true
        settingsFrame.Size = UDim2.new(0, 0, 0, 0)
        local openTween = TweenService:Create(settingsFrame, tweenInfoSettings, {Size = UDim2.new(0, 179, 0, 172)})
        openTween:Play()
    else
        local closeTween = TweenService:Create(settingsFrame, tweenInfoSettings, {Size = UDim2.new(0, 0, 0, 0)})
        closeTween:Play()
        closeTween.Completed:Wait()
        if not settingsOpen then
            settingsFrame.Visible = false
        end
    end
end)

-- === 5.4. ПЕРЕТЯГИВАНИЕ (Drag) ===
local dragging = false
local dragStart = nil
local startPos = nil
local startAdminPos = nil
local startSettingsPos = nil
local initialYScale = 0

osnovnoi.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = osnovnoi.Position
        if not initialYScale then initialYScale = startPos.Y.Scale end
        startAdminPos = adminFrame.Position
        startSettingsPos = settingsFrame.Position
        local connection
        connection = UserInputService.InputEnded:Connect(function(endInput)
            if endInput.UserInputType == Enum.UserInputType.MouseButton1 or endInput.UserInputType == Enum.UserInputType.Touch then
                dragging = false
                connection:Disconnect()
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local screenSize = screenGui.AbsoluteSize
        if screenSize.X == 0 or screenSize.Y == 0 then return end
        local delta = input.Position - dragStart
        local deltaXScale = delta.X / screenSize.X
        local deltaYScale = delta.Y / screenSize.Y
        local newYScale = startPos.Y.Scale + deltaYScale
        local minY = 0.0
        local maxY = initialYScale + 0.02
        local clampedY = math.clamp(newYScale, minY, maxY)
        local newXScale = startPos.X.Scale + deltaXScale
        local clampedX = math.clamp(newXScale, 0.0, 1.0 - osnovnoi.Size.X.Scale)
        osnovnoi.Position = UDim2.new(clampedX, osnovnoi.Position.X.Offset, clampedY, osnovnoi.Position.Y.Offset)
        local realDeltaX = clampedX - startPos.X.Scale
        local realDeltaY = clampedY - startPos.Y.Scale
        if adminFrame and startAdminPos then
            adminFrame.Position = UDim2.new(
                startAdminPos.X.Scale + realDeltaX,
                adminFrame.Position.X.Offset,
                startAdminPos.Y.Scale + realDeltaY,
                adminFrame.Position.Y.Offset
            )
        end
        if settingsFrame and startSettingsPos then
            settingsFrame.Position = UDim2.new(
                startSettingsPos.X.Scale + realDeltaX,
                settingsFrame.Position.X.Offset,
                startSettingsPos.Y.Scale + realDeltaY,
                settingsFrame.Position.Y.Offset
            )
        end
    end
end)

print("✅ RYZEN ADMIN УСПЕШНО ЗАГРУЖЕН! НАЖМИ 🎃 (на самом деле кнопки уже есть)")
