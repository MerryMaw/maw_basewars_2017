
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( 'shared.lua' )

function ENT:Initialize()
	self:SetModel( "models/props_lab/powerbox01a.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )
	self:PhysWake()
	
	self:SetHealth(100)
	
	self.CD	= CurTime()
end

function ENT:OnRemove()
	if (self:GetMoney() > 0) then
		DropMoney(self:GetMoney(), self:GetPos()) --Changing abit here
	end
end

function ENT:StartTouch(ent)
	if (self.CD > CurTime()) then return end
	if (ent:GetClass()=="bw_money") then
		self:SetMoney(self:GetMoney()+ent:GetMoney())
		ent:Remove() 
	end
end

function ENT:Use(user)
	if (self.CD > CurTime()) then return end
	
	if (self:GetCreator() == user and self:GetMoney() > 0) then
		DropMoney(self:GetMoney(), self:GetPos()+self:GetUp()*20)
		
		self:SetMoney(0)
		self:EmitSound( "ambient/alarms/klaxon1.wav" )
		
		self.CD = CurTime()+3
	end
end