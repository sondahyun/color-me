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
	local location = composer.getVariable("location")
	local color = composer.getVariable("color")

	local items = {}
	local itemCount = {}

	items[1] = loadedItems.item1--/loadedSettings.item1
	items[2] = loadedItems.item2--/loadedSettings.item1	
	items[3] = loadedItems.item3--/loadedSettings.item1		
	items[4] = loadedItems.item4--/loadedSettings.item1		
	items[5] = loadedItems.item5--/loadedSettings.item1		
	items[6] = loadedItems.item6--/loadedSettings.item1		
	items[7] = loadedItems.item7--/loadedSettings.item1		
	items[8] = loadedItems.item8--/loadedSettings.item1		
	items[9] = loadedItems.item9--/loadedSettings.item1		
	items[10] = loadedItems.item10--/loadedSettings.item1		
	items[11] = loadedItems.item11--/loadedSettings.item1		
	items[12] = loadedItems.item12--/loadedSettings.item1
	items[13] = loadedItems.item13--/loadedSettings.item1		
	items[14] = loadedItems.item14--/loadedSettings.item1		
	items[15] = loadedItems.item15--/loadedSettings.item1
	items[16] = loadedItems.item16--/loadedSettings.item1

	itemCount[1] = loadedItems.item1Count--/loadedSettings.item1
	itemCount[2] = loadedItems.item2Count--/loadedSettings.item1	
	itemCount[3] = loadedItems.item3Count--/loadedSettings.item1		
	itemCount[4] = loadedItems.item4Count--/loadedSettings.item1		
	itemCount[5] = loadedItems.item5Count--/loadedSettings.item1		
	itemCount[6] = loadedItems.item6Count--/loadedSettings.item1		
	itemCount[7] = loadedItems.item7Count--/loadedSettings.item1		
	itemCount[8] = loadedItems.item8Count--/loadedSettings.item1		
	itemCount[9] = loadedItems.item9Count--/loadedSettings.item1		
	itemCount[10] = loadedItems.item10Count--/loadedSettings.item1		
	itemCount[11] = loadedItems.item11Count--/loadedSettings.item1		
	itemCount[12] = loadedItems.item12Count--/loadedSettings.item1
	itemCount[13] = loadedItems.item13Count--/loadedSettings.item1		
	itemCount[14] = loadedItems.item14Count--/loadedSettings.item1		
	itemCount[15] = loadedItems.item15Count--/loadedSettings.item1
	itemCount[16] = loadedItems.item16Count--/loadedSettings.item1

	local function goback_bag(event)
		if event.phase == "began" then 
			composer.hideOverlay("viewgift_bag_popup")
		end
	end

	-- 아이템 정렬 함수
	local function arrange()
		if location <= 1 then
			loadedItems.item1 = items[2]
			loadedItems.item1Count = itemCount[2]
		end
		if location <= 2 then
			loadedItems.item2 = items[3]
			loadedItems.item2Count = itemCount[3]
		end
		if location <= 3 then
			loadedItems.item3 = items[4]
			loadedItems.item3Count = itemCount[4]
		end
		if location <= 4 then
			loadedItems.item4 = items[5]
			loadedItems.item4Count = itemCount[5]
		end
		if location <= 5 then
			loadedItems.item5 = items[6]
			loadedItems.item5Count = itemCount[6]
		end
		if location <= 6 then
			loadedItems.item6 = items[7]
			loadedItems.item6Count = itemCount[7]
		end
		if location <= 7 then
			loadedItems.item7 = items[8]
			loadedItems.item7Count = itemCount[8]
		end
		if location <= 8 then
			loadedItems.item8 = items[9]
			loadedItems.item8Count = itemCount[9]
		end
		if location <= 9 then
			loadedItems.item9 = items[10]
			loadedItems.item9Count = itemCount[10]
		end
		if location <= 10 then
			loadedItems.item10 = items[11]
			loadedItems.item10Count = itemCount[11]
		end
		if location <= 11 then
			loadedItems.item11 = items[12]
			loadedItems.item11Count = itemCount[12]
		end
		if location <= 12 then
			loadedItems.item12 = items[13]
			loadedItems.item12Count = itemCount[13]
		end
		if location <= 13 then
			loadedItems.item13 = items[14]
			loadedItems.item13Count = itemCount[14]
		end
		if location <= 14 then
			loadedItems.item14 = items[15]
			loadedItems.item14Count = itemCount[15]
		end
		if location <= 15 then
			loadedItems.item15 = items[16]
			loadedItems.item15Count = itemCount[16]
		end
		if location <= 16 then
			loadedItems.item16 = ""
			loadedItems.item16Count = ""
		end

	end

	-- 해당 아이템 개수 차감 저장
	local function substract_save()
		itemCount[location] = itemCount[location]-1
		if location == 1 then
			loadedItems.item1Count = itemCount[location]
		elseif location ==2 then
			loadedItems.item2Count = itemCount[location]
		elseif location ==3 then
			loadedItems.item3Count = itemCount[location]
		elseif location ==4 then
			loadedItems.item4Count = itemCount[location]
		elseif location ==5 then
			loadedItems.item5Count = itemCount[location]
		elseif location ==6 then
			loadedItems.item6Count = itemCount[location]
		elseif location ==7 then
			loadedItems.item7Count = itemCount[location]
		elseif location ==8 then
			loadedItems.item8Count = itemCount[location]
		elseif location ==9 then
			loadedItems.item9Count = itemCount[location]
		elseif location ==10 then
			loadedItems.item10Count = itemCount[location]
		elseif location ==11 then
			loadedItems.item11Count = itemCount[location]
		elseif location ==12 then
			loadedItems.item12Count = itemCount[location]
		elseif location ==13 then
			loadedItems.item13Count = itemCount[location]
		elseif location ==14 then
			loadedItems.item14Count = itemCount[location]
		elseif location ==15 then
			loadedItems.item15Count = itemCount[location]
		elseif location ==16 then
			loadedItems.item16Count = itemCount[location]
		end

	end


	local function use_stuff(event)
		if event.phase == "began" then
			items[location] = ""

			
			if (itemCount[location]==1) then
				arrange()
				loadedItems.itemCount = loadedItems.itemCount - 1
			-- 아이템 정렬
			else 
				substract_save()
			end

			--loadedItems.itemCount = loadedItems.itemCount - 1
			loadsave.saveTable(loadedItems,"items.json")
			composer.setVariable("item",item)
			composer.setVariable("color",color)
			composer.removeScene("viewgift_bag")
			composer.removeScene("viewgift_bag_popup")
			composer.gotoScene("viewgift_finish")
		end
	end


	item = composer.getVariable("item")
	local use_popup = display.newImage("이미지/공통/사용.png")
	use_popup.x, use_popup.y = display.contentWidth*0.5, display.contentHeight*0.5

	sceneGroup:insert(use_popup)

	local item_image = display.newImage("이미지/가방/아이템/" .. item .. ".png")
	item_image.x, item_image.y = display.contentWidth*0.5, display.contentHeight*0.415
	item_image.width = item_image.width*1.249
	item_image.height = item_image.height*1.249
	sceneGroup:insert(item_image)

	local yes_button = display.newImage("이미지/공통/yes버튼.png")
	yes_button.x,yes_button.y = display.contentWidth*0.4,display.contentHeight*0.67
	sceneGroup:insert(yes_button)
	yes_button:addEventListener("touch",use_stuff)

	local no_button = display.newImage("이미지/공통/no버튼.png")
	no_button.x,no_button.y = display.contentWidth*0.6,display.contentHeight*0.67
	sceneGroup:insert(no_button)
	no_button:addEventListener("touch",goback_bag)
	
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
