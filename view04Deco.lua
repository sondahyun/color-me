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

	if loadedSettings.month == 5 then
		if loadedSettings.month6_event == 0 then
			loadedSettings.month6_event = loadedSettings.month6_event + 1
			loadsave.saveTable(loadedSettings,"settings.json")
		end
	end

	
	local background = display.newImage("이미지/상점/꾸미기배경.png")
	background.x, background.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(background)

	local storeMusic = audio.loadStream( "음악/상점.mp3" )
	
	local function go_back(event)
		if event.phase == "began" then
			audio.pause(storeMusic)
			composer.removeScene("view04Deco")
			composer.gotoScene("view01Map")
		end
	end
	
	local exit = display.newImage("이미지/공통/x버튼.png")
	exit.x, exit.y = display.contentWidth*0.9207, display.contentHeight*0.0438
	exit.anchorX, exit.anchorY = 0,0
	sceneGroup:insert(exit)
	exit:addEventListener("touch",go_back)


-- 코인 창 객체 
	local goCloset = display.newImage("이미지/공통/코인표시창.png")
	sceneGroup:insert(goCloset)
	goCloset.x, goCloset.y = display.contentWidth*0.1, display.contentHeight*0.08

	loadedSettings.money=loadedSettings.money+1000

	-- 코인 객체, 글씨체 및 세이브 파일에 담겨진 보유 코인을 text에 담음
	local money = display.newText("",display.contentWidth*0.16, display.contentHeight*0.079,"font/NanumSquare_acB.ttf")
	money:setFillColor(0.964, 0.462, 0.411)
	money.anchorX = 1
	money.text = loadedSettings.money
	money.size = 53
	sceneGroup:insert(money)

	--옷 보러가기 버튼
	local goCloset = display.newImage("이미지/상점/옷상점버튼.png")
	sceneGroup:insert(goCloset)
	goCloset.x, goCloset.y = display.contentWidth*0.865, display.contentHeight*0.851

	-- 진열

	local function popup(event)
		if event.phase == "began" then
			item = event.target.name
			money = event.target.id
			composer.setVariable("item", item)
			composer.setVariable("money",money)
			composer.removeScene("view04Deco")
			composer.gotoScene("view04Decoitem_s")
		end
	end

	local function popup2(event)
		if event.phase == "began" then
			item = event.target.name
			money = event.target.id
			composer.setVariable("item", item)
			composer.setVariable("money",money)
			composer.removeScene("view04Deco")
			composer.gotoScene("view04Decoitem_L")
		end
	end

	--1행
	local flowerBlanket = display.newImage("이미지/상점/아이템/꽃무늬 이불세트.png")
	flowerBlanket.x,flowerBlanket.y = display.contentWidth*0.145, display.contentHeight*0.3
	flowerBlanket.anchorX,flowerBlanket.anchorY = 0.5,0.5
	flowerBlanket.name = "꽃무늬 이불세트"
	flowerBlanket.id = 10
	sceneGroup:insert(flowerBlanket)
	flowerBlanket:addEventListener("touch",popup2)

	local stripeBlanket = display.newImage("이미지/상점/아이템/줄무늬 이불세트.png")
	stripeBlanket.x,stripeBlanket.y = display.contentWidth*0.288, display.contentHeight*0.301
	stripeBlanket.anchorX,stripeBlanket.anchorY = 0.5,0.5
	stripeBlanket.name = "줄무늬 이불세트"
	stripeBlanket.id = 16
	sceneGroup:insert(stripeBlanket)
	stripeBlanket:addEventListener("touch",popup2)

	local cactus = display.newImage("이미지/상점/아이템/선인장화분.png")
	cactus.x,cactus.y = display.contentWidth*0.427, display.contentHeight*0.295
	cactus.anchorX,cactus.anchorY = 0.5,0.5
	cactus.id = 15
	sceneGroup:insert(cactus)
	cactus.name = "선인장화분"
	cactus:addEventListener("touch",popup)

	local sunflower = display.newImage("이미지/상점/아이템/해바라기화분.png")
	sunflower.x,sunflower.y = display.contentWidth*0.571, display.contentHeight*0.285
	sunflower.anchorX,sunflower.anchorY = 0.5,0.5
	sceneGroup:insert(sunflower)
	sunflower.name = "오리"
	sunflower.id = 14
	sunflower:addEventListener("touch",popup)

	local clover = display.newImage("이미지/상점/아이템/클로버화분.png")
	clover.x,clover.y = display.contentWidth*0.713, display.contentHeight*0.295
	clover.anchorX,clover.anchorY = 0.5,0.5
	sceneGroup:insert(clover)
	clover.name = "클로버화분"
	clover.id = 18
	clover:addEventListener("touch",popup)

	local violet= display.newImage("이미지/상점/아이템/제비꽃화분.png")
	violet.x,violet.y = display.contentWidth*0.852, display.contentHeight*0.317
	violet.anchorX,violet.anchorY = 0.5,0.5
	sceneGroup:insert(violet)
	violet.name = "제비꽃화분"
	violet.id = 20
	violet:addEventListener("touch",popup)

	-- 2행

	local heartCarpet = display.newImage("이미지/상점/아이템/하트카펫.png")
	heartCarpet.x,heartCarpet.y = display.contentWidth*0.17, display.contentHeight*0.537
	heartCarpet.anchorX,heartCarpet.anchorY = 0.5,0.5
	sceneGroup:insert(heartCarpet)
	heartCarpet.name = "하트카펫"
	heartCarpet.id = 10
	heartCarpet:addEventListener("touch",popup2)

	local roundCarpet = display.newImage("이미지/상점/아이템/둥근카펫.png")
	roundCarpet.x,roundCarpet.y = display.contentWidth*0.347, display.contentHeight*0.537
	roundCarpet.anchorX,roundCarpet.anchorY = 0.5,0.5
	sceneGroup:insert(roundCarpet)
	roundCarpet.name = "둥근카펫"
	roundCarpet.id = 16
	roundCarpet:addEventListener("touch",popup2)

	local squareCarpet = display.newImage("이미지/상점/아이템/네모카펫.png")
	squareCarpet.x,squareCarpet.y = display.contentWidth*0.542, display.contentHeight*0.553
	squareCarpet.anchorX,squareCarpet.anchorY = 0.5,0.5
	sceneGroup:insert(squareCarpet)
	squareCarpet.name = "네모카펫"
	squareCarpet.id = 25
	squareCarpet:addEventListener("touch",popup2)

	local teddybear = display.newImage("이미지/상점/아이템/곰인형.png")
	teddybear.x,teddybear.y = display.contentWidth*0.71, display.contentHeight*0.54
	teddybear.anchorX,teddybear.anchorY = 0.5,0.5
	sceneGroup:insert(teddybear)
	teddybear.name = "곰인형"
	teddybear.id = 20
	teddybear:addEventListener("touch",popup)

	local bunny = display.newImage("이미지/상점/아이템/토끼인형.png")
	bunny.x,bunny.y = display.contentWidth*0.848, display.contentHeight*0.529
	bunny.anchorX,bunny.anchorY = 0.5,0.5
	sceneGroup:insert(bunny)
	bunny.name = "토끼인형"
	bunny.id = 20
	bunny:addEventListener("touch",popup)

	--3행
	local dotWallpaper = display.newImage("이미지/상점/아이템/도트무늬벽지.png")
	dotWallpaper.x,dotWallpaper.y = display.contentWidth*0.149, display.contentHeight*0.766
	dotWallpaper.anchorX,dotWallpaper.anchorY = 0.5,0.5
	sceneGroup:insert(dotWallpaper)
	dotWallpaper.name = "도트무늬벽지"
	dotWallpaper.id = 25
	dotWallpaper:addEventListener("touch",popup2)

	local plaidWallpaper = display.newImage("이미지/상점/아이템/격자무늬벽지.png")
	plaidWallpaper.x,plaidWallpaper.y = display.contentWidth*0.29, display.contentHeight*0.766
	plaidWallpaper.anchorX,plaidWallpaper.anchorY = 0.5,0.5
	sceneGroup:insert(plaidWallpaper)
	plaidWallpaper.name = "격자무늬벽지"
	plaidWallpaper.id = 25
	plaidWallpaper:addEventListener("touch",popup2)

	local whiteFloor = display.newImage("이미지/상점/아이템/흰색바닥.png")
	whiteFloor.x,whiteFloor.y = display.contentWidth*0.433, display.contentHeight*0.777
	whiteFloor.anchorX,whiteFloor.anchorY = 0.5,0.5
	sceneGroup:insert(whiteFloor)
	whiteFloor.name = "흰색바닥"
	whiteFloor.id = 25
	whiteFloor:addEventListener("touch",popup2)

	local woodFloor = display.newImage("이미지/상점/아이템/나무바닥.png")
	woodFloor.x,woodFloor.y = display.contentWidth*0.571, display.contentHeight*0.777
	woodFloor.anchorX,woodFloor.anchorY = 0.5,0.5
	sceneGroup:insert(woodFloor)
	woodFloor.name = "나무바닥"
	woodFloor.id = 25
	woodFloor:addEventListener("touch",popup2)

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
