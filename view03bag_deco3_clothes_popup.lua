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
	
	tag = composer.getVariable("tag")
	name = loadedItems.costumeBuy[tag].name

	local function go_back(event)
		if event.phase == "began" then
			--composer.removeScene("view03bag_deco3_clothes_popup")
			composer.hideOverlay("view03bag_deco3_clothes")
			loadsave.saveTable(loadedItems,"items.json")
		end
	end

	local popup = display.newImage("이미지/가방/의상팝업창/" .. name .. ".png")
	popup.x, popup.y = display.contentWidth*0.5, display.contentHeight*0.5
	popup.alpha = 1
	sceneGroup:insert(popup)

	local exit = display.newImage("이미지/공통/x버튼.png")
	exit.x, exit.y = display.contentWidth*0.66, display.contentHeight*0.31
	exit.width = exit.width*0.85
	exit.height = exit.height*0.85
	sceneGroup:insert(exit)
	exit:addEventListener("touch",go_back)

	local i = 0

	--적용하기

	local function apply_function(event)
		if event.phase == "began" then
			if (i==0) then 
				event.target.fill = {type="image",filename="이미지/가방/의상팝업창/가방(옷)-적용중 버튼.png"}
				i=i+1
				loadedItems.costume = name
			else
				event.target.fill = {type="image",filename="이미지/가방/의상팝업창/가방(옷)-적용하기 버튼.png"}
				i=i-1
				loadedItems.costume = "기본"
			end
		end
	end

	if name == loadedItems.costume then
		enter = display.newImage("이미지/가방/의상팝업창/가방(옷)-적용중 버튼.png")
		i = 1
	else
		enter = display.newImage("이미지/가방/의상팝업창/가방(옷)-적용하기 버튼.png")
		i = 0
	end

	enter.x, enter.y = display.contentWidth*0.562, display.contentHeight*0.6
	sceneGroup:insert(enter)
	enter:addEventListener("touch",apply_function)



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
