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

	
	local background = display.newImage("이미지/상점/배경(가격).png")
	background.x, background.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(background)

	local storeMusic = audio.loadStream( "음악/상점.mp3" )
	
	local function go_back(event)
		if event.phase == "began" then
			audio.pause(storeMusic)
			composer.removeScene("view04Store")
			composer.gotoScene("view01Map")
		end
	end
	
	local exit = display.newImage("이미지/공통/x버튼.png")
	exit.x, exit.y = display.contentWidth*0.9207, display.contentHeight*0.0438
	exit.anchorX, exit.anchorY = 0,0
	sceneGroup:insert(exit)
	exit:addEventListener("touch",go_back)


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

	-- 진열

	local function popup(event)
		if event.phase == "began" then
			item = event.target.name
			money = event.target.id
			composer.setVariable("item", item)
			composer.setVariable("money",money)
			composer.removeScene("view04Store")
			composer.gotoScene("view04Storeitem")
		end
	end

	--1행
	local pencil = display.newImage("이미지/상점/아이템/연필.png")
	pencil.x,pencil.y = display.contentWidth*0.1117, display.contentHeight*0.241
	pencil.anchorX,pencil.anchorY = 0,0
	pencil.name = "연필"
	pencil.id = 10
	sceneGroup:insert(pencil)
	pencil:addEventListener("touch",popup)

	local dog_rice = display.newImage("이미지/상점/아이템/사료.png")
	dog_rice.x,dog_rice.y = display.contentWidth*0.2615, display.contentHeight*0.241
	dog_rice.anchorX,dog_rice.anchorY = 0,0
	dog_rice.name = "사료"
	dog_rice.id = 16
	sceneGroup:insert(dog_rice)
	dog_rice:addEventListener("touch",popup)

	local toy = display.newImage("이미지/상점/아이템/블록.png")
	toy.x,toy.y = display.contentWidth*0.3948, display.contentHeight*0.241
	toy.anchorX,toy.anchorY = 0,0
	toy.id = 15
	sceneGroup:insert(toy)
	toy.name = "블록"

	toy:addEventListener("touch",popup)

	local duck = display.newImage("이미지/상점/아이템/오리.png")
	duck.x,duck.y = display.contentWidth*0.5427, display.contentHeight*0.249
	duck.anchorX,duck.anchorY = 0,0
	sceneGroup:insert(duck)
	duck.name = "오리"
	duck.id = 14
	duck:addEventListener("touch",popup)

	local heart = display.newImage("이미지/상점/아이템/응원봉.png")
	heart.x,heart.y = display.contentWidth*0.6807, display.contentHeight*0.24
	heart.anchorX,heart.anchorY = 0,0
	sceneGroup:insert(heart)
	heart.name = "응원봉"
	heart.id = 18
	heart:addEventListener("touch",popup)

	local pie = display.newImage("이미지/상점/아이템/파이.png")
	pie.x,pie.y = display.contentWidth*0.8195, display.contentHeight*0.249
	pie.anchorX,pie.anchorY = 0,0
	sceneGroup:insert(pie)
	pie.name = "파이"
	pie.id = 20
	pie:addEventListener("touch",popup)

	-- 2행

	local kit = display.newImage("이미지/상점/아이템/실험세트.png")
	kit.x,kit.y = display.contentWidth*0.1788, display.contentHeight*0.5114
	kit.anchorX,kit.anchorY = 0,0
	sceneGroup:insert(kit)
	kit.name = "실험세트"
	kit.id = 25
	kit:addEventListener("touch",popup)

	local plant = display.newImage("이미지/상점/아이템/화분.png")
	plant.x,plant.y = display.contentWidth*0.3393, display.contentHeight*0.463
	plant.anchorX,plant.anchorY = 0,0
	sceneGroup:insert(plant)
	plant.name = "화분"
	plant.id = 25
	plant:addEventListener("touch",popup)

	local tiger = display.newImage("이미지/상점/아이템/호랑이.png")
	tiger.x,tiger.y = display.contentWidth*0.475, display.contentHeight*0.48
	tiger.anchorX,tiger.anchorY = 0,0
	sceneGroup:insert(tiger)
	tiger.name = "호랑이"
	tiger.id = 25
	tiger:addEventListener("touch",popup)

	local purfume = display.newImage("이미지/상점/아이템/향수.png")
	purfume.x,purfume.y = display.contentWidth*0.6167, display.contentHeight*0.4736
	purfume.anchorX,purfume.anchorY = 0,0
	sceneGroup:insert(purfume)
	purfume.name = "향수"
	purfume.id = 25
	purfume:addEventListener("touch",popup)

	local speaker = display.newImage("이미지/상점/아이템/스피커.png")
	speaker.x,speaker.y = display.contentWidth*0.7489, display.contentHeight*0.4901
	speaker.anchorX,speaker.anchorY = 0,0
	sceneGroup:insert(speaker)
	speaker.name = "스피커"
	speaker.id = 25
	speaker:addEventListener("touch",popup)

	--3행
	local pin = display.newImage("이미지/상점/아이템/머리핀.png")
	pin.x,pin.y = display.contentWidth*0.1117, display.contentHeight*0.76

	pin.anchorX,pin.anchorY = 0,0
	sceneGroup:insert(pin)
	pin.name = "머리핀"
	pin.id = 10
	pin:addEventListener("touch",popup)

	local headset = display.newImage("이미지/상점/아이템/헤드셋.png")
	headset.x,headset.y = display.contentWidth*0.2615, display.contentHeight*0.712
	headset.anchorX,headset.anchorY = 0,0
	sceneGroup:insert(headset)
	headset.name = "헤드셋"
	headset.id = 25
	headset:addEventListener("touch",popup)

	local hero = display.newImage("이미지/상점/아이템/망토.png")
	hero.x,hero.y = display.contentWidth*0.3948, display.contentHeight*0.74
	hero.anchorX,hero.anchorY = 0,0
	sceneGroup:insert(hero)
	hero.name = "망토"
	hero.id = 15
	hero:addEventListener("touch",popup)

	local galsses = display.newImage("이미지/상점/아이템/안경닦이.png")
	galsses.x,galsses.y = display.contentWidth*0.6807, display.contentHeight*0.725
	galsses.anchorX,galsses.anchorY = 0,0
	sceneGroup:insert(galsses)
	galsses.name = "안경닦이"
	galsses.id = 25
	galsses:addEventListener("touch",popup)

	local mint = display.newImage("이미지/상점/아이템/민초.png")
	mint.x,mint.y = display.contentWidth*0.543, display.contentHeight*0.73
	mint.anchorX,mint.anchorY = 0,0
	sceneGroup:insert(mint)
	mint.name = "민초"
	mint.id = 25
	mint:addEventListener("touch",popup)

	local frame = display.newImage("이미지/상점/아이템/액자.png")
	frame.x,frame.y = display.contentWidth*0.8195, display.contentHeight*0.73
	frame.anchorX,frame.anchorY = 0,0
	sceneGroup:insert(frame)
	frame.name = "액자"
	frame.id = 20
	frame:addEventListener("touch",popup)





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
