AddCSLuaFile()

SWEP.PrintName 		= "BW Keys"
SWEP.Slot 			= 0
SWEP.SlotPos 		= 3
SWEP.DrawAmmo 		= false
SWEP.DrawCrosshair 	= false

SWEP.ViewModelFOV	= 62
SWEP.ViewModelFlip	= false

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= false
  
SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= 0			
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= ""

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= 0		
SWEP.Secondary.Automatic	= false		
SWEP.Secondary.Ammo			= ""

function SWEP:Initialize()
	self:SetWeaponHoldType("normal")
end

local function ValidateDoor(pl,door)
	if (CLIENT) then return false end
	
	if (!IsValid(door)) then return false end
	
	if (door:GetPos():Distance(pl:GetPos()) > 100) then return false end
	if (!door:GetClass():find("_door_")) then return false end

	return true
end

function SWEP:PrimaryAttack()
	if (CLIENT) then return end
	
	local tr = self.Owner:GetEyeTrace()
	
	if (!ValidateDoor(self.Owner,tr.Entity)) then return end
	
	tr.Entity:Fire("lock", "", 0)
	tr.Entity:EmitSound( "doors/door_latch1.wav" )
	
	self:SetNextPrimaryFire(CurTime() + 0.5)
end

function SWEP:SecondaryAttack()
	if (CLIENT) then return end
	
	local tr = self.Owner:GetEyeTrace()
	
	if (!ValidateDoor(self.Owner,tr.Entity)) then return end
	
	tr.Entity:Fire("unlock", "", 0)
	tr.Entity:EmitSound( "doors/door_latch3.wav" )
	
	self:SetNextSecondaryFire(CurTime() + 0.5)
end

function SWEP:DrawWorldModel()
end

function SWEP:PreDrawViewModel()
	return true
end

