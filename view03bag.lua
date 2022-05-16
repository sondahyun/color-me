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
			composer.removeScene("view03bag")
			composer.gotoScene("view03bag_deco")
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

	local function click( event )
		composer.setVariable("item",event.target.id)
		composer.showOverlay( "view03bag_popup",options)
	end

	local function check_kit(target_name,item)
		if(target_name=="실험세트") then
			item.x=item.x-3
		end
	end

	--반복문 정리--
	local function image( num )
		if num == 1 then
			local item1 = display.newImage("이미지/가방/아이템/" .. loadedItems.item1 .. ".png")
			item1.x, item1.y =  display.contentWidth*0.0516, display.contentHeight*0.2818
			item1.id = loadedItems.item1
			item1.anchorX, item1.anchorY = 0,0
			sceneGroup:insert(item1)
			check_kit(loadedItems.item1,item1)
			item1:addEventListener("touch", click)
			if(loadedItems.item1Count > 1) then
				--중복
				local jungbok1 = display.newImage("이미지/가방/중복.png")
				jungbok1.x, jungbok1.y =  display.contentWidth*0.1313, display.contentHeight*0.3019
				sceneGroup:insert(jungbok1)
				--중복 몇개?
				local jungbok1Count = display.newText("",display.contentWidth*0.1307, display.contentHeight*0.3037,"font/잘풀리는오늘 Medium.ttf")
				jungbok1Count:setFillColor(0.9, 0.76, 0.83)
				jungbok1Count.text = loadedItems.item1Count
				jungbok1Count.size = 30
				sceneGroup:insert(jungbok1Count)
			end
		elseif num == 2 then
			local item2 = display.newImage("이미지/가방/아이템/" .. loadedItems.item2 .. ".png")
			item2.x, item2.y =  display.contentWidth*0.1670, display.contentHeight*0.2818
			item2.id = loadedItems.item2
			item2.anchorX, item2.anchorY = 0,0
			sceneGroup:insert(item2)
			check_kit(loadedItems.item2,item2)
			item2:addEventListener("touch", click)
			if(loadedItems.item2Count > 1) then
				--중복
				local jungbok2 = display.newImage("이미지/가방/중복.png")
				jungbok2.x, jungbok2.y =  display.contentWidth*0.2458, display.contentHeight*0.3019
				sceneGroup:insert(jungbok2)
				--중복 몇개?
				local jungbok2Count = display.newText("",display.contentWidth*0.2453, display.contentHeight*0.3037,"font/잘풀리는오늘 Medium.ttf")
				jungbok2Count:setFillColor(0.9, 0.76, 0.83)
				jungbok2Count.text = loadedItems.item2Count
				jungbok2Count.size = 30
				sceneGroup:insert(jungbok2Count)
			end
		elseif num == 3 then
			local item3 = display.newImage("이미지/가방/아이템/" .. loadedItems.item3 .. ".png")
			item3.x, item3.y =  display.contentWidth*0.2823, display.contentHeight*0.2818
			sceneGroup:insert(item3)
			item3.id = loadedItems.item3
			item3.anchorX, item3.anchorY = 0,0
			check_kit(loadedItems.item3,item3)
			item3:addEventListener("touch", click)
			if(loadedItems.item3Count > 1) then
				--중복
				local jungbok3 = display.newImage("이미지/가방/중복.png")
				jungbok3.x, jungbok3.y =  display.contentWidth*0.3620, display.contentHeight*0.3019
				sceneGroup:insert(jungbok3)
				--중복 몇개?
				local jungbok3Count = display.newText("",display.contentWidth*0.3615, display.contentHeight*0.3037,"font/잘풀리는오늘 Medium.ttf")
				jungbok3Count:setFillColor(0.9, 0.76, 0.83)
				jungbok3Count.text = loadedItems.item3Count
				jungbok3Count.size = 30
				sceneGroup:insert(jungbok3Count)
			end
		elseif num == 4 then
			local item4 = display.newImage("이미지/가방/아이템/" .. loadedItems.item4 .. ".png")
			item4.x, item4.y =  display.contentWidth*0.3977, display.contentHeight*0.2818
			sceneGroup:insert(item4)
			item4.id = loadedItems.item4
			item4.anchorX, item4.anchorY = 0,0
			check_kit(loadedItems.item4,item4)
			item4:addEventListener("touch", click)
			if(loadedItems.item4Count > 1) then
				--중복
				local jungbok4 = display.newImage("이미지/가방/중복.png")
				jungbok4.x, jungbok4.y =  display.contentWidth*0.4771, display.contentHeight*0.3019
				sceneGroup:insert(jungbok4)
				--중복 몇개?
				local jungbok4Count = display.newText("",display.contentWidth*0.4766, display.contentHeight*0.3037,"font/잘풀리는오늘 Medium.ttf")
				jungbok4Count:setFillColor(0.9, 0.76, 0.83)
				jungbok4Count.text = loadedItems.item4Count
				jungbok4Count.size = 30
				sceneGroup:insert(jungbok4Count)
			end
		elseif num == 5 then
			local item5 = display.newImage("이미지/가방/아이템/" .. loadedItems.item5 .. ".png")
			item5.x, item5.y =  display.contentWidth*0.5130, display.contentHeight*0.2818
			sceneGroup:insert(item5)
			item5.id = loadedItems.item5
			item5.anchorX, item5.anchorY = 0,0
			check_kit(loadedItems.item5,item5)
			item5:addEventListener("touch", click)
			if(loadedItems.item5Count > 1) then
				--중복
				local jungbok5 = display.newImage("이미지/가방/중복.png")
				jungbok5.x, jungbok5.y =  display.contentWidth*0.5927, display.contentHeight*0.3019
				sceneGroup:insert(jungbok5)
				--중복 몇개?
				local jungbok5Count = display.newText("",display.contentWidth*0.5922, display.contentHeight*0.3037,"font/잘풀리는오늘 Medium.ttf")
				jungbok5Count:setFillColor(0.9, 0.76, 0.83)
				jungbok5Count.text = loadedItems.item5Count
				jungbok5Count.size = 30
				sceneGroup:insert(jungbok5Count)
			end
		elseif num == 6 then
			local item6 = display.newImage("이미지/가방/아이템/" .. loadedItems.item6 .. ".png")
			item6.x, item6.y =  display.contentWidth*0.6283, display.contentHeight*0.2818
			sceneGroup:insert(item6)
			item6.id = loadedItems.item6
			item6.anchorX, item6.anchorY = 0,0
			check_kit(loadedItems.item6,item6)
			item6:addEventListener("touch", click)
			if(loadedItems.item6Count > 1) then
				--중복
				local jungbok6 = display.newImage("이미지/가방/중복.png")
				jungbok6.x, jungbok6.y =  display.contentWidth*0.7073, display.contentHeight*0.3019
				sceneGroup:insert(jungbok6)
				--중복 몇개?
				local jungbok6Count = display.newText("",display.contentWidth*0.7068, display.contentHeight*0.3037,"font/잘풀리는오늘 Medium.ttf")
				jungbok6Count:setFillColor(0.9, 0.76, 0.83)
				jungbok6Count.text = loadedItems.item6Count
				jungbok6Count.size = 30
				sceneGroup:insert(jungbok6Count)
			end

		elseif num == 7 then
			local item7 = display.newImage("이미지/가방/아이템/" .. loadedItems.item7 .. ".png")
			item7.x, item7.y =  display.contentWidth*0.7437, display.contentHeight*0.2818
			sceneGroup:insert(item7)
			item7.id = loadedItems.item7
			item7.anchorX, item7.anchorY = 0,0
			check_kit(loadedItems.item7,item7)
			item7:addEventListener("touch", click)
			if(loadedItems.item7Count > 1) then
				--중복
				local jungbok7 = display.newImage("이미지/가방/중복.png")
				jungbok7.x, jungbok7.y =  display.contentWidth*0.8234, display.contentHeight*0.3019
				sceneGroup:insert(jungbok7)
				--중복 몇개?
				local jungbok7Count = display.newText("",display.contentWidth*0.8229, display.contentHeight*0.3037,"font/잘풀리는오늘 Medium.ttf")
				jungbok7Count:setFillColor(0.9, 0.76, 0.83)
				jungbok7Count.text = loadedItems.item7Count
				jungbok7Count.size = 30
				sceneGroup:insert(jungbok7Count)
			end
		elseif num == 8 then
			local item8 = display.newImage("이미지/가방/아이템/" .. loadedItems.item8 .. ".png")
			item8.x, item8.y =  display.contentWidth*0.8590, display.contentHeight*0.2818
			sceneGroup:insert(item8)
			item8.id = loadedItems.item8
			item8.anchorX, item8.anchorY = 0,0
			check_kit(loadedItems.item8,item8)
			item8:addEventListener("touch", click)
			if(loadedItems.item8Count > 1) then
				--중복
				local jungbok8 = display.newImage("이미지/가방/중복.png")
				jungbok8.x, jungbok8.y =  display.contentWidth*0.9385, display.contentHeight*0.3019
				sceneGroup:insert(jungbok8)
				--중복 몇개?
				local jungbok8Count = display.newText("",display.contentWidth*0.9380, display.contentHeight*0.3037,"font/잘풀리는오늘 Medium.ttf")
				jungbok8Count:setFillColor(0.9, 0.76, 0.83)
				jungbok8Count.text = loadedItems.item8Count
				jungbok8Count.size = 30
				sceneGroup:insert(jungbok8Count)
			end
		elseif num == 9 then
			local item9 = display.newImage("이미지/가방/아이템/" .. loadedItems.item9 .. ".png")
			item9.x, item9.y =  display.contentWidth*0.0516, display.contentHeight*0.6178
			sceneGroup:insert(item9)
			item9.id = loadedItems.item9
			item9.anchorX, item9.anchorY = 0,0
			check_kit(loadedItems.item9,item9)
			item9:addEventListener("touch", click)
			if(loadedItems.item9Count > 1) then
				--중복
				local jungbok9 = display.newImage("이미지/가방/중복.png")
				jungbok9.x, jungbok9.y =  display.contentWidth*0.1307, display.contentHeight*0.6398
				sceneGroup:insert(jungbok9)
				--중복 몇개?
				local jungbok9Count = display.newText("",display.contentWidth*0.1307, display.contentHeight*0.6398,"font/잘풀리는오늘 Medium.ttf")
				jungbok9Count:setFillColor(0.9, 0.76, 0.83)
				jungbok9Count.text = loadedItems.item9Count
				jungbok9Count.size = 30
				sceneGroup:insert(jungbok9Count)
			end
		elseif num == 10 then
			local item10 = display.newImage("이미지/가방/아이템/" .. loadedItems.item10 .. ".png")
			item10.x, item10.y =  display.contentWidth*0.1670, display.contentHeight*0.6178
			sceneGroup:insert(item10)
			item10.id = loadedItems.item10
			check_kit(loadedItems.item10,item10)
			item10.anchorX, item10.anchorY = 0,0
			item10:addEventListener("touch", click)
			if(loadedItems.item10Count > 1) then
				--중복
				local jungbok10 = display.newImage("이미지/가방/중복.png")
				jungbok10.x, jungbok10.y =  display.contentWidth*0.2453, display.contentHeight*0.6398
				sceneGroup:insert(jungbok10)
				--중복 몇개?
				local jungbok10Count = display.newText("",display.contentWidth*0.2453, display.contentHeight*0.6398,"font/잘풀리는오늘 Medium.ttf")
				jungbok10Count:setFillColor(0.9, 0.76, 0.83)
				jungbok10Count.text = loadedItems.item10Count
				jungbok10Count.size = 30
				sceneGroup:insert(jungbok10Count)
			end

		elseif num == 11 then
			local item11 = display.newImage("이미지/가방/아이템/" .. loadedItems.item11 .. ".png")
			item11.x, item11.y =  display.contentWidth*0.2823, display.contentHeight*0.6178
			sceneGroup:insert(item11)
			item11.id = loadedItems.item11
			item11.anchorX, item11.anchorY = 0,0
			check_kit(loadedItems.item11,item11)
			item11:addEventListener("touch", click)
			if(loadedItems.item11Count > 1) then
				--중복
				local jungbok11 = display.newImage("이미지/가방/중복.png")
				jungbok11.x, jungbok11.y =  display.contentWidth*0.3620, display.contentHeight*0.6370
				sceneGroup:insert(jungbok11)
				--중복 몇개?
				local jungbok11Count = display.newText("",display.contentWidth*0.3615, display.contentHeight*0.6398,"font/잘풀리는오늘 Medium.ttf")
				jungbok11Count:setFillColor(0.9, 0.76, 0.83)
				jungbok11Count.text = loadedItems.item11Count
				jungbok11Count.size = 30
				sceneGroup:insert(jungbok11Count)
			end
		elseif num == 12 then
			local item12 = display.newImage("이미지/가방/아이템/" .. loadedItems.item12 .. ".png")
			item12.x, item12.y =  display.contentWidth*0.3977, display.contentHeight*0.6178
			sceneGroup:insert(item12)
			item12.id = loadedItems.item12
			item12.anchorX, item12.anchorY = 0,0
			check_kit(loadedItems.item12,item12)
			item12:addEventListener("touch", click)
			if(loadedItems.item12Count > 1) then
				--중복
				local jungbok12 = display.newImage("이미지/가방/중복.png")
				jungbok12.x, jungbok12.y =  display.contentWidth*0.4771, display.contentHeight*0.6370
				sceneGroup:insert(jungbok12)
				--중복 몇개?
				local jungbok12Count = display.newText("",display.contentWidth*0.4766, display.contentHeight*0.6398,"font/잘풀리는오늘 Medium.ttf")
				jungbok12Count:setFillColor(0.9, 0.76, 0.83)
				jungbok12Count.text = loadedItems.item12Count
				jungbok12Count.size = 30
				sceneGroup:insert(jungbok12Count)
			end
		elseif num == 13 then
			local item13 = display.newImage("이미지/가방/아이템/" .. loadedItems.item13 .. ".png")
			item13.x, item13.y =  display.contentWidth*0.513, display.contentHeight*0.6178
			sceneGroup:insert(item13)
			item13.id = loadedItems.item13
			item13.anchorX, item13.anchorY = 0,0
			check_kit(loadedItems.item13,item13)
			item13:addEventListener("touch", click)
			if(loadedItems.item13Count > 1) then
				--중복
				local jungbok13 = display.newImage("이미지/가방/중복.png")
				jungbok13.x, jungbok13.y =  display.contentWidth*0.5927, display.contentHeight*0.6370
				sceneGroup:insert(jungbok13)
				--중복 몇개?
				local jungbok13Count = display.newText("",display.contentWidth*0.5922, display.contentHeight*0.6398,"font/잘풀리는오늘 Medium.ttf")
				jungbok13Count:setFillColor(0.9, 0.76, 0.83)
				jungbok13Count.text = loadedItems.item13Count
				jungbok13Count.size = 30
				sceneGroup:insert(jungbok13Count)
			end
		elseif num == 14 then
			local item14 = display.newImage("이미지/가방/아이템/" .. loadedItems.item14 .. ".png")
			item14.x, item14.y =  display.contentWidth*0.6283, display.contentHeight*0.6178
			sceneGroup:insert(item14)
			item14.id = loadedItems.item14
			item14.anchorX, item14.anchorY = 0,0
			check_kit(loadedItems.item14,item14)
			item14:addEventListener("touch", click)
			if(loadedItems.item14Count > 1) then
				--중복
				local jungbok14 = display.newImage("이미지/가방/중복.png")
				jungbok14.x, jungbok14.y =  display.contentWidth*0.7073, display.contentHeight*0.6370
				sceneGroup:insert(jungbok14)
				--중복 몇개?
				local jungbok14Count = display.newText("",display.contentWidth*0.7068, display.contentHeight*0.6398,"font/잘풀리는오늘 Medium.ttf")
				jungbok14Count:setFillColor(0.9, 0.76, 0.83)
				jungbok14Count.text = loadedItems.item14Count
				jungbok14Count.size = 30
				sceneGroup:insert(jungbok14Count)
			end
		elseif num == 15 then
			local item15 = display.newImage("이미지/가방/아이템/" .. loadedItems.item15 .. ".png")
			item15.x, item15.y =  display.contentWidth*0.7437, display.contentHeight*0.6178
			sceneGroup:insert(item15)
			item15.id = loadedItems.item15
			item15.anchorX, item15.anchorY = 0,0
			check_kit(loadedItems.item15,item15)
			item15:addEventListener("touch", click)
			if(loadedItems.item15Count > 1) then
				--중복
				local jungbok15 = display.newImage("이미지/가방/중복.png")
				jungbok15.x, jungbok15.y =  display.contentWidth*0.8234, display.contentHeight*0.6370
				sceneGroup:insert(jungbok15)
				--중복 몇개?
				local jungbok15Count = display.newText("",display.contentWidth*0.8229, display.contentHeight*0.6398,"font/잘풀리는오늘 Medium.ttf")
				jungbok15Count:setFillColor(0.9, 0.76, 0.83)
				jungbok15Count.text = loadedItems.item15Count
				jungbok15Count.size = 30
				sceneGroup:insert(jungbok15Count)
			end
		elseif num == 16 then
			local item16 = display.newImage("이미지/가방/아이템/" .. loadedItems.item16 .. ".png")
			item16.x, item16.y =  display.contentWidth*0.8590, display.contentHeight*0.6178
			sceneGroup:insert(item16)
			item16.anchorX, item16.anchorY = 0,0
			item16.id = loadedItems.item16
			check_kit(loadedItems.item16,item16)
			item16:addEventListener("touch", click)
			if(loadedItems.item16Count > 1) then
				--중복
				local jungbok16 = display.newImage("이미지/가방/중복.png")
				jungbok16.x, jungbok16.y =  display.contentWidth*0.9385, display.contentHeight*0.6370
				sceneGroup:insert(jungbok16)
				--중복 몇개?
				local jungbok16Count = display.newText("",display.contentWidth*0.9380, display.contentHeight*0.6398,"font/잘풀리는오늘 Medium.ttf")
				jungbok16Count:setFillColor(0.9, 0.76, 0.83)
				jungbok16Count.text = loadedItems.item16Count
				jungbok16Count.size = 30
				sceneGroup:insert(jungbok16Count)
			end
		end
	end

	local count = loadedItems.itemCount

	for i=1,count do 
		image(i)
	end




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
