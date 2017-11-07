AddCSLuaFile()
 
SWEP.Base                   = "weapon_maw_base"
SWEP.PrintName              = "m4a1"
SWEP.Slot                   = 3
SWEP.HoldType               = "ar2"
 
SWEP.ViewModel              = "models/weapons/v_rif_m4a1.mdl"
SWEP.WorldModel             = "models/weapons/w_rif_m4a1.mdl"
 
SWEP.Primary.Sound          = "weapons/m4a1/m4a1-1.wav"
SWEP.Primary.Recoil         = 0.55
SWEP.Primary.Damage         = 45
SWEP.Primary.NumShots       = 1
SWEP.Primary.Cone           = 0.018
SWEP.Primary.Delay          = 0.06
 
SWEP.Primary.ClipSize       = 35  
SWEP.Primary.DefaultClip    = 35  
SWEP.Primary.Automatic      = true
SWEP.Primary.Ammo           = "AR2"
 
AddSpawnableEntity(
    {
        Class       = string.Explode("/",SWEP.Folder)[2],
        Name        = SWEP.PrintName,
        Category    = "Weapons",
        Model       = SWEP.WorldModel,
        Price       = 14750,
    }
)