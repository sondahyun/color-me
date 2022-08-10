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


	-- 코인 객체, 글씨체 및 세이브 파일에 담겨진 보유 코인을 text에 담음
	local money = display.newText("",display.contentWidth*0.16, display.contentHeight*0.079,"font/NanumSquare_acB.ttf")
	money:setFillColor(0.964, 0.462, 0.411)
	money.anchorX = 1
	money.text = loadedSettings.money
	money.size = 53
	sceneGroup:insert(money)

	local function gotodeco(event)
		if event.phase == "began" then
			composer.removeScene("view04Deco")
			composer.gotoScene("view04DecoClothes")
		end
	end

	--옷 보러가기 버튼
	local goCloset = display.newImage("이미지/상점/옷상점버튼.png")
	sceneGroup:insert(goCloset)
	goCloset.x, goCloset.y = display.contentWidth*0.865, display.contentHeight*0.851
	goCloset:addEventListener("touch",gotodeco)

	-- 진열

	local function popup(event)
		if event.phase == "began" then
			item = event.target.name
			money = event.target.id
			composer.setVariable("item", item)
			composer.setVariable("money",money)
			composer.removeScene("view04Deco")
			composer.gotoScene("view04Decoitem")
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
	local flowerBlanket = display.newImage("이미지/상점/아이템/꽃무늬이불.png")
	flowerBlanket.x,flowerBlanket.y = display.contentWidth*0.145, display.contentHeight*0.3
	flowerBlanket.anchorX,flowerBlanket.anchorY = 0.5,0.5
	flowerBlanket.name = "꽃무늬이불"
	flowerBlanket.id = 10
	flowerBlanket.alpha=loadedItems.d1Sold+0.5
	sceneGroup:insert(flowerBlanket)
	if loadedItems.d1Sold==1 then 
		flowerBlanket:addEventListener("touch",popup2)	
	else
		flowerBlanket:removeEventListener("touch",popup2)
	end


	local stripeBlanket = display.newImage("이미지/상점/아이템/줄무늬이불.png")
	stripeBlanket.x,stripeBlanket.y = display.contentWidth*0.288, display.contentHeight*0.301
	stripeBlanket.anchorX,stripeBlanket.anchorY = 0.5,0.5
	stripeBlanket.name = "줄무늬이불"
	stripeBlanket.id = 16
	stripeBlanket.alpha=loadedItems.d2Sold+0.5
	sceneGroup:insert(stripeBlanket)
	if loadedItems.d2Sold==1 then 
		stripeBlanket:addEventListener("touch",popup2)	
	else
		stripeBlanket:removeEventListener("touch",popup2)
	end

	local cactus = display.newImage("이미지/상점/아이템/선인장화분.png")
	cactus.x,cactus.y = display.contentWidth*0.427, display.contentHeight*0.295
	cactus.anchorX,cactus.anchorY = 0.5,0.5
	cactus.id = 15
	cactus.alpha=loadedItems.d3Sold+0.5
	sceneGroup:insert(cactus)
	cactus.name = "선인장화분"
	if loadedItems.d3Sold==1 then 
		cactus:addEventListener("touch",popup)	
	else
		cactus:removeEventListener("touch",popup)
	end

	local sunflower = display.newImage("이미지/상점/아이템/해바라기화분.png")
	sunflower.x,sunflower.y = display.contentWidth*0.571, display.contentHeight*0.285
	sunflower.anchorX,sunflower.anchorY = 0.5,0.5
	sunflower.alpha=loadedItems.d4Sold+0.5
	sceneGroup:insert(sunflower)
	sunflower.name = "해바라기화분"
	sunflower.id = 14
	if loadedItems.d4Sold==1 then 
		sunflower:addEventListener("touch",popup)	
	else
		sunflower:removeEventListener("touch",popup)
	end

	local clover = display.newImage("이미지/상점/아이템/클로버화분.png")
	clover.x,clover.y = display.contentWidth*0.713, display.contentHeight*0.295
	clover.anchorX,clover.anchorY = 0.5,0.5
	clover.alpha=loadedItems.d5Sold+0.5
	sceneGroup:insert(clover)
	clover.name = "클로버화분"
	clover.id = 18
	if loadedItems.d5Sold==1 then 
		clover:addEventListener("touch",popup)	
	else
		clover:removeEventListener("touch",popup)
	end

	local violet= display.newImage("이미지/상점/아이템/제비꽃화분.png")
	violet.x,violet.y = display.contentWidth*0.852, display.contentHeight*0.317
	violet.anchorX,violet.anchorY = 0.5,0.5
	violet.alpha=loadedItems.d6Sold+0.5
	sceneGroup:insert(violet)
	violet.name = "제비꽃화분"
	violet.id = 20
	if loadedItems.d6Sold==1 then 
		violet:addEventListener("touch",popup)	
	else
		violet:removeEventListener("touch",popup)
	end

	-- 2행

	local heartCarpet = display.newImage("이미지/상점/아이템/하트카펫.png")
	heartCarpet.x,heartCarpet.y = display.contentWidth*0.17, display.contentHeight*0.537
	heartCarpet.anchorX,heartCarpet.anchorY = 0.5,0.5
	heartCarpet.alpha=loadedItems.d7Sold+0.5
	sceneGroup:insert(heartCarpet)
	heartCarpet.name = "하트카펫"
	heartCarpet.id = 10
	if loadedItems.d7Sold==1 then 
		heartCarpet:addEventListener("touch",popup2)	
	else
		heartCarpet:removeEventListener("touch",popup2)
	end

	local roundCarpet = display.newImage("이미지/상점/아이템/둥근카펫.png")
	roundCarpet.x,roundCarpet.y = display.contentWidth*0.347, display.contentHeight*0.537
	roundCarpet.anchorX,roundCarpet.anchorY = 0.5,0.5
	roundCarpet.alpha=loadedItems.d8Sold+0.5
	sceneGroup:insert(roundCarpet)
	roundCarpet.name = "둥근카펫"
	roundCarpet.id = 16
	if loadedItems.d8Sold==1 then 
		roundCarpet:addEventListener("touch",popup2)	
	else
		roundCarpet:removeEventListener("touch",popup2)
	end

	local squareCarpet = display.newImage("이미지/상점/아이템/네모카펫.png")
	squareCarpet.x,squareCarpet.y = display.contentWidth*0.542, display.contentHeight*0.553
	squareCarpet.anchorX,squareCarpet.anchorY = 0.5,0.5
	squareCarpet.alpha=loadedItems.d9Sold+0.5
	sceneGroup:insert(squareCarpet)
	squareCarpet.name = "네모카펫"
	squareCarpet.id = 25
	if loadedItems.d9Sold==1 then 
		squareCarpet:addEventListener("touch",popup2)	
	else
		squareCarpet:removeEventListener("touch",popup2)
	end

	local teddybear = display.newImage("이미지/상점/아이템/곰인형.png")
	teddybear.x,teddybear.y = display.contentWidth*0.71, display.contentHeight*0.54
	teddybear.anchorX,teddybear.anchorY = 0.5,0.5
	teddybear.alpha=loadedItems.d10Sold+0.5
	sceneGroup:insert(teddybear)
	teddybear.name = "곰인형"
	teddybear.id = 20
	if loadedItems.d10Sold==1 then 
		teddybear:addEventListener("touch",popup)	
	else
		teddybear:removeEventListener("touch",popup)
	end

	local bunny = display.newImage("이미지/상점/아이템/토끼인형.png")
	bunny.x,bunny.y = display.contentWidth*0.848, display.contentHeight*0.529
	bunny.anchorX,bunny.anchorY = 0.5,0.5
	bunny.alpha=loadedItems.d11Sold+0.5
	sceneGroup:insert(bunny)
	bunny.name = "토끼인형"
	bunny.id = 20
	if loadedItems.d11Sold==1 then 
		bunny:addEventListener("touch",popup)	
	else
		bunny:removeEventListener("touch",popup)
	end

	--3행
	local dotWallpaper = display.newImage("이미지/상점/아이템/도트벽지.png")
	dotWallpaper.x,dotWallpaper.y = display.contentWidth*0.149, display.contentHeight*0.766
	dotWallpaper.anchorX,dotWallpaper.anchorY = 0.5,0.5
	dotWallpaper.alpha=loadedItems.d12Sold+0.5
	sceneGroup:insert(dotWallpaper)
	dotWallpaper.name = "도트벽지"
	dotWallpaper.id = 25
	if loadedItems.d12Sold==1 then 
		dotWallpaper:addEventListener("touch",popup2)
	else
		dotWallpaper:removeEventListener("touch",popup2)
	end

	local plaidWallpaper = display.newImage("이미지/상점/아이템/격자벽지.png")
	plaidWallpaper.x,plaidWallpaper.y = display.contentWidth*0.29, display.contentHeight*0.766
	plaidWallpaper.anchorX,plaidWallpaper.anchorY = 0.5,0.5
	plaidWallpaper.alpha=loadedItems.d13Sold+0.5
	sceneGroup:insert(plaidWallpaper)
	plaidWallpaper.name = "격자벽지"
	plaidWallpaper.id = 25
	if loadedItems.d13Sold==1 then 
		plaidWallpaper:addEventListener("touch",popup2)	
	else
		plaidWallpaper:removeEventListener("touch",popup2)
	end

	local whiteFloor = display.newImage("이미지/상점/아이템/흰색바닥.png")
	whiteFloor.x,whiteFloor.y = display.contentWidth*0.433, display.contentHeight*0.777
	whiteFloor.anchorX,whiteFloor.anchorY = 0.5,0.5
	whiteFloor.alpha=loadedItems.d14Sold+0.5
	sceneGroup:insert(whiteFloor)
	whiteFloor.name = "흰색바닥"
	whiteFloor.id = 25
	if loadedItems.d14Sold==1 then 
		whiteFloor:addEventListener("touch",popup2)	
	else
		whiteFloor:removeEventListener("touch",popup2)
	end

	local woodFloor = display.newImage("이미지/상점/아이템/나무바닥.png")
	woodFloor.x,woodFloor.y = display.contentWidth*0.571, display.contentHeight*0.777
	woodFloor.anchorX,woodFloor.anchorY = 0.5,0.5
	woodFloor.alpha=loadedItems.d15Sold+0.5
	sceneGroup:insert(woodFloor)
	woodFloor.name = "나무바닥"
	woodFloor.id = 25
	if loadedItems.d15Sold==1 then 
		woodFloor:addEventListener("touch",popup2)	
	else
		woodFloor:removeEventListener("touch",popup2)
	end

	--가격표(추후수정)

local fbprice = display.newText("10P",display.contentWidth*0.145, display.contentHeight*0.429,"font/NanumSquare_acB.ttf")
fbprice.size = 25
fbprice:setFillColor(0)
sceneGroup:insert(fbprice)

local sbprice = display.newText("16P",display.contentWidth*0.286, display.contentHeight*0.429,"font/NanumSquare_acB.ttf")
sbprice.size = 25
sbprice:setFillColor(0)
sceneGroup:insert(sbprice)

local cactusprice = display.newText("15P",display.contentWidth*0.427, display.contentHeight*0.429,"font/NanumSquare_acB.ttf")
cactusprice.size = 25
cactusprice:setFillColor(0)
sceneGroup:insert(cactusprice)

local sfprice = display.newText("14P",display.contentWidth*0.568, display.contentHeight*0.429,"font/NanumSquare_acB.ttf")
sfprice.size = 25
sfprice:setFillColor(0)
sceneGroup:insert(sfprice)

local cloverprice = display.newText("18P",display.contentWidth*0.709, display.contentHeight*0.429,"font/NanumSquare_acB.ttf")
cloverprice.size = 25
cloverprice:setFillColor(0)
sceneGroup:insert(cloverprice)

local violetprice = display.newText("20P",display.contentWidth*0.85, display.contentHeight*0.429,"font/NanumSquare_acB.ttf")
violetprice.size = 25
violetprice:setFillColor(0)
sceneGroup:insert(violetprice)

local hcprice = display.newText("10P",display.contentWidth*0.169, display.contentHeight*0.664,"font/NanumSquare_acB.ttf")
hcprice.size = 25
hcprice:setFillColor(0)
sceneGroup:insert(hcprice)

local rcprice = display.newText("15P",display.contentWidth*0.346, display.contentHeight*0.664,"font/NanumSquare_acB.ttf")
rcprice.size = 25
rcprice:setFillColor(0)
sceneGroup:insert(rcprice)

local scprice = display.newText("15P",display.contentWidth*0.542, display.contentHeight*0.664,"font/NanumSquare_acB.ttf")
scprice.size = 25
scprice:setFillColor(0)
sceneGroup:insert(scprice)

local tbprice = display.newText("20P",display.contentWidth*0.709, display.contentHeight*0.664,"font/NanumSquare_acB.ttf")
tbprice.size = 25
tbprice:setFillColor(0)
sceneGroup:insert(tbprice)

local bunnyprice = display.newText("20P",display.contentWidth*0.85, display.contentHeight*0.664,"font/NanumSquare_acB.ttf")
bunnyprice.size = 25
bunnyprice:setFillColor(0)
sceneGroup:insert(bunnyprice)

local dwprice = display.newText("25P",display.contentWidth*0.148, display.contentHeight*0.904,"font/NanumSquare_acB.ttf")
dwprice.size = 25
dwprice:setFillColor(0)
sceneGroup:insert(dwprice)

local pwprice = display.newText("25P",display.contentWidth*0.289, display.contentHeight*0.904,"font/NanumSquare_acB.ttf")
pwprice.size = 25
pwprice:setFillColor(0)
sceneGroup:insert(pwprice)

local whfprice = display.newText("25P",display.contentWidth*0.429, display.contentHeight*0.904,"font/NanumSquare_acB.ttf")
whfprice.size = 25
whfprice:setFillColor(0)
sceneGroup:insert(whfprice)

local wofprice = display.newText("25P",display.contentWidth*0.57, display.contentHeight*0.904,"font/NanumSquare_acB.ttf")
wofprice.size = 25
wofprice:setFillColor(0)
sceneGroup:insert(wofprice)

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
