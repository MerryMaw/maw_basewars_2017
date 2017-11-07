include('shared.lua')

ENT.RenderGroup = RENDERGROUP_BOTH

local matBeam = Material("effects/laser1")
local bbox = Vector(14,14,32)

local IdleCol = Color(0,255,0,255)
local TargCol = Color(255,0,0,255)

local OffAng = Angle(0, 270, 60)
local OffPos = Vector(0, -2, 45)

local w,h = 130,100
	
function ENT:Draw()
	self:DrawModel()
	
	local text = "Level "..math.IntToRoman(self:GetLevel())
	local text2 = {string.rep("*",self.ConsumedPower),string.rep("*",self.Power-self.ConsumedPower)}
	
	local Pos = self:LocalToWorld(OffPos)
	local Ang = self:LocalToWorldAngles(OffAng)
	
	cam.Start3D2D(Pos,Ang,0.1)
		surface.SetDrawColor(MAIN_BLACKCOLOR_FADE)
		surface.DrawRect(0,0,w+1,h)

		draw.DrawText(text,"3D2DFont32",10,0,MAIN_WHITECOLOR)
		draw.DrawText(text2[1],"HL2Symbols",10,20,MAIN_YELLOWCOLOR)
		draw.DrawText(text2[2],"HL2Symbols",10,20,MAIN_REDCOLOR)
	cam.End3D2D()
end


function ENT:DrawTranslucent()
	if (!self:GetOnline() or !self:IsPowered()) then return end
	
	local Pitch,Yaw

	local t 			= UnPredictedCurTime()/10
	local Target 		= self:GetTarget()
	local attachInfo 	= self:GetAttachment(self:LookupAttachment("eyes"))
	
	local Ang = attachInfo.Ang
	local Pos = attachInfo.Pos
	
	local Col = IdleCol
	
	if (!Pos or !Ang) then return end
	
	if (IsValid(Target)) then
		local pAng = self:WorldToLocalAngles((Target:GetShootPos()-Pos):Angle())
		
		Pitch 	= pAng.p
		Yaw 	= pAng.y
		
		Ang 	= (Target:GetShootPos()-Pos):Angle()
		Col 	= TargCol
	else
		
		Pitch 	= math.sin(t)*15
		Yaw 	= math.cos(t*5)*45
	end
	
	local Tr = util.QuickTrace(Pos,Ang:Forward()*10000,self)
	
	render.SetMaterial(matBeam)
	render.DrawBeam(Pos, Tr.HitPos,2,0,1,Col)
	
	self:SetPoseParameter("aim_yaw", Yaw)
	self:SetPoseParameter("aim_pitch", Pitch)
	
	self:SetRenderBoundsWS(Pos,Tr.HitPos,bbox)
end
