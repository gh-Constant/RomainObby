local Settings = {}
Settings.__index = Settings

function Settings.new()
	local self = setmetatable({}, Settings)

	self.checkpointFolder = workspace.Map.zonesCheckpoints
	self.ZoneChecker = workspace.Map.zonesChecker
	self.killParts = workspace.Map:WaitForChild("KillParts")
	return self
end

function Settings:getKillPartsFolder()
	return self.killParts
end

function Settings:getCheckpointFolder()
	return self.checkpointFolder
end

function Settings:getZoneCheckerFolder()
	return self.ZoneChecker
end

return Settings
