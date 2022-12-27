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

	--버튼 함수--

	local function go_back(event)
		if event.phase == "began" then
			composer.removeScene("view03bag_deco3_clothes")
			composer.gotoScene("view00Room")
		end
	end
	
	local function go_popup(event)
		if event.phase == "began" then
			composer.removeScene("view03bag_deco3_clothes")
			composer.gotoScene("view03bag")
		end
	end

	local function go_two(event)
		if event.phase == "began" then
			composer.removeScene("view03bag_deco3_clothes")
			composer.gotoScene("view03bag_deco2")
		end
	end

	local function go_one(event)
		if event.phase == "began" then
			composer.removeScene("view03bag_deco3_clothes")
			composer.gotoScene("view03bag_deco")
		end
	end


	local update = display.newImage("이미지/가방/가방(꾸미기) 배경-01.png")
	update.x, update.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(update)


	--일반/꾸미기 전환 버튼--

	local basic_button= display.newImage("이미지/가방/일반.png")
	basic_button.x, basic_button.y = display.contentWidth*0.3066, display.contentHeight*0.0774
	basic_button.anchorX,basic_button.anchorY=0,0
	basic_button:addEventListener("touch",go_popup)
	sceneGroup:insert(basic_button)

	local pretty_button= display.newImage("이미지/가방/꾸미기_완료.png")
	pretty_button.x, pretty_button.y = display.contentWidth*0.5, display.contentHeight*0.0774
	sceneGroup:insert(pretty_button)
	pretty_button.anchorX,pretty_button.anchorY=0,0

	--목록 전환 버튼--

	local left_buttoned = display.newImage("이미지/가방/가구버튼1.png")
	left_buttoned.x, left_buttoned.y = display.contentWidth*0.444,display.contentHeight*0.8966
	sceneGroup:insert(left_buttoned)
	left_buttoned:addEventListener("touch",go_one)
	left_buttoned.anchorX,left_buttoned.anchorY=0,0

	local right_button = display.newImage("이미지/가방/가구버튼2.png")
	right_button.x, right_button.y = display.contentWidth*0.4795,display.contentHeight*0.8966
	sceneGroup:insert(right_button)
	right_button:addEventListener("touch",go_two)
	right_button.anchorX,right_button.anchorY=0,0

	local clothes_button = display.newImage("이미지/가방/꾸미기(옷)버튼(클릭O).png")
	clothes_button.x, clothes_button.y = display.contentWidth* 0.5280833 ,display.contentHeight*0.8966
	sceneGroup:insert(clothes_button)
	--clothes_button:addEventListener("touch",go_clothes)
	clothes_button.anchorX,clothes_button.anchorY=0,0

	local exit = display.newImage("이미지/공통/x버튼.png")
	exit.x, exit.y = display.contentWidth*0.9207, display.contentHeight*0.0438
	exit.anchorX, exit.anchorY = 0,0
	sceneGroup:insert(exit)
	exit:addEventListener("touch",go_back)


	--아이템 목록--


	--악마
	--[[local costume_devil = loadedItems.costumeBuy[0]
	--탐정
	local costume_detective = loadedItems.costumeBuy[1]
	--해적
	local costume_pirate = loadedItems.costumeBuy[2]
	--공주님
	local costume_princess = loadedItems.costumeBuy[3]
	--병정인형
	local costume_walnut = loadedItems.costumeBuy[4]
	--수면잠옷
	local costume_pyjamas = loadedItems.costumeBuy[5]
	--여름해변
	local costume_summer = loadedItems.costumeBuy[6]
	--말썽쟁이
	local costume_troublemaker = loadedItems.costumeBuy[7]
	--모범친구
	local costume_nerd = loadedItems.costumeBuy[8]
	--기본
	local costume_normal = loadedItems.costumeBuy[9]--]]


	--[[local costume_walnut = loadedItems.costume_walnut
	local costume_pirate = loadedItems.costume_pirate
	local costume_detective = loadedItems.costume_detective
	local costume_summer = loadedItems.costume_summer
	local costume_devil = loadedItems.costume_devil
	local costume_pyjamas = loadedItems.costume_pyjamas
	local costume_troublemaker = loadedItems.costume_troublemaker
	local costume_nerd = loadedItems.costume_nerd
	local costume_princess = loadedItems.costume_princess
--]]

	
	
	--[[
	wallpaperImage[1] = "격자벽지"
	wallpaperImage[2] = "도트벽지"
	wallpaperImage[3] = "흰색벽지"

	floorImage[1] = "나무바닥"
	floorImage[2] = "푸른바닥"
	floorImage[3] = "흰색바닥"

	blanketImage[1] = "꽃무늬이불"
	blanketImage[2] = "줄무늬이불"
	blanketImage[3] = "파랑이불"

	carpetImage[1] = "네모카펫"
	carpetImage[2] = "둥근카펫"
	carpetImage[3] = "하트카펫"
	]]--
	

	--[[
	local wallpaperCount = 3
	local floorCount = 3
	local blanketCount = 3
	local carpetCount = 3

	]]--
	local clothes_Count = 9
	
	for i=1, 10 do
		print(loadedItems.costumeBuy[i].buy)
		print(loadedItems.costumeBuy[i].name)
	end



	--아이템 함수--
	local function popup(event)
		if event.phase == "began" then
			tag = event.target.tag
			composer.setVariable("tag", tag)
			composer.showOverlay("view03bag_deco3_clothes_popup",options)
		end
	end

	local clothes_location = {
		{267,677.92}, --악마
		{605.96,647.92}, --탐정
		{862.20,610.49}, --해적
		{1175.25,700.07}, --공주
		{1445,640.45}, --병정

		{325.7,300.45}, --잠옷
		{610.16,345.15}, --해변
		{905,300.64}, --말썽쟁이
		{1180.94,410}, --모범친구
		{1467.99,470} --기본
	}

	local wallpaper = {}
	local j=1


	for i=1, 10 do
		if loadedItems.costumeBuy[i].buy == 1 then
			 wallpaper[i] = display.newImage("이미지/가방/의상템/" .. loadedItems.costumeBuy[i].name .. ".png")
			 wallpaper[i].x,wallpaper[i].y = clothes_location[i][1], clothes_location[i][2]
			 sceneGroup:insert(wallpaper[i])
			 wallpaper[i].tag = i
			 wallpaper[i]:addEventListener("touch",popup)
			 wallpaper[i].anchorX,wallpaper[i].anchorY = 0,0
			 j = j + 1
		end
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