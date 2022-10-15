if not game:IsLoaded() then
game.Loaded:Wait()
end
local petNet = {}
local network = require(game:GetService("ReplicatedStorage"):WaitForChild("Framework",10):WaitForChild("Library",10));
assert(network,"now what the hell")
function petNet:getPath(...)
    local path = {...}
    local oldPath = network
    for i,v in ipairs(path) do
        oldPath = rawget(oldPath,v)
    end
    return oldPath
end
print(petNet:getPath("Variables","LoadingWorld"))
function petNet:waitForLoad()
    local currentlyLoading
        repeat wait() 
            currentlyLoading = ((petNet:getPath("Variables","LoadingWorld")==false) and workspace:FindFirstChild("__MAP") and workspace["__MAP"]:FindFirstChild("PlayerSpawns")) and true or false
        until currentlyLoading
    return currentlyLoading
end
return petNet
