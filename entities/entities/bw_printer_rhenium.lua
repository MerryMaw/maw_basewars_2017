AddCSLuaFile()

ENT.Base = "bw_printer"

ENT.NiceName	= "Rhenium Money Printer"
ENT.MaxHealth 	= 450
ENT.Model 		= "models/props_c17/consolebox03a.mdl"
ENT.Material 	= "models/debug/debugwhite"
ENT.Color 		= Color(255, 255, 255, 255)
ENT.Power 		= 1
ENT.LevelStats	= {
	[0] = {500, 750, 60000},
	[1] = {1500, 1750, 120000},
	[2] = {3000, 3250, 240000},
	[3] = {6000, 6250, 480000},
	[4] = {12000, 12250, nil},
}

// Purchase Price: 60000
// Name: Rhenium Money Printer
// Limit: 3

AddSpawnableEntity(
	{
		Class 		= string.Explode("/",ENT.Folder)[2],
		Name 		= ENT.NiceName,
		Category 	= "Printers",
		Model 		= ENT.Model,
		Limit 		= 3,
		Price		= 60000,
	}
)