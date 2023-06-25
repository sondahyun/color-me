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

	if (loadedSettings.month == 0) and (loadedSettings.month1_event==0) then
		--print("이벤트!!")
		loadedSettings.month1_event = loadedSettings.month1_event + 1
		loadsave.saveTable(loadedSettings,"settings.json")
	end

	local option1={
		isModal=true
	}

	
	item = composer.getVariable("item")
	money = composer.getVariable("money")

	local function take_stuff(event)
		if event.phase == "began" then 
			if (loadedSettings.money - money) >= 0 and loadedItems.decoCount < 15 then
				loadedItems.decoCount = loadedItems.decoCount + 1
				if loadedItems.decoCount == 1 then
					loadedItems.deco1 = item
				elseif loadedItems.decoCount == 2 then
					loadedItems.deco2 = item
				elseif loadedItems.decoCount == 3 then
					loadedItems.deco3 = item
				elseif loadedItems.decoCount == 4 then
					loadedItems.deco4 = item
				elseif loadedItems.decoCount == 5 then
					loadedItems.deco5 = item
				elseif loadedItems.decoCount == 6 then
					loadedItems.deco6 = item
				elseif loadedItems.decoCount == 7 then
					loadedItems.deco7 = item
				elseif loadedItems.decoCount == 8 then
					loadedItems.deco8 = item
				elseif loadedItems.decoCount == 9 then
					loadedItems.deco9 = item
				elseif loadedItems.decoCount == 10 then
					loadedItems.deco10 = item
				elseif loadedItems.decoCount == 11 then
					loadedItems.deco11 = item
				elseif loadedItems.decoCount == 12 then
					loadedItems.deco12 = item
				elseif loadedItems.decoCount == 13 then
					loadedItems.deco13 = item
				elseif loadedItems.decoCount == 14 then
					loadedItems.deco14 = item
				elseif loadedItems.decoCount == 15 then
					loadedItems.deco15 = item
				end

				print(item)
				if item=="꽃무늬이불" then 
					loadedItems.d1Sold=0
				elseif item=="줄무늬이불" then 
					loadedItems.d2Sold=0
				elseif item=="선인장화분" then 
					loadedItems.d3Sold=0
				elseif item=="해바라기화분" then 
					loadedItems.d4Sold=0
				elseif item=="클로버화분" then 
					loadedItems.d5Sold=0
				elseif item=="제비꽃화분" then 
					loadedItems.d6Sold=0
				elseif item=="하트카펫" then 
					loadedItems.d7Sold=0
				elseif item=="둥근카펫" then 
					loadedItems.d8Sold=0
				elseif item=="네모카펫" then
					loadedItems.d9Sold=0
				elseif item=="곰인형" then 
					loadedItems.d10Sold=0
				elseif item=="토끼인형" then 
					loadedItems.d11Sold=0
				elseif item=="도트벽지" then
					loadedItems.d12Sold=0
				elseif item=="격자벽지" then 
					loadedItems.d13Sold=0
				elseif item=="흰색바닥" then 
					loadedItems.d14Sold=0
				elseif item=="나무바닥" then 
					loadedItems.d15Sold=0
				end

				print(item)

				print("loadedItems.blanketCount" .. loadedItems.blanketCount)

				if (item=="꽃무늬이불") or (item=="줄무늬이불") then 
					loadedItems.blanketCount=loadedItems.blanketCount+1
					if loadedItems.blanketCount==2 then 
						loadedItems.blanket2=item 
					elseif loadedItems.blanketCount==3 then 
						loadedItems.blanket3=item
					end
				end
				if (item=="선인장화분") or (item=="해바라기화분") or (item=="클로버화분") or (item=="제비꽃화분") then 
					loadedItems.plantCount=loadedItems.plantCount+1
					if loadedItems.plantCount==1 then 
						loadedItems.plant1=item 
					elseif loadedItems.plantCount==2 then 
						loadedItems.plant2=item
					elseif loadedItems.plantCount==3 then 
						loadedItems.plant3=item
					elseif loadedItems.plantCount==4 then 
						loadedItems.plant4=item
					end
				end
				if (item=="하트카펫") or (item=="둥근카펫") or (item=="네모카펫") then 
					loadedItems.carpetCount=loadedItems.carpetCount+1
					if loadedItems.carpetCount==1 then 
						loadedItems.carpet1=item 
					elseif loadedItems.carpetCount==2 then 
						loadedItems.carpet2=item
					elseif loadedItems.carpetCount==3 then 
						loadedItems.carpet3=item
					end
				end
				if (item=="곰인형") or (item=="토끼인형")then 
					loadedItems.dollCount=loadedItems.dollCount+1
					if loadedItems.dollCount==1 then 
						loadedItems.doll1=item 
					elseif loadedItems.dollCount==2 then 
						loadedItems.doll2=item
					end
				end
				if (item=="도트벽지") or (item=="격자벽지") then 
					loadedItems.wallpaperCount=loadedItems.wallpaperCount+1
					if loadedItems.wallpaperCount==2 then 
						loadedItems.wallpaper2=item 
					elseif loadedItems.wallpaperCount==3 then 
						loadedItems.wallpaper3=item
					end
				end
				if (item=="흰색바닥") or (item=="나무바닥") then 
					loadedItems.floorCount=loadedItems.floorCount+1
					if loadedItems.floorCount==2 then 
						loadedItems.floor2=item 
					elseif loadedItems.floorCount==3 then 
						loadedItems.floor3=item
					end
				end

				loadedSettings.money = loadedSettings.money - money
				loadsave.saveTable(loadedSettings,"settings.json")
				loadsave.saveTable(loadedItems,"items.json")
				composer.gotoScene("view04Deco")
			else 
				--composer.removeScene("view04Storeitem")
				composer.showOverlay("view04Decostop",option1)
			end
		end
	end


	


	local popup = display.newImage("이미지/상점/팝업창/" .. item .. ".png")
	popup.x,popup.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(popup)

	local function goback_Deco(event)
		if event.phase == "began" then
			composer.removeScene("view04Decoitem")
			composer.gotoScene("view04Deco")
		end
	end




	local exit2 = display.newImage("이미지/공통/x버튼.png")
	exit2.x, exit2.y = display.contentWidth*0.6, display.contentHeight*0.29
	exit2.anchorX, exit2.anchorY = 0,0
	sceneGroup:insert(exit2)
	exit2:addEventListener("touch",goback_Deco)

	local button = display.newImage("이미지/상점/구매버튼.png")
	button.x, button.y = display.contentWidth*0.44, display.contentHeight*0.59
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
