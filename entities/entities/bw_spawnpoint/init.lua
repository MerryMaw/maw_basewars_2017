
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( 'shared.lua' )

function ENT:Initialize()
	self:SetModel("models/props_junk/sawblade001a.mdl")
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_NONE )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )
	
	local phys = self.Entity:GetPhysicsObject()
	
	if (IsValid(phys)) then phys:EnableMotion(false) end
	
	self:SetHealth(100)
end