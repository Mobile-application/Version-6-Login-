-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

local sqlite3 = require( "sqlite3" )
local widget = require( "widget" )
 


-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
 
--input listener

local function inputListener( self, event )
   print("TextBox 1 input listener event @ ", system.getTimer())
   for k,v in pairs(event) do
      print(k,v)
   end   
   print("-----------------------------------------------\n")
end

-- create()
function scene:create( event )
	
    local sceneGroup = self.view
	
	--adding background
	background = display.newImage( "background3.png", display.contentCenterX, display.contentCenterY )
	sceneGroup:insert(background)
	
	--Adding Welcome Message
	Welcome = display.newText("Monitoring App",display.contentCenterX,display.contentCenterY*0.40, "Comic Sans MS", 40)
	sceneGroup:insert(Welcome)
	
	-- Open "data.db". If the file doesn't exist, it will be created
	local path = system.pathForFile( "mob_database.db", system.DocumentsDirectory )
	local db = sqlite3.open( path )   
 
	-- Handle the "applicationExit" event to close the database
	local function onSystemEvent( event )
		if ( event.type == "applicationExit" ) then             
			db:close()
		end
end
  
-- Set up the table if it doesn't exist
local tablesetup = [[CREATE TABLE IF NOT EXISTS Mobile ( Name PRIMARY KEY,Number,Email);]]
print( tablesetup )
db:exec( tablesetup )
 

-- Print the table contents
for row in db:nrows("SELECT * FROM Mobile") do
    local text = row.Name .. " " .. row.Number.." "..row.Email
    --local t = display.newText( text, 20, 30*row.id, nil, 16 )
    --t:setFillColor( 1, 1, 1 )
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
 
 --name of the textbox name
local username = display.newText( "Name:", 84, 200, native.systemFont, 20 )
username:setFillColor( 1, 0, 0 )

sceneGroup:insert(username)
-- Create text box
NameBox = native.newTextBox( 220, 200, 170, 50 )
--NameBox.text = "This is line 1.\nAnd this is line2"
NameBox.size = 16
NameBox.isEditable = true

NameBox.userInput = inputListener
NameBox:addEventListener( "userInput" )
sceneGroup:insert(NameBox)

 --name of the textbox number
number = display.newText( "Number:", 90, 300, native.systemFont, 20 )
number:setFillColor( 1, 0, 0 )
sceneGroup:insert(number)
-- Create text box
NumberBox = native.newTextBox( 220, 300, 170, 50 )
--NameBox.text = "This is line 1.\nAnd this is line2"
NumberBox.size = 16
NumberBox.isEditable = true
NumberBox.userInput = inputListener
NumberBox:addEventListener( "userInput" )
sceneGroup:insert(NumberBox)
NameBox:addEventListener( "userInput", textListener )

   
--creating button to enter
local function newscene()
  composer.gotoScene("main",{effect = "slideLeft", time = 500})
end

--redirect user to register page
local function RegesterScene()
  composer.gotoScene("register",{effect = "slideLeft", time = 500})
end


-- Function to handle button events
local function handleButtonEvent( event )
 
    if ( "ended" == event.phase ) then
		
		local path = system.pathForFile( "mob_database.db", system.DocumentsDirectory )

		-- Open the database for access
		local db = sqlite3.open( path )
		--Creating an empty table
		local Mob={}
		--		Mobile1= db:nrows("SELECT * FROM Mobile")
		for row in db:nrows("SELECT * FROM Mobile") do
			print("N:",row.Name)
			if
			( NameBox.text=="" or NumberBox.text=="") or (NameBox.text==row.Name and NumberBox.text~=row.Number)  then
				WrongDetails = display.newText( "Wrong Details, Try again", 130, 140, native.systemFont, 14 )
				WrongDetails:setFillColor(1,0,0)
				sceneGroup:insert(WrongDetails)
			
				elseif 
				( NameBox.text==row.Name and NumberBox.text==row.Number) then
				
				NameBox.isVisible = false
				NumberBox.isVisible = false
				
				
				composer.gotoScene( "FirstScene" , { effect="fade", time=500 })
				
		
			      
			end
		end
			
        print( "Button was pressed and released Successfully" )
    end
end
 
-- Create the widget
local button1 = widget.newButton(
    {
        left = 100,
        top = 350,
        id = "button1",
		defaultFile = "LoginButton.png",
        --label = "Login",
        onEvent = handleButtonEvent
    }
)
sceneGroup:insert(button1)
 


--butten to redirect user to register page
 -- Create the widget
local Register = widget.newButton(
    {
        left = 90,
        top = 470,
		shape = "roundedRect",
        width = 150,
        height = 40,
        cornerRadius = 2,
		strokeColor = { default={192,192,192}, over={0.2,0.2,1,1} },
        strokeWidth = 2,
        id = "register",
        label = "Register",
		fillColor = {default={1,0.1,0.7,0.4}, over={1,1,1,1} }
        
    }
)
Register:setFillColor(176,196,222)
Register:addEventListener ("touch", RegesterScene)
sceneGroup:insert(Register)

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





