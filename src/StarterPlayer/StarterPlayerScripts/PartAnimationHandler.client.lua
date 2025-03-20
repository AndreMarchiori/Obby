local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local PartAnimationEvent:RemoteEvent = ReplicatedStorage:WaitForChild("PartAnimationEvent")

local currentPart = nil

PartAnimationEvent.OnClientEvent:Connect(function(part)
    if currentPart == part then return end
    
    TweenService:Create(part, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In, 0, true), {Size = Vector3.new(part.Size.X +2, part.Size.Y, part.Size.Z+2)}):Play()
    currentPart = part
end)