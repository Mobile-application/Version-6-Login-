local composer = require( "composer" )
 
 local sqlite3 = require( "sqlite3" )
local widget = require( "widget" )
 
local scene = composer.newScene()
 
 --sending user back to the Home Screen 
local function Back ()	
composer.gotoScene("Login",{effect = "slideLeft", time = 500})
end 

 	-- Open "data.db". If the file doesn't exist, it will be created
local path = system.pathForFile( "mob_database.db", system.DocumentsDirectory )
local db = sqlite3.open( path )
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
--Listner used

--input listener

local function inputListener( self, event )
   print("TextBox 1 input listener event @ ", system.getTimer())
   for k,v in pairs(event) do
      print(k,v)
   end   
   print("-----------------------------------------------\n")
end

-- Handle the "applicationExit" event to close the database
local function onSystemEvent( event )
    if ( event.type == "applicationExit" ) then             
        db:close()
    end
end
  

-- Setup the event listener to catch "applicationExit"
Runtime:addEventListener( "system", onSystemEvent )

--creating textbox
local NameBox
 
local function textListener( event )
 
    if ( event.phase == "began" ) then
        -- User begins editing "NameBox"
 
    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
        -- Output resulting text from "NameBox"
        print( event.target.text )
 
    elseif ( event.phase == "editing" ) then
        print( event.newCharacters )
        print( event.oldText )
        print( event.startPosition )
        print( event.text )
    end
end
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
 
--handle button event
-- Function to handle button events
local function handleButtonLoginEvent( event )
 
    if ( "ended" == event.phase ) then
	--hiding Display
	RegisterDisplay.alpha=0
		composer.gotoScene("Login",{effect = "slideLeft", time = 500})
	end
end
 
--handle button event
-- Function to handle button events
local function handleButtonEvent( event )
 
    if ( "ended" == event.phase ) then
		-- Open the database for access
		local db = sqlite3.open( path )
		local tablefill = [[INSERT INTO Mobile VALUES (']]..NameBox.text..[[',']]..NumberBox.text..[[',']]..EmailBox.text..[['); ]]
		db:exec( tablefill )
		
		--composer.gotoScene( "sample" , { effect="fade", time=500 })
        print( "New Details inserted into the Database" )
		
	     if( NameBox.text=="" or NumberBox.text=="" or EmailBox.text=="") then
				
				WDetails = display.newText( "Please enter details!",display.contentCenterX,display.contentCenterY*0.30, native.systemFont, 20 )
				WDetails:setFillColor(1,0,1)
				sceneGroup:insert(WDetails)
		else 
		composer.gotoScene( "FirstScene" , { effect="fade", time=500 })		
		--RegisterDisplay = display.newText( "User Registered", 155, 210, native.systemFont, 30 )
		
		--NameBox.isEditable = false
		
		--hiding the form once user successfully Registered
		Welcome.alpha=0
		Name.alpha=0
		NameBox.isVisible=false
		number.alpha=0
		NumberBox.isVisible=false
		Email.alpha=0
		EmailBox.isVisible=false
		
		Submit.isVisible=false
		
		
		--Redirecting user to the Login Page
		-- Create the widget
	LoginNow = widget.newButton(
		{
			left = 90,
			top = 300,
			shape = "roundedRect",
			width = 150,
			height = 40,
			cornerRadius = 2,
			id = "LoginNow",
			label = "LoginNow",
			onEvent = handleButtonLoginEvent
		}
	)
	sceneGroup:insert(LoginNow)
    end
	end
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

	
		--adding background
	background = display.newImage( "background3.png", display.contentCenterX, display.contentCenterY )
	sceneGroup:insert(background)
	
	--Adding Welcome Message
	Welcome = display.newText("Fill Form",display.contentCenterX,display.contentCenterY*0.10, "Comic Sans MS", 40)
	sceneGroup:insert(Welcome)
	
    -- Code here runs when the scene is first created but has not yet appeared on screen
	--name of the textbox name
	Name = display.newText( "Name:", 68, 130, native.systemFont, 20 )
	Name:setFillColor( 1, 0, 0 )

	sceneGroup:insert(Name)
	-- Create text box
	NameBox = native.newTextBox( 220, 130, 180, 50 )
	--NameBox.text = "This is line 1.\nAnd this is line2"
	NameBox.size = 16
	NameBox.isEditable = true

	NameBox.userInput = inputListener
	NameBox:addEventListener( "userInput" )
	sceneGroup:insert(NameBox)




	 --name of the textbox number
	number = display.newText( "Number:", 68, 250, native.systemFont, 20 )
	number:setFillColor( 1, 0, 0 )
	sceneGroup:insert(number)
	-- Create text box
	NumberBox = native.newTextBox( 220, 250, 180, 50 )
	--NameBox.text = "This is line 1.\nAnd this is line2"
	NumberBox.size = 16
	NumberBox.isEditable = true
	NumberBox.userInput = inputListener
	NumberBox:addEventListener( "userInput" )
	sceneGroup:insert(NumberBox)
	NameBox:addEventListener( "userInput", textListener )

 
 
	 --name of the textbox Email
	Email = display.newText( "Email:", 68, 365, native.systemFont, 20 )
	Email:setFillColor( 1, 0, 0 )
	sceneGroup:insert(Email)
	-- Create text box
	EmailBox = native.newTextBox( 220, 365, 180, 50 )
	--NameBox.text = "This is line 1.\nAnd this is line2"
	EmailBox.size = 16
	EmailBox.isEditable = true
	EmailBox.userInput = inputListener
	EmailBox:addEventListener( "userInput" )
	sceneGroup:insert(EmailBox)
	NameBox:addEventListener( "userInput", textListener ) 



--Now we will make a button Register where user can cclick and register them selves
-- Create the widget
Submit = widget.newButton(
    {
        left = 100,
        top = 440,
		shape = "roundedRect",
        width = 150,
        height = 40,
        cornerRadius = 2,
        id = "Submit",
        label = "Submit",
        onEvent = handleButtonEvent
    }
)
sceneGroup:insert(Submit)
		--home icon to send user to the home screen
	BackImage = display.newImage("back.png", 40, 20 )
	sceneGroup:insert(BackImage)
	BackImage:addEventListener("tap", Back)
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
