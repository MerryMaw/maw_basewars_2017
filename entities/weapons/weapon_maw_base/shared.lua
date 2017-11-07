
SWEP.Author					= "The Maw"
SWEP.Contact				= "cjbremer@gmail.com"
SWEP.PrintName				= "BASE"
SWEP.Purpose				= ""
SWEP.Instructions			= ""
SWEP.HoldType				= "ar2"

SWEP.Slot					= 3
SWEP.ViewModelFOV			= 82
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_smg_p90.mdl"
SWEP.WorldModel				= "models/weapons/w_smg_p90.mdl"

SWEP.Spawnable				= false
SWEP.AdminSpawnable			= false

SWEP.Primary.Sound			= "weapons/p90/p90-1.wav"
SWEP.Primary.Recoil			= 0.6
SWEP.Primary.Damage			= 50
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.017
SWEP.Primary.Delay 			= 0.05

SWEP.Primary.ClipSize		= 50	
SWEP.Primary.DefaultClip	= 50	
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "SMG1"

SWEP.Secondary.ClipSize		= -1	
SWEP.Secondary.DefaultClip	= -1	
SWEP.Secondary.Automatic	= false			
SWEP.Secondary.Ammo			= "none"

SWEP.CSMuzzleFlashes 		= true

SWEP.RenderGroup = RENDERGROUP_TRANSLUCENT

function SWEP:Initialize()
	self:SetWeaponHoldType(self.HoldType)
end

function SWEP:Precache() 
	util.PrecacheSound("weapons/clipempty_pistol.wav") 
end

function SWEP:PrimaryAttack()
	if (!self:CanPrimaryAttack()) then return end
	
	--Commenting out the line below somehow fixes 
	--the whole Client spraying bullets before primary fire.... ??????
	
	--if (CLIENT and !IsFirstTimePredicted()) then return end
	
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	self.Owner:MuzzleFlash()
	self:SendWeaponAnim(ACT_VM_IDLE)
	

	--if (CLIENT) then return end
	
	self:EmitSound(self.Primary.Sound)
	
	self:TakePrimaryAmmo(1)
	
	self.Owner:LagCompensation(true)
		self:ShootBullet(self.Primary.Damage,self.Primary.NumShots,self.Primary.Cone)
	self.Owner:LagCompensation(false)
	
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay + 0.05)
end

function SWEP:Deploy()
	self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
	return true
end