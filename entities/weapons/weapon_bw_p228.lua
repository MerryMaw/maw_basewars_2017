AddCSLuaFile()
 
SWEP.Base                   = "weapon_maw_base"
SWEP.PrintName              = "p228"
SWEP.Slot                   = 2
SWEP.HoldType               = "pistol"
 
SWEP.ViewModel              = "models/weapons/v_pist_p228.mdl"
SWEP.WorldModel             = "models/weapons/w_pist_p228.mdl"
 
SWEP.Primary.Sound          = "weapons/p228/p228-1.wav"
SWEP.Primary.Recoil         = 0.35
SWEP.Primary.Damage         = 35
SWEP.Primary.NumShots       = 1
SWEP.Primary.Cone           = 0.017
SWEP.Primary.Delay          = 0.08
 
SWEP.Primary.ClipSize       = 7
SWEP.Primary.DefaultClip    = 7
SWEP.Primary.Automatic      = true
SWEP.Primary.Ammo           = "SMG1"
 
AddSpawnableEntity(
    {
        Class       = string.Explode("/",SWEP.Folder)[2],
        Name        = SWEP.PrintName,
        Category    = "Weapons",
        Model       = SWEP.WorldModel,
        Price       = 1500,
    }
)