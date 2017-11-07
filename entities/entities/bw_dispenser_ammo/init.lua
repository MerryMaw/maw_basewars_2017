
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( 'shared.lua' )

function ENT:Initialize()
	self:SetModel("models/props_lab/reciever_cart.mdl")
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )
end


function ENT:Use(user)
	if (user:IsPlayer()) then
		local wep = user:GetActiveWeapon()
		
		if (!IsValid(wep)) then return end
		
		user:GiveAmmo(wep:GetMaxClip1()*2, wep:GetPrimaryAmmoType())
	end
end
