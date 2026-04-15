-----------------------------------------------------------------------------------------
-- main.lua
-- 게임 진입점: 타이틀 씬으로 이동
-----------------------------------------------------------------------------------------
local composer = require( "composer" )

display.setStatusBar( display.DefaultStatusBar )

composer.gotoScene( "title" )