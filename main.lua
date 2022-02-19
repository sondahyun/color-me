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
	--서유리
	--타이틀 음악을 다현
	--local titleMusic = audio.loadStream( "음악/타이틀.mp3" )
   -- audio.play(titleMusic)

    audio.play(titleMusic)

	composer.gotoScene( "viewmonth4_event" )
end

local function onSecondView( event )
	composer.gotoScene( "view00Room" )
end

local function on3View( event )
	composer.gotoScene( "store" )
end



onFirstView()	-- invoke first tab button's onPress event manually
--수정끝