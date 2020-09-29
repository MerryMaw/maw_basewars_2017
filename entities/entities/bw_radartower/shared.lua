
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= ""
ENT.Author			= "Maw"
ENT.Purpose			= "Stuff"

AddSpawnableEntity(
	{
		Class 		= string.Explode("/",ENT.Folder)[2],
		Name 		= "Radar Tower",
		Category 	= "Utility",
		Model 		= "models/props_rooftop/roof_dish001.mdl",
		Limit 		= 1,
		Price		= 2500,
	}
)
