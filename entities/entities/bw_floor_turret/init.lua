
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( 'shared.lua' )

local Spread = Vector(0.02,0.02,0)

function ENT:Initialize()
	self:SetModel("models/Combine_turrets/Floor_turret.mdl")
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )
	
	self:SetHealth(1000)
end

function ENT:Upgrade(pl)
	if (!IsValid(pl)) then return end
	
	local Lvl 		= self:GetLevel()
	
	if (Lvl >= 10) then return end
	
	local Up = 1000 * 2^(1+Lvl/10)
	
	if (pl:GetMoney() >= Up) then
		pl:AddMoney(-Up)
		self:SetLevel(Lvl+1)
		self:EmitSound("buttons/button4.wav")
	else
		self:EmitSound("buttons/button10.wav")
	end
end

function ENT:Think()
	local pl 			= self:GetCreator()
	
	if (!IsValid(pl) or !self:IsPowered()) then return end
	if (!self:GetOnline()) then return end
	
	local bHasFact 		= pl:HasFaction()
	local plFact		= pl:GetFaction()
	local t 			= self:GetTarget()
	local attachInfo 	= self:GetAttachment(self:LookupAttachment("eyes"))
	local Pos 			= attachInfo.Pos or self:GetPos()
	
	
	-- Find a target among players, otherwise...
	if (!IsValid(t)) then
		local For = self:GetForward()
		
		for k,v in pairs(player.GetAll()) do
			if ((!bHasFact or plFact != v:GetFaction()) and v != pl) then
				local dir = (v:GetShootPos()-Pos):GetNormal()
				
				if (dir:Dot(For) > 0.1 and self:Visible(v) and v:Alive()) then
					self:SetTarget(v)
					break
				end
			end
		end
	else
		
		local dir 	= (t:GetShootPos()-Pos):GetNormal()
		local d 	= dir:Dot(self:GetForward())
		
		if (d <= 0.1 or !self:Visible(t) or !t:Alive() or (bHasFact and plFact == t:GetFaction())) then
			self:SetTarget(NULL)
		else
			local tab = {
				Attacker = self:GetCreator() or self,
				Damage = math.random(30,50),
				Dir = dir,
				Src = Pos,
				Spread = Spread,
			}
			
			self:EmitSound( "Weapon_SMG1.Single" )
			self:FireBullets(tab)
		end
	end
	
	self:NextThink(CurTime()+0.2)
	return true
end


function ENT:Use(user)
	if (self:GetCreator() == user) then
		self:SetOnline(!self:GetOnline())
	end
end
