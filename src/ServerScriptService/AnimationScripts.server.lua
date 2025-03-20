local pistaFolder:Folder= game:GetService("Workspace"):WaitForChild("Pista1")
local Players = game:GetService("Players")
local PartAnimationEvent:RemoteEvent = game:GetService("ReplicatedStorage").PartAnimationEvent

local Highlight = game:GetService("ReplicatedFirst"):WaitForChild("Highlight")

for i, v:Part in pistaFolder:GetChildren() do

    Highlight:Clone().Parent = v

    v.Touched:Connect(function(hit)
        if not hit.Parent:FindFirstChildOfClass("Humanoid") then return end
        local plr = Players:GetPlayerFromCharacter(hit.Parent)
        PartAnimationEvent:FireClient(plr, v)
    end)
end