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

	local background = display.newImage("이미지/상점/배경(가격).png")
	background.x, background.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(background)

	local exit = display.newImage("이미지/공통/x버튼.png")
	exit.x, exit.y = display.contentWidth*0.9207, display.contentHeight*0.0438
	exit.anchorX, exit.anchorY = 0,0
	sceneGroup:insert(exit)

-- 코인 창 객체 
	local coin = display.newImage("이미지/공통/코인표시창.png")
	sceneGroup:insert(coin)
	coin.x, coin.y = display.contentWidth*0.1, display.contentHeight*0.08



	-- 코인 객체, 글씨체 및 세이브 파일에 담겨진 보유 코인을 text에 담음
	local money = display.newText("",display.contentWidth*0.16, display.contentHeight*0.079,"font/NanumSquare_acB.ttf")
	money:setFillColor(0.964, 0.462, 0.411)
	money.anchorX = 1
	money.text = loadedSettings.money +1000
	money.size = 53
	sceneGroup:insert(money)

	--1행
	local pencil = display.newImage("이미지/상점/아이템/연필.png")
	pencil.x,pencil.y = display.contentWidth*0.1117, display.contentHeight*0.241
	pencil.anchorX,pencil.anchorY = 0,0
	sceneGroup:insert(pencil)
	pencil.name = "연필"

	local dog_rice = display.newImage("이미지/상점/아이템/사료.png")
	dog_rice.x,dog_rice.y = display.contentWidth*0.2615, display.contentHeight*0.241
	dog_rice.anchorX,dog_rice.anchorY = 0,0
	sceneGroup:insert(dog_rice)
	dog_rice.name = "사료"

	local toy = display.newImage("이미지/상점/아이템/블록.png")
	toy.x,toy.y = display.contentWidth*0.3948, display.contentHeight*0.241
	toy.anchorX,toy.anchorY = 0,0
	sceneGroup:insert(toy)

	local duck = display.newImage("이미지/상점/아이템/오리.png")
	duck.x,duck.y = display.contentWidth*0.5427, display.contentHeight*0.249
	duck.anchorX,duck.anchorY = 0,0
	sceneGroup:insert(duck)

	local heart = display.newImage("이미지/상점/아이템/응원봉.png")
	heart.x,heart.y = display.contentWidth*0.6807, display.contentHeight*0.24
	heart.anchorX,heart.anchorY = 0,0
	sceneGroup:insert(heart)

	local pie = display.newImage("이미지/상점/아이템/파이.png")
	pie.x,pie.y = display.contentWidth*0.8195, display.contentHeight*0.249
	pie.anchorX,pie.anchorY = 0,0
	sceneGroup:insert(pie)

	-- 2행

	local kit = display.newImage("이미지/상점/아이템/실험세트.png")
	kit.x,kit.y = display.contentWidth*0.1788, display.contentHeight*0.5114
	kit.anchorX,kit.anchorY = 0,0
	sceneGroup:insert(kit)

	local plant = display.newImage("이미지/상점/아이템/화분.png")
	plant.x,plant.y = display.contentWidth*0.3393, display.contentHeight*0.463
	plant.anchorX,plant.anchorY = 0,0
	sceneGroup:insert(plant)

	local tiger = display.newImage("이미지/상점/아이템/호랑이.png")
	tiger.x,tiger.y = display.contentWidth*0.475, display.contentHeight*0.48
	tiger.anchorX,tiger.anchorY = 0,0
	sceneGroup:insert(tiger)

	local purfume = display.newImage("이미지/상점/아이템/향수.png")
	purfume.x,purfume.y = display.contentWidth*0.6167, display.contentHeight*0.4736
	purfume.anchorX,purfume.anchorY = 0,0
	sceneGroup:insert(purfume)

	local speaker = display.newImage("이미지/상점/아이템/스피커.png")
	speaker.x,speaker.y = display.contentWidth*0.7489, display.contentHeight*0.4901
	speaker.anchorX,speaker.anchorY = 0,0
	sceneGroup:insert(speaker)

	--3행
	local pin = display.newImage("이미지/상점/아이템/머리핀.png")
	pin.x,pin.y = display.contentWidth*0.1117, display.contentHeight*0.76
	pin.anchorX,pin.anchorY = 0,0
	sceneGroup:insert(pin)


	local headset = display.newImage("이미지/상점/아이템/헤드셋.png")
	headset.x,headset.y = display.contentWidth*0.2615, display.contentHeight*0.712
	headset.anchorX,headset.anchorY = 0,0
	sceneGroup:insert(headset)

	local hero = display.newImage("이미지/상점/아이템/망토.png")
	hero.x,hero.y = display.contentWidth*0.3948, display.contentHeight*0.74
	hero.anchorX,hero.anchorY = 0,0
	sceneGroup:insert(hero)

	local galsses = display.newImage("이미지/상점/아이템/안경닦이.png")
	galsses.x,galsses.y = display.contentWidth*0.6807, display.contentHeight*0.725
	galsses.anchorX,galsses.anchorY = 0,0
	sceneGroup:insert(galsses)

	local mint = display.newImage("이미지/상점/아이템/민초.png")
	mint.x,mint.y = display.contentWidth*0.543, display.contentHeight*0.73
	mint.anchorX,mint.anchorY = 0,0
	sceneGroup:insert(mint)

	local frame = display.newImage("이미지/상점/아이템/액자.png")
	frame.x,frame.y = display.contentWidth*0.8195, display.contentHeight*0.73
	frame.anchorX,frame.anchorY = 0,0
	sceneGroup:insert(frame)

	item = composer.getVariable("item")
	money = composer.getVariable("money")

	local color = 0
	local i = 0
	--중복아이템 flag 변수
	local jungbok
	local function take_stuff(event)
		jungbok = 0
		local red_num = loadedSettings.red_num
		local yellow_num = loadedSettings.yellow_num
		local blue_num = loadedSettings.blue_num
		local purple_num = loadedSettings.purple_num
		local green_num = loadedSettings.green_num

	  local find1 = composer.getVariable("find1")
	  local find2= composer.getVariable("find2")
	  local find3 = composer.getVariable("find3")
	  local find4 = composer.getVariable("find4")
	  local find5 = composer.getVariable("find5")
		if event.phase == "began" then 
			print(item)
			if (loadedSettings.money - money) >= 0 and loadedItems.itemCount < 16 then
					if item == "액자" then
						if red_num >= 50 and find1 == 0 then
							color = "1"
							print("red")
							composer.setVariable("color", color)
							composer.setVariable("find1", 1)							
						elseif yellow_num >= 50 and find3 == 0 then
							print("yellow")
							color = "3"
							composer.setVariable("color", color)
							composer.setVariable("find3", 1)			
						elseif blue_num >= 50 and find2 == 0 then
							color = "2"
							composer.setVariable("color", color)
							composer.setVariable("find2", 1)			
						elseif purple_num >= 50 and find4 == 0 then
							color = "4"
							composer.setVariable("color", color)
							composer.setVariable("find4", 1)			
						elseif green_num >= 50 and find5 == 0 then
							color = "5"
							composer.setVariable("color", color)
							composer.setVariable("find5", 1)			
						end
						loadsave.saveTable(loadedSettings,"settings.json")
					end
					--중복확인
    				if loadedItems.item1== item then
    					jungbok = 1
    					loadedItems.item1Count = loadedItems.item1Count + 1
    				elseif loadedItems.item2== item then
    					jungbok = 1
    					loadedItems.item2Count = loadedItems.item2Count + 1
    				elseif loadedItems.item3== item then
    					jungbok = 1
    					loadedItems.item3Count = loadedItems.item3Count + 1
    				elseif loadedItems.item4== item then
    					jungbok = 1
    					loadedItems.item4Count = loadedItems.item4Count + 1
    				elseif loadedItems.item5== item then
    					jungbok = 1
    					loadedItems.item5Count = loadedItems.item5Count + 1
    				elseif loadedItems.item6== item then
    					jungbok = 1
    					loadedItems.item6Count = loadedItems.item6Count + 1
    				elseif loadedItems.item7== item then
    					jungbok = 1
    					loadedItems.item7Count = loadedItems.item7Count + 1
    				elseif loadedItems.item8== item then
    					jungbok = 1
    					loadedItems.item8Count = loadedItems.item8Count + 1
    				elseif loadedItems.item9== item then
    					jungbok = 1
    					loadedItems.item9Count = loadedItems.item9Count + 1
   				elseif loadedItems.item10== item then
    					jungbok = 1
    					loadedItems.item10Count = loadedItems.item10Count + 1
    				elseif loadedItems.item11== item then
    					jungbok = 1
    					loadedItems.item11Count = loadedItems.item11Count + 1
    				elseif loadedItems.item12== item then
    					jungbok = 1
    					loadedItems.item12Count = loadedItems.item12Count + 1
    				elseif loadedItems.item13== item then
    					jungbok = 1
    					loadedItems.item13Count = loadedItems.item13Count + 1
    				elseif loadedItems.item14== item then
    					jungbok = 1
    					loadedItems.item14Count = loadedItems.item14Count + 1
    				elseif loadedItems.item15== item then
    					jungbok = 1
    					loadedItems.item15Count = loadedItems.item15Count + 1
    				elseif loadedItems.item16== item then
    					jungbok = 1
    					loadedItems.item16Count = loadedItems.item16Count + 1
    				elseif loadedItems.item17== item then
    					jungbok = 1
    					loadedItems.item17Count = loadedItems.item17Count + 1
    				end
				if jungbok == 0 then
					loadedItems.itemCount = loadedItems.itemCount + 1
					if loadedItems.itemCount == 1 then
						loadedItems.item1 = item
						loadedItems.item1Count = 1
					elseif loadedItems.itemCount == 2 then
						loadedItems.item2 = item
						loadedItems.item2Count = 1
					elseif loadedItems.itemCount == 3 then
						loadedItems.item3 = item
						loadedItems.item3Count = 1
					elseif loadedItems.itemCount == 4 then
						loadedItems.item4 = item
						loadedItems.item4Count = 1
					elseif loadedItems.itemCount == 5 then
						loadedItems.item5 = item
						loadedItems.item5Count = 1
					elseif loadedItems.itemCount == 6 then
						loadedItems.item6 = item
						loadedItems.item6Count = 1
					elseif loadedItems.itemCount == 7 then
						loadedItems.item7 = item
						loadedItems.item7Count = 1
					elseif loadedItems.itemCount == 8 then
						loadedItems.item8 = item
						loadedItems.item8Count = 1
					elseif loadedItems.itemCount == 9 then
						loadedItems.item9 = item
						loadedItems.item9Count = 1
					elseif loadedItems.itemCount == 10 then
						loadedItems.item10 = item
						loadedItems.item10Count = 1
					elseif loadedItems.itemCount == 11 then
						loadedItems.item11 = item
						loadedItems.item11Count = 1
					elseif loadedItems.itemCount == 12 then
						loadedItems.item12 = item
						loadedItems.item12Count = 1
					elseif loadedItems.itemCount == 13 then
						loadedItems.item13 = item
						loadedItems.item13Count = 1
					elseif loadedItems.itemCount == 14 then
						loadedItems.item14 = item
						loadedItems.item14Count = 1
					elseif loadedItems.itemCount == 15 then
						loadedItems.item15 = item
						loadedItems.item15Count = 1
					elseif loadedItems.itemCount == 16 then
						loadedItems.item16 = item
						loadedItems.item16Count = 1
					elseif loadedItems.itemCount == 17 then
						loadedItems.item17 = item
						loadedItems.item17Count = 1
					end
				end
				
				loadedSettings.money = loadedSettings.money - money
				loadsave.saveTable(loadedSettings,"settings.json")
				loadsave.saveTable(loadedItems,"items.json")
				composer.removeScene("view04Storeitem")
				composer.gotoScene("view04Store")
			else 
				--composer.removeScene("view04Storeitem")
				composer.showOverlay("view04Storestop",option1)
			end
		end
	end

	local popup = display.newImage("이미지/상점/팝업창/" .. item .. ".png")
	popup.x,popup.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(popup)

	local function goback_store(event)
		if event.phase == "began" then
			composer.removeScene("view04Storeitem")
			composer.gotoScene("view04Store")
		end
	end

	local exit1 = display.newImage("이미지/공통/x버튼.png")
	exit1.x, exit1.y = display.contentWidth*0.6, display.contentHeight*0.29
	exit1.anchorX, exit1.anchorY = 0,0
	sceneGroup:insert(exit1)
	exit1:addEventListener("touch",goback_store)

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
