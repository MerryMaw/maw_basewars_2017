
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= ""
ENT.Author			= "Maw"
ENT.Purpose			= "Stuff"

AddSpawnableEntity(
	{
		Class 		= string.Explode("/",ENT.Folder)[2],
		Name 		= "Gun Factory",
		Category 	= "Production",
		Model 		= "models/props/de_prodigy/transformer.mdl",
		Limit 		= 1,
		Price		= 2500,
	}
)
