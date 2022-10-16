if not shared.DiscordPrompt == true then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyLi000/CrystalHub/main/DiscordInv/Invite.lua"))()
end

repeat
	task.wait()
until shared.DiscordPrompt == true

shared.DiscordPrompt = false
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyLi000/CrystalHub/main/Functions.lua"))()
end)
loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyLi000/CrystalHub/main/Scripts/Logs.lua"))()
local Key = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local Logo = Instance.new("ImageLabel")
local KeyBox = Instance.new("TextBox")
local UICorner_2 = Instance.new("UICorner")
local Boarder2 = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local Boarder1 = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local Boarder4 = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local Boarder3 = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")

Key.Name = "Key"
Key.Parent = game.CoreGui
Key.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Key.ResetOnSpawn = false
Key.IgnoreGuiInset = true

Background.Name = "Background"
Background.Parent = Key
Background.AnchorPoint = Vector2.new(0.5, 0.5)
Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Background.BackgroundTransparency = 1.000
Background.Position = UDim2.new(0.5, 0, 0.5, 0)
Background.Size = UDim2.new(0.245000005, 0, 0.5, 0)

Logo.Name = "Logo"
Logo.Parent = Background
Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Logo.BackgroundTransparency = 1.000
Logo.Size = UDim2.new(1, 0, 0.85, 0)
Logo.Image = "http://www.roblox.com/asset/?id=11289123262"

KeyBox.Name = "KeyBox"
KeyBox.Parent = Background
KeyBox.AnchorPoint = Vector2.new(0.5, 0.5)
KeyBox.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
KeyBox.BorderColor3 = Color3.fromRGB(100, 100, 100)
KeyBox.Position = UDim2.new(0.5, 0, 0.883673429, 0)
KeyBox.Size = UDim2.new(1, 0, 0.180000007, 0)
KeyBox.Font = Enum.Font.Unknown
KeyBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
KeyBox.PlaceholderText = "Key"
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.TextScaled = true
KeyBox.TextSize = 14.000
KeyBox.TextWrapped = true
KeyBox.ClearTextOnFocus = false

UICorner_2.Parent = KeyBox

Boarder2.Name = "Boarder2"
Boarder2.Parent = Background
Boarder2.AnchorPoint = Vector2.new(0.5, 0.5)
Boarder2.BackgroundColor3 = Color3.fromRGB(159, 159, 159)
Boarder2.Position = UDim2.new(0.5, 0, 0, 0)
Boarder2.Size = UDim2.new(1, 0, 0.0500000007, 0)

UICorner_3.Parent = Boarder2

Boarder1.Name = "Boarder1"
Boarder1.Parent = Background
Boarder1.AnchorPoint = Vector2.new(0.5, 0.5)
Boarder1.BackgroundColor3 = Color3.fromRGB(159, 159, 159)
Boarder1.Position = UDim2.new(0.99000001, 0, 0.5, 0)
Boarder1.Size = UDim2.new(0.0500000007, 0, 1.04999995, 0)

UICorner_4.Parent = Boarder1

Boarder4.Name = "Boarder4"
Boarder4.Parent = Background
Boarder4.AnchorPoint = Vector2.new(0.5, 0.5)
Boarder4.BackgroundColor3 = Color3.fromRGB(159, 159, 159)
Boarder4.Position = UDim2.new(0.00999999978, 0, 0.5, 0)
Boarder4.Size = UDim2.new(0.0500000007, 0, 1.04999995, 0)

UICorner_5.Parent = Boarder4

Boarder3.Name = "Boarder3"
Boarder3.Parent = Background
Boarder3.AnchorPoint = Vector2.new(0.5, 0.5)
Boarder3.BackgroundColor3 = Color3.fromRGB(159, 159, 159)
Boarder3.Position = UDim2.new(0.5, 0, 1, 0)
Boarder3.Size = UDim2.new(1, 0, 0.0500000007, 0)

UICorner_6.Parent = Boarder3

spawn(function()
	while wait() do
		Key.Name = math.random(10000,999999)
		Background.Name = math.random(10000,999999)
		Logo.Name = math.random(10000,999999)
		Discord.Name = math.random(10000,999999)
		UICorner.Name = math.random(10000,999999)
		KeyBox.Name = math.random(10000,999999)
		Boarder1.Name = math.random(10000,999999)
		UICorner_2.Name = math.random(10000,999999)
		Boarder2.Name = math.random(10000,999999)
		UICorner_3.Name = math.random(10000,999999)
		Boarder3.Name = math.random(10000,999999)
		UICorner_4.Name = math.random(10000,999999)
		Boarder4.Name = math.random(10000,999999)
		UICorner_5.Name = math.random(10000,999999)
		UICorner_6.Name = math.random(10000,999999)
	end
end)

--[[Discord.MouseButton1Click:Connect(function()
	setclipboard("https://www.discord.gg/QbQ3aFRbbJ")
	Discord.Text = "Copied!"
	wait(2)
	Discord.Text = "Join Discord"
end)--]]

local Code = loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyLi000/CrystalHub/main/assets/Logo.png"))()

local function onFocusLost(EnterPressed, Input)
	if EnterPressed then
		if KeyBox.Text == Code then
			Key:Destroy()
			if pcall(function()
					game:HttpGet("https://raw.githubusercontent.com/SkyLi000/CrystalHub/main/Games/" .. game.PlaceId .. ".lua")
				end) then
				loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyLi000/CrystalHub/main/Games/" .. game.PlaceId .. ".lua"))()
			else
				loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyLi000/CrystalHub/main/Games/NotSupported.lua"))()
			end
		else
			KeyBox.Text = ""
			Discord.Text = "Wrong Key!"
			wait(3)
			Discord.Text = "Join Discord"
		end
	end
end

KeyBox.FocusLost:Connect(onFocusLost)
