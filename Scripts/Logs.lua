local q = loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyLi000/GalaxyScript/main/Scripts/Sha.lua"))()
local s = loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyLi000/GalaxyScript/main/Whitelists.lua"))()
local a = os.time()
local a = os.date('!*t', a)
plr = game:GetService'Players'.LocalPlayer;
local b = false;
local c = false;
local e = false
if plr.MembershipType == Enum.MembershipType.Premium then
	b = true
elseif plr.MembershipType == Enum.MembershipType.None then
	b = false
end;
if b == false then
	if plr.AccountAge <= 70 then
		c = true
	end
end;
if plr.AccountAge <= 30 then
	e = true
else
	e = false
end
local w = q.sha512(plr.Name .. plr.UserId)
local ow = s.Owner
local de = s.Developer
local pr = s.Private
function getWhitelist()
	for i, v in pairs(ow) do
		if i == w then
			return "Owner"
		end
	end
	for i, v in pairs(de, w) do
		if i == w then
			return "Developer"
		end
	end
	for i, v in pairs(pr) do 
		if i == w then
			return "Private"
		end
	end
	return "Normal"
end
local c = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId, Enum.InfoType.Asset)
local function d()
	local a =
       (TRIGON_LOADED and "Trigon EVO") or (syn and not is_sirhurt_closure and not pebc_execute and "Synapse") or (secure_load and "Sentinel") or (EVON_LOADED and "Evon") or (is_sirhurt_closure and "Sirhurt") or (pebc_execute and "ProtoSmasher") or (KRNL_LOADED and "Krnl") or (OXYGEN_LOADED and "Oxygen U") or (WrapGlobal and "WeAreDevs") or (IsElectron and "Electron") or (isvm and "Proxo") or (shadow_env and "Shadow") or (jit and "EasyExploits") or (getreg()['CalamariLuaEnv'] and "Calamari") or (unit and "‎") or (IS_VIVA_LOADED and "VIVA") or (IS_COCO_LOADED and "Coco") or ("Unsupported Executor")
	return a
end;
local a = {
	["title"] = "Crystal Logs | **" .. Game.Players.LocalPlayer.Name .. " has executed Crystal**",
	["description"] = "```This was executed on " .. c.Name .. "```",
	["type"] = "rich",
	["color"] = tonumber("0x007bff"),
	["thumbnail"] = {
		["url"] = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. plr.UserId .. "&width=420&height=420&format=png"
	},
	["image"] = {
		["url"] = "http://www.roblox.com/Thumbs/Asset.ashx?Width=768&Height=432&AssetID=" .. game.PlaceId
	},
	["fields"] = {
		{
			["name"] = "Executor Info",
			["value"] = "```Executor Used: " .. (d()) .. "```",
			["inline"] = true
		},
		{
			["name"] = "Membership Info:",
			["value"] = "```Membership Type: " .. tostring(b) .. "```",
			["inline"] = true
		},
		{
			["name"] = "Game Link Info",
			["value"] = "```Game link: https://roblox.com/games/" .. game.PlaceId .. "/```",
			["inline"] = false
		},
		{
			["name"] = "User Info",
			["value"] = "```Username: " .. plr.Name .. "\nDisplay Name: " .. plr.Character.Humanoid.DisplayName .. "\nAccount Age: " .. plr.AccountAge .. "\nUser ID: " .. plr.UserId .. "\nPlayer Type: " .. getWhitelist() .. "```",
			["inline"] = true
		},
		{
			["name"] = "Alt Account (Prediction):",
			["value"] = "```Alt Account (Prediction): " .. tostring(e) .. "```",
			["inline"] = true
		},
		{
			["name"] = "Alt Accout Prediction Info",
			["value"] = "```How does alt accout check work?\nIf the accout was made less than 31 days ago, it is an alt.```",
			["inline"] = false
		},
		{
			["name"] = "Player Hash",
			["value"] = "```" .. w .. "```"
		},
	},
	["footer"] = {
		["text"] = "Executed by " .. Game.Players.LocalPlayer.Name .. " on " .. c.Name .. ""
	},
	["timestamp"] = string.format('%d-%d-%dT%02d:%02d:%02dZ', a.year, a.month, a.day, a.hour, a.min, a.sec),
}
(syn and syn.request or http_request or http.request) {
	Url = 'https://discord.com/api/webhooks/1030914224769216554/TKAXL42atKaGyvrqZd16D3fA-VnRG2ziVMiBkuDtESggpwOMfsEzYOxq-WC-124IyhXp';
	Method = 'POST';
	Headers = {
		['Content-Type'] = 'application/json';
	};
	Body = game:GetService'HttpService':JSONEncode({
		content = Content;
		embeds = {
			a
		};
	});
}
