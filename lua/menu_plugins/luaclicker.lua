
local MANIFEST = {
    id = "vee.clickertest",
    author = "Vee/VCSoldier",
    name = "Clicker Test",
    description = "Click The Button",
    version = "1.2",
}


menup(MANIFEST)
surface.CreateFont("Font", {
    font = "Arial",
    extended = true,
    size = 50,
	weight = 900,
})

include("vgui/DHorizontalDivider.lua") -- I FUCKING HATE YOU RUBAT, WHY ISNT THIS CALLED, YOU DUMB MOTHERFUCKER, YOU MAKE DPROGRESSBAR GET CALLED BUT NOT SOMETHING USEFUL LIKE THIS, EAT MY NUTS
local function popup()
     local Color_BG = Color( 37, 44, 54, 255 )
     local Color_Button = Color( 53, 59, 72, 255 )
	 local Color_Div = Color( 30, 40, 50, 255 )
     
	 local DermaFrame = vgui.Create( "DFrame" )
	 DermaFrame:SetTitle("LuaClicker!")
	 DermaFrame:SetSize( 600, 600 )
	 DermaFrame:Center()
	 DermaFrame:MakePopup()
	 DermaFrame.Count = 1
     DermaFrame.Paint = function( self, w, h )
	     draw.RoundedBox( 0, 0, 0, w, h, Color_BG )
	 end
	 local DermaPanelLeft = vgui.Create( "DPanel", DermaFrame )
	 DermaPanelLeft.Paint = function( self, w, h )
	     draw.RoundedBox( 0, 0, 0, w, h, Color_BG )
     end
	 	 local DermaPanelRight = vgui.Create( "DPanel", DermaFrame )
	 DermaPanelRight.Paint = function( self, w, h )
	     draw.RoundedBox( 0, 0, 0, w, h, Color_BG )
     end
	 
	 local DermaDiv = vgui.Create( "DHorizontalDivider", DermaFrame )
	 DermaDiv:Dock( FILL )
	 DermaDiv:SetLeft( DermaPanelLeft )
	 DermaDiv:SetRight( DermaPanelRight )
	 DermaDiv:SetRightMin( 200 )
	 DermaDiv:SetDividerWidth( 4 ) -- Set the divider width. Default is 8
     DermaDiv:SetLeftMin( 400 ) -- Set the Minimum width of left side
	 DermaDiv:SetLeftWidth( 400 )
	 DermaDiv.Paint = function( self, w, h )
	     draw.RoundedBox( 5, 5, 5, w, h, Color_Div )
     end
	 
	 local DermaButton = vgui.Create( "DButton", DermaPanelLeft )
	 DermaButton:SetText( "Click" )
	 DermaButton:CenterHorizontal()
	 DermaButton:SetPos( 170 ,320 )
	 DermaButton:SetSize( 60, 60 )
	 DermaButton.Paint = function( self, w, h )
	     draw.RoundedBox( 0, 0, 0, w, h, Color_Button ) -- Draw a blue button
     end
	 
	 local DermaLabel = vgui.Create( "DLabel", DermaPanelLeft )
	 DermaLabel:SetText(tostring(DermaFrame.Count))
	 DermaLabel:SetFont( "Font" ) 
	 DermaButton.DoClick = function()
	     DermaFrame.Count = DermaFrame.Count + 1
		 DermaLabel:SetText(tostring(DermaFrame.Count))
		 DermaLabel:SizeToContents()
		 DermaLabel:CenterHorizontal()
	     DermaLabel:CenterVertical()
     end
end

menup.drawer.add(MANIFEST.id, "Clicker Test", popup, "icon16/cursor.png")

return function()
    menup.drawer.del(MANIFEST.id)
end

