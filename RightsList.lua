local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
 --adding a button which brings back user from myDetails to Home.
local function Home ()	
composer.gotoScene("FirstScene",{effect = "slideLeft", time = 500})
end

--sending user to Legal Rights file for description

--sending user to privacy_act file for a brief description about this act
local function privacy_act ()	
composer.gotoScene("privacy_act",{effect = "slideLeft", time = 500})
end

--sending user to telecommunication_act file for a brief description about this act
local function telecommunication_act ()	
composer.gotoScene("telecommunication_act",{effect = "slideLeft", time = 500})
end

--sending user to wa_act file for a brief description about this act
local function wa_act ()	
composer.gotoScene("wa_act",{effect = "slideLeft", time = 500})
end

--sending user to listening_act file for a brief description about this act
local function listening_act ()	
composer.gotoScene("listening_act",{effect = "slideLeft", time = 500})
end

--sending user to nsw_act file for a brief description about this act
local function nsw_act ()	
composer.gotoScene("nsw_act",{effect = "slideLeft", time = 500})
end

--sending user to nt_act file for a brief description about this act
local function nt_act ()	
composer.gotoScene("nt_act",{effect = "slideLeft", time = 500})
end

--sending user to qld_act file for a brief description about this act
local function qld_act ()	
composer.gotoScene("qld_act",{effect = "slideLeft", time = 500})
end

--sending user to tas_act file for a brief description about this act
local function tas_act ()	
composer.gotoScene("tas_act",{effect = "slideLeft", time = 500})
end


local widget = require ("widget")
local Privacy
local Telecommunication
local Freedom
local WA
local ACT
local NSW
local NT
local Qld
local Tas
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
	
	--showing a background
	background = display.newImage( "background3.png", display.contentCenterX, display.contentCenterY )
	sceneGroup:insert(background)
	
	HomeImage = display.newImage("HomeIcon.png", 280, 20 )
	sceneGroup:insert(HomeImage)
	HomeImage:addEventListener("tap", Home)
	
    -- Code here runs when the scene is first created but has not yet appeared on screen
	head = display.newText("Legal Rights Information", display.contentCenterX*0.90,display.contentCenterY*0.10,"Arial",20)
	head:setFillColor(1,0,0)
	sceneGroup:insert(head)
	
	--creating buttons for all legal rights
	-- creating button for privacy_act
	Privacy = widget.newButton(
	{
		id = "Privacy",
		label = "Privacy Act - Privacy Act 1988 (Cth)",
		onEvent = myeventListener,
		emboss = false,
		left = 20,
		top = 80,
		fontSize = 16.5,
		shape = "roundedRect",
		width = 270,
		height = 30,
		fillColor = { default = { 1, 0.7, 0.5}, over = { 1, 0.7, 0.5} }
	}
	)
	sceneGroup:insert(Privacy)
	Privacy:addEventListener ("touch", privacy_act)
	
	-- creating button for telecommunication_act
	Telecommunication = widget.newButton(
	{
		id = "Telecommunication",
		label = "Telecommunication  (interception and  \n     access) act 1979",
		onEvent = myeventListener,
		emboss = false,
		left = 20,
		top = 118,
		fontSize = 16.5,
		shape = "roundedRect",
		width = 290,
		height = 30,
		fillColor = { default = { 1, 0.7, 0.5}, over = { 1, 0.7, 0.5} }
	}
	)
	sceneGroup:insert(Telecommunication)
	Telecommunication:addEventListener ("touch", telecommunication_act)	
	
	-- creating button for wa_act
	WA = widget.newButton(
	{
		id = "WA",
		label = "The Surveillance Device Act 1998 (WA)",
		onEvent = myeventListener,
		emboss = false,
		left = 20,
		top = 160,
		fontSize = 16.5,
		shape = "roundedRect",
		width = 300,
		height = 30,
		fillColor = { default = { 1, 0.7, 0.5}, over = { 1, 0.7, 0.5} }
	}
	)
	sceneGroup:insert(WA)
	WA:addEventListener ("touch", wa_act)
	
	-- creating button for listening_act
	ACT = widget.newButton(
	{
		id = "ACT",
		label = "The Listening Devices Act 1992 (ACT)",
		onEvent = myeventListener,
		emboss = false,
		left = 20,
		top = 200,
		fontSize = 16.5,
		shape = "roundedRect",
		width = 290,
		height = 30,
		fillColor = { default = { 1, 0.7, 0.5}, over = { 1, 0.7, 0.5} }
	}
	)
	sceneGroup:insert(ACT)
	ACT:addEventListener ("touch", listening_act)

	-- creating button for nsw_act
	NSW = widget.newButton(
	{
		id = "NSW",
		label = "The Surveillance Devices Act 2007 (NSW)",
		onEvent = myeventListener,
		emboss = false,
		left = 20,
		top = 240,fontSize = 16.5,
		shape = "roundedRect",
		width = 320,
		height = 30,
		fillColor = { default = { 1, 0.7, 0.5}, over = { 1, 0.7, 0.5} }
	}
	)
	sceneGroup:insert(NSW)
	NSW:addEventListener ("touch", nsw_act)
	
	-- creating button for nt_act
	NT = widget.newButton(
	{
		id = "NT",
		label = "The Surveillance Devices Act 2007 (NT)",
		onEvent = myeventListener,
		emboss = false,
		left = 20,
		top = 280,
		fontSize = 16.5,
		shape = "roundedRect",
		width = 300,
		height = 30,
		fillColor = { default = { 1, 0.7, 0.5}, over = { 1, 0.7, 0.5} }
	}
	)
	sceneGroup:insert(NT)
	NT:addEventListener ("touch", nt_act)
	
	-- creating button for qld_act
	Qld = widget.newButton(
	{
		id = "Qld",
		label = "The Invasion of Privacy Act 1971 (Qld)",
		onEvent = myeventListener,
		emboss = false,
		left = 20,
		top = 320,
		fontSize = 16.5,
		shape = "roundedRect",
		width = 290,
		height = 30,
		fillColor = { default = { 1, 0.7, 0.5}, over = { 1, 0.7, 0.5} }
	}
	)
	sceneGroup:insert(Qld)
	Qld:addEventListener ("touch", qld_act)
		
	-- creating button for tas_act		
	Tas = widget.newButton(
	{
		id = "Tas",
		label = "The Surveillance Devices Act 1991 (Tas)",
		onEvent = myeventListener,
		emboss = false,
		left = 20,
		top = 360,
		fontSize = 16.5,
		shape = "roundedRect",
		width = 300,
		height = 30,
		fillColor = { default = { 1, 0.7, 0.5}, over = { 1, 0.7, 0.5} }
	}
	)
	sceneGroup:insert(Tas)
	Tas:addEventListener ("touch", tas_act)
	
				
end

 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene

