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

--link for brief description about this right
local function hyperLink()
  system.openURL("https://www.legislation.act.gov.au/View/a/1992-57/current/PDF/1992-57.PDF")
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
	heading = [[The Listening Devices Act
				1992 (ACT) ]]
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
	
	--Display link for LR4
	
	local Link = widget.newButton(
	{
		id = "link",
		label = "Read Online",
		width='98',
		height='30',
		onEvent = myeventListener,
		emboss = false,
		x = display.contentCenterX*0.90,
		y = display.contentCenterY*0.31,
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
			top = 95,
			left = 0,
			width = display.contentWidth,
			height = display.contentHeight,
			topPadding = 340,
			bottomPadding = 0,
			horizontalScrollDisabled = true,
			verticalScrollDisabled = false,
			listener = scrollListener,
		}
	)
	sceneGroup:insert(scrollView)
	
	local text = [[
											
	DESCRIPTION OF THE ACT:
	 An Act to regulate the use of listening devices for the purpose of listening to or recording private conversations in the Australian Capital Territory.
	 
	DEFINITION OF LISTENING DEVICE:
	An electronic device used for secretly listening to or recording someone’s conversations. 
	For example, handheld devices such as mobile phones and tablets, which have inbuilt audio recording capabilities; voice recorders/dictation equipment, audio bug surveillance devices.
	
	OVERVIEW OF THE ACT:
	Part 2, section 4 of the Act outlines when it is an offence to use a listening device
	It states that it is an offence for a person who is not a party to a private conversation to intentionally use a listening device to listen or record that private conversation.
	However, it is also an offence for a person to do so if they are a party to a private conversation.
	So, listening devices cannot be used to listen to or record private conversations but can be used to listen to or record public conversations.
	
	YOUR OVERALL RIGHTS:
	It is illegal for someone to record or listen to your private conversations using a listening device. 
	This includes someone hacking into your own personal mobile phone to record or listen to your private conversations"
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