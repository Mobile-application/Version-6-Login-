composer = require( "composer" )
 
local scene = composer.newScene()
 
local function Home ()	
composer.gotoScene("FirstScene",{effect = "slideLeft", time = 500})

end



--Adding Welcome message
--local function header
--display.newText("Welcome",display.contentCenterX,display.contentCenterY, "Comic Sans MS", 50)
--end
--header()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
local widget = require ("widget")


local function complaint ()	
	composer.gotoScene("Complaint",{effect = "slideLeft", time = 500})
end




local function hyperLink()
  system.openURL("https://report.acorn.gov.au")
end
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
	
	--adding background
	bg=display.newRect(display.contentCenterX,display.contentCenterY,display.contentWidth,display.contentHeight)
	bg:setFillColor( 1,1 , 1)
	
	bg2=display.newRect(display.contentCenterX, 0,display.contentWidth,65)
	bg2:setFillColor(0.823529 ,0.411765 ,0.117647)
	sceneGroup:insert(bg)
	sceneGroup:insert(bg2)
	
	HomeImage = display.newImage("HomeIcon.png", 280, -7 )
	sceneGroup:insert(HomeImage)
	HomeImage:addEventListener("tap", Home)
	
	
	backImage = display.newImage("back.png", 30, -7 )
	--backImage:translate(140,450)
	sceneGroup:insert(backImage)
	backImage:addEventListener("tap", complaint)
	
	head = display.newText("Complaint", display.contentCenterX*0.90,display.contentCenterY*0.05,"Arial",25)
	head:setFillColor(1,1,1)
	sceneGroup:insert(head)
	
	-- Path for the file to read
local path = system.pathForFile( "file2.txt", system.ResourceDirectory )
 
-- Open the file handle
local file, errorString = io.open( path, "r" )
if not file then
		-- Error occurred; output the cause
		print( "File error: " .. errorString )
	else
		-- Output lines
		for line in file:lines() do
		
			print( line )
			
			local surveyText = {
			   text =  line,
	           x = display.contentCenterX,
			   y = display.contentCenterX,
			   fontSize = native.SystemFont,
			   width = 280,
			   height = 220,
			   align = "left"
			}
			local textBox = display.newText( surveyText)
			textBox:setFillColor(0,0,0)
			sceneGroup:insert(textBox)
		end
		-- Close the file handle
		io.close( file )
	end

	
	local surveyLink = widget.newButton(
	{
		id = "link",
		label = "Click here to make\n      a complaint",
		onEvent = myeventListener,
		emboss = false,
		x = display.contentCenterX,
		y = 300,
		shape = "roundedRect",
		fillColor = { default = { 1, 0.7, 0.5}, over = { 1, 0.7, 0.5} }
	}
	)
	sceneGroup:insert(surveyLink)
	surveyLink:addEventListener ("tap", hyperLink)
	

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