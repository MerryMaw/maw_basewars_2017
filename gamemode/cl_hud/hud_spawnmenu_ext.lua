




local function spawnMenuTab()
	local menu = vgui.Create("DCategoryList")
	menu.Paint = function() end
	
	for Category, v in SortedPairs( GetSpawnableEntities() ) do
		local c = menu:Add( Category )
		
		local b = vgui.Create("DIconLayout",list)
		
		for _,ent in SortedPairsByMemberValue( v, "Price" ) do
			local a = b:Add( "SpawnIcon" )
			a:SetModel(ent.Model)
			a:SetTooltip(ent.Name.."\n$"..math.NiceInt(ent.Price))
			a.DoClick = function(s)
				RequestSpawnEntity(ent.Class)
			end
		end
		
		b:InvalidateLayout(true)
		c:SetContents(b)
	end
	
	return menu
end

spawnmenu.AddCreationTab( "Basewars Store", spawnMenuTab, "basewars2017/icons/coins.png", 1 )