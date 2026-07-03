local RYZEN_ADMIN = Instance.new("ScreenGui")
RYZEN_ADMIN.Name = "RYZEN ADMIN"
RYZEN_ADMIN.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
RYZEN_ADMIN.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local AdminFrame = Instance.new("Frame")
AdminFrame.Name = "AdminFrame"
AdminFrame.Position = UDim2.new(0.354934, 0, 0.0833333, 0)
AdminFrame.Size = UDim2.new(0, 199, 0, 237)
AdminFrame.BackgroundColor3 = Color3.new(0, 0, 0)
AdminFrame.BorderSizePixel = 0
AdminFrame.BorderColor3 = Color3.new(0, 0, 0)
AdminFrame.Visible = false
AdminFrame.Parent = RYZEN_ADMIN

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Name = "ScrollingFrame"
ScrollingFrame.Position = UDim2.new(0, 0, 0.00421941, 0)
ScrollingFrame.Size = UDim2.new(0, 199, 0, 236)
ScrollingFrame.BackgroundColor3 = Color3.new(0, 0, 0)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.BorderColor3 = Color3.new(0, 0, 0)
ScrollingFrame.Active = true
ScrollingFrame.ScrollBarImageColor3 = Color3.new(0, 0, 0)
ScrollingFrame.Parent = AdminFrame

local UICorner = Instance.new("UICorner")
UICorner.Name = "UICorner"
UICorner.CornerRadius = UDim.new(0, 50)
UICorner.Parent = ScrollingFrame

local UICorner2 = Instance.new("UICorner")
UICorner2.Name = "UICorner"
UICorner2.CornerRadius = UDim.new(0, 50)
UICorner2.Parent = AdminFrame

local osnovnoi = Instance.new("Frame")
osnovnoi.Name = "osnovnoi"
osnovnoi.Position = UDim2.new(0.328655, 0, 0, 0)
osnovnoi.Size = UDim2.new(0, 399, 0, 44)
osnovnoi.BackgroundColor3 = Color3.new(0, 0, 0)
osnovnoi.BorderSizePixel = 0
osnovnoi.BorderColor3 = Color3.new(0, 0, 0)
osnovnoi.Parent = RYZEN_ADMIN

local script = Instance.new("TextButton")
script.Name = "script"
script.Position = UDim2.new(0.324129, 0, 0.136364, 0)
script.Size = UDim2.new(0, 34, 0, 32)
script.BackgroundColor3 = Color3.new(0.415686, 0.415686, 0.415686)
script.BorderSizePixel = 0
script.BorderColor3 = Color3.new(1, 1, 1)
script.Text = "Скрипт"
script.TextColor3 = Color3.new(1, 1, 1)
script.TextSize = 14
script.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
script.Parent = osnovnoi

local UICorner3 = Instance.new("UICorner")
UICorner3.Name = "UICorner"
UICorner3.CornerRadius = UDim.new(0, 40)
UICorner3.Parent = script

local UICorner4 = Instance.new("UICorner")
UICorner4.Name = "UICorner"
UICorner4.CornerRadius = UDim.new(1, 0)
UICorner4.Parent = osnovnoi

local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Name = "ImageLabel"
ImageLabel.Size = UDim2.new(0, 45, 0, 44)
ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel.BorderSizePixel = 0
ImageLabel.BorderColor3 = Color3.new(0, 0, 0)
ImageLabel.Image = "rbxassetid://74347438788688"
ImageLabel.Parent = osnovnoi

local UICorner5 = Instance.new("UICorner")
UICorner5.Name = "UICorner"
UICorner5.CornerRadius = UDim.new(1, 0)
UICorner5.Parent = ImageLabel

local name = Instance.new("TextLabel")
name.Name = "name"
name.Position = UDim2.new(0.138466, 0, 0.136364, 0)
name.Size = UDim2.new(0, 52, 0, 18)
name.BackgroundColor3 = Color3.new(0, 0, 0)
name.BorderSizePixel = 0
name.BorderColor3 = Color3.new(0, 0, 0)
name.Text = "Welcome"
name.TextColor3 = Color3.new(1, 1, 1)
name.TextSize = 14
name.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
name.Parent = osnovnoi

local UICorner6 = Instance.new("UICorner")
UICorner6.Name = "UICorner"
UICorner6.CornerRadius = UDim.new(0, 50)
UICorner6.Parent = name

local SettingsFrame = Instance.new("TextButton")
SettingsFrame.Name = "SettingsFrame"
SettingsFrame.Position = UDim2.new(0.864662, 0, 0.0909091, 0)
SettingsFrame.Size = UDim2.new(0, 43, 0, 36)
SettingsFrame.BackgroundColor3 = Color3.new(0, 0, 0)
SettingsFrame.BorderSizePixel = 0
SettingsFrame.BorderColor3 = Color3.new(0, 0, 0)
SettingsFrame.Text = "⚙️"
SettingsFrame.TextColor3 = Color3.new(0, 0, 0)
SettingsFrame.TextSize = 14
SettingsFrame.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
SettingsFrame.Parent = osnovnoi

local UICorner7 = Instance.new("UICorner")
UICorner7.Name = "UICorner"
UICorner7.CornerRadius = UDim.new(0, 40)
UICorner7.Parent = SettingsFrame

local Settings = Instance.new("Frame")
Settings.Name = "Settings"
Settings.Position = UDim2.new(0.547815, 0, 0.0745614, 0)
Settings.Size = UDim2.new(0, 179, 0, 172)
Settings.BackgroundColor3 = Color3.new(0, 0, 0)
Settings.BorderSizePixel = 0
Settings.BorderColor3 = Color3.new(0, 0, 0)
Settings.Visible = false
Settings.Parent = RYZEN_ADMIN

local UICorner8 = Instance.new("UICorner")
UICorner8.Name = "UICorner"
UICorner8.CornerRadius = UDim.new(0, 40)
UICorner8.Parent = Settings

