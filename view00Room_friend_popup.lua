--메인캐릭터의 방

local composer = require( "composer" )
local scene = composer.newScene()
local loadsave = require("loadsave")
local json = require( "json" )

function scene:create( event )
	local sceneGroup = self.view

	local black = display.newRect(display.contentWidth/2,display.contentHeight/2,display.contentWidth,display.contentHeight)
	black.alpha = 0.5
	black:setFillColor(0)
	sceneGroup:insert(black)

	local function go_back(event)
		if event.phase == "began" then
			composer.hideOverlay("view00Room_friend_popup")
		end
	end
	
	color = composer.getVariable("color")


	local update = display.newImage("이미지/앨범/친구목록/팝업창/" .. color .. ".png")
	update.x, update.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(update)

	local exit = display.newImage("이미지/공통/x버튼.png")
	exit.x, exit.y = display.contentWidth*0.71, display.contentHeight*0.25
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
		--composer.removeScene("view00Room")
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