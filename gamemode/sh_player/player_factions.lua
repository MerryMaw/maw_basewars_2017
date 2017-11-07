local meta = FindMetaTable("Player")

GM.Factions = {}

local function updateFactions()
	local Dat = {}
	
	for k,v in pairs(player.GetAll()) do
		if (v.Faction) then
			Dat[v.Faction] = GAMEMODE.Factions[v.Faction]
		end
	end
	
	GAMEMODE.Factions = Dat
end

if (SERVER) then
	util.AddNetworkString("UpdateFactions")
	util.AddNetworkString("RequestJoinFaction")
	util.AddNetworkString("RequestLeaveFaction")
	util.AddNetworkString("RequestCreateFaction")
	util.AddNetworkString("CreateFaction")
	util.AddNetworkString("LeaveFaction")
	util.AddNetworkString("JoinFaction")
	
	function meta:CreateFaction(str,pass,col)
		if (GAMEMODE.Factions[str] and #player.GetAllByFaction(str) > 0) then return end
		
		str = string.sub(str,1,30)
		
		col = col or Color(math.random(60,255),math.random(60,255),math.random(60,255),255)
		
		self.Faction = str 
		
		GAMEMODE.Factions[str] = {Password=pass,Color=col}
		
		self:AddFeedMessage("You successfully created "..str..".",col)
		
		net.Start("CreateFaction")
			net.WriteEntity(self)
			net.WriteString(str)
			net.WriteColor(col)
		net.Broadcast()
		
		updateFactions()
	end
	
	function meta:SetFaction(str,pass,col)
		if (!GAMEMODE.Factions[str]) then return end
		if (GAMEMODE.Factions[str].Password != pass) then return end
		
		self.Faction = str 
		
		self:AddFeedMessage("You successfully joined  "..str..".",GAMEMODE.Factions[str].Color)
		
		net.Start("JoinFaction")
			net.WriteEntity(self)
			net.WriteString(str)
		net.Broadcast()
		
		updateFactions()
	end
	
	function meta:LeaveFaction()
		if (!self.Faction) then return end
		
		self:AddFeedMessage("You left  "..self.Faction..".",GAMEMODE.Factions[self.Faction].Color)
		
		self.Faction = nil
		
		net.Start("LeaveFaction")
			net.WriteEntity(self)
		net.Broadcast()
		
		updateFactions()
	end
	
	function meta:UpdateFaction(pl)
		if (!self.Faction) then return end
		
		net.Start("UpdateFactions")
			net.WriteEntity(self)
			net.WriteString(self.Faction)
			net.WriteColor(GAMEMODE.Factions[self.Faction].Color)
		net.Send(pl)
	end
	
	net.Receive("RequestCreateFaction",function(size,pl) pl:CreateFaction(net.ReadString(),net.ReadString(),net.ReadColor()) end)
	net.Receive("RequestJoinFaction",function(size,pl) pl:SetFaction(net.ReadString(),net.ReadString()) end)
	net.Receive("RequestLeaveFaction",function(size,pl) pl:LeaveFaction() end)
else
	function JoinFaction(str,pass)
		net.Start("RequestJoinFaction")
			net.WriteString(str)
			net.WriteString(pass)
		net.SendToServer()
	end
	
	function LeaveFaction()
		net.Start("RequestLeaveFaction")
		net.SendToServer()
	end
	
	function CreateFaction(str,pass,color)
		net.Start("RequestCreateFaction")
			net.WriteString(str)
			net.WriteString(pass)
			net.WriteColor(color)
		net.SendToServer()
	end
	
	net.Receive("UpdateFactions",function() 
		local pl 		= net.ReadEntity()
		local faction 	= net.ReadString()
		
		GAMEMODE.Factions[faction] = GAMEMODE.Factions[faction] or net.ReadColor()

		pl.Faction = faction
		updateFactions()
	end)
	
	net.Receive("CreateFaction",function() 
		local pl 		= net.ReadEntity()
		local faction 	= net.ReadString()
		
		if (!IsValid(pl)) then return end
		
		GAMEMODE.Factions[faction] = GAMEMODE.Factions[faction] or net.ReadColor()
		
		pl.Faction = faction
		updateFactions()
	end)
	
	net.Receive("JoinFaction",function() 
		local pl 		= net.ReadEntity()
		local faction 	= net.ReadString()
		
		if (!IsValid(pl)) then return end
		
		pl.Faction = faction
		updateFactions()
	end)
	
	net.Receive("LeaveFaction",function() 
		local pl = net.ReadEntity()
		
		if (!IsValid(pl)) then return end
		
		pl.Faction = nil
		updateFactions()
	end)
end
	
function meta:GetFaction()
	return self.Faction or "Civilian"
end

function meta:HasFaction()
	return self:GetFaction() != "Civilian"
end

function meta:GetFactionColor()
	local fact = self:GetFaction()
	return GAMEMODE.Factions[fact] and (GAMEMODE.Factions[fact].Color or GAMEMODE.Factions[fact]) or MAIN_DEFAULT_FACTIONCOLOR
end
	

function player.GetAllFactions()
	local Dat 	= {}
	
	for k,v in pairs(player.GetAll()) do
		local Fact = v:GetFaction()
		
		if (Dat[Fact]) then table.insert(Dat[Fact],v) else Dat[Fact] = {v} end
	end
	
	return Dat,GAMEMODE.Factions
end

function player.GetAllByFaction(name)
	local dat = {}
	
	for k,v in pairs(player.GetAll()) do
		if (v:GetFaction() == name) then
			table.insert(dat,v)
		end
	end
	
	return dat
end