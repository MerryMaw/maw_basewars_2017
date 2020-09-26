
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= ""
ENT.Author			= "Maw"
ENT.Purpose			= "Stuff"

ENT.Untouchable 	= true


AddSpawnableEntity(
	{
		Class 		= string.Explode("/",ENT.Folder)[2],
		Name 		= "Spawnpoint",
		Category 	= "Utility",
		Model 		= "models/props_junk/sawblade001a.mdl",
		Limit 		= 1,
		Price		= 2500,
	}
)
