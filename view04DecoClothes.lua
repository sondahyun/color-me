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
	
	local shouldUpdate = false
	
	local background = display.newImage("이미지/상점/옷템/배경(베타).png") -- 원래는 배경
	background.x, background.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(background)

	local storeMusic = audio.loadStream( "음악/상점.mp3" )

	
	local function go_back(event)
		if event.phase == "began" then
			audio.pause(storeMusic)
			composer.removeScene("view04DecoClothes")
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
			composer.removeScene("view04DecoClothes")
			composer.gotoScene("view04Deco")
		end
	end

	--옷 보러가기 버튼
	local goCloset = display.newImage("이미지/상점/옷템/가구상점으로.png")
	sceneGroup:insert(goCloset)
	goCloset.x, goCloset.y = display.contentWidth*0.865, display.contentHeight*0.851
	goCloset:addEventListener("touch",gotodeco)

	local options={
		isModal=true
	}

	local function clothesClick(event)
		if event.phase == "ended" then
			shouldUpdate = true
			tag = event.target.tag
			composer.setVariable("tag", tag)
			composer.removeScene("view04DecoClothes")
			composer.gotoScene("view04DecoClothes_popup")
		end
	end

	-- 옷 이미지
	local clothes_name = {
		"꼬마악마",
		"탐정",
		"해적",
		"공주님",
		--"병정인형",
		"수면잠옷",
		"여름해변",
		"말썽쟁이",
		--"모범친구"
	}

	local clothes_location = {
		{89.7,310.45},
		{506.27,277.09},
		{822.16,229.15},
		{1203,333.64},
		--{1532.94,262},
		{162.67,650.92},
		{510.96,706.51},
		{869.56,646.49},
		--{1211.25,780.07}
	}

	local clothes_image = {}
	for i = 1, #clothes_name do
		clothes_image[i] = display.newImage("이미지/상점/옷템/의상-" .. clothes_name[i] .."세트.png")
		clothes_image[i].name = clothes_name[i]
		clothes_image[i].tag = i
		clothes_image[i].anchorX, clothes_image[i].anchorY = 0,0
		clothes_image[i].x, clothes_image[i].y = clothes_location[i][1], clothes_location[i][2]

		if loadedItems.costumeBuy[i].buy == 0 then
			clothes_image[i]:addEventListener("touch",clothesClick)
		end
		sceneGroup:insert(clothes_image[i])

	end

	--sold--

	local sold = {}

	local function checkLow(i)
		if(i>4) then
			return 1
		else
			return 0
		end
	end

	--sold out
	for i = 1, #clothes_name do
		sold[i] = display.newImage("이미지/상점/옷템/매진.png")
		sold[i].tag = i
		sold[i].x, sold[i].y = 408 + 343*((i-1)%4),445 + 370*(checkLow(i))
		sold[i].alpha = loadedItems.costumeBuy[i].buy
		sceneGroup:insert(sold[i])
	end

end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	local loadedItems= loadsave.loadTable( "items.json" )
	
	if phase == "will" then
		for i = 1, 9 do
			print(loadedItems.costumeBuy[i].buy)
		end
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
