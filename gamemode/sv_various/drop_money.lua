

function DropMoney(int, pos)
	if (int <= 0) then return end
	
	local e = ents.Create("bw_money")
	e:SetPos(pos)
	e:SetMoney(int)
	e:Spawn()
	e:Activate()
end