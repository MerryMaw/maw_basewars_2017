
local CD = CurTime()

local PowerGridRange = 300 --Ill make a local range for each generator some time maybe.

function UpdatePowerGrid()
	if (CD > CurTime()) then return end
	
	--Reset everythings power consumption before appending
	for k,v in pairs(ents.FindByClass("bw_*")) do
		v.ConsumedPower = 0
	end
	
	for _,Gen in pairs(ents.FindByClass("bw_generator*")) do
		local pos = Gen:GetPos()
		for _,Ent in pairs(ents.FindByClass("bw_*")) do
			if (!Ent:GetClass():find("bw_generator") and Ent.Power and Ent.ConsumedPower < Ent.Power and Ent:GetPos():Distance(pos) < PowerGridRange) then
				--if (Ent.GetPlayerOwner and Ent:GetPlayerOwner() != Gen:GetPlayerOwner()) then continue end
				
				local p = math.min(Gen.Power-Gen.ConsumedPower,Ent.Power-Ent.ConsumedPower)
				Ent.ConsumedPower = Ent.ConsumedPower+p
				Gen.ConsumedPower = Gen.ConsumedPower+p
				
				if (Gen.ConsumedPower == Gen.Power) then break end
			end
		end
	end
	
	CD = CurTime()+1
end