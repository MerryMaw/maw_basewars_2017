AddCSLuaFile()

ENT.Base = "bw_printer"

ENT.NiceName	= "Nuclear Money Factory"
ENT.MaxHealth 	= 1650
ENT.Model 		= "models/props_lab/servers.mdl"
ENT.Material 	= "models/debug/debugwhite"
ENT.Color 		= Color(33, 255, 0, 255)
ENT.Power 		= 4
ENT.LevelStats 	= {
	[0] = {8725000, 9725000, 700000000},
	[1] = {17450000, 18450000, 1400000000},
	[2] = {34900000, 35900000, 2800000000},
	[3] = {69800000, 70800000, 5600000000},
	[4] = {139600000, 140600000, nil},	
}

// Purchase Price: 700000000
// Name: Nuclear Money Factory
// Limit: 1

AddSpawnableEntity(
	{
		Class 		= string.Explode("/",ENT.Folder)[2],
		Name 		= ENT.NiceName,
		Category 	= "Printers",
		Model 		= ENT.Model,
		Limit 		= 1,
		Price		= 700000000,
	}
)