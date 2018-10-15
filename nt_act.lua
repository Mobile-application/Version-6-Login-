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
  system.openURL("https://legislation.nt.gov.au/en/Legislation/SURVEILLANCE-DEVICES-ACT")
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
				Act 2007 (NT) ]]
	head = display.newText(heading, display.contentCenterX*1.0,display.contentCenterY*0.15,"Arial",17)
	sceneGroup:insert(head)
	
	--home icon to send user to the home screen
	HomeImage = display.newImage("HomeIcon.png", 280, 20 )
	sceneGroup:insert(HomeImage)
	HomeImage:addEventListener("tap", Home)
	
	--sending user back to the previous screeen icon
	BackImage = display.newImage("back.png", 25, 20 )
	sceneGroup:insert(BackImage)
	BackImage:addEventListener("tap", back)
	
	
	--Display link for LR6
	
	local Link = widget.newButton(
	{
		id = "link",
		label = "Read Online",
		width='98',
		height='30',
		onEvent = myeventListener,
		emboss = false,
		x = display.contentCenterX*0.90,
		y = display.contentCenterY*0.30,
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
			top = 90,
			left = 0,
			width = display.contentWidth,
			height = display.contentHeight,
			topPadding = 750,
			bottomPadding = 0,
			horizontalScrollDisabled = true,
			verticalScrollDisabled = false,
			listener = scrollListener,
		}
	)
	sceneGroup:insert(scrollView)
	
	local text = [[
											
	DESCRIPTION OF THE ACT:
	An Act to regulate the installation, use, maintenance and retrieval of surveillance
	devices in Northern Territory.
	
	DEFINITION OF LISTENING DEVICE:
	An electronic device used for secretly listening to or recording someone’s conversations
	For example, handheld devices such as mobile phones and tablets, which have inbuilt audio
	recording capabilities; voice recorders/dictation equipment, audio bug surveillance
	devices.
	
	DEFINITION OF OPTICAL SURVEILLANCE DEVICE:
	Any device capable of being used to record visually or observe an activity
	For example, handheld devices such as mobile phones and tablets with a camera, cameras,
	binoculars, ‘spy cameras.
	
	
	OVERVIEW OF THE ACT:
	Part 2 of the Act outlines the regulation of installation, use and maintenance of
	surveillance devices.
	
	Section 11 and 12 of Part 2 includes information on the installation, use and maintenance
	of listening devices and of optical surveillance devices.
	
	The Act states that it is an offence for a person who is not a party to a private conversation to
	intentionally use a listening device to listen or record that private conversation.
	
	However, it is also an offence for a person to do so if they are a party to a private
	conversation.

	So, listening devices cannot be used to listen to or record private conversations but can be
	used to listen to or record public conversations.

	The Act also states that it is an offence to intentionally record visually or observe a person
	and or the carrying on by a person of an activity by knowingly installing, using or maintaining
	an optical surveillance device on or within a premises/ a vehicle or on any other object
	
	So, it is an offence to use an optical surveillance device if it involves entering the
	premises/vehicle without that person’s consent and if it involves interfering with a person’s
	vehicle or object (e.g. phone or laptop) without their consent

	YOUR OVERALL RIGHTS:
	It is illegal for someone to record or listen to your private conversations using a listening
	device.
	
	This includes someone hacking into your own personal mobile phone to record or listen to
	your private conversations.
	     It is illegal for someone to visually record or observe you using an optical surveillance
	device.
	
	This includes someone hacking into the camera or webcam of your laptop or mobile phone to visually record or observe you.
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