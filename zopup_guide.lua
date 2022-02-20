-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local loadsave = require( "loadsave" )
local json = require( "json" )

function scene:create( event )
	local sceneGroup = self.view
	local loadedSettings = loadsave.loadTable( "settings.json" )
	
	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.


	local black = display.newRect(display.contentWidth/2,display.contentHeight/2,display.contentWidth,display.contentHeight)
	black.alpha = 0.5
	black:setFillColor(0)
	sceneGroup:insert(black)

	local function go_back(event)
		if event.phase == "began" then
			composer.hideOverlay("zopup_guide")
		end
	end

	local tutorial = {}

	for i=1,9 do 
		tutorial[i] = display.newImage("이미지/스케줄/가이드/홈_게임방법가이드" .. i .. ".png")
		tutorial[i].x, tutorial[i].y = display.contentWidth/2, display.contentHeight/2
		--tutorial[i].anchorX,tutorial[i].anchorY = 0,0
		sceneGroup:insert(tutorial[i])
		tutorial[i].alpha=0
	end

	tutorial[1].alpha = 1



	-- 장면 넘김
	local i = 1

	-- 다음 장면 넘김
	local function next(event)
		if event.phase == "began" then 
			if i < 9 then
				i = i+1
				tutorial[i-1].alpha = 0
				tutorial[i].alpha = 1

			end
		end
	end

	-- 이전 장면 되돌아가기
	local function former(event)
		if event.phase == "began" then 
			if i > 1 then
				i = i-1
				tutorial[i+1].alpha = 0
				tutorial[i].alpha = 1

			end
		end
	end
	

	-- 기본 값.

	-- 다음 장면 버튼
	local move= display.newImage("이미지/스케줄/가이드/오른쪽.png")
	move.x, move.y = display.contentWidth*0.8, display.contentHeight/2
	move:addEventListener("touch",next)
	sceneGroup:insert(move)
	
	-- 이전 장면 버튼
	local move1= display.newImage("이미지/스케줄/가이드/왼쪽.png")
	move1.x, move1.y = display.contentWidth*0.2, display.contentHeight/2
	move1:addEventListener("touch",former)
	sceneGroup:insert(move1)

	local exit = display.newImage("이미지/공통/x버튼.png")
	exit.x, exit.y = display.contentWidth*0.76, display.contentHeight*0.27
	sceneGroup:insert(exit)
	exit:addEventListener("touch",go_back)

	
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
