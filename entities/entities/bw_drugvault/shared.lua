
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= ""
ENT.Author			= "Maw"
ENT.Purpose			= "Stuff"

AddSpawnableEntity(
	{
		Class 		= string.Explode("/",ENT.Folder)[2],
		Name 		= "Drug Vault",
		Category 	= "Other",
		Model 		= "models/props_c17/furniturefridge001a.mdl",
		Limit 		= 1,
		Price		= 2500,
	}
)
