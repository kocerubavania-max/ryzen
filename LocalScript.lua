local TweenService = game:GetService("TweenService")

local button = script.Parent 
local frameOsnovnoi = button.Parent 
local ryzenAdmin = frameOsnovnoi.Parent 

-- Находим фрейм
local frameToOpen = ryzenAdmin:WaitForChild("AdminFrame") 

-- Настройки плавности (0.3 секунды)
local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)

-- Переменная, которая запоминает, открыто ли окно (false = закрыто)
local isOpen = false 

local function onButtonClick()
	if not isOpen then
		-- === КОД ДЛЯ ОТКРЫТИЯ ===
		isOpen = true
		frameToOpen.Visible = true

		-- Проявляем фон фрейма
		TweenService:Create(frameToOpen, tweenInfo, {BackgroundTransparency = 0}):Play()

		-- Проявляем всё, что внутри фрейма
		for _, child in pairs(frameToOpen:GetDescendants()) do
			if child:IsA("ImageLabel") or child:IsA("ImageButton") then
				TweenService:Create(child, tweenInfo, {ImageTransparency = 0}):Play()
			elseif child:IsA("TextLabel") or child:IsA("TextButton") then
				TweenService:Create(child, tweenInfo, {TextTransparency = 0}):Play()
			end
		end
	else
		-- === КОД ДЛЯ ЗАКРЫТИЯ ===
		isOpen = false

		-- Делаем прозрачным фон фрейма
		local hideTween = TweenService:Create(frameToOpen, tweenInfo, {BackgroundTransparency = 1})
		hideTween:Play()

		-- Делаем прозрачным всё, что внутри фрейма
		for _, child in pairs(frameToOpen:GetDescendants()) do
			if child:IsA("ImageLabel") or child:IsA("ImageButton") then
				TweenService:Create(child, tweenInfo, {ImageTransparency = 1}):Play()
			elseif child:IsA("TextLabel") or child:IsA("TextButton") then
				TweenService:Create(child, tweenInfo, {TextTransparency = 1}):Play()
			end
		end

		-- Полностью выключаем Visible только ПОСЛЕ того, как анимация исчезновения закончится
		hideTween.Completed:Connect(function()
			if not isOpen then -- Дополнительная проверка, чтобы не выключить случайно, если быстро нажали опять
				frameToOpen.Visible = false
			end
		end)
	end
end

button.MouseButton1Click:Connect(onButtonClick)