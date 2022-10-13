--[[

   _____       _                       _____           _       _       
  / ____|     | |                     / ____|         (_)     | |      
 | |  __  __ _| | __ ___  ___   _    | (___   ___ _ __ _ _ __ | |_ ___ 
 | | |_ |/ _` | |/ _` \ \/ / | | |    \___ \ / __| '__| | '_ \| __/ __|
 | |__| | (_| | | (_| |>  <| |_| |    ____) | (__| |  | | |_) | |_\__ \
  \_____|\__,_|_|\__,_/_/\_\\__, |   |_____/ \___|_|  |_| .__/ \__|___/
                             __/ |                      | |            
                            |___/                       |_|            
]]--

local Whitelists = {}

local WhitelistTable = {
	Owner = {
		0,
	},
	CoOwner = {
		0,
		0,
	},
	HeadDeveloper = {
		0,
		0,
		0,
	},
	Developer = {
		0,
		0,
		0,
	},
	Staff = {
		0,
		0,
		0,
	},
	Admin = {
		0,
		0,
		0,
	},
	Premium = {
		0,
		0,
		0,
	},
}

function Whitelists:GetWhitelist(Rank)
	return WhitelistTable[Rank]
end


return Whitelists
