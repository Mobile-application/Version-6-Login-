local composer = require( "composer" )
 
local scene = composer.newScene()

-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
	local function ShowFile()
		-- Path for the file to read
		local path = system.pathForFile( "file.txt", system.ResourceDirectory )
		 sceneGroup:insert(path)
		-- Open the file handle
		local file, errorString = io.open( path, "r" )
		 
		if not file then
			-- Error occurred; output the cause
			print( "File error: " .. errorString )
		else
			-- Output lines
			for line in file:lines() do
			
				print( line )
				
				local options = {
				   text = line,
				   x = display.contentCenterX,
				   y = display.contentCenterY,
				   fontSize = 24,
				   width = 280,
				   height = 329,
				   align = "left"
				}
				sceneGroup:insert(options)
				sceneGroup:insert(line)
				
				local textBox = display.newText( options )
				display.setDefault( "background", 1, 1, 1 )
				textBox:setFillColor( 0, 0, 0 )
				sceneGroup:insert(textBox)
				--display.newText(line,150,150,"Arial",20)

			end
			-- Close the file handle
			io.close( file )
	end
	sceneGroup:insert(ShowFile())
	
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



	 
end
