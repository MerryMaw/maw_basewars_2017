AddCSLuaFile()

ENT.Base = "bw_printer"

ENT.NiceName	= "Silver Money Printer"
ENT.MaxHealth 	= 300
ENT.Model 		= "models/props_lab/reciever01a.mdl"
ENT.Material 	= "models/debug/debugwhite"
ENT.Color 		= Color(182, 182, 182, 255)
ENT.Power 		= 1
ENT.LevelStats 	= {
	[0] = {250, 350, 20000},
	[1] = {500, 600, 40000},
	[2] = {1000, 1100, 80000},
	[3] = {2000, 2100, 160000},
	[4] = {4000, 4100, nil},
}

// Purchase Price: 20000
// Name: Silver Money Printer
// Limit: 4

AddSpawnableEntity(
	{
		Class 		= string.Explode("/",ENT.Folder)[2],
		Name 		= ENT.NiceName,
		Category 	= "Printers",
		Model 		= ENT.Model,
		Limit 		= 4,
		Price		= 20000,
	}
)