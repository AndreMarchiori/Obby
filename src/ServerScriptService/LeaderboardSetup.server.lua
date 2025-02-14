local DataStore = game:GetService("DataStoreService")
local ds = DataStore:GetDataStore("PlayerScore")

game.Players.PlayerAdded:Connect(function(plr)
	local leaderstats = Instance.new("Folder", plr)
	leaderstats.Name = "leaderstats"

	local Gold = Instance.new("NumberValue", leaderstats)
	Gold.Name = "Gold"

	local key = "plr-"..plr.UserId
	local success, SavedData = pcall(function()
		return ds:GetAsync(key)
	end)

	if SavedData then 
		Gold.Value = SavedData[1]
	else
		local DataToSave = {Gold.Value}
		local success, message = pcall(function()
		ds:SetAsync(key, DataToSave)
		end)
	end
end)

game.Players.PlayerRemoving:Connect(function(plr)
	local key = "plr-"..plr.UserId
	local DataToSave = {plr.leaderstats.Gold.Value}
	local success, message = pcall(function()
		ds:SetAsync(key, DataToSave)
	end)
end)