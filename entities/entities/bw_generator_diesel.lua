AddCSLuaFile()

ENT.Base 		= "bw_generator"

ENT.NiceName	= "Basic Generator"
ENT.MaxHealth 	= 150
ENT.Model 		= "models/props_vehicles/generatortrailer01.mdl"
ENT.Power 		= 4

AddSpawnableEntity(
	{
		Class 		= string.Explode("/",ENT.Folder)[2],
		Name 		= ENT.NiceName,
		Category 	= "Generators",
		Model 		= ENT.Model,
		Limit 		= 4,
		Price		= 500,
	}
)