AddCSLuaFile()

ENT.Base = "bw_printer"

ENT.NiceName	= "Platinum Money Printer"
ENT.MaxHealth 	= 1050
ENT.Model 		= "models/props_c17/consolebox01a.mdl"
ENT.Material 	= "models/debug/debugwhite"
ENT.Color 		= Color(230, 230, 230, 255)
ENT.Power 		= 3
ENT.LevelStats 	= {
	[0] = {80000, 90000, 5720000},
	[1] = {160000, 170000, 11440000},
	[2] = {320000, 330000, 22880000},
	[3] = {640000, 650000, 45760000},
	[4] = {1280000, 1290000, nil},
}

// Purchase Price: 5700000
// Name: Platinum Money Printer
// Limit: 2

AddSpawnableEntity(
	{
		Class 		= string.Explode("/",ENT.Folder)[2],
		Name 		= ENT.NiceName,
		Category 	= "Printers",
		Model 		= ENT.Model,
		Limit 		= 2,
		Price		= 5700000,
	}
)