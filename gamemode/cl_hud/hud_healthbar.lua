local heart 	= Material( "basewars2017/icons/heart.png" )
local shield 	= Material( "basewars2017/icons/shield.png" )
local money 	= Material( "basewars2017/icons/money.png" )


local sw, sh = ScrW(), ScrH()

local x = 55
local w,h = 180, 15

function DrawBWHealthBar()
	local pl = LocalPlayer()
	
	local hp = pl:Health()
    local ar = pl:Armor()
	
	//health
	if (hp <= 0) then return end
	
	local y = sh-50
	local chp = w*math.Clamp(hp/100,0,1)
	
	surface.SetDrawColor( MAIN_COLOR_HEALTH )
	surface.DrawRect(x,y,chp,h)
	
	surface.SetDrawColor( MAIN_WHITECOLOR_FADE )
	surface.DrawRect(x,y,chp,h/2)

	surface.SetDrawColor( MAIN_BLACKCOLOR )
	surface.DrawOutlinedRect(x,y,w,h)
	
	draw.SimpleText( hp, "StatusFont", x+w/2, y, MAIN_WHITECOLOR, 1 )

	surface.SetMaterial( heart )
	surface.SetDrawColor( MAIN_WHITECOLOR )
	surface.DrawTexturedRect( 25, y, 16, 16 )
	
	
	//money
	y = sh-72
	
	draw.SimpleText( "$"..string.Comma(pl:GetMoney()), "StatusFont", x, y, MAIN_WHITECOLOR )
	
	surface.SetMaterial( money )
	surface.SetDrawColor( MAIN_WHITECOLOR )
	surface.DrawTexturedRect( 25, y, 16, 16 )
	
	
	//armor
	if (ar <= 0) then return end
	
	local car = w*math.Clamp(ar/100,0,100)
	
	y = sh-28
	
	surface.SetDrawColor( MAIN_COLOR_ARMOR )
	surface.DrawRect(x,y,car,h)
	
	surface.SetDrawColor( MAIN_WHITECOLOR_FADE )
	surface.DrawRect(x,y,car,h/2)

	surface.SetDrawColor( MAIN_BLACKCOLOR )
	surface.DrawOutlinedRect(x,y,w,h)
	
	draw.SimpleText( ar, "StatusFont", x+w/2, y, MAIN_WHITECOLOR, 1 )

	surface.SetMaterial( shield )
	surface.SetDrawColor( MAIN_WHITECOLOR )
	surface.DrawTexturedRect( 25, y, 16, 16 )
	
	
end