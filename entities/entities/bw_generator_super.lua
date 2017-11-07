AddCSLuaFile()
 
ENT.Base        = "bw_generator"

ENT.NiceName	= "Super Generator"
ENT.MaxHealth   = 350
ENT.Model       = "models/props_c17/FurnitureBoiler001a.mdl"
ENT.Power       = 8

ENT.OffsetPos	= Vector(0,5,0)
 
AddSpawnableEntity(
    {
        Class       = string.Explode("/",ENT.Folder)[2],
        Name        = ENT.NiceName,
        Category    = "Generators",
        Model       = ENT.Model,
        Limit       = 4,
        Price       = 3000,
    }
)