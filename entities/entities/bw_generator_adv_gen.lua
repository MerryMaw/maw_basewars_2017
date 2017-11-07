AddCSLuaFile()
 
ENT.Base        = "bw_generator"
 
ENT.NiceName	= "Advanced Generator"
ENT.MaxHealth   = 250
ENT.Model       = "models/props/gg_vietnam/vietnam_generator.mdl"
ENT.Power       = 6
 
ENT.OffsetPos	= Vector(-20,0,30)
ENT.OffsetAng	= Angle(0,0,90)

AddSpawnableEntity(
    {
        Class       = string.Explode("/",ENT.Folder)[2],
        Name        = ENT.NiceName,
        Category    = "Generators",
        Model       = ENT.Model,
        Limit       = 3,
        Price       = 1000,
    }
)