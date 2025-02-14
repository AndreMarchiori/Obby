local parent:Part = script.Parent
local spawnLocation = game.Workspace.AreaInicial:FindFirstChild("ChaoDaAreaInicial")
local debouncing = {}
local confetes:Folder = parent.Confetes
local ReplicatedStorage = game:WaitForChild("ReplicatedStorage")
local particleTemplate = ReplicatedStorage:WaitForChild("ParticulasFinais")

parent.Touched:Connect(function(hit)
	local player = game.Players:GetPlayerFromCharacter(hit.Parent)
	local leaderstats = player:FindFirstChild("leaderstats")
	local playerGold = leaderstats and leaderstats:FindFirstChild("Gold")

	if not player then return end
	if debouncing[player] then return end
	debouncing[player] = true
	task.delay(6, function()
		debouncing[player] = nil
	end)

	playerGold.Value += 100
	-- Move o personagem para a posição inicial
	local character:Model = hit.Parent
	local primaryPart = character.PrimaryPart

	for _, confete in confetes:GetChildren() do
		if particleTemplate then
			local newParticle = particleTemplate:Clone()
			newParticle.Parent = confete
			newParticle.Enabled = true
			delay(5, function()
				newParticle.Enabled = false
				task.wait(2)
				newParticle:Destroy()
			end)
		end
	end

	delay(5, function()
		primaryPart.CFrame = spawnLocation.CFrame * CFrame.new(0, 10, 0)
	end)
end)