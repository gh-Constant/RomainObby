local Players = game:GetService("Players")
local ServerScriptService = game:GetService("ServerScriptService")
local PlayerData = require(script.Parent.PlayerData)

local PlayerObject = {}
PlayerObject.__index = PlayerObject

-- Table to store player objects
local playerObjects = {}

function PlayerObject.new(player: Player)
	local self = setmetatable({}, PlayerObject)
	self.player = player
	self.currentZone = "Default"
	return self
end

function PlayerObject:getPlayer()
	return self.player
end

function PlayerObject.GetPlayerObject(player: Player)
	return playerObjects[player]
end

-- Connect to PlayerAdded event to create a PlayerObject for each player
Players.PlayerAdded:Connect(function(player)
	playerObjects[player] = PlayerObject.new(player)
end)

-- Handle PlayerRemoving to clean up
Players.PlayerRemoving:Connect(function(player)
	playerObjects[player] = nil
end)

function PlayerObject:setCurrentZone(zoneName: string)
	self.currentZone = zoneName
end

function PlayerObject:getCurrentZone(): string
	return self.currentZone
end

return PlayerObject
