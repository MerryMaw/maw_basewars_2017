AddCSLuaFile()
 
ENT.Base        = "bw_generator"
 
ENT.NiceName	= "Advanced Generator"
ENT.MaxHealth   = 250
ENT.Model       = "models/gibs/airboat_broken_engine.mdl"
ENT.Power       = 6
 
ENT.OffsetPos	= Vector(5,-10,10)
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