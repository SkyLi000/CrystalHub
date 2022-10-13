if not shared.DiscordPrompt == true then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyLi000/GalaxyScript/main/DiscordInv/Invite.lua"))()
end

repeat
	task.wait()
until shared.DiscordPrompt == true

shared.DiscordPrompt = false

local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local Window = OrionLib:MakeWindow({
	Name = "Galaxy Scripts | Key System",
	HidePremium = true,
	IntroText = "Galaxy Key System",
	IntroIcon = "http://www.roblox.com/asset/?id=10681543154"
})
local Player = game.Players.LocalPlayer
OrionLib:MakeNotification({
	Name = "Galaxy Key",
	Content = "Please enter the key " .. Player.Name .. "",
	Image = "http://www.roblox.com/asset/?id=11216830603",
	Time = 5
})
local Key = loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyLi000/GalaxyScript/main/assets/Logo"))()
local KeyInput
function WrongKeyNotif()
	OrionLib:MakeNotification({
		Name = "Wrong Key!",
		Content = "Double Check The Key, " .. Player.Name .. "",
		Image = "http://www.roblox.com/asset/?id=11216830603",
		Time = 5
	})
end
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "http://www.roblox.com/asset/?id=11216755736",
	PremiumOnly = false
})

Tab:AddTextbox({
	Name = "Enter Key",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		KeyInput = Value
	end
})
Tab:AddButton({
	Name = "Submit Key",
	Callback = function()
		if KeyInput == Key then
			OrionLib:Destroy()
			if pcall(function()
				game:HttpGet("https://raw.githubusercontent.com/SkyLi000/GalaxyScript/main/Games/" .. game.PlaceId .. ".lua")
			end) then
				loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyLi000/GalaxyScript/main/Games/" .. game.PlaceId .. ".lua"))()
			else
				loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyLi000/GalaxyScript/main/Games/NotSupported.lua"))()
			end
		else
			WrongKeyNotif()
		end
	end
})
