local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/IreXion-UI-Library/main/IreXion%20UI%20Library"))()

local Gui = Library:AddGui({
    Title = {
        "Galaxy Scripts",
        "Other Games"
    },
    ThemeColor = Color3.fromRGB(31, 80, 255),
    ToggleKey = Enum.KeyCode.RightShift,
})

local Players = game:GetService("Players")

function Teleport(CFrame)
    local Player = Players.LocalPlayer
    Player.Character.HumanoidRootPart.CFrame = CFrame
end

game:GetService("UserInputService").JumpRequest:Connect(function()
    if getgenv().InfiniteJumpEnabled then
        Players.LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState("Jumping")
    end
end)

local Home = Gui:AddTab("Home")
local Credits = Home:AddCategory("Credits & Socials")
local Label = Credits:AddLabel("Galaxy Socials")
local Button = Credits:AddButton("Youtube Channel - Click To Copy Link", function()
    setclipboard("https://youtube.com/channel/UClgGo0csMKyAV6VeFFIl_PA?sub_confirmation=1")
end)

local Button = Credits:AddButton("Discord Server - Click To Copy Link", function()
    setclipboard("https://www.discord.gg/QbQ3aFRbbJ")
end)

local Label = Credits:AddLabel("Development Team")
local Label = Credits:AddLabel("SkyGodCheesey#6379 | Owner")
local Label = Credits:AddLabel("ILOVEVXPE4LIFE#3354 | Co-Owner")
local Label = Credits:AddLabel("Sky..#1197 | Head Developer")
local Label = Credits:AddLabel("V0rt3xqa#6221 | Developer")

local Tab = Gui:AddTab("Main")
local Category = Tab:AddCategory("Misc")
local Button = Category:AddButton("Free Cam - LeftShift + P", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyLi000/GalaxyScript/main/Scripts/FreeCam.lua", true))()
	game.StarterGui:SetCore("SendNotification", {
		Title = "Free Cam";
		Text = "Press Left Shift + P";
		Duration = 5;
	})
end)

local Tab = Gui:AddTab("Players")
local Category = Tab:AddCategory("Player Setting")
local Box = Category:AddBox("WalkSpeed", function(Value)
	game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = Value
end)

local Box = Category:AddBox("JumpPower", function(Value)
	game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = Value
end)

local Button = Category:AddButton("Teleport - Control + Click", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyLi000/GalaxyScript/main/Scripts/ControlClickTp.lua"))()
    game.StarterGui:SetCore("SendNotification", {
		Title = "Teleport";
		Text = "Press Left Control + Left Click";
		Duration = 5;
	})
end)

local Button = Category:AddButton("Infinite Jump", function()
	getgenv().InfiniteJumpEnabled = true
end)

local Button = Category:AddButton("Reset Player", function()
    game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
end)

local Tab = Gui:AddTab("Settings")
local Category = Tab:AddCategory("Guis")
local DualLabel = Category:AddDualLabel({
    "Gui Toggle",
    "RightShift"
})

local Button = Category:AddButton("Destroy Gui", function()
    game:GetService("CoreGui")["Galaxy Scripts Non Supported Games"]:Destroy()
end)

local Button = Category:AddButton("Dissconnect From Server", function()
    game:GetService("Players").LocalPlayer:Kick("Dissconnected From Server")
end)

local Button = Category:AddButton("Shutdown Game - Client", function()
    game:Shutdown()
end)

local OrionLibrary = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local Player = game:GetService("Players").LocalPlayer
OrionLibrary:MakeNotification({
    Name = "Script Loaded",
    Content = "Thank you for using Galaxy Scripts!",
    Image = "https://www.roblox.com/asset/?id=4919148038",
    Time = 5
})

local Sound = Instance.new("Sound", game:GetService("SoundService"))
Sound.SoundId = "rbxassetid://232127604"
Sound:Play()
