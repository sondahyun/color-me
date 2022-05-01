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
			composer.removeScene("view03bag_deco")
			composer.gotoScene("view03bag")
		end
	end


	local update = display.newImage("이미지/가방/꾸미기배경1.png")
	update.x, update.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(update)

	local basic_button= display.newImage("이미지/가방/일반.png")
	basic_button.x, basic_button.y = display.contentWidth*0.3066, display.contentHeight*0.0774
	basic_button.anchorX,basic_button.anchorY=0,0
	basic_button:addEventListener("touch",go_popup)

	sceneGroup:insert(basic_button)

	local pretty_button= display.newImage("이미지/가방/꾸미기_완료.png")
	pretty_button.x, pretty_button.y = display.contentWidth*0.5, display.contentHeight*0.0774
	sceneGroup:insert(pretty_button)
	pretty_button.anchorX,pretty_button.anchorY=0,0

	local left_button = display.newImage("이미지/가방/가구버튼1_클릭.png")
	left_button.x, left_button.y = display.contentWidth*0.444,display.contentHeight*0.8966
	sceneGroup:insert(left_button)
	left_button.anchorX,left_button.anchorY=0,0

	local right_button = display.newImage("이미지/가방/가구버튼2.png")
	right_button.x, right_button.y = display.contentWidth*0.4795,display.contentHeight*0.8966
	sceneGroup:insert(right_button)
	right_button.anchorX,right_button.anchorY=0,0

	local exit = display.newImage("이미지/공통/x버튼.png")
	exit.x, exit.y = display.contentWidth*0.9207, display.contentHeight*0.0438
	exit.anchorX, exit.anchorY = 0,0
	
	sceneGroup:insert(exit)
	exit:addEventListener("touch",go_back)

	--[[local function click( event )
		composer.setVariable("item",event.target.id)
		composer.showOverlay( "view03bag_popup",options)
	end]]--

	--반복문 정리---
	--[[
	local function image( num )
		if num == 1 then
			local item1 = display.newImage("이미지/가방/아이템/" .. loadedItems.item1 .. ".png")
			item1.x, item1.y =  display.contentWidth*0.0516, display.contentHeight*0.2818
			item1.id = loadedItems.item1
			item1.anchorX, item1.anchorY = 0,0
			sceneGroup:insert(item1)
			check_kit(loadedItems.item1,item1)
			item1:addEventListener("touch", click)
		elseif num == 2 then
			local item2 = display.newImage("이미지/가방/아이템/" .. loadedItems.item2 .. ".png")
			item2.x, item2.y =  display.contentWidth*0.1670, display.contentHeight*0.2818
			item2.id = loadedItems.item2
			item2.anchorX, item2.anchorY = 0,0
			sceneGroup:insert(item2)
			check_kit(loadedItems.item2,item2)
			item2:addEventListener("touch", click)
		elseif num == 3 then
			local item3 = display.newImage("이미지/가방/아이템/" .. loadedItems.item3 .. ".png")
			item3.x, item3.y =  display.contentWidth*0.2823, display.contentHeight*0.2818
			sceneGroup:insert(item3)
			item3.id = loadedItems.item3
			item3.anchorX, item3.anchorY = 0,0
			check_kit(loadedItems.item3,item3)
			item3:addEventListener("touch", click)
		elseif num == 4 then
			local item4 = display.newImage("이미지/가방/아이템/" .. loadedItems.item4 .. ".png")
			item4.x, item4.y =  display.contentWidth*0.3977, display.contentHeight*0.2818
			sceneGroup:insert(item4)
			item4.id = loadedItems.item4
			item4.anchorX, item4.anchorY = 0,0
			check_kit(loadedItems.item4,item4)
			item4:addEventListener("touch", click)
		elseif num == 5 then
			local item5 = display.newImage("이미지/가방/아이템/" .. loadedItems.item5 .. ".png")
			item5.x, item5.y =  display.contentWidth*0.5130, display.contentHeight*0.2818
			sceneGroup:insert(item5)
			item5.id = loadedItems.item5
			item5.anchorX, item5.anchorY = 0,0
			check_kit(loadedItems.item5,item5)
			item5:addEventListener("touch", click)
		elseif num == 6 then
			local item6 = display.newImage("이미지/가방/아이템/" .. loadedItems.item6 .. ".png")
			item6.x, item6.y =  display.contentWidth*0.6283, display.contentHeight*0.2818
			sceneGroup:insert(item6)
			item6.id = loadedItems.item6
			item6.anchorX, item6.anchorY = 0,0
			check_kit(loadedItems.item6,item6)
			item6:addEventListener("touch", click)
		elseif num == 7 then
			local item7 = display.newImage("이미지/가방/아이템/" .. loadedItems.item7 .. ".png")
			item7.x, item7.y =  display.contentWidth*0.7437, display.contentHeight*0.2818
			sceneGroup:insert(item7)
			item7.id = loadedItems.item7
			item7.anchorX, item7.anchorY = 0,0
			check_kit(loadedItems.item7,item7)
			item7:addEventListener("touch", click)
		elseif num == 8 then
			local item8 = display.newImage("이미지/가방/아이템/" .. loadedItems.item8 .. ".png")
			item8.x, item8.y =  display.contentWidth*0.8590, display.contentHeight*0.2818
			sceneGroup:insert(item8)
			item8.id = loadedItems.item8
			item8.anchorX, item8.anchorY = 0,0
			check_kit(loadedItems.item8,item8)
			item8:addEventListener("touch", click)
		elseif num == 9 then
			local item9 = display.newImage("이미지/가방/아이템/" .. loadedItems.item9 .. ".png")
			item9.x, item9.y =  display.contentWidth*0.0516, display.contentHeight*0.6178
			sceneGroup:insert(item9)
			item9.id = loadedItems.item9
			item9.anchorX, item9.anchorY = 0,0
			check_kit(loadedItems.item9,item9)
			item9:addEventListener("touch", click)
		elseif num == 10 then
			local item10 = display.newImage("이미지/가방/아이템/" .. loadedItems.item10 .. ".png")
			item10.x, item10.y =  display.contentWidth*0.1670, display.contentHeight*0.6178
			sceneGroup:insert(item10)
			item10.id = loadedItems.item10
			check_kit(loadedItems.item10,item10)
			item10.anchorX, item10.anchorY = 0,0
			item10:addEventListener("touch", click)
		elseif num == 11 then
			local item11 = display.newImage("이미지/가방/아이템/" .. loadedItems.item11 .. ".png")
			item11.x, item11.y =  display.contentWidth*0.2823, display.contentHeight*0.6178
			sceneGroup:insert(item11)
			item11.id = loadedItems.item11
			item11.anchorX, item11.anchorY = 0,0
			check_kit(loadedItems.item11,item11)
			item11:addEventListener("touch", click)
		elseif num == 12 then
			local item12 = display.newImage("이미지/가방/아이템/" .. loadedItems.item12 .. ".png")
			item12.x, item12.y =  display.contentWidth*0.3977, display.contentHeight*0.6178
			sceneGroup:insert(item12)
			item12.id = loadedItems.item12
			item12.anchorX, item12.anchorY = 0,0
			check_kit(loadedItems.item12,item12)
			item12:addEventListener("touch", click)
		elseif num == 13 then
			local item13 = display.newImage("이미지/가방/아이템/" .. loadedItems.item13 .. ".png")
			item13.x, item13.y =  display.contentWidth*0.513, display.contentHeight*0.6178
			sceneGroup:insert(item13)
			item13.id = loadedItems.item13
			item13.anchorX, item13.anchorY = 0,0
			check_kit(loadedItems.item13,item13)
			item13:addEventListener("touch", click)
		elseif num == 14 then
			local item14 = display.newImage("이미지/가방/아이템/" .. loadedItems.item14 .. ".png")
			item14.x, item14.y =  display.contentWidth*0.6283, display.contentHeight*0.6178
			sceneGroup:insert(item14)
			item14.id = loadedItems.item14
			item14.anchorX, item14.anchorY = 0,0
			check_kit(loadedItems.item14,item14)
			item14:addEventListener("touch", click)
		elseif num == 15 then
			local item15 = display.newImage("이미지/가방/아이템/" .. loadedItems.item15 .. ".png")
			item15.x, item15.y =  display.contentWidth*0.7437, display.contentHeight*0.6178
			sceneGroup:insert(item15)
			item15.id = loadedItems.item15
			item15.anchorX, item15.anchorY = 0,0
			check_kit(loadedItems.item15,item15)
			item15:addEventListener("touch", click)
		elseif num == 16 then
			local item16 = display.newImage("이미지/가방/아이템/" .. loadedItems.item16 .. ".png")
			item16.x, item16.y =  display.contentWidth*0.8590, display.contentHeight*0.6178
			sceneGroup:insert(item16)
			item16.anchorX, item16.anchorY = 0,0
			item16.id = loadedItems.item16
			check_kit(loadedItems.item16,item16)
			item16:addEventListener("touch", click)
		end
	end

	local count = loadedItems.itemCount

	for i=1,count do 
		image(i)
	end


	]]--

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
