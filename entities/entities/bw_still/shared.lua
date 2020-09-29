
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= ""
ENT.Author			= "Maw"
ENT.Purpose			= "Stuff"

AddSpawnableEntity(
	{
		Class 		= string.Explode("/",ENT.Folder)[2],
		Name 		= "Still",
		Category 	= "Production",
		Model 		= "models/props/de_inferno/wine_barrel.mdl",
		Limit 		= 1,
		Price		= 2500,
	}
)
