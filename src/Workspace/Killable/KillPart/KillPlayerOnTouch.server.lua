local parent = script.Parent
local debouncing = {}

parent.Touched:Connect(function(hit)
	local playerName = hit.Parent.Parent.Name
	if debouncing[playerName] then
		return
	end

	debouncing[playerName] = true
	
	
	local humanoid = hit.Parent:FindFirstChild("Humanoid")
	
	if not humanoid then
		return
	end
	
	if humanoid then
		humanoid.Health -= 25
		delay(1, function()
			debouncing[playerName] = false
		end)
	end
end)