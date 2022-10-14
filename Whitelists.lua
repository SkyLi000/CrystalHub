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

local Whitelists = {
    Private = {
        ["79a014a9bdf10afd77c543073e124cefc2b9375537b9c9062f2a1c03d13dad654593ce3f8a0c2fdc73d6c1c3528039d1d1d48c6669c935ca78f490183d937526 "] 
            = Color3.new(0.666667, 0, 1), -- Pangu
        ["7c0960139f5e98fb129a8799026948aca2fb18943d1d87aeb5122f3cbe187d6aed1ddc119505c88c2ca3ee5ed7b6c9a2c5440a509710efa1c5b3c09a49bd6861"]
            = Color3.new(0.666667, 0, 1), -- Just an average joe
        ["dbdc2c73bdce637146323beb6b6c5371707cec3b07a03d3c6703da1f86be7d5cee145d0d9df6d0a5056ee597bd0dd2796620553dbdf65c8b7fd61ce6857f79e6"]
                = Color3.new(0.666667, 0, 1), -- Pangu
    },
    Developer = {
        ["5208cdc24c953e1b2b0db014d6693c2c1d59485d0cd1c9aeb8c682c39736cd35d60d9970643387f647a22a900c742e61c5833e2a22064e126a7a0c59fec07c80"] 
            = Color3.new(0.333333, 0.333333, 1), -- Dripped Out
	["f61f227ce13b71c5e86f9e1f92927691b9c0a85ec001965c92f15b344e4d774f88bd1e6920cc4fec660c26991b3a57822edf97f1fca26c43f380cdc37163364d"] 
            = Color3.new(0.333333, 0.333333, 1),
    },
    Owner = {
        ["1e01ec5f74a840dbb3ee466a952c77727da0210c130b7e5e7d6a391ecf27d1ff993157c50c6244b563a23197bdc614a66db035f358e205f17832c6a4a103bef6"] 
            = Color3.new(0.333333, 1, 1), -- Vortex
        ["fee075b943672d60efa69292a42cb984a81a3ce9005f89bc64f3f47fc671eb3d7af49dc2473bb50f1d447067d9cfd8bf9ce186d948949ce814174688d2d02362"]
                = Color3.fromRGB(151, 32, 212), -- SkyGodCheesey
	["59fa1f07ee121e5c05e708dcddec75b9dd72b7b610e61c0bdb792ece79d9bc8615e69a4d970e15b55220eb24745bc77f63ff763e6fb1aba7e9ab0ebe5d4f87a9"]
	    = Color3.new(0.8, 0, 1),
    },
}

return Whitelists
