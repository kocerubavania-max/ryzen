-- ============================================================
-- 🎃 RYZEN ADMIN — ГОЛОВНИЙ СКРИПТ (завантажує GUI з GitHub)
-- ============================================================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

-- ============================================================
-- 1. ЗАВАНТАЖЕННЯ GUI (ryzen.rbxm) З GITHUB
-- ============================================================
local url = "https://raw.githubusercontent.com/kocerubavania-max/ryzen/main/ryzen.rbxm"
local success, result = pcall(function()
    return game:GetObjects(url)
end)

if not success or #result == 0 then
    warn("❌ Не вдалося завантажити ryzen.rbxm!")
    return
end

local screenGui = result[1]  -- Беремо перший ScreenGui
screenGui.Parent = player.PlayerGui
print("✅ GUI завантажено!")

-- ============================================================
-- 2. ЗНАХОДИМО ВСІ ЕЛЕМЕНТИ (З ПЕРЕВІРКОЮ)
-- ============================================================
local mainFrame = screenGui:FindFirstChild("MainFrame")      -- osnovnoi
local adminFrame = screenGui:FindFirstChild("AdminFrame")    -- адмін-панель
local settingsFrame = screenGui:FindFirstChild("Settings")   -- налаштування

local toggleSettingsBtn = mainFrame and mainFrame:FindFirstChild("SettingsButton")
local toggleAdminBtn = mainFrame and mainFrame:FindFirstChild("AdminButton")
local welcomeLabel = screenGui:FindFirstChild("WelcomeLabel")

-- ============================================================
-- 3. ПРИВІТАННЯ (WELCOME + NICKNAME)
-- ============================================================
if welcomeLabel then
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
end

-- ============================================================
-- 4. ВІДКРИТТЯ/ЗАКРИТТЯ НАЛАШТУВАНЬ (Settings)
-- ============================================================
if toggleSettingsBtn and settingsFrame then
    local isSettingsOpen = false
    local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

    toggleSettingsBtn.MouseButton1Click:Connect(function()
        isSettingsOpen = not isSettingsOpen
        if isSettingsOpen then
            settingsFrame.Visible = true
            settingsFrame.Size = UDim2.new(0, 0, 0, 0)
            local openTween = TweenService:Create(settingsFrame, tweenInfo, {Size = UDim2.new(0, 250, 0, 200)})
            openTween:Play()
        else
            local closeTween = TweenService:Create(settingsFrame, tweenInfo, {Size = UDim2.new(0, 0, 0, 0)})
            closeTween:Play()
            closeTween.Completed:Wait()
            if not isSettingsOpen then
                settingsFrame.Visible = false
            end
        end
    end)
end

-- ============================================================
-- 5. ВІДКРИТТЯ/ЗАКРИТТЯ АДМІН-ПАНЕЛІ (AdminFrame)
-- ============================================================
if toggleAdminBtn and adminFrame then
    local isAdminOpen = false
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)

    toggleAdminBtn.MouseButton1Click:Connect(function()
        isAdminOpen = not isAdminOpen
        if isAdminOpen then
            adminFrame.Visible = true
            adminFrame.BackgroundTransparency = 1
            -- Робимо всі дочірні елементи прозорими перед появою
            for _, child in pairs(adminFrame:GetDescendants()) do
                if child:IsA("ImageLabel") or child:IsA("ImageButton") then
                    child.ImageTransparency = 1
                elseif child:IsA("TextLabel") or child:IsA("TextButton") then
                    child.TextTransparency = 1
                end
            end
            -- Анімація появи
            TweenService:Create(adminFrame, tweenInfo, {BackgroundTransparency = 0}):Play()
            for _, child in pairs(adminFrame:GetDescendants()) do
                if child:IsA("ImageLabel") or child:IsA("ImageButton") then
                    TweenService:Create(child, tweenInfo, {ImageTransparency = 0}):Play()
                elseif child:IsA("TextLabel") or child:IsA("TextButton") then
                    TweenService:Create(child, tweenInfo, {TextTransparency = 0}):Play()
                end
            end
        else
            -- Анімація зникнення
            local closeTween = TweenService:Create(adminFrame, tweenInfo, {BackgroundTransparency = 1})
            closeTween:Play()
            for _, child in pairs(adminFrame:GetDescendants()) do
                if child:IsA("ImageLabel") or child:IsA("ImageButton") then
                    TweenService:Create(child, tweenInfo, {ImageTransparency = 1}):Play()
                elseif child:IsA("TextLabel") or child:IsA("TextButton") then
                    TweenService:Create(child, tweenInfo, {TextTransparency = 1}):Play()
                end
            end
            closeTween.Completed:Wait()
            if not isAdminOpen then
                adminFrame.Visible = false
            end
        end
    end)
end

-- ============================================================
-- 6. ПЕРЕТЯГУВАННЯ ВСІХ ФРЕЙМІВ (ОДНОЧАСНО)
-- ============================================================
if mainFrame then
    local dragging = false
    local dragStart = nil
    local startPos = nil
    local startAdminPos = nil
    local startSettingsPos = nil
    local initialYScale = nil

    -- Включаємо можливість перетягування для основного фрейма
    mainFrame.Active = true
    mainFrame.Selectable = true

    mainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            -- Оновлюємо посилання на фрейми
            adminFrame = screenGui:FindFirstChild("AdminFrame")
            settingsFrame = screenGui:FindFirstChild("Settings")

            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position

            if not initialYScale then
                initialYScale = mainFrame.Position.Y.Scale
            end

            if adminFrame then
                startAdminPos = adminFrame.Position
            end
            if settingsFrame then
                startSettingsPos = settingsFrame.Position
            end

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

            -- Обмеження по Y
            local minY = 0.0
            local maxY = initialYScale + 0.02
            local clampedY = math.clamp(startPos.Y.Scale + deltaYScale, minY, maxY)

            -- Обмеження по X
            local clampedX = math.clamp(startPos.X.Scale + deltaXScale, 0.0, 1.0 - mainFrame.Size.X.Scale)

            -- Миттєве переміщення (без Tween, щоб не було лагів)
            mainFrame.Position = UDim2.new(clampedX, mainFrame.Position.X.Offset, clampedY, mainFrame.Position.Y.Offset)

            -- Розраховуємо зміщення для інших фреймів
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
end

print("🎃 RYZEN ADMIN повністю завантажено! Натисни кнопку 🎃 для відкриття меню.")
