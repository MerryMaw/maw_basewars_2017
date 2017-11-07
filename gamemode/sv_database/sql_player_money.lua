
local meta = FindMetaTable("Player")

function meta:SQL_UpdateCharMoney()
	self.SQL_MoneyQuery = "UPDATE Accounts SET Money="..self:GetMoney().." WHERE PlayerID="..SQLStr(self:SteamID64())..";"
end

