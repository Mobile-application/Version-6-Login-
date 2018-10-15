-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()
local widget = require( "widget" )
 
--sending user back to the Home Screen 
local function Home ()	
composer.gotoScene("FirstScene",{effect = "slideLeft", time = 500})

end 

--sending user back to the previous screen
local function back ()	
composer.gotoScene("RightsList",{effect = "slideRight", time = 500})

end 
 -- ScrollView listener
local function scrollListener( event )
 
    local phase = event.phase
    local direction = event.direction
	
	-- If the scrollview has reached it's scroll limit.
	if event.limitReached then
		if "up"== direction then
			print("Reached Top Limit")
		elseif "down" == direction then
			print("Reached Bottom Limit")
		end
	end
	
	return true
end
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 --link for brief description about this right
local function hyperLink()
  system.openURL("https://www.legislation.tas.gov.au/view/whole/html/inforce/current/act-1991-021")
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 local bg
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
	bg=display.newRect(display.contentCenterX,display.contentCenterY,display.contentWidth,display.contentHeight)
	bg:setFillColor(0.823529 ,0.411765 ,0.117647)
	sceneGroup:insert(bg)
	
	--title of the scene LR2
	heading = [[The Surveillance Devices
				Act 1991 (Tas) ]]
	head = display.newText(heading, display.contentCenterX*1.0,display.contentCenterY*0.15,"Arial",18)
	sceneGroup:insert(head)
	
	--home icon to send user to the home screen
	HomeImage = display.newImage("HomeIcon.png", 280, 20 )
	sceneGroup:insert(HomeImage)
	HomeImage:addEventListener("tap", Home)
	
	--sending user back to the previous screeen icon
	BackImage = display.newImage("back.png", 25, 20 )
	sceneGroup:insert(BackImage)
	BackImage:addEventListener("tap", back)
	
	
	--Display link for LR1
	
	local Link = widget.newButton(
	{
		id = "link",
		label = "Read Online",
		width='98',
		height='30',
		onEvent = myeventListener,
		emboss = false,
		x = display.contentCenterX*0.90,
		y = display.contentCenterY*0.33,
		shape = "roundedRect",

	}
	)
	
	Link:setFillColor( 0.854902, 0.647059, 0.12549 )
	Link:setStrokeColor( 1, 0, 0 )
	sceneGroup:insert(Link)
	Link:addEventListener("tap", hyperLink)
	
	-- Create the widget for scroll view
	local scrollView = widget.newScrollView(
		{
			top = 99,
			left = 0,
			width = display.contentWidth,
			height = display.contentHeight,
			topPadding = 390,
			bottomPadding = 0,
			horizontalScrollDisabled = true,
			verticalScrollDisabled = false,
			listener = scrollListener,
		}
	)
	sceneGroup:insert(scrollView)
	
	local text = [[
											
	DESCRIPTION OF THE ACT:
	The Listening Devices Act 1991 (Tas), regulates the use of listening devices in Tasmania.
	
	DEFINITIONS 
	A listening device means any apparatus capable of being used to record or listen to a
	private conversation concurrently with its taking place.
	
	For example these may include; handheld devices such as mobile phones, tablets, voice
	recorders/dictation equipment and audio bug surveillance devices.
	
	A conversation between two people at low volume in a busy park where there is no one
	close to them would be a private conversation as would be a conversation between two
	people taking place in a private home where they are alone would be a private
	conversation.

	OVERVIEW OF THE ACT
	Sections 3, 5 & 12 of the act outline:
			When it is an offence to use a listening device
			Defines the term ‘private conversation’
			The maximum penalty for using a listening device illegally

	YOUR OVERALL RIGHTS:
	It is an offence for a person to use a listening device to record or listen to a private
	conversation, whether or not that person is a party to the conversation.
	
	This includes the act of hacking into personal devices and accessing cameras and microphones.
	]]
local text = display.newText(text,0,0,270,0,"Helvetica", 14)
text:setTextColor(0)
text.x = display.contentCenterX
scrollView:insert(text)
	-- Code here runs when the scene is first created but has not yet appeared on screen
 
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