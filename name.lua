local TweenService = game:GetService("TweenService")
local toggleButton = script.Parent -- Твоя кнопка SettingsFrame
local osnovnoi = toggleButton.Parent -- Полоса osnovnoi
local ryzenAdmin = osnovnoi.Parent -- Главный RYZEN ADMIN

-- Ищем фрейм Settings на одном уровне с osnovnoi
local settingsWindow = ryzenAdmin:WaitForChild("Settings")
local isOpen = false

-- Скорость анимации появления (0.25 секунды)
local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

toggleButton.MouseButton1Click:Connect(function()
	isOpen = not isOpen

	if isOpen then
		-- Сначала делаем фрейм прозрачным, но включаем его видимость
		settingsWindow.Size = UDim2.new(0, 0, 0, 0) -- Начинаем с нуля для эффекта выплывания
		settingsWindow.Visible = true

		-- Укажи размеры своего фрейма Settings, которые тебе нужны (например, ширина 250, высота 200)
		local openTween = TweenService:Create(settingsWindow, tweenInfo, {Size = UDim2.new(0, 250, 0, 200)})
		openTween:Play()
	else
		-- Плавно сжимаем и закрываем окошко обратно
		local closeTween = TweenService:Create(settingsWindow, tweenInfo, {Size = UDim2.new(0, 0, 0, 0)})
		closeTween:Play()
		closeTween.Completed:Wait()

		if not isOpen then
			settingsWindow.Visible = false
		end
	end
end)