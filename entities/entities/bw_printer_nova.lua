AddCSLuaFile()

ENT.Base = "bw_printer"

ENT.NiceName	= "Nova Money Printer"
ENT.MaxHealth 	= 3600
ENT.Model 		= "models/props_wasteland/laundry_washer001a.mdl"
ENT.Material 	= "models/debug/debugwhite"
ENT.Color 		= Color(218, 218, 218, 255)
ENT.Power 		= 5
ENT.LevelStats 	= {
	[0] = {20000000, 23000000, 2900000000},
	[1] = {40000000, 43000000, 5800000000},
	[2] = {80000000, 83000000, 11600000000},
	[3] = {160000000, 163000000, 23200000000},
	[4] = {320000000, 323000000, nil},	
}

AddSpawnableEntity(
	{
		Class 		= string.Explode("/",ENT.Folder)[2],
		Name 		= ENT.NiceName,
		Category 	= "Printers",
		Model 		= ENT.Model,
		Limit 		= 1,
		Price		= 2900000000,
	}
)