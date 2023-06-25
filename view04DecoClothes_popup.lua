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

	local popup = display.newImage("이미지/상점/옷팝업창/의상구매-" .. loadedItems.costumeBuy[tag].name .. "세트.png")
	popup.x,popup.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(popup)

	local function goback_Deco(event)
		if event.phase == "began" then
			composer.removeScene("view04DecoClothes_popup")
			composer.gotoScene("view04DecoClothes")
		end
	end

	local function take_stuff(event)
		if event.phase == "began" then
			loadedItems.costumeBuy[tag].buy = 1
			loadedSettings.money = loadedSettings.money - loadedItems.costumeBuy[tag].cost

			loadsave.saveTable(loadedSettings,"settings.json")
			loadsave.saveTable(loadedItems,"items.json")	
			print("touch")
		end
		if event.phase=="ended" then
			composer.gotoScene("view04DecoClothes")
		end
	end


	local exit2 = display.newImage("이미지/공통/x버튼.png")
	exit2.x, exit2.y = display.contentWidth*0.63, display.contentHeight*0.20
	exit2.anchorX, exit2.anchorY = 0,0
	sceneGroup:insert(exit2)
	exit2:addEventListener("touch",goback_Deco)

	local button = display.newImage("이미지/상점/구매버튼.png")
	button.x, button.y = display.contentWidth*0.44, display.contentHeight*0.66
	button.anchorX, button.anchorY = 0,0
	sceneGroup:insert(button)
	button:addEventListener("touch",take_stuff)



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
