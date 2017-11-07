
if (SERVER) then
	util.AddNetworkString("SyncPlayer_BW")
	util.AddNetworkString("LoadEntity_BW")
	
	net.Receive("SyncPlayer_BW",function(siz,pl)
		pl:SetMoney(pl:GetMoney())
	end)
	
	net.Receive("LoadEntity_BW",function(siz,pl)
		local ent = net.ReadEntity()
		if (!IsValid(ent)) then return end
		
		if (ent:IsPlayer()) then 
			ent:UpdateFaction(pl)
			return 
		end
	end)
	
else
	local Q = 0
	
	function GM:InitPostEntity()
		net.Start("SyncPlayer_BW") net.SendToServer()
	end
	
	function GM:NetworkEntityCreated(ent)
		if (!IsValid(ent) or !ent:IsPlayer()) then return end
		
		Q=Q+1
		timer.Simple(0.1*Q,function()
			net.Start("LoadEntity_BW") net.WriteEntity(ent) net.SendToServer()
			Q=Q-1
		end)
	end
end
