local composer = require( "composer" )
 
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
 --adding a button which brings back user from myDetails to Home.
local function Home ()	
composer.gotoScene("FirstScene",{effect = "slideLeft", time = 500})
end

--adding a button which brings user to complaint page
local function complaint_info()	
composer.gotoScene("complaint_info",{effect = "slideLeft", time = 500})
end

--adding a button which brings user to complaint page
local function complaint_unknown()	
composer.gotoScene("complaint_unknown",{effect = "slideLeft", time = 500})
end


local widget = require ("widget")

--create() 
function scene:create( event )
 
    local sceneGroup = self.view
	
	--showing a backgroynd
	bg=display.newRect(display.contentCenterX,display.contentCenterY,display.contentWidth,display.contentHeight)
	bg:setFillColor( 1,1 , 1)
	
	bg2=display.newRect(display.contentCenterX, 0,display.contentWidth,65)
	bg2:setFillColor(0.823529 ,0.411765 ,0.117647)
	sceneGroup:insert(bg)
	sceneGroup:insert(bg2)
	
	
	HomeImage = display.newImage("HomeIcon.png", 280, 20 )
	sceneGroup:insert(HomeImage)
	HomeImage:addEventListener("tap", Home)
	
    -- Code here runs when the scene is first created but has not yet appeared on screen
	head = display.newText("Make a complaint", display.contentCenterX*0.90,display.contentCenterY*0.05,"Arial",26)
	head:setFillColor(1,1,1)
	sceneGroup:insert(head)
	
	--creating buttons for complaint 
	--creating button for known breaches
	breaches = widget.newButton(
	{
		id = "breach",
		label = "Breaches from government \n       or private agencies",
		onEvent = myeventListener,
		fontSize = 24,
		emboss = false,
		left = 10,
		top = 120,
		shape = "roundedRect",
		width = 300,
		height = 60,
		fillColor = { default = { 1, 0.7, 0.5}, over = { 1, 0.7, 0.5} }		
	}
	)
	sceneGroup:insert(breaches)
	breaches:addEventListener ("touch", complaint_info)
	
	--creating button for unknown breaches
	UnknownBreaches = widget.newButton(
	{
		id = "unknownBreaches",
		label = "Breaches from unknown \n              sources",
		onEvent = myeventListener,
		fontSize = 24,
		emboss = false,
		left = 10,
		top = 280,
		shape = "roundedRect",
		width = 300,
		height = 60,
		fillColor = { default = { 1, 0.7, 0.5}, over = { 1, 0.7, 0.5} }
	}
	)
	sceneGroup:insert(UnknownBreaches)
	UnknownBreaches:addEventListener ("touch", complaint_unknown)	
	
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

