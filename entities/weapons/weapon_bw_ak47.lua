AddCSLuaFile()
 
SWEP.Base                   = "weapon_maw_base"
SWEP.PrintName              = "AK-47"
SWEP.Slot                   = 3
SWEP.HoldType               = "ar2"
 
SWEP.ViewModel              = "models/weapons/v_rif_ak47.mdl"
SWEP.WorldModel             = "models/weapons/w_rif_ak47.mdl"
 
SWEP.Primary.Sound          = "weapons/ak47/ak47-1.wav"
SWEP.Primary.Recoil         = 0.4
SWEP.Primary.Damage         = 70
SWEP.Primary.NumShots       = 1
SWEP.Primary.Cone           = 0.012
SWEP.Primary.Delay          = 0.09
 
SWEP.Primary.ClipSize       = 30  
SWEP.Primary.DefaultClip    = 30  
SWEP.Primary.Automatic      = true
SWEP.Primary.Ammo           = "AR2"
 
AddSpawnableEntity(
    {
        Class       = string.Explode("/",SWEP.Folder)[2],
        Name        = SWEP.PrintName,
        Category    = "Weapons",
        Model       = SWEP.WorldModel,
        Price       = 25000,
    }
)