-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
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
			composer.hideOverlay("view02schedule_end")
		end
	end

	local exit = display.newImage("이미지/스케줄/제한/마침경고.png")
	exit.x, exit.y = display.contentWidth/2, display.contentHeight/2
	sceneGroup:insert(exit)

	local yes_button = display.newImage("이미지/공통/yes버튼.png")
	yes_button.x,yes_button.y = display.contentWidth*0.43,display.contentHeight*0.59
	yes_button.width = yes_button.width*0.8
	yes_button.height = yes_button.height*0.8
	sceneGroup:insert(yes_button)

	local no_button = display.newImage("이미지/공통/no버튼.png")
	no_button.x,no_button.y = display.contentWidth*0.57,display.contentHeight*0.59
	no_button.width = no_button.width*0.8
	no_button.height = no_button.height*0.8
	no_button:addEventListener("touch",go_back)
	sceneGroup:insert(no_button)

	
	
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
