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

	local background = display.newImage("이미지/상점/꾸미기배경.png")
	background.x, background.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(background)

	local exit = display.newImage("이미지/공통/x버튼.png")
	exit.x, exit.y = display.contentWidth*0.9207, display.contentHeight*0.0438
	exit.anchorX, exit.anchorY = 0,0
	sceneGroup:insert(exit)

    --옷 보러가기 버튼
	local goCloset = display.newImage("이미지/상점/옷상점버튼.png")
	sceneGroup:insert(goCloset)
	goCloset.x, goCloset.y = display.contentWidth*0.865, display.contentHeight*0.851

-- 코인 창 객체 
	local coin = display.newImage("이미지/공통/코인표시창.png")
	sceneGroup:insert(coin)
	coin.x, coin.y = display.contentWidth*0.1, display.contentHeight*0.08

	loadedSettings.money=loadedSettings.money+1000

	-- 코인 객체, 글씨체 및 세이브 파일에 담겨진 보유 코인을 text에 담음
	local money = display.newText("",display.contentWidth*0.16, display.contentHeight*0.079,"font/NanumSquare_acB.ttf")
	money:setFillColor(0.964, 0.462, 0.411)
	money.anchorX = 1
	money.text = loadedSettings.money 
	money.size = 53
	sceneGroup:insert(money)

	--1행
	local flowerBlanket = display.newImage("이미지/상점/아이템/꽃무늬 이불세트.png")
	flowerBlanket.x,flowerBlanket.y = display.contentWidth*0.145, display.contentHeight*0.3
	flowerBlanket.alpha=loadedItems.d1Sold+0.5
	sceneGroup:insert(flowerBlanket)

	local stripeBlanket = display.newImage("이미지/상점/아이템/줄무늬 이불세트.png")
	stripeBlanket.x,stripeBlanket.y = display.contentWidth*0.288, display.contentHeight*0.301
	stripeBlanket.alpha=loadedItems.d2Sold+0.5
	sceneGroup:insert(stripeBlanket)

	local cactus = display.newImage("이미지/상점/아이템/선인장화분.png")
	cactus.x,cactus.y = display.contentWidth*0.427, display.contentHeight*0.295
	cactus.alpha=loadedItems.d3Sold+0.5
	sceneGroup:insert(cactus)

	local sunflower = display.newImage("이미지/상점/아이템/해바라기화분.png")
	sunflower.x,sunflower.y = display.contentWidth*0.571, display.contentHeight*0.285
	sunflower.alpha=loadedItems.d4Sold+0.5
	sceneGroup:insert(sunflower)

	local clover = display.newImage("이미지/상점/아이템/클로버화분.png")
	clover.x,clover.y = display.contentWidth*0.713, display.contentHeight*0.295
	clover.alpha=loadedItems.d5Sold+0.5
	sceneGroup:insert(clover)

	local violet= display.newImage("이미지/상점/아이템/제비꽃화분.png")
	violet.x,violet.y = display.contentWidth*0.852, display.contentHeight*0.317
	violet.alpha=loadedItems.d6Sold+0.5
	sceneGroup:insert(violet)

	-- 2행

	local heartCarpet = display.newImage("이미지/상점/아이템/하트카펫.png")
	heartCarpet.x,heartCarpet.y = display.contentWidth*0.17, display.contentHeight*0.537
	heartCarpet.alpha=loadedItems.d7Sold+0.5
	sceneGroup:insert(heartCarpet)

	local roundCarpet = display.newImage("이미지/상점/아이템/둥근카펫.png")
	roundCarpet.x,roundCarpet.y = display.contentWidth*0.347, display.contentHeight*0.537
	roundCarpet.alpha=loadedItems.d8Sold+0.5
	sceneGroup:insert(roundCarpet)

	local squareCarpet = display.newImage("이미지/상점/아이템/네모카펫.png")
	squareCarpet.x,squareCarpet.y = display.contentWidth*0.542, display.contentHeight*0.553
	squareCarpet.alpha=loadedItems.d9Sold+0.5
	sceneGroup:insert(squareCarpet)

	local teddybear = display.newImage("이미지/상점/아이템/곰인형.png")
	teddybear.x,teddybear.y = display.contentWidth*0.71, display.contentHeight*0.54
	teddybear.alpha=loadedItems.d10Sold+0.5
	sceneGroup:insert(teddybear)

	local bunny = display.newImage("이미지/상점/아이템/토끼인형.png")
	bunny.x,bunny.y = display.contentWidth*0.848, display.contentHeight*0.529
	bunny.alpha=loadedItems.d11Sold+0.5
	sceneGroup:insert(bunny)

	--3행
	local dotWallpaper = display.newImage("이미지/상점/아이템/도트무늬벽지.png")
	dotWallpaper.x,dotWallpaper.y = display.contentWidth*0.149, display.contentHeight*0.766
	dotWallpaper.alpha=loadedItems.d12Sold+0.5
	sceneGroup:insert(dotWallpaper)

	local plaidWallpaper = display.newImage("이미지/상점/아이템/격자무늬벽지.png")
	plaidWallpaper.x,plaidWallpaper.y = display.contentWidth*0.29, display.contentHeight*0.766
	plaidWallpaper.alpha=loadedItems.d13Sold+0.5
	sceneGroup:insert(plaidWallpaper)

	local whiteFloor = display.newImage("이미지/상점/아이템/흰색바닥.png")
	whiteFloor.x,whiteFloor.y = display.contentWidth*0.433, display.contentHeight*0.777
	whiteFloor.alpha=loadedItems.d14Sold+0.5
	sceneGroup:insert(whiteFloor)

	local woodFloor = display.newImage("이미지/상점/아이템/나무바닥.png")
	woodFloor.x,woodFloor.y = display.contentWidth*0.571, display.contentHeight*0.777
	woodFloor.alpha=loadedItems.d15Sold+0.5
	sceneGroup:insert(woodFloor)

	local sold={}
   sold[1] = display.newImage("이미지/상점/상점_soldout.png")
   sold[1].x,sold[1].y = display.contentWidth*0.1459, display.contentHeight*0.411
   sold[2] = display.newImage("이미지/상점/상점_soldout.png")
   sold[2].x,sold[2].y = display.contentWidth*0.287, display.contentHeight*0.411
   sold[3] = display.newImage("이미지/상점/상점_soldout.png")
   sold[3].x,sold[3].y = display.contentWidth*0.428, display.contentHeight*0.411
   sold[4] = display.newImage("이미지/상점/상점_soldout.png")
   sold[4].x,sold[4].y = display.contentWidth*0.569, display.contentHeight*0.411
   sold[5] = display.newImage("이미지/상점/상점_soldout.png")
   sold[5].x,sold[5].y = display.contentWidth*0.710, display.contentHeight*0.411
   sold[6] = display.newImage("이미지/상점/상점_soldout.png")
   sold[6].x,sold[6].y = display.contentWidth*0.851, display.contentHeight*0.411
   sold[7] = display.newImage("이미지/상점/상점_soldout.png")
   sold[7].x,sold[7].y = display.contentWidth*0.17, display.contentHeight*0.647
   sold[8] = display.newImage("이미지/상점/상점_soldout.png")
   sold[8].x,sold[8].y = display.contentWidth*0.347, display.contentHeight*0.647
   sold[9] = display.newImage("이미지/상점/상점_soldout.png")
   sold[9].x,sold[9].y = display.contentWidth*0.543, display.contentHeight*0.647
   sold[10] = display.newImage("이미지/상점/상점_soldout.png")
   sold[10].x,sold[10].y = display.contentWidth*0.71, display.contentHeight*0.647
   sold[11] = display.newImage("이미지/상점/상점_soldout.png")
   sold[11].x,sold[11].y = display.contentWidth*0.851, display.contentHeight*0.647
   sold[12] = display.newImage("이미지/상점/상점_soldout.png")
   sold[12].x,sold[12].y = display.contentWidth*0.149, display.contentHeight*0.886
   sold[13] = display.newImage("이미지/상점/상점_soldout.png")
   sold[13].x,sold[13].y = display.contentWidth*0.29, display.contentHeight*0.886
   sold[14] = display.newImage("이미지/상점/상점_soldout.png")
   sold[14].x,sold[14].y = display.contentWidth*0.43, display.contentHeight*0.886
   sold[15] = display.newImage("이미지/상점/상점_soldout.png")
   sold[15].x,sold[15].y = display.contentWidth*0.571, display.contentHeight*0.886

   for i=1,15 do
   	sold[i].alpha=0
      sceneGroup:insert(sold[i])
   end

    if loadedItems.d1Sold==0 then
   		sold[1].alpha=1
   	end
   	if loadedItems.d2Sold==0 then
   		sold[2].alpha=1
   	end
   	if loadedItems.d3Sold==0 then
   		sold[3].alpha=1
   	end
   	if loadedItems.d4Sold==0 then
   		sold[4].alpha=1
   	end
   	if loadedItems.d5Sold==0 then
   		sold[5].alpha=1
   	end
   	if loadedItems.d6Sold==0 then
   		sold[6].alpha=1
   	end
   	if loadedItems.d7Sold==0 then
   		sold[7].alpha=1
   	end
   	if loadedItems.d8Sold==0 then
   		sold[8].alpha=1
   	end
   	if loadedItems.d9Sold==0 then
   		sold[9].alpha=1
   	end
   	if loadedItems.d10Sold==0 then
   		sold[10].alpha=1
   	end
   	if loadedItems.d11Sold==0 then
   		sold[11].alpha=1
   	end
   	if loadedItems.d12Sold==0 then
   		sold[12].alpha=1
   	end
   	if loadedItems.d13Sold==0 then
   		sold[13].alpha=1
   	end
   	if loadedItems.d14Sold==0 then
   		sold[14].alpha=1
   	end
   	if loadedItems.d15Sold==0 then
   		sold[15].alpha=1
   	end

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

				if item=="꽃무늬 이불세트" then 
					loadedItems.d1Sold=0
				elseif item=="줄무늬 이불세트" then 
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
				elseif item=="도트무늬벽지" then 
					loadedItems.d12Sold=0
				elseif item=="격자무늬벽지" then 
					loadedItems.d13Sold=0
				elseif item=="흰색바닥" then 
					loadedItems.d14Sold=0
				elseif item=="나무바닥" then 
					loadedItems.d15Sold=0
				end

				loadedSettings.money = loadedSettings.money - money
				loadsave.saveTable(loadedSettings,"settings.json")
				loadsave.saveTable(loadedItems,"items.json")
				composer.removeScene("view04Decoitem_L")
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
			composer.removeScene("view04Decoitem_L")
			composer.gotoScene("view04Deco")
		end
	end




	local exit2 = display.newImage("이미지/공통/x버튼.png")
	exit2.x, exit2.y = display.contentWidth*0.693, display.contentHeight*0.29
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
