AddCSLuaFile()

ENT.Base = "bw_printer"

ENT.NiceName	= "Rhodium Money Printer"
ENT.MaxHealth 	= 1200
ENT.Model 		= "models/props_c17/consolebox01a.mdl"
ENT.Material 	= "models/debug/debugwhite"
ENT.Color 		= Color(127, 0, 255, 255)
ENT.Power 		= 3
ENT.LevelStats 	= {
	[0] = {270000, 320000, 18600000},
	[1] = {540000, 590000, 37200000},
	[2] = {1080000, 1130000, 74400000},
	[3] = {2160000, 2210000, 148800000},
	[4] = {4320000, 4370000, nil},
}

// Purchase Price: 19000000
// Name: Rhodium Money Printer
// Limit: 1

AddSpawnableEntity(
	{
		Class 		= string.Explode("/",ENT.Folder)[2],
		Name 		= ENT.NiceName,
		Category 	= "Printers",
		Model 		= ENT.Model,
		Limit 		= 1,
		Price		= 19000000,
	}
)