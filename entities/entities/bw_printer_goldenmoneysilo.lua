AddCSLuaFile()

ENT.Base = "bw_printer"

ENT.NiceName	= "Golden Money Silo"
ENT.MaxHealth 	= 1500
ENT.Model 		= "models/props_wasteland/laundry_washer003.mdl"
ENT.Material 	= "models/debug/debugwhite"
ENT.Color 		= Color(255, 221, 0, 255)
ENT.Power 		= 4
ENT.LevelStats 	= {
	[0] = {2562500, 3062500, 205000000},
	[1] = {5125000, 5625000, 410000000},
	[2] = {10250000, 10750000, 820000000},
	[3] = {20500000, 21000000, 1640000000},
	[4] = {41000000, 41500000, nil},
}

AddSpawnableEntity(
	{
		Class 		= string.Explode("/",ENT.Folder)[2],
		Name 		= ENT.NiceName,
		Category 	= "Printers",
		Model 		= ENT.Model,
		Limit 		= 1,
		Price		= 200000000,
	}
)