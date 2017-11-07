AddCSLuaFile()

SWEP.Base					= "weapon_maw_base"
SWEP.PrintName 				= "P90"
SWEP.Slot 					= 3
SWEP.HoldType				= "ar2"

SWEP.ViewModel				= "models/weapons/v_smg_p90.mdl"
SWEP.WorldModel				= "models/weapons/w_smg_p90.mdl"
  
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

AddSpawnableEntity(
	{
		Class 		= string.Explode("/",SWEP.Folder)[2],
		Name 		= SWEP.PrintName,
		Category 	= "Weapons",
		Model 		= SWEP.WorldModel,
		Price		= 16000,
	}
)
