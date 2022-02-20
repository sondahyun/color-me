-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------
local composer = require( "composer" )
local scene = composer.newScene()


function scene:create( event )
	local sceneGroup = self.view
	local black = display.newRect(display.contentWidth/2,display.contentHeight/2,display.contentWidth,display.contentHeight)
	black.alpha = 0.5
	black:setFillColor(0)
	sceneGroup:insert(black)

	local options = {
		isModal = true
	}

	local function go_back(event)
		if event.phase == "began" then
			composer.removeScene("view03bag")
			composer.gotoScene("view00Room")
		end
	end
	
	local function go_popup(event)
		if event.phase == "began" then
			composer.showOverlay("zopup_update",options)
			--composer.gotoScene("view00Room")
		end
	end


	local update = display.newImage("이미지/가방/배경.png")
	update.x, update.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(update)

	local basic_button= display.newImage("이미지/가방/일반_완료.png")
	basic_button.x, basic_button.y = display.contentWidth*0.3066, display.contentHeight*0.0774
	basic_button.anchorX,basic_button.anchorY=0,0

	sceneGroup:insert(basic_button)

	local pretty_button= display.newImage("이미지/가방/꾸미기.png")
	pretty_button.x, pretty_button.y = display.contentWidth*0.5, display.contentHeight*0.0774
	sceneGroup:insert(pretty_button)
	pretty_button.anchorX,pretty_button.anchorY=0,0
	pretty_button:addEventListener("touch",go_popup)


	local exit = display.newImage("이미지/공통/x버튼.png")
	exit.x, exit.y = display.contentWidth*0.9207, display.contentHeight*0.0438
	exit.anchorX, exit.anchorY = 0,0
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
