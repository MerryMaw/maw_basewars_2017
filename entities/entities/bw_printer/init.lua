
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( 'shared.lua' )

-- VARS ARE DEFINED IN SHARED!

function ENT:Initialize()
	self:SetModel(self.Model)
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )
	self:PhysWake()
	
	self:SetHealth(self.MaxHealth)
	self:NextThink(CurTime()+30)
	
	self:SetColor(self.Color)
	self:SetMaterial(self.Material)
end

function ENT:Upgrade(pl)
	if (!IsValid(pl)) then return end
	
	local Lvl 		= self:GetLevel()
	local curLvl 	= self.LevelStats[Lvl]
	local nexLvl 	= self.LevelStats[Lvl+1]
	
	if (nexLvl and pl:GetMoney() >= curLvl[3]) then
		pl:AddMoney(-curLvl[3])
		self:SetLevel(Lvl+1)
		self:EmitSound("buttons/button4.wav")
	else
		self:EmitSound("buttons/button10.wav")
	end
end

function ENT:Think()
	if (!self:IsPowered()) then return end
	
	local mom = self.LevelStats[self:GetLevel()]
	
	if (!mom) then return end
	
	DropMoney(math.random(mom[1],mom[2]), self:LocalToWorld(self.OffsetPos))
	
	self:EmitSound("buttons/blip2.wav")
	self:NextThink(CurTime()+30)
	return true
end

function ENT:Use(user)
	if (user:IsPlayer()) then
		//TODO: Resets n shit
	end
end
