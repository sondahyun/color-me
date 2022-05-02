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

	if (item == "도트벽지") then
		apply_count =loadedItems.grid_apply
	elseif (item == "격자벽지") then
		apply_count =loadedItems.dot_apply
	elseif (item == "흰색벽지") then
		apply_count =loadedItems.white_apply
	elseif (item == "꽃무늬이불") then
		apply_count =loadedItems.flower_apply
	elseif (item == "줄무늬이불") then
		apply_count =loadedItems.sprite_apply
	elseif (item == "파랑이불") then
		apply_count =loadedItems.blue_apply
	elseif (item == "나무바닥") then
		apply_count =loadedItems.tree_apply
	elseif (item == "푸른바닥") then
		apply_count =loadedItems.fblue_apply
	elseif (item == "흰색바닥") then
		apply_count =loadedItems.fwhite_apply
	elseif (item == "네모카펫") then
		apply_count =loadedItems.square_apply
	elseif (item == "둥근카펫") then
		apply_count =loadedItems.circle_apply
	elseif (item == "하트카펫") then
		apply_count =loadedItems.heart_apply
	elseif (item == "선인장화분") then
		apply_count =loadedItems.cactus_apply
	elseif (item == "제비꽃화분") then
		apply_count =loadedItems.violet_apply
	elseif (item == "해바라기화분") then
		apply_count =loadedItems.sunflower_apply
	elseif (item == "클로버화분") then
		apply_count =loadedItems.clover_apply
	elseif (item == "곰인형") then
		apply_count =loadedItems.bear_apply
	elseif (item == "토끼인형") then
		apply_count =loadedItems.rabbit_apply
	elseif (item == "레이액자") then
		apply_count =loadedItems.lay_apply
	elseif (item == "위즈액자") then
		apply_count =loadedItems.wiz_apply
	elseif (item == "솔리액자") then
		apply_count =loadedItems.soli_apply
	elseif (item == "조이액자") then
		apply_count =loadedItems.joy_apply
	elseif (item == "블리액자") then
		apply_count =loadedItems.bly_apply
	end

	if (apply_count==0) then
		i=0
	else
		i=1
	end

	local function put_apply() 
		if (item == "도트벽지") then
			loadedItems.grid_apply = i
		elseif (item == "격자벽지") then
			loadedItems.dot_apply= i
		elseif (item == "흰색벽지") then
			loadedItems.white_apply= i
		elseif (item == "꽃무늬이불") then
			loadedItems.flower_apply= i
		elseif (item == "줄무늬이불") then
			loadedItems.sprite_apply= i
		elseif (item == "파랑이불") then
			loadedItems.blue_apply= i
		elseif (item == "나무바닥") then
			loadedItems.tree_apply= i
		elseif (item == "푸른바닥") then
			loadedItems.fblue_apply= i
		elseif (item == "흰색바닥") then
			loadedItems.fwhite_apply= i
		elseif (item == "네모카펫") then
			loadedItems.square_apply= i
		elseif (item == "둥근카펫") then
			loadedItems.circle_apply= i
		elseif (item == "하트카펫") then
			loadedItems.heart_apply= i
		elseif (item == "선인장화분") then
			loadedItems.cactus_apply= i
		elseif (item == "제비꽃화분") then
			loadedItems.violet_apply= i
		elseif (item == "해바라기화분") then
			loadedItems.sunflower_apply= i
		elseif (item == "클로버화분") then
			loadedItems.clover_apply= i
		elseif (item == "곰인형") then
			loadedItems.bear_apply= i
		elseif (item == "토끼인형") then
			loadedItems.rabbit_apply= i
		elseif (item == "레이액자") then
			loadedItems.lay_apply= i
		elseif (item == "위즈액자") then
			loadedItems.wiz_apply= i
		elseif (item == "솔리액자") then
			loadedItems.soli_apply= i
		elseif (item == "조이액자") then
			loadedItems.joy_apply= i
		elseif (item == "블리액자") then
			loadedItems.bly_apply= i
		end
	end
	
	local function go_back(event)
		if event.phase == "began" then
			put_apply()
			loadsave.saveTable(loadedItems,"items.json")
			composer.hideOverlay("view03bag_popup")
		end
	end

	

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

	if (apply_count==0) then
		apply = display.newImage("이미지/가방/적용하기.png")
	else
		apply = display.newImage("이미지/가방/적용중.png")
	end
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
