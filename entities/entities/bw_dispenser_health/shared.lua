
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= ""
ENT.Author			= "Maw"
ENT.Purpose			= "Stuff"

AddSpawnableEntity(
	{
		Class 		= string.Explode("/",ENT.Folder)[2],
		Name 		= "Health Dispenser",
		Category 	= "Utility",
		Model 		= "models/props_combine/health_charger001.mdl",
		Limit 		= 1,
		Price		= 2500,
	}
)
