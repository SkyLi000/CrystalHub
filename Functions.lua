local tags = {}
local function GetURL(scripturl)
	local res = game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/"..scripturl, true)
	assert(res ~= "404: Not Found", "File not found : vape/"..scripturl)
	return res
end
local shalib = loadstring(GetURL("Libraries/sha.lua"))()
local _hash,hash = pcall(function()
	local _h = loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyGodCheesey/Galaxy-Script-Hub/main/Whitelists.lua"))()
	return _h
end)

local clients = {
	ChatStrings1 = {
		["GalaxyC345CDAGH"] = "Galaxy",
	},
	ChatStrings2 = {
		["Galaxy"] = "GalaxyC345CDAGH",
	},
	ClientUsers = {}
}	

if _hash then
	tags = hash
else
	if tags then
		tags = hash
	else
		_hash,hash = pcall(function()
			local _h = loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyGodCheesey/Galaxy-Script-Hub/main/Whitelists.lua"))()
			return _h
		end)	
		if _hash then
			tags = hash
		else
			repeat
				task.wait(0.1)
				_hash,hash = pcall(function()
					return loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyGodCheesey/Galaxy-Script-Hub/main/Whitelists.lua"))()
				end)	
				if _hash then
					tags = hash
				end
				print("retrying")
			until _hash
		end
	end
end
local lplr = game.Players.LocalPlayer
local repstorage = game.ReplicatedStorage
local Functions = {
	CheckPlayerType = function(plr)
		local type = clients.ClientUsers[plr]
		local color = Color3.new()
		for i,v in pairs(tags.private) do
			if i == shalib.sha512(tostring(plr.Name..plr.UserId)) then
				type = "Galaxy Private"
				color = v
			end
		end
		for i,v in pairs(tags.developer) do
			if i == shalib.sha512(tostring(plr.Name..plr.UserId)) then
				type = "Galaxy Developer"
				color = v
			end
		end
		for i,v in pairs(tags.owner) do
			if i == shalib.sha512(tostring(plr.Name..plr.UserId)) then
				type = "Galaxy Owner"
				color = v
			end
		end
		if not color then
			color = Color3.new()
		end
		if type then
			if clients.ClientUsers[plr] then
				type = "Galaxy User"
			end
		else
			type = "DEFAULT"
		end
		if plr == lplr and type == nil then
			type = "Galaxy User"
		end
		return type,color
	end,
}
Functions["IsSpecialIngame"] = function (plr)
	local type
	if plr then
		if not (Functions.CheckPlayerType(plr) == "DEFAULT" or Functions.CheckPlayerType(plr) == "Galaxy User") then
			type = plr
		end
	else
		for i,v in pairs(game.Players:GetChildren()) do
			if not (Functions.CheckPlayerType(v) == "DEFAULT" or Functions.CheckPlayerType(v) == "Galaxy User") then
				type = v
			end
		end
	end
	if type == nil then
		type = "DEFAULT"
	end
	return type
end
local didnotsay = {}
task.spawn(function()
		game.Players.PlayerAdded:Connect(function(v)
	task.wait(0.01)
	local a = Functions.IsSpecialIngame()
	if a and didnotsay[v] == nil and a ~= lplr then
		didnotsay[v] = true
		repstorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..a.Name.." "..clients.ChatStrings2.Galaxy, "All")
	end								
end)
end)
local alreadysaidlist = {}
task.spawn(function()
	local a
	for i,v in pairs(game.Players:GetPlayers()) do
		task.wait()
		a = Functions.IsSpecialIngame()
		if didnotsay[v] == nil and a ~= lplr then
			--local ab = not (Functions.CheckPlayerType(plr) == "DEFAULT" or Functions.CheckPlayerType(plr) == "Galaxy User")
			ab = true
			if a and ab and didnotsay[v] == nil then
				didnotsay[v] = true
				repstorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..Functions.IsSpecialIngame().Name.." "..clients.ChatStrings2.Galaxy, "All")
			end									
		end
	end
end)

local tab = {}

lplr.PlayerGui:WaitForChild("Chat").Frame.ChatChannelParentFrame["Frame_MessageLogDisplay"].Scroller.ChildAdded:Connect(function(text)
	local textlabel2 = text:WaitForChild("TextLabel")
	if Functions.IsSpecialIngame() ~= "DEFAULT" then
		local args = textlabel2.Text:split(" ")
		local client = clients.ChatStrings1[#args > 0 and args[#args] or tab.Message]
		if textlabel2.Text:find("You are now chatting") or textlabel2.Text:find("You are now privately chatting") then
			text.Size = UDim2.new(0, 0, 0, 0)
			text:GetPropertyChangedSignal("Size"):Connect(function()
				text.Size = UDim2.new(0, 0, 0, 0)
			end)
		end
		if client then
			if textlabel2.Text:find(clients.ChatStrings2[client]) then
				text.Size = UDim2.new(0, 0, 0, 0)
				text:GetPropertyChangedSignal("Size"):Connect(function()
					text.Size = UDim2.new(0, 0, 0, 0)
				end)
			end
		end
		textlabel2:GetPropertyChangedSignal("Text"):Connect(function()
			local args = textlabel2.Text:split(" ")
			local client = clients.ChatStrings1[#args > 0 and args[#args] or tab.Message]
			if textlabel2.Text:find("You are now chatting") or textlabel2.Text:find("You are now privately chatting") then
				text.Size = UDim2.new(0, 0, 0, 0)
				text:GetPropertyChangedSignal("Size"):Connect(function()
					text.Size = UDim2.new(0, 0, 0, 0)
				end)
			end
			if client then
				if textlabel2.Text:find(clients.ChatStrings2[client]) then
					text.Size = UDim2.new(0, 0, 0, 0)
					text:GetPropertyChangedSignal("Size"):Connect(function()
						text.Size = UDim2.new(0, 0, 0, 0)
					end)
				end
			end
		end)
	end
end)		
local oldchanneltabs = {}
for i,v in pairs(getconnections(game.ReplicatedStorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
	if v.Function and #debug.getupvalues(v.Function) > 0 and type(debug.getupvalues(v.Function)[1]) == "table" and getmetatable(debug.getupvalues(v.Function)[1]) and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel then
		oldchanneltab = getmetatable(debug.getupvalues(v.Function)[1])
		oldchannelfunc = getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
		getmetatable(debug.getupvalues(v.Function)[1]).GetChannel = function(Self, Name)
			local tab = oldchannelfunc(Self,Name)
			if tab then
				local addmessage = tab.AddMessageToChannel
				if oldchanneltabs[tab] == nil then
					oldchanneltabs[tab] = tab.AddMessageToChannel
				end
				tab.AddMessageToChannel = function(Self2, MessageData)
					if MessageData.FromSpeaker and game.Players[MessageData.FromSpeaker] then
						pcall(function()
							local plr = game.Players[MessageData.FromSpeaker]
							local str = tostring(plr.Name..plr.UserId)
							if not (Functions.CheckPlayerType(plr) == "DEFAULT") or clients.ClientUsers[plr.Name] then
								local tagtext,color = Functions.CheckPlayerType(plr)
								MessageData.ExtraData = {
									NameColor = game.Players[MessageData.FromSpeaker].Team == nil and Color3.new(0, 1, 1) or game.Players[MessageData.FromSpeaker].TeamColor.Color,
									Tags = {
										table.unpack(MessageData.ExtraData.Tags),
										{
											TagColor = color,
											TagText = tagtext,
										}
									}
								}
							end
						end)
					end
					pcall(function()
						return addmessage(Self2, MessageData)
					end)
				end
			end
			return tab
		end
	end
end
game.ReplicatedStorage.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Wait()
task.wait(0.2)
if getconnections then
	for i,v in pairs(getconnections(game.ReplicatedStorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
		if v.Function and #debug.getupvalues(v.Function) > 0 and type(debug.getupvalues(v.Function)[1]) == "table" and getmetatable(debug.getupvalues(v.Function)[1]) and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel then
			debug.getupvalues(v.Function)[1]:SwitchCurrentChannel("All")
		end
	end
end

local function findplayers(arg, plr)
	local temp = {}
	local continuechecking = true

	if arg == "default" and continuechecking and Functions.CheckPlayerType(lplr) == "Galaxy User" then table.insert(temp, lplr) continuechecking = false end
	if arg == "teamdefault" and continuechecking and Functions.CheckPlayerType(lplr) == "Galaxy User" and plr and lplr:GetAttribute("Team") ~= plr:GetAttribute("Team") then table.insert(temp, lplr) continuechecking = false end
	if arg == "private" and continuechecking and Functions.CheckPlayerType(lplr) == "Galaxy Private" then table.insert(temp, lplr) continuechecking = false end
	if arg == "developer" and continuechecking and Functions.CheckPlayerType(lplr) == "Galaxy Developer" then table.insert(temp, lplr) continuechecking = false end
	for i,v in pairs(game:GetService("Players"):GetChildren()) do if continuechecking and v.Name:lower():sub(1, arg:len()) == arg:lower() then table.insert(temp, v) continuechecking = false end end

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
	["DEFAULT"] = -1,--xd
	["GALAXY USER"] = 0,
	["GALAXY PRIVATE"] = 1,
	["GALAXY DEVELOPER"] = 2,
	["GALAXY OWNER"] = 3
}

local commands = shared.Commands

function createwarning (title,content,duration)
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

chatconnection = repstorage.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(tab, channel)
	local plr = game.Players:FindFirstChild(tab["FromSpeaker"])
	local args = tab.Message:split(" ")
	local client = clients.ChatStrings1[#args > 0 and args[#args] or tab.Message]
	task.wait()
	if tab.MessageType == "Whisper" then
		if plr and not (Functions.CheckPlayerType(plr) == "DEFAULT" or Functions.CheckPlayerType(plr) == "Galaxy User") and tab.MessageType == "Whisper" and client ~= nil and alreadysaidlist[plr.Name] == nil then
			alreadysaidlist[plr.Name] = true
			local playerlist = game:GetService("CoreGui"):FindFirstChild("PlayerList")
			if playerlist then
				pcall(function()
					local playerlistplayers = playerlist.PlayerListMaster.OffsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame.ScollingFrame.OffsetUndoFrame
					local targetedplr = playerlistplayers:FindFirstChild("p_"..plr.UserId)
					if targetedplr then 
						targetedplr.ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerIcon.Image = getcustomassetfunc("MainLogo")
					end
				end)
			end
			task.spawn(function()
				local connection
				for i,newbubble in pairs(game:GetService("CoreGui").BubbleChat:GetDescendants()) do
					if newbubble:IsA("TextLabel") and newbubble.Text:find(clients.ChatStrings2[client]) then
						newbubble.Parent.Parent.Visible = false
						repeat task.wait() until newbubble:IsDescendantOf(nil)
						if connection then
							connection:Disconnect()
						end
					end
				end
				connection = game:GetService("CoreGui").BubbleChat.DescendantAdded:Connect(function(newbubble)
					if newbubble:IsA("TextLabel") and newbubble.Text:find(clients.ChatStrings2[client]) then
						newbubble.Parent.Parent.Visible = false
						repeat task.wait() until newbubble:IsDescendantOf(nil)
						if connection then
							connection:Disconnect()
						end
					end
				end)
			end)
			createwarning("Galaxy", plr.Name.." is using "..client.."!", 60)
			clients.ClientUsers[plr.Name] = client:upper()..' USER'
			task.spawn(function()
				pcall(function()
					if entity then
						local ind, newent = entity.getEntityFromPlayer(plr)
						if newent then entity.entityUpdatedEvent:Fire(newent) end
					end
				end)
			end)
		end
	end
	task.spawn(function()
		if priolist[string.upper(Functions.CheckPlayerType(lplr))] > 0 and plr == lplr then
			if tab.Message:len() >= 5 and tab.Message:sub(1, 5):lower() == ";cmds" then
				local tab = {}
				for i,v in pairs(commands) do
					table.insert(tab, i)
				end
				table.sort(tab)
				local str = ""
				for i,v in pairs(tab) do
					str = str..";"..v.."\n"
				end
				game.StarterGui:SetCore("ChatMakeSystemMessage",{
					Text = 	str,
				})
			end
		end
		if plr and priolist[Functions.CheckPlayerType(plr)] > 0 and plr ~= lplr and priolist[Functions.CheckPlayerType(plr)] > priolist[Functions.CheckPlayerType(lplr)] and #args > 1 then
			table.remove(args, 1)
			local chosenplayers = findplayers(args[1], plr)
			if table.find(chosenplayers, lplr) then
				table.remove(args, 1)
				for i,v in pairs(commands) do
					if tab.Message:len() >= (i:len() + 1) and tab.Message:sub(1, i:len() + 1):lower() == ";"..i:lower() then
						v(args, plr)
						break
					end
				end
			end
		end
	end)
end)

return Functions
