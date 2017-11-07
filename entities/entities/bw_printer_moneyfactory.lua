AddCSLuaFile()

ENT.Base = "bw_printer"

ENT.NiceName	= "Money Factory"
ENT.MaxHealth 	= 1350
ENT.Model 		= "models/props_lab/servers.mdl"
ENT.Material 	= "models/debug/debugwhite"
ENT.Color 		= Color(182, 182, 182, 255)
ENT.Power 		= 4
ENT.LevelStats 	= {
	[0] = {880000, 980000, 61300000},
	[1] = {1760000, 1860000, 122600000},
	[2] = {3520000, 3620000, 245200000},
	[3] = {7040000, 7140000, 490400000},
	[4] = {14080000, 14180000, nil},
}

// Purchase Price: 61000000
// Name: Money Factory
// Limit: 1

AddSpawnableEntity(
	{
		Class 		= string.Explode("/",ENT.Folder)[2],
		Name 		= ENT.NiceName,
		Category 	= "Printers",
		Model 		= ENT.Model,
		Limit 		= 1,
		Price		= 61000000,
	}
)


