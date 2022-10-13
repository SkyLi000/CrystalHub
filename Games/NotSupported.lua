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

Players.PlayerAdded:Connect(function(Player)
    print("New User Joined Game\nUsername: "..Player.Name.."\nDisplay Name: "..Player.Character:WaitForChild("Humanoid").DisplayName.."\nUser Id: "..Player.UserId)
end)

Players.PlayerRemoving:Connect(function(Player)
    print("User Left Game\nUsername: "..Player.Name.."\nDisplay Name: "..Player.Character:WaitForChild("Humanoid").DisplayName.."\nUser Id: "..Player.UserId)
end)

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
local Catergory = Tab:AddCategory("Misc")
local Button = Category:AddButton("Free Cam - LeftShift + P", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyLi000/GalaxyScript/main/Scripts/FreeCam.lua", true))()
	game.StarterGui:SetCore("SendNotification", {
		Title = "Free Cam";
		Text = "Press Left Shift + P";
		Duration = 5;
	})
end)

local Tab = Gui.AddTab("Players")
local Catergory = Tab:AddCategory("Player Setting")
local Slider = Catergory:AddSlider("WalkSpeed", 16, 250, 1, function(Value)
    game:GetService("Players").LocalPlayer.Humanoid.WalkSpeed = Value
end)
local Slider = Catergory:AddSlider("JumpPower", 50, 250, 1, function(Value)
    game:GetService("Players").LocalPlayer.Humanoid.JumpPower = Value
end)

local Tab = Gui:AddTab("Player")
local Category = Tab:AddCategory("Become Unstoppable")
local Slider = Category:AddSlider("Walkspeed", 16, 250, 1, function(val)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
end)
local Button = Catergory:AddButton("Teleport - Control + Click", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyLi000/GalaxyScript/main/Scripts/ControlClickTp.lua"))()
    game.StarterGui:SetCore("SendNotification", {
		Title = "Teleport";
		Text = "Press Left Control + Left Click";
		Duration = 5;
	})
end)

local Toggle = Category:AddToggle("Infinite Jump", false, function(Toggle)
    getgenv().InfiniteJumpEnabled = Toggle
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

local Button = Catergory:AddButton("Destroy Gui", function()
    game:GetService("CoreGui")["Galaxy Scripts"]:Destroy()
end)

local Button = Catergory:AddButton("Dissconnect From Server", function()
    game:GetService("Players").LocalPlayer:Kick("Dissconnected From Server")
end)

local Button = Catergory:AddButton("Shutdown Game - Client", function()
    game:Shutdown()
end)

local OrionLibrary = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local Player = game:GetService("Players").LocalPlayer
OrionLibrary:MakeNotification({
    Name = "Script Loaded",
    Content = "Thank you for using Galaxy Scripts!\nCurrent game is not supported by Galaxy Scripts.",
    Image = "https://www.roblox.com/asset/?id=4919148038",
    Time = 5
})

local Sound = Instance.new("Sound", game:GetService("SoundService"))
Sound.SoundId = "rbxassetid://232127604"
Sound:Play()
