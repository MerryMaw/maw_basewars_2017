
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= ""
ENT.Author			= "Maw"
ENT.Purpose			= "Stuff"

AddSpawnableEntity(
	{
		Class 		= string.Explode("/",ENT.Folder)[2],
		Name 		= "Meth Lab",
		Category 	= "Production",
		Model 		= "models/props/de_train/processor_nobase.mdl",
		Limit 		= 1,
		Price		= 2500,
	}
)
