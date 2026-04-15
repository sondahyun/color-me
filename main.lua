-----------------------------------------------------------------------------------------
-- main.lua
-- 게임 진입점: 타이틀 씬으로 이동
-----------------------------------------------------------------------------------------
local composer = require( "composer" )

display.setStatusBar( display.DefaultStatusBar )

-- letterbox 여백 색상을 흰색으로 설정 (기본 검정 제거)
display.setDefault( "background", 0.96, 0.94, 0.90 )

composer.gotoScene( "title" )