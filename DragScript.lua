local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local frame = script.Parent -- Твой фрейм osnovnoi
local ryzenAdmin = frame.Parent

-- Ищем AdminFrame и фрейм Settings
local adminFrame = ryzenAdmin:FindFirstChild("AdminFrame")
local settingsFrame = ryzenAdmin:FindFirstChild("Settings") -- НАШЛИ НАСТРОЙКИ

local dragging = false
local dragStart
local startPos
local startAdminPos
local startSettingsPos -- Стартовая позиция настроек перед перетаскиванием
local initialYScale = nil 

-- НАСТРОЙКА ПРОРЫВА ЗА ГРАНИЦЫ РОБЛОКСА:
if ryzenAdmin:IsA("ScreenGui") then
	ryzenAdmin.IgnoreGuiInset = true
end

frame.Active = true
frame.Selectable = true

frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		-- Обновляем ссылки на элементы на случай, если они перезагрузились
		adminFrame = ryzenAdmin:FindFirstChild("AdminFrame")
		settingsFrame = ryzenAdmin:FindFirstChild("Settings")

		dragging = true
		dragStart = input.Position
		startPos = frame.Position

		if not initialYScale then
			initialYScale = frame.Position.Y.Scale
		end

		if adminFrame then
			startAdminPos = adminFrame.Position
		end

		-- Запоминаем, где стояли настройки в момент начала перетаскивания
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
		local screenSize = ryzenAdmin.AbsoluteSize
		if screenSize.X == 0 or screenSize.Y == 0 then return end

		local delta = input.Position - dragStart

		local deltaXScale = delta.X / screenSize.X
		local deltaYScale = delta.Y / screenSize.Y

		-- 1. ОГРАНИЧЕНИЕ ПО ВЕРТИКАЛИ (Y)
		local newYScale = startPos.Y.Scale + deltaYScale

		local minY = 0.0 
		local maxY = initialYScale + 0.02 

		local clampedY = math.clamp(newYScale, minY, maxY)

		-- 2. ОГРАНИЧЕНИЕ ПО ГОРИЗОНТАЛИ (X)
		local newXScale = startPos.X.Scale + deltaXScale
		local clampedX = math.clamp(newXScale, 0.0, 1.0 - frame.Size.X.Scale)

		local tweenInfo = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		-- Двигаем основную полосу (osnovnoi)
		local goalFrame = UDim2.new(clampedX, frame.Position.X.Offset, clampedY, frame.Position.Y.Offset)
		TweenService:Create(frame, tweenInfo, {Position = goalFrame}):Play()

		-- Считаем чистое смещение, на которое сдвинулся палец/мышка
		local realDeltaX = clampedX - startPos.X.Scale
		local realDeltaY = clampedY - startPos.Y.Scale

		-- Двигаем AdminFrame следом
		if adminFrame and startAdminPos then
			local goalAdmin = UDim2.new(
				startAdminPos.X.Scale + realDeltaX,
				adminFrame.Position.X.Offset,
				startAdminPos.Y.Scale + realDeltaY,
				adminFrame.Position.Y.Offset
			)
			TweenService:Create(adminFrame, TweenInfo.new(0), {Position = goalAdmin}):Play()
		end

		-- Двигаем фрейм Settings (Настройки) следом без задержек
		if settingsFrame and startSettingsPos then
			local goalSettings = UDim2.new(
				startSettingsPos.X.Scale + realDeltaX,
				settingsFrame.Position.X.Offset,
				startSettingsPos.Y.Scale + realDeltaY,
				settingsFrame.Position.Y.Offset
			)
			TweenService:Create(settingsFrame, TweenInfo.new(0), {Position = goalSettings}):Play()
		end
	end
end)