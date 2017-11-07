local meta = FindMetaTable("Player")

if (SERVER) then
	util.AddNetworkString("Money")

	function meta:SetMoney(int)
		if (!int) then return end
		
		self.Money = math.ceil(int)
		self:SQL_UpdateCharMoney()
		
		net.Start("Money")
			net.WriteDouble(self.Money)
		net.Send(self)
	end
	
	function meta:AddMoney(int)
		self:SetMoney((self.Money or 0) + int)
	end
else
	net.Receive("Money",function() LocalPlayer().Money = net.ReadDouble() end)
end

function meta:GetMoney()
	return self.Money or 0
end