include('shared.lua')

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

ENT.CurScale 		= 0

function ENT:Draw()
	self:DrawModel()
	
	/* --IDK if i even want to do this :C
	
	local tr = LocalPlayer():GetEyeTrace()
	
	self.CurScale = Lerp(FrameTime()*4,self.CurScale,(tr.Entity == self) and 0.05 or 0)
	
	if (self.CurScale > 0.002) then
		local text = "$"..math.NiceInt(self:GetMoney())		
		
		local Ang = self:GetAngles()
		Ang:RotateAroundAxis(Ang:Right(),180)
		
		cam.Start3D2D(self:GetPos(),Ang,self.CurScale)
			draw.DrawText(text,"3D2DFont64",0,-34,MAIN_WHITECOLOR,1)
		cam.End3D2D()
		
		Ang:RotateAroundAxis(Ang:Right(),180)
		
		cam.Start3D2D(self:GetPos()+self:GetUp(),Ang,self.CurScale)
			draw.DrawText(text,"3D2DFont64",0,-34,MAIN_WHITECOLOR,1)
		cam.End3D2D()
	end*/
end
