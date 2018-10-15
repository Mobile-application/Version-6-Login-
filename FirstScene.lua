local composer = require( "composer" )
 
local scene = composer.newScene()
 


--Adding Welcome message
--local function header()
--display.newText("Welcome",display.contentCenterX,display.contentCenterY, "Comic Sans MS", 50)
--end
--header()

local Welcome
local myImage

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
local function newscene()
  composer.gotoScene("RightsList",{effect = "slideLeft", time = 500})
end
--function to redirect user to complaint file
local function complaint()
  composer.gotoScene("Complaint",{effect = "slideLeft", time = 500})
end 


 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
	
	--adding background
	background = display.newImage( "background3.png", display.contentCenterX, display.contentCenterY )
	sceneGroup:insert(background)
	
	--Adding Welcome Message
	Welcome = display.newText("Monitoring App",display.contentCenterX,display.contentCenterY*0.40, "Comic Sans MS", 40)
	sceneGroup:insert(Welcome)
	--Displaying Legal Rights Text and icon
	LegalRghts = display.newText("Legal Rights",display.contentCenterX*0.90,display.contentCenterY*2.0, "Comic Sans MS", 25)
	sceneGroup:insert(LegalRghts)
	myImage = display.newImage("Contact3.png", 140, 445 )
	sceneGroup:insert(myImage)
	myImage:addEventListener("tap", newscene)
	
	--Displaying Complaint icon and text
	Complaint = display.newText("Complaint",display.contentCenterX*1.35,display.contentCenterY*1.27, "Comic Sans MS", 25)
	sceneGroup:insert(Complaint)
	myImage = display.newImage("Contact6.png", display.contentCenterX*1.40, display.contentCenterY*1.1 )
	sceneGroup:insert(myImage)
	myImage:addEventListener("tap", complaint)


	--Adding Timer in this app which display how long a user is seing the app
	
	--sceneGroup:insert(Timer)
	
 
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


