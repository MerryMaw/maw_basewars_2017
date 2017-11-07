
local Cate 		= {}
local Spawnable = {}

function AddSpawnableEntity(Dat)
	Dat.Category 		= Dat.Category or "Default"
	Dat.Name 			= Dat.Name or Dat.Class
	Dat.Limit			= Dat.Limit or 1
	Dat.Price			= Dat.Price or 0
	
	Cate[Dat.Category] 	= Cate[Dat.Category] or {}

	table.insert(Cate[Dat.Category],Dat)
	
	Spawnable[Dat.Class] = (Dat.Spawnable != false and Dat) or false
end

function GetSpawnableEntities()
	return Cate
end

function GetSpawnableEntitiesCategory(category)
	return Cate[category] or {}
end

function IsClassSpawnable(class)
	return Spawnable[class]
end


/*
	TYLER! Add entities/weapons here!
	
	TableStructure:
	
	{
		Class 		= string Class
		Name 		= string Name		= Class
		Category 	= string Category	= "Default"
		Model 		= string Model
		Price 		= integer Price		= 0
		Limit 		= integer Limit 	= 1 //Infinite
		Spawnable 	= boolean Spawnable = true
	}
*/

--I added the printers on the printer entities instead.
--So with the base weapons
AddSpawnableEntity(
	{
		Class 		= "weapon_smg1",
		Name 		= "HL2 SMG",
		Category 	= "Weapons",
		Model 		= "models/weapons/w_smg1.mdl",
		Price		= 4000,
	}
)


/*
	END
*/



