-----------------------------------------------------------------------------------------
--
-- main.lua 
-----------------------------------------------------------------------------------------

-- show default status bar (iOS)
display.setStatusBar( display.DefaultStatusBar )

-- include Corona's "widget" library
local widget = require "widget"
local composer = require "composer"


-- event listeners for tab buttons:
local function onFirstView( event )
    audio.play(titleMusic)

	composer.gotoScene( "view21card" )
end

local function onSecondView( event )
	composer.gotoScene( "view00Room" )
end

local function on3View( event )
	composer.gotoScene( "store" )
end



onFirstView()	-- invoke first tab button's onPress event manually
--수정끝