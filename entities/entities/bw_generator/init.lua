
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
	
	self:SetColor(self.Color)
	self:SetMaterial(self.Material)
end

function ENT:Use(user)
	if (user:IsPlayer()) then
		//TODO: Resets n shit
	end
end
