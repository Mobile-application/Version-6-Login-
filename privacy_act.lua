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
  system.openURL("https://www.legislation.gov.au/Details/C2014C00076")
end
 
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
	
	--title of the scene LR!
	head = display.newText("Privacy Act 1988(Cth)", display.contentCenterX*0.90,display.contentCenterY*0.10,"Arial",20)
	--head:setFillColor(1,0,0)
	sceneGroup:insert(head)
	
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
		y = display.contentCenterY*0.25,
		shape = "roundedRect",

	}
	)
	
	Link:setFillColor( 0.854902, 0.647059, 0.12549 )
	Link:setStrokeColor( 1, 0, 0 )
	sceneGroup:insert(Link)
	Link:addEventListener("tap", hyperLink)
	
	--home icon to send user to the home screen
	HomeImage = display.newImage("HomeIcon.png", 280, 20 )
	sceneGroup:insert(HomeImage)
	HomeImage:addEventListener("tap", Home)
	
	--sending user back to the previous screeen icon
	BackImage = display.newImage("back.png", 25, 20 )
	sceneGroup:insert(BackImage)
	BackImage:addEventListener("tap", back)
	
	-- Create the widget for scroll view
	local scrollView = widget.newScrollView(
		{
			top = 78,
			left = 0,
			width = display.contentWidth,
			height = display.contentHeight,
			topPadding = 580,
			bottomPadding = 50,
			horizontalScrollDisabled = true,
			verticalScrollDisabled = false,
			listener = scrollListener,
		}
	)
	sceneGroup:insert(scrollView)
	
	local text = [[
											
	DESCRIPTION OF THE ACT:
	This act applies to “APP entities”, which are agencies (federal government) or
	organisations. This act is in place in order to regulate what information can be collected,
	and how it can be stored.

	DEFINITION OF LISTENING DEVICE:
		APP entities:
			Agencies
				■ A minister of government (e.g. Michelle Roberts, minister for police)
				■ A government department (e.g. department of finance)
				■ A commonwealth appointed body or tribunal
				■ A body established by the governor-general or by a minister
				■ A federal court
				■ The Australian Federal Police
				■ A Norfolk Island Agency
				■ Some other agencies may be applicable under this act
			
			Organisations
				■ May refer to any companies, whether an individual, body corporate,
				partnership, unincorporated association or a trust.
				■ Does not refer to small businesses, who have an annual income of less
				than $3mil.
	OVERVIEW OF THE ACT:
	○ You may remain anonymous or use a fake name when dealing with an APP
entity
○ Personal, sensitive information can be collected, but only when the individual has
given consent (unless an exception applies).
○ An APP entity must inform you why the information is collected, who the
information is accessed by and how you can see or correct your information.
○ An APP entity cannot use your information for reasons outside of the original
purpose of the collection
○ An APP entity cannot use your information for marketing unless consented to or if
it is reasonably expected
○ APP entities cannot use or disclose any identifying information that has been
assigned by a government agency (e.g. drivers license number, medicare
number, passport number & tax file number).
○ APP entities must provide you with access to your personal information if
requested (unless an exception applies).

	YOUR OVERALL RIGHTS:
	In most cases you are not obliged to give information to APP entities, but if you do give
information, you are entitled to know what the information is for, and can request to
change or remove it.]]
local text = display.newText(text,0,0,270,0,"Helvetica", 14)
text:setTextColor(0)
text.x = display.contentCenterX
scrollView:insert(text)
 
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