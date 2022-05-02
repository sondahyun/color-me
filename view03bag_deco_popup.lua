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
	local loadedItems= loadsave.loadTable( "items.json" )
	
	item = composer.getVariable("item")
	two_check = composer.getVariable("two_check")

	local function go_back(event)
		if event.phase == "began" then
			composer.hideOverlay("view03bag_popup")
		end
	end

	local i = 0

	local function apply_function(event)
		if event.phase == "began" then
			if (i==0) then 
				event.target.fill = {type="image",filename="이미지/가방/적용중.png"}
				i=i+1
			else
				event.target.fill = {type="image",filename="이미지/가방/적용하기.png"}
				i=i-1
			end
		end
	end
	
	local popup = display.newImage("이미지/가방/가구팝업창/" .. item .. ".png")
	popup.x, popup.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(popup)

	local exit = display.newImage("이미지/공통/x버튼.png")
	if(two_check==1) then
		exit.x = display.contentWidth*0.628
	else
		exit.x = display.contentWidth*0.72
	end

	exit.y = display.contentHeight*0.34
	exit.width = exit.width*0.85
	exit.height = exit.height*0.85
	sceneGroup:insert(exit)
	exit:addEventListener("touch",go_back)

	local apply = display.newImage("이미지/가방/적용하기.png")
	apply.x, apply.y = display.contentWidth*0.5, display.contentHeight*0.59
	sceneGroup:insert(apply)
	apply:addEventListener("touch",apply_function)







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
