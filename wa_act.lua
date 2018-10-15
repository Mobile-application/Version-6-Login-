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

--link for more info
local function hyperLink()
  system.openURL("https://www.legislation.wa.gov.au/legislation/prod/filestore.nsf/FileURL/mrdoc_27928.pdf/$FILE/Surveillance%20Devices%20Act%201998%20-%20%5B02-f0-02%5D.pdf?OpenElement")
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
 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 local bg
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
	bg=display.newRect(display.contentCenterX,display.contentCenterY,display.contentWidth,display.contentHeight)
	bg:setFillColor( 0.823529 ,0.411765 ,0.117647)
	sceneGroup:insert(bg)
	
	--title of the scene LR2
	heading = [[The Surveillance Device 
		Act 1998 (WA) ]]
	head = display.newText(heading, display.contentCenterX*1.0,display.contentCenterY*0.14,"Arial",18)
	sceneGroup:insert(head)
	
	--home icon to send user to the home screen
	HomeImage = display.newImage("HomeIcon.png", 280, 20 )
	sceneGroup:insert(HomeImage)
	HomeImage:addEventListener("tap", Home)
	
	--sending user back to the previous screeen icon
	BackImage = display.newImage("back.png", 25, 20 )
	sceneGroup:insert(BackImage)
	BackImage:addEventListener("tap", back)
	
	
	--Display link for LR3
	
	local Link = widget.newButton(
	{
		id = "link",
		label = "Read Online",
		width='98',
		height='26',
		onEvent = myeventListener,
		emboss = false,
		x = display.contentCenterX*0.90,
		y = display.contentCenterY*0.29,
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
			top = 88,
			left = 0,
			width = display.contentWidth,
			height = display.contentHeight,
			topPadding = 525,
			bottomPadding = 0,
			horizontalScrollDisabled = true,
			verticalScrollDisabled = false,
			listener = scrollListener,
		}
	)
	sceneGroup:insert(scrollView)
	
	local text = [[
											
	DESCRIPTION OF THE ACT:
	This act talks about your rights in relation to being recorded or tracked without your
	consent.
	
	DEFINITION OF LISTENING DEVICE:
	Private activity refers to activities where it is obvious that the individuals do not
	want others to observe them, which is not in a public area. If it is reasonable to
	expect that the activity could be observed naturally, it is not private.
	
	Private conversations are similar, if it is obvious that the individuals do not want
	others to listen to them, and it is not a public area, and it is not reasonable to
	expect that the conversations could be heard naturally it is a private
	conversation.

	OVERVIEW OF THE ACT:
	These laws do not apply to police officers, or people working for the police. They
	also do not apply if consent is given, or if the installation of a surveillance device
	is for the benefit of the person (security devices).
	
	Listening devices may not be installed to listen to private conversations when the
	individual is not aware the conversation is being recorded.
	
	Cameras may not be installed to record or observe any private activity, unless
	consent is obtained

	The same applies to tracking devices.
	
	Surveillance devices may be used when a court has decided there is suspicion of
	a crime.
	
	If private information has been gained as a result of an illegal surveillance, they
	are not permitted to publish or pass on this information.
	
	Listening devices and cameras may be used if the matter is understood to be a
	matter of urgent public interest, but must report to a judge quickly as to why a
	device was used. Further from this, recordings may be published if a judge
	agrees it is in the best for public interest.
	
	YOUR OVERALL RIGHTS:
	Private conversations or activity may not be recorded unless consent is given, and
	tracking devices cannot be placed unless it is done by a police officer.
	
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