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
	location = composer.getVariable("location")
	i = composer.getVariable("number")
	item = composer.getVariable("item")

	format = composer.getVariable("format")
	local items = {}
	
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

	local function goback_bag(event)
		if event.phase == "began" then 
			composer.setVariable("number",i)
			composer.setVariable("useornot",0)
			composer.removeScene("view02schedule")
			composer.removeScene("view02schedule_item")
			if format == 1 then 
				composer.gotoScene("view03")
			elseif format == 2 then
				composer.gotoScene("view03_fun")
			else 
				composer.gotoScene("view03_hobby")
			end
		end
	end

	local function use_stuff(event)
		if event.phase == "began" then
			items[location] = ""

			if location == 1 then
				loadedItems.item1 = items[2]
				loadedItems.item2 = items[3]
				loadedItems.item3 = items[4]
				loadedItems.item4 = items[5]	
				loadedItems.item5 = items[6]
				loadedItems.item6 = items[7]
				loadedItems.item7 = items[8]
				loadedItems.item8 = items[9]	
				loadedItems.item9 = items[10]
				loadedItems.item10 = items[11]
				loadedItems.item11 = items[12]
				loadedItems.item12 = items[13] --/loadedSettings.item1		
				loadedItems.item13 = items[14] --/loadedSettings.item1		
				loadedItems.item14 = items[15]
				loadedItems.item15 = items[16]--/loadedSettings.item1--/loadedSettings.item1
				loadedItems.item16 = ""
			elseif location == 2 then
				loadedItems.item2 = items[3]
				loadedItems.item3 = items[4]
				loadedItems.item4 = items[5]	
				loadedItems.item5 = items[6]
				loadedItems.item6 = items[7]
				loadedItems.item7 = items[8]
				loadedItems.item8 = items[9]	
				loadedItems.item9 = items[10]
				loadedItems.item10 = items[11]
				loadedItems.item11 = items[12]
				loadedItems.item12 = items[13] --/loadedSettings.item1		
				loadedItems.item13 = items[14] --/loadedSettings.item1		
				loadedItems.item14 = items[15]
				loadedItems.item15 = items[16]--/loadedSettings.item1--/loadedSettings.item1
				loadedItems.item16 = ""
			elseif location == 3 then
				loadedItems.item3 = items[4]
				loadedItems.item4 = items[5]	
				loadedItems.item5 = items[6]
				loadedItems.item6 = items[7]
				loadedItems.item7 = items[8]
				loadedItems.item8 = items[9]	
				loadedItems.item9 = items[10]
				loadedItems.item10 = items[11]
				loadedItems.item11 = items[12]
				loadedItems.item12 = items[13] --/loadedSettings.item1		
				loadedItems.item13 = items[14] --/loadedSettings.item1		
				loadedItems.item14 = items[15]
				loadedItems.item15 = items[16]--/loadedSettings.item1--/loadedSettings.item1
				loadedItems.item16 = ""
			elseif location == 4 then
				loadedItems.item4 = items[5]	
				loadedItems.item5 = items[6]
				loadedItems.item6 = items[7]
				loadedItems.item7 = items[8]
				loadedItems.item8 = items[9]	
				loadedItems.item9 = items[10]
				loadedItems.item10 = items[11]
				loadedItems.item11 = items[12]
				loadedItems.item12 = items[13] --/loadedSettings.item1		
				loadedItems.item13 = items[14] --/loadedSettings.item1		
				loadedItems.item14 = items[15]
				loadedItems.item15 = items[16]--/loadedSettings.item1--/loadedSettings.item1
				loadedItems.item16 = ""
			elseif location == 5 then	
				loadedItems.item5 = items[6]
				loadedItems.item6 = items[7]
				loadedItems.item7 = items[8]
				loadedItems.item8 = items[9]	
				loadedItems.item9 = items[10]
				loadedItems.item10 = items[11]
				loadedItems.item11 = items[12]
				loadedItems.item12 = items[13] --/loadedSettings.item1		
				loadedItems.item13 = items[14] --/loadedSettings.item1		
				loadedItems.item14 = items[15]
				loadedItems.item15 = items[16]--/loadedSettings.item1--/loadedSettings.item1
				loadedItems.item16 = ""
			elseif location == 6 then	
				loadedItems.item6 = items[7]
				loadedItems.item7 = items[8]
				loadedItems.item8 = items[9]	
				loadedItems.item9 = items[10]
				loadedItems.item10 = items[11]
				loadedItems.item11 = items[12]
				loadedItems.item12 = items[13] --/loadedSettings.item1		
				loadedItems.item13 = items[14] --/loadedSettings.item1		
				loadedItems.item14 = items[15]
				loadedItems.item15 = items[16]--/loadedSettings.item1--/loadedSettings.item1
				loadedItems.item16 = ""
			elseif location == 7 then	
				loadedItems.item7 = items[8]
				loadedItems.item8 = items[9]	
				loadedItems.item9 = items[10]
				loadedItems.item10 = items[11]
				loadedItems.item11 = items[12]
				loadedItems.item12 = items[13] --/loadedSettings.item1		
				loadedItems.item13 = items[14] --/loadedSettings.item1		
				loadedItems.item14 = items[15]
				loadedItems.item15 = items[16]--/loadedSettings.item1--/loadedSettings.item1
				loadedItems.item16 = ""
			elseif location == 8 then	
				loadedItems.item8 = items[9]	
				loadedItems.item9 = items[10]
				loadedItems.item10 = items[11]
				loadedItems.item11 = items[12]
				loadedItems.item12 = items[13] --/loadedSettings.item1		
				loadedItems.item13 = items[14] --/loadedSettings.item1		
				loadedItems.item14 = items[15]
				loadedItems.item15 = items[16]--/loadedSettings.item1--/loadedSettings.item1
				loadedItems.item16 = ""
			elseif location == 9 then	
				loadedItems.item9 = items[10]
				loadedItems.item10 = items[11]
				loadedItems.item11 = items[12]
				loadedItems.item12 = items[13] --/loadedSettings.item1		
				loadedItems.item13 = items[14] --/loadedSettings.item1		
				loadedItems.item14 = items[15]
				loadedItems.item15 = items[16]--/loadedSettings.item1--/loadedSettings.item1
				loadedItems.item16 = ""
			elseif location == 10 then	
				loadedItems.item10 = items[11]
				loadedItems.item11 = items[12]
				loadedItems.item12 = items[13] --/loadedSettings.item1		
				loadedItems.item13 = items[14] --/loadedSettings.item1		
				loadedItems.item14 = items[15]
				loadedItems.item15 = items[16]--/loadedSettings.item1--/loadedSettings.item1
				loadedItems.item16 = ""
			elseif location == 11 then	
				loadedItems.item11 = items[12]
				loadedItems.item12 = items[13] --/loadedSettings.item1		
				loadedItems.item13 = items[14] --/loadedSettings.item1		
				loadedItems.item14 = items[15]
				loadedItems.item15 = items[16]--/loadedSettings.item1--/loadedSettings.item1
				loadedItems.item16 = ""
			elseif location == 12 then	
				loadedItems.item12 = items[13] --/loadedSettings.item1		
				loadedItems.item13 = items[14] --/loadedSettings.item1		
				loadedItems.item14 = items[15]
				loadedItems.item15 = items[16]--/loadedSettings.item1--/loadedSettings.item1
				loadedItems.item16 = ""
			elseif location == 13 then	
			 --/loadedSettings.item1		
				loadedItems.item13 = items[14] --/loadedSettings.item1		
				loadedItems.item14 = items[15]
				loadedItems.item15 = items[16]--/loadedSettings.item1--/loadedSettings.item1
				loadedItems.item16 = ""
			elseif location == 14 then	
				 --/loadedSettings.item1		
				loadedItems.item14 = items[15]
				loadedItems.item15 = items[16]--/loadedSettings.item1--/loadedSettings.item1
				loadedItems.item16 = ""
			elseif location == 15 then	
				
				loadedItems.item15 = items[16]--/loadedSettings.item1--/loadedSettings.item1
				loadedItems.item16 = ""
			elseif location == 16 then	
				--/loadedSettings.item1--/loadedSettings.item1
				loadedItems.item16 = ""
			end

			loadedItems.itemCount = loadedItems.itemCount - 1
			loadsave.saveTable(loadedItems,"items.json")
			composer.setVariable("number",i)
			composer.setVariable("item",item)
			composer.setVariable("useornot",1)
			composer.removeScene("view02schedule")
			composer.removeScene("view02schedule_item")
			if format == 1 then 
				composer.gotoScene("view03")
			elseif format == 2 then
				composer.gotoScene("view03_fun")
			else 
				composer.gotoScene("view03_hobby")
			end
			
			
		end
	end


	
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
