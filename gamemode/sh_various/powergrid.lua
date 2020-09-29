

//I will most likely coroutine this whole process later.
local CD = CurTime()
local min = math.min

local PowerGridRange = 300^2 --Ill make a local range for each generator some time maybe.

function UpdatePowerGrid()
	if (CD > CurTime()) then return end
	
	//local s = SysTime()
	--Reset everythings power consumption before appending
	local bwEntsAll = ents.FindByClass("bw_*");
	
	local bwEnts = {}
	local bwEntsGenerators = {}
	
	for k,v in pairs(bwEntsAll) do
		if (v:GetClass():find("bw_generator")) then
			bwEntsGenerators[k] = v
		else
			bwEnts[k] = v
		end
		
		v.ConsumedPower = 0
	end
	
	for _,Gen in pairs(bwEntsGenerators) do
		local pos = Gen:GetPos()
		for _,Ent in pairs(bwEnts) do
			if (Ent.Power and Ent.ConsumedPower < Ent.Power and Ent:GetPos():DistToSqr(pos) < PowerGridRange) then
				--if (Ent.GetPlayerOwner and Ent:GetPlayerOwner() != Gen:GetPlayerOwner()) then continue end
				
				local p = min(Gen.Power-Gen.ConsumedPower,Ent.Power-Ent.ConsumedPower)
				Ent.ConsumedPower = Ent.ConsumedPower+p
				Gen.ConsumedPower = Gen.ConsumedPower+p
				
				if (Gen.ConsumedPower == Gen.Power) then break end
			end
		end
	end
	
	//print("Time: " .. (SysTime() - s))
	CD = CurTime()+1
end


hook.Add( "Tick", "checkPowerGrid", function()
	UpdatePowerGrid()
end)