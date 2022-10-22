local L_x_ = "1"
getgenv().Code = L_x_
local L_1_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyLi000/CrystalHub/main/Scripts/CrackedCheck.lua"))()
local L_2_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyLi000/CrystalHub/main/Scripts/CrackedCheck2.lua"))()

if getgenv().D1SC0RD_1NV == loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyLi000/CrystalHub/main/Scripts/DiscordLink.lua"))()
and L_2_ == L_1_ then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyLi000/CrystalHub/main/KeySys.lua"))()
else
	if L_2_ ~= L_1_ or getgenv().D1SC0RD_1NV ~= loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyLi000/CrystalHub/main/Scripts/DiscordLink.lua"))() then
		if isfolder("Crystal") then
			if isfile("Crystal/Settings2.lua") then
				if readfile("Crystal/Settings2.lua") == "2" then
					game:GetService("Players").LocalPlayer:Kick("Error while loading script!")
				end
				else
				writefile("Crystal/Settings2.lua","2")
			end
		else
			if not isfolder("Crystal") then
				makefolder("Crystal")
			end
			if isfile("Crystal/Setting2.lua") then
				if readfile("Crystal/Settings2.lua") == "2" then
					game:GetService("Players").LocalPlayer:Kick("Error while loading script!")
				end
			else
				writefile("Crystal/Settings2.lua", "2")
				game:GetService("Players").LocalPlayer:Kick("Error while loading script!")
			end
		end
	else
		local L_3_ = (syn and syn.request) or http_request or request
		local L_4_ = game:GetService("HttpService")
		L_3_({
			Url = "http://127.0.0.1:6463/rpc?v=1",
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json",
				["Origin"] = "https://discord.com"
			},
			Body = L_4_:JSONEncode({
				cmd = "INVITE_BROWSER",
				args = {
					code = "QbQ3aFRbbJ"
				},
				nonce = L_4_:GenerateGUID(false)
			})
		})
		game:GetService("Players").LocalPlayer:Kick("Discord Link Invalid\nhttps://discord.gg/QbQ3aFRbbJ")
	end
end
