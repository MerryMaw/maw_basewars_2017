AddCSLuaFile()

ENT.Base = "bw_printer"

ENT.NiceName	= "Gold Money Printer"
ENT.MaxHealth 	= 900
ENT.Model 		= "models/props_c17/consolebox01a.mdl"
ENT.Material 	= "models/debug/debugwhite"
ENT.Color 		= Color(255, 221, 0, 255)
ENT.Power 		= 2
ENT.LevelStats 	= {
	[0] = {23000, 28000, 1765000},
	[1] = {46000, 51000, 3530000},
	[2] = {92000, 97000, 7060000},
	[3] = {184000, 189000, 14120000},
	[4] = {368000, 373000, nil},
}

AddSpawnableEntity(
	{
		Class 		= string.Explode("/",ENT.Folder)[2],
		Name 		= ENT.NiceName,
		Category 	= "Printers",
		Model 		= ENT.Model,
		Limit 		= 2,
		Price		= 1765000,
	}
)