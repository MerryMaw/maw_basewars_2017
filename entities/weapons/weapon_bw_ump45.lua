AddCSLuaFile()
 
SWEP.Base                   = "weapon_maw_base"
SWEP.PrintName              = "ump45"
SWEP.Slot                   = 3
SWEP.HoldType               = "smg"
 
SWEP.ViewModel              = "models/weapons/v_smg_ump45.mdl"
SWEP.WorldModel             = "models/weapons/w_smg_ump45.mdl"
 
SWEP.Primary.Sound          = "weapons/ump45/ump45-1.wav"
SWEP.Primary.Recoil         = 0.45
SWEP.Primary.Damage         = 47
SWEP.Primary.NumShots       = 1
SWEP.Primary.Cone           = 0.017
SWEP.Primary.Delay          = 0.09
 
SWEP.Primary.ClipSize       = 35
SWEP.Primary.DefaultClip    = 35
SWEP.Primary.Automatic      = true
SWEP.Primary.Ammo           = "SMG1"
 
AddSpawnableEntity(
    {
        Class       = string.Explode("/",SWEP.Folder)[2],
        Name        = SWEP.PrintName,
        Category    = "Weapons",
        Model       = SWEP.WorldModel,
        Price       = 9500,
    }
)