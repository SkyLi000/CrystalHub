--Galaxy Scripts Regular Gui
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/IreXion-UI-Library/main/IreXion%20UI%20Library"))()
local Gui = Library:AddGui({
        Title = {"Galaxy Scripts", "Regular"},
        ThemeColor = Color3.fromRGB(151, 32, 212),
        ToggleKey = Enum.KeyCode.RightControl,
})

--Values

--Functions

local Players = game:GetService("Players")
 
Players.PlayerAdded:Connect(function(player)
    print(player.Name .. "Has Joined The Game")
end)

Players.PlayerRemoving:Connect(function(player)
    print(player.Name .. "Has Left The Game")
end)

function Teleport(teleportPlace)
    local player = game.Players.LocalPlayer
    player.Character.HumanoidRootPart.CFrame = teleportPlace
end

--Other
    local Player = game:GetService("Players").LocalPlayer
    game:GetService("UserInputService").JumpRequest:Connect(function()
        if InfiniteJumpEnabled then
            Player.Character:WaitForChild("Humanoid"):ChangeState("Jumping")
        end
    end)

--Home Tab
    local Tab = Gui:AddTab("Home")

    local Category = Tab:AddCategory("Credits + Socials")

    local Label = Category:AddLabel("My stuff")

    local Button = Category:AddButton("YouTube Channel- Click to copy link", function()
        setclipboard("https://www.youtube.com/channel/UCt1UF4Glun5X_D-qXaJcQtg")
    end)

    local Button = Category:AddButton("Discord Server- Click to copy link", function()
        setclipboard("https://www.discord.gg/44ANWfjDHD")
    end)

    local Label = Category:AddLabel("Vynixius")

    local Button = Category:AddButton("Vynixius Discord Server- Click to copy link", function()
        setclipboard("https://discord.gg/vynixius")
    end)

--Main Tab
    local Tab = Gui:AddTab("Main")

    local Category = Tab:AddCategory("Have Fun")

    local Button = Category:AddButton("Player ESP", function()
            loadstring(game:HttpGet("https://pastebin.com/raw/wnPevvmm", true))()
            loadstring(game:HttpGet("https://pastebin.com/raw/KFUmWP7A", true))()
            loadstring(game:HttpGet("https://pastebin.com/raw/bd67RgU9", true))()
    end)

    local Button = Category:AddButton("Free Cam", function()
        loadstring(game:HttpGet("https://pastebin.com/raw/yWcu7n2H", true))()
        game.StarterGui:SetCore("SendNotification", {Title="Free Cam"; Text="Press LeftControl + P"; Duration=5;})
    end)

--Player
    local Tab = Gui:AddTab("Player")
    
    local Category = Tab:AddCategory("Become Unstoppable")

    local Slider = Category:AddSlider("Walkspeed", 16, 250, 1, function(val)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
    end)

    local Toggle = Category:AddToggle("Click TP", false, function(toggle)
        if _G.WRDClickTeleport == nil then
            _G.WRDClickTeleport = toggle
            
            local player = game:GetService("Players").LocalPlayer
            local UserInputService = game:GetService("UserInputService")
            local mouse = player:GetMouse()
    
            repeat wait() until mouse
            
            UserInputService.InputBegan:Connect(function(input, gameProcessed)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if _G.WRDClickTeleport and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                        player.Character:MoveTo(Vector3.new(mouse.Hit.x, mouse.Hit.y, mouse.Hit.z)) 
                    end
                end
            end)
        else
            _G.WRDClickTeleport = not _G.WRDClickTeleport
            if _G.WRDClickTeleport then
                game.StarterGui:SetCore("SendNotification", {Title="Click teleport enabled"; Text="Press LeftControl + LeftClick"; Duration=5;})
            else
                game.StarterGui:SetCore("SendNotification", {Title="Click teleport disabled"; Text=""; Duration=5;})
            end
        end
    end)

    local Toggle = Category:AddToggle("Infinite Jump", false, function(toggle)
        InfiniteJumpEnabled = toggle
    end)

    local Toggle = Category:AddToggle("No-Clip", false, function(toggle)
        
    end)

    local Toggle = Category:AddToggle("Fly [R15]- Reset To turn off", false, function(toggle)
        repeat wait() 
                until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
            local mouse = game.Players.LocalPlayer:GetMouse() 
            repeat wait() until mouse
            local plr = game.Players.LocalPlayer 
            local torso = plr.Character.HumanoidRootPart 
            local flying = toggle
            local deb = true 
            local ctrl = {f = 0, b = 0, l = 0, r = 0} 
            local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
            local maxspeed = 50 
            local speed = 0 
            
            function Fly() 
            local bg = Instance.new("BodyGyro", torso) 
            bg.P = 9e4 
            bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
            bg.cframe = torso.CFrame 
            local bv = Instance.new("BodyVelocity", torso) 
            bv.velocity = Vector3.new(0,0.1,0) 
            bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
            repeat wait() 
            plr.Character.Humanoid.PlatformStand = true 
            if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then 
            speed = speed+.5+(speed/maxspeed) 
            if speed > maxspeed then 
            speed = maxspeed 
            end 
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then 
            speed = speed-1 
            if speed < 0 then 
            speed = 0 
            end 
            end 
            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then 
            bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
            lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
            elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
            bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
            else 
            bv.velocity = Vector3.new(0,0.1,0) 
            end 
            bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
            until not flying 
            ctrl = {f = 0, b = 0, l = 0, r = 0} 
            lastctrl = {f = 0, b = 0, l = 0, r = 0} 
            speed = 0 
            bg:Destroy() 
            bv:Destroy() 
            plr.Character.Humanoid.PlatformStand = false 
            end 
            mouse.KeyDown:connect(function(key) 
            if key:lower() == "e" and key:lower() == "m" then 
            if flying then flying = toggle
            else 
            flying = toggle
            Fly() 
            end 
            elseif key:lower() == "w" then 
            ctrl.f = 1 
            elseif key:lower() == "s" then 
            ctrl.b = -1 
            elseif key:lower() == "a" then 
            ctrl.l = -1 
            elseif key:lower() == "d" then 
            ctrl.r = 1 
            end 
            end) 
            mouse.KeyUp:connect(function(key) 
            if key:lower() == "w" then 
            ctrl.f = 0 
            elseif key:lower() == "s" then 
            ctrl.b = 0 
            elseif key:lower() == "a" then 
            ctrl.l = 0 
            elseif key:lower() == "d" then 
            ctrl.r = 0 
            end 
            end)
            Fly()
    end)

    local Button = Category:AddButton("Reset Player", function()
        local Sound = Instance.new("Sound",game:GetService("SoundService"))
        Sound.SoundId = "rbxassetid://11029872119"
        Sound:Play()
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end)

--Settings
    local Tab = Gui:AddTab("Settings")

    local Category = Tab:AddCategory("Gui Stuff")
    
    local DualLabel = Category:AddDualLabel({"Gui Toggle", "RightControl"})

    local Button = Category:AddButton("Destroy Gui", function()
        game:GetService("CoreGui")["Galaxy Scripts Regular"]:Destroy()
    end)

    local Button = Category:AddButton("Disconnect From Server", function()
        game:GetService("Players").LocalPlayer:Kick(" ")
    end)

    local Toggle = Category:AddToggle("", false, function(toggle)
        
    end)

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Player = game.Players.LocalPlayer
OrionLib:MakeNotification({
    Name = "Script loaded",
    Content = "Thanks you for using Galaxy Scripts!",
    Image = "http://www.roblox.com/asset/?id=4919148038",
    Time = 5
})

local Sound = Instance.new("Sound",game:GetService("SoundService"))
Sound.SoundId = "rbxassetid://232127604"
Sound:Play()
