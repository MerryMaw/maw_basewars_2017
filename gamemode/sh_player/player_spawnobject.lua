

local meta = FindMetaTable("Player")

if (SERVER) then
	util.AddNetworkString("RequestSpawnEntity")
	
	net.Receive("RequestSpawnEntity",function(len, pl)
		local class = IsClassSpawnable(net.ReadString())
		
		if (!class) then pl:AddFeedMessage("Invalid entity",MAIN_REDCOLOR) return end
		if (pl:GetMoney() < class.Price) then pl:AddFeedMessage("Insufficient funds!",MAIN_REDCOLOR) return end 
		if (pl:ClassExceedLimit(class.Class)) then pl:AddFeedMessage("Maximum "..class.Class.." reached",MAIN_REDCOLOR) return end
		
		local tr = pl:GetEyeTrace()
		
		pl:AddMoney(-class.Price)
		
		local e = ents.Create(class.Class)
		e:SetPos(tr.HitPos+Vector(0,0,100))
		e:Spawn()
		e:Activate()
		e:SetCreator(pl)
		e:DropToFloor()
		
		//Allow players to undo entities spawned through the Basewars tab?
		/*
		undo.Create( class.Name )
			undo.AddEntity( e )
			undo.SetPlayer( pl )
		undo.Finish()*/
	end)
else
	function RequestSpawnEntity(class)
		net.Start("RequestSpawnEntity")
			net.WriteString(class)
		net.SendToServer()
	end
end