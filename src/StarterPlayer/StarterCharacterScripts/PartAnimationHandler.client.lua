local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local PlayPartAnimation:RemoteEvent = ReplicatedStorage:WaitForChild("PlayPartAnimation")
local bar:Frame = Players.LocalPlayer.PlayerGui:WaitForChild("ScreenGui"):WaitForChild("Frame"):WaitForChild("Bar")
local pistaFolder:Folder= game:GetService("Workspace"):WaitForChild("Pista1")
local clearedParts = 0

local currentPart = nil

PlayPartAnimation.OnClientEvent:Connect(function(part:Part)
    if currentPart == part then return end
    
    TweenService:Create(part, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In, 0, true), {Size = Vector3.new(part.Size.X +2, part.Size.Y, part.Size.Z+2)}):Play()
    currentPart = part

    if part:GetAttribute("IsCleared") == true then return end
    part:SetAttribute("IsCleared", true)
    clearedParts += 1
    task.wait(0.1)
    part.Highlight.FillTransparency = 0.8
    part.Highlight.OutlineTransparency = 0.5

    TweenService:Create(bar, TweenInfo.new(0.3), {Size = UDim2.new(clearedParts/#pistaFolder:GetChildren(), 0, 1, 0)}):Play()

    if clearedParts == #pistaFolder:GetChildren() then
        bar.BackgroundColor3 = Color3.fromRGB(4, 255, 0)
    end
end)