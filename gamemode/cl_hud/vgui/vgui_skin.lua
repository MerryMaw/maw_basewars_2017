
--[[---------------------------------------------------------
	Most of the functions are pretty much default with the
	exception of the adjustment of some of the names, 
	variables and the UV cords for the custom GWEN texture.
-----------------------------------------------------------]]



local surface 	= surface
local Color 	= Color

--[[---------------------------------------------------------
	Textures
-----------------------------------------------------------]]

local grad_Down = surface.GetTextureID( "gui/gradient_down" )
local grad_Up	= surface.GetTextureID( "gui/gradient_up" )


--[[---------------------------------------------------------
	Initial skin information
-----------------------------------------------------------]]

SKIN = {}

SKIN.PrintName 		= "BW Skin"
SKIN.Author 		= "The Maw"
SKIN.DermaVersion	= 1
SKIN.GwenTexture	= Material("basewars2017/ui_spreadsheet_2.png")


--[[---------------------------------------------------------
	GWEN elements
-----------------------------------------------------------]]

SKIN.TEX					= {}

SKIN.TEX.Frame				= GWEN.CreateTextureBorder( 0, 32, 48, 48, 4, 4, 4, 4 )

SKIN.TEX.Panel				= GWEN.CreateTextureBorder( 0, 80, 48, 48, 8, 8, 8, 8 ) --GWEN.CreateTextureBorder( 384, 128, 48, 48, 8, 8, 8, 8 )

SKIN.TEX.Button				= GWEN.CreateTextureBorder( 192, 16, 48, 16, 8, 8, 8, 8 )
SKIN.TEX.Button_Down		= GWEN.CreateTextureBorder( 240, 16, 48, 16, 8, 8, 8, 8 )

SKIN.TEX.Tab				= GWEN.CreateTextureBorder( 256, 320, 32, 16, 8, 8, 8, 0 )
SKIN.TEX.Tab_Active			= GWEN.CreateTextureBorder( 256, 320, 32, 16, 8, 8, 8, 0 )
SKIN.TEX.Tab_Panel			= GWEN.CreateTextureBorder( 208, 320, 48, 48, 8, 8, 8, 8 )

SKIN.TEX.Tree				= GWEN.CreateTextureBorder( 0, 144, 48, 48, 8, 8, 8, 8 )

SKIN.TEX.Scroller 				= GWEN.CreateTextureBorder( 48, 144, 16, 48, 16, 16, 16, 16 )

SKIN.TEX.Scroller_Button_Down 	= GWEN.CreateTextureBorder( 240, 288, 16, 16, 8, 8, 8, 8 )
SKIN.TEX.Scroller_Button 		= GWEN.CreateTextureBorder( 240, 288, 16, 16, 8, 8, 8, 8 )

SKIN.TEX.Scroller_Up			= GWEN.CreateTextureNormal( 64, 160, 16, 16 )
SKIN.TEX.Scroller_Up_Down		= GWEN.CreateTextureNormal( 64, 144, 16, 16 )

SKIN.TEX.Scroller_Down			= GWEN.CreateTextureNormal( 80, 160, 16, 16 )
SKIN.TEX.Scroller_Down_Down		= GWEN.CreateTextureNormal( 80, 144, 16, 16 )


--[[---------------------------------------------------------
	Color
-----------------------------------------------------------]]

local WheelAng		= 215

local Color_Frame 	= HSVToColor(WheelAng,0.5,0.7) --Color(150,150,150)
local Color_Panel 	= HSVToColor(WheelAng,0.5,0.6) --Color(200,200,200)

local WheelAng_Button		= WheelAng

local Color_Button 			= HSVToColor(WheelAng_Button,0.5,0.8) --Color(200,200,200)
local Color_Button_Hover 	= HSVToColor(WheelAng_Button,0.5,0.9) --Color(200,200,200)
local Color_Button_Down 	= HSVToColor(WheelAng_Button,0.5,0.75) --Color(200,200,200)



--[[---------------------------------------------------------
	Panel
-----------------------------------------------------------]]

function SKIN:PaintFrame( panel, w, h )

	self.TEX.Frame( 0, 0, w, h, Color_Frame )
	
end


--[[---------------------------------------------------------
	Panel
-----------------------------------------------------------]]

function SKIN:PaintPanel( panel, w, h )

	if ( !panel.m_bBackground ) then return end
	
	self.TEX.Panel( 0, 0, w, h, Color_Panel )
	
end


--[[---------------------------------------------------------
	Property Sheet
-----------------------------------------------------------]]

function SKIN:PaintPropertySheet( panel, w, h )
	local ActiveTab = panel:GetActiveTab()
	local Offset	= IsValid(ActiveTab) and ActiveTab:GetTall() - 8 or 0
	
	self.TEX.Panel( 0, Offset, w, h - Offset, Color_Panel )
end


--[[---------------------------------------------------------
	Property Sheet Tabs
-----------------------------------------------------------]]

function SKIN:PaintTab( panel, w, h )
	if ( panel:GetPropertySheet():GetActiveTab() == panel ) then
		return self:PaintActiveTab( panel, w, h )
	end
	
	self.TEX.Panel( 0, 0, w, h, Color_Button_Down )
	
	--self.TEX.Tab( 0, 0, w, h	 )
end

function SKIN:PaintActiveTab( panel, w, h )

	self.TEX.Panel( 0, 0, w, h, Color_Button )
	--self.TEX.Tab_Active( 0, 0, w, h )

end


--[[---------------------------------------------------------
	Buttons
-----------------------------------------------------------]]

function SKIN:PaintButton( panel, w, h )
	if ( !panel.m_bBackground ) then return end

	if ( panel.Depressed || panel:IsSelected() || panel:GetToggle() ) then
		return self.TEX.Panel( 0, 0, w, h, Color_Button_Down )
		--self.TEX.Button_Down( 0, 0, w, h )
	end

	
	if ( panel.Hovered ) then
		return self.TEX.Panel( 0, 0, w, h, Color_Button_Hover )
	end
	
	
	self.TEX.Panel( 0, 0, w, h, Color_Button )
	--self.TEX.Button( 0, 0, w, h )

end


--[[---------------------------------------------------------
	Tree
-----------------------------------------------------------]]

function SKIN:PaintTree( panel, w, h )
	if ( !panel.m_bBackground ) then return end

	self.TEX.Tree( 0, 0, w, h, panel.m_bgColor )

end


--[[---------------------------------------------------------
	VScrollBar
-----------------------------------------------------------]]

function SKIN:PaintVScrollBar( panel, w, h )

	self.TEX.Scroller( 0, 16, w, h - 32 )
	
end


--[[---------------------------------------------------------
	ScrollBarGrip
-----------------------------------------------------------]]

function SKIN:PaintScrollBarGrip( panel, w, h )
	if ( panel.Depressed ) then
		return self.TEX.Scroller_Button_Down( 0, 0, w, h )
	end
	
	/*
	if ( panel.Hovered ) then
		return self.TEX.Scroller_Button_Hover( 0, 0, w, h )
	end
	*/
	
	return self.TEX.Scroller_Button( 0, 0, w, h )

end


--[[---------------------------------------------------------
	ButtonDown
-----------------------------------------------------------]]

function SKIN:PaintButtonDown( panel, w, h )
	if ( !panel.m_bBackground ) then return end

	if ( panel.Depressed || panel:IsSelected() ) then
		return self.TEX.Scroller_Down_Down( 0, 0, w, h )
	end
/*
	if ( panel.Hovered ) then
		return self.tex.Scroller.DownButton_Hover( 0, 0, w, h )
	end
*/
	self.TEX.Scroller_Down( 0, 0, w, h )

end


--[[---------------------------------------------------------
	ButtonUp
-----------------------------------------------------------]]

function SKIN:PaintButtonUp( panel, w, h )
	if ( !panel.m_bBackground ) then return end

	if ( panel.Depressed || panel:IsSelected() ) then
		return self.TEX.Scroller_Up_Down( 0, 0, w, h )
	end
	/*
	if ( panel.Hovered ) then
		return self.tex.Scroller.UpButton_Hover( 0, 0, w, h )
	end
	*/
	self.TEX.Scroller_Up( 0, 0, w, h )

end

derma.DefineSkin( "Basewars Remastered", "Remade for Basewars", SKIN )