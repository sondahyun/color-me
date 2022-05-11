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
	j=0

	if (item == "도트벽지") then
		apply_count =loadedItems.dot_apply
	elseif (item == "격자벽지") then
		apply_count =loadedItems.grid_apply
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

	local function wallpaper_clear()
		loadedItems.grid_apply=0
		loadedItems.dot_apply=0
		loadedItems.white_apply=0
	end

	local function floor_clear()
		loadedItems.fblue_apply=0
		loadedItems.tree_apply=0
		loadedItems.fwhite_apply=0
	end

	local function blanket_clear()
		loadedItems.flower_apply=0
		loadedItems.sprite_apply=0
		loadedItems.blue_apply=0
	end

	local function carpet_clear()
		loadedItems.square_apply=0
		loadedItems.circle_apply=0
		loadedItems.heart_apply=0
	end

	local function plant_clear()
		loadedItems.cactus_apply=0
		loadedItems.sunflower_apply=0
		loadedItems.clover_apply=0
		loadedItems.violet_apply=0
	end

	local function doll_clear()
		loadedItems.bear_apply=0
		loadedItems.rabbit_apply=0
	end

	local function frame_clear()
		loadedItems.lay_apply=0
		loadedItems.wiz_apply= 0
		loadedItems.soli_apply= 0
		loadedItems.joy_apply= 0
		loadedItems.bly_apply= 0
	end

	local function put_apply() 
		if (item == "도트벽지") then
			if (j==1) then
				wallpaper_clear()
			end
			loadedItems.dot_apply = i
		elseif (item == "격자벽지") then
			if (j==1) then
				wallpaper_clear()
			end
			loadedItems.grid_apply= i
		elseif (item == "흰색벽지") then
			if (j==1) then
				wallpaper_clear()
			end
			loadedItems.white_apply= i
		elseif (item == "꽃무늬이불") then
			if (j==1) then
				blanket_clear()
			end
			loadedItems.flower_apply= i
		elseif (item == "줄무늬이불") then
			if (j==1) then
				blanket_clear()
			end
			loadedItems.sprite_apply= i
		elseif (item == "파랑이불") then
			if (j==1) then
				blanket_clear()
			end
			loadedItems.blue_apply= i
		elseif (item == "나무바닥") then
			if (j==1) then
				floor_clear()
			end
			loadedItems.tree_apply= i
		elseif (item == "푸른바닥") then
			if (j==1) then
				floor_clear()
			end
			loadedItems.fblue_apply= i
		elseif (item == "흰색바닥") then
			if (j==1) then
				floor_clear()
			end
			loadedItems.fwhite_apply= i
		elseif (item == "네모카펫") then
			if (j==1) then
				carpet_clear()
			end
			loadedItems.square_apply= i
		elseif (item == "둥근카펫") then
			if (j==1) then
				carpet_clear()
			end
			loadedItems.circle_apply= i
		elseif (item == "하트카펫") then
			if (j==1) then
				carpet_clear()
			end
			loadedItems.heart_apply= i
		elseif (item == "선인장화분") then
			if (j==1) then
				plant_clear()
			end
			loadedItems.cactus_apply= i
		elseif (item == "제비꽃화분") then
			if (j==1) then
				plant_clear()
			end
			loadedItems.violet_apply= i
		elseif (item == "해바라기화분") then
			if (j==1) then
				plant_clear()
			end
			loadedItems.sunflower_apply= i
		elseif (item == "클로버화분") then
			if (j==1) then
				plant_clear()
			end
			loadedItems.clover_apply= i
		elseif (item == "곰인형") then
			if (j==1) then
				doll_clear()
			end
			loadedItems.bear_apply= i
		elseif (item == "토끼인형") then
			if (j==1) then
				doll_clear()
			end
			loadedItems.rabbit_apply= i
		elseif (item == "레이액자") then
			if (j==1) then
				frame_clear()
			end
			loadedItems.lay_apply= i
		elseif (item == "위즈액자") then
			if (j==1) then
				frame_clear()
			end
			loadedItems.wiz_apply= i
		elseif (item == "솔리액자") then
			if (j==1) then
				frame_clear()
			end
			loadedItems.soli_apply= i
		elseif (item == "조이액자") then
			if (j==1) then
				frame_clear()
			end
			loadedItems.joy_apply= i
		elseif (item == "블리액자") then
			if (j==1) then
				frame_clear()
			end
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
			if (j==0) then 
				j=1
			end

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
