
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( 'shared.lua' )

-- VARS ARE DEFINED IN SHARED!

function ENT:Initialize()
	self:SetModel("models/props/cs_assault/Money.mdl")
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )
	self:PhysWake()
	
	self:NextThink(CurTime()+60)
end

function ENT:Think()
	self:Remove()
end

function ENT:Use(user)
	if (user:IsPlayer()) then
		local mon = math.max(0,self:GetMoney())
		
		user:AddMoney(mon)
		user:AddFeedMessage("You collected $"..mon,MAIN_GREENCOLOR)
		
		
		//self:EmitSound("ambient/levels/labs/coinslot1.wav")
		
		self:Remove()
	end
end

function ENT:StartTouch(ent)
	if (ent:GetClass() == self:GetClass()) then
		if (ent:GetMoney() > self:GetMoney()) then
			ent:SetMoney(ent:GetMoney()+self:GetMoney())
			
			self:NextThink(CurTime()+60)
			self:Remove()
		end
	end
end
