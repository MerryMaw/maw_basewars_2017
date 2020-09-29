
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= ""
ENT.Author			= "Maw"
ENT.Purpose			= "Stuff"

AddSpawnableEntity(
	{
		Class 		= string.Explode("/",ENT.Folder)[2],
		Name 		= "Drug Lab",
		Category 	= "Production",
		Model 		= "models/props_combine/combine_mine01.mdl",
		Limit 		= 1,
		Price		= 2500,
	}
)
