-- ============================================================
-- 🎃 RYZEN LOADER — ГАРАНТОВАНО РОБОЧИЙ
-- ============================================================

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer

-- ТВОЄ ПОСИЛАННЯ НА ryzen.rbxm (ПЕРЕВІР, ЩО ВОНО ПРАВИЛЬНЕ!)
local url = "https://raw.githubusercontent.com/kocerubavania-max/ryzen/main/ryzen.rbxm"

-- ЗАВАНТАЖУЄМО .RBXM
local success, result = pcall(function()
    return game:GetObjects(url)
end)

if success and #result > 0 then
    local gui = result[1]
    gui.Parent = player.PlayerGui
    print("✅ RYZEN ADMIN ЗАВАНТАЖЕНО!")
else
    -- ЯКЩО .RBXM НЕ ЗАВАНТАЖИВСЯ — СТВОРЮЄМО GUI ВРУЧНУ
    warn("❌ Не вдалося завантажити ryzen.rbxm. Створюю GUI з нуля...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/kocerubavania-max/ryzen/main/RyzenAdmin.lua"))()
end
