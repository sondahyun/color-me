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
			composer.removeScene("view03bag_deco")
			composer.gotoScene("view00Room")
		end
	end
	
	local function go_popup(event)
		if event.phase == "began" then
			composer.removeScene("view03bag_deco")
			composer.gotoScene("view03bag")
		end
	end

	local function go_two(event)
		if event.phase == "began" then
			composer.removeScene("view03bag_deco")
			composer.gotoScene("view03bag_deco2")
		end
	end

	local update = display.newImage("이미지/가방/꾸미기배경1.png")
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

	local left_buttoned = display.newImage("이미지/가방/가구버튼1_클릭.png")
	left_buttoned.x, left_buttoned.y = display.contentWidth*0.444,display.contentHeight*0.8966
	sceneGroup:insert(left_buttoned)
	left_buttoned.anchorX,left_buttoned.anchorY=0,0

	local right_button = display.newImage("이미지/가방/가구버튼2.png")
	right_button.x, right_button.y = display.contentWidth*0.4795,display.contentHeight*0.8966
	sceneGroup:insert(right_button)
	right_button:addEventListener("touch",go_two)
	right_button.anchorX,right_button.anchorY=0,0

	local exit = display.newImage("이미지/공통/x버튼.png")
	exit.x, exit.y = display.contentWidth*0.9207, display.contentHeight*0.0438
	exit.anchorX, exit.anchorY = 0,0
	sceneGroup:insert(exit)
	exit:addEventListener("touch",go_back)


	--아이템 목록--

	local wallpaperImage = {}
	local floorImage = {}
	local blanketImage = {}
	local carpetImage = {}
	
	wallpaperImage[1] = loadedItems.wallpaper1
	wallpaperImage[2] = loadedItems.wallpaper2
	wallpaperImage[3] = loadedItems.wallpaper3

	floorImage[1] = loadedItems.floor1
	floorImage[2] = loadedItems.floor2
	floorImage[3] = loadedItems.floor3

	blanketImage[1] = loadedItems.blanket1
	blanketImage[2] = loadedItems.blanket2
	blanketImage[3] = loadedItems.blanket3

	carpetImage[1] = loadedItems.carpet1
	carpetImage[2] = loadedItems.carpet2
	carpetImage[3] = loadedItems.carpet3



	
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
	local wallpaper = {}
	local floor = {}
	local blanket = {}
	local carpet = {}

	--[[
	local wallpaperCount = 3
	local floorCount = 3
	local blanketCount = 3
	local carpetCount = 3

	]]--
	wallpaperCount=loadedItems.wallpaperCount
	floorCount=loadedItems.floorCount
	blanketCount=loadedItems.blanketCount
	carpetCount=loadedItems.carpetCount

	for i=1,wallpaperCount do
		print(wallpaperImage[i])
	end

	for i=1,blanketCount do
		print(blanketImage[i])
		print(blanketCount)
	end
	


	--아이템 함수--
	local function popup(event)
		if event.phase == "began" then
			composer.setVariable("item",event.target.id)
			composer.setVariable("two_check",0)
			composer.showOverlay("view03bag_deco_popup",options)
		end
	end

	for i=1,wallpaperCount do
		 wallpaper[i] = display.newImage("이미지/가방/가구템/" .. wallpaperImage[i] .. ".png")
		 wallpaper[i].x,wallpaper[i].y = display.contentWidth*0.0937 + display.contentWidth*0.1231*(i-1),display.contentHeight*0.2816
		 sceneGroup:insert(wallpaper[i])
		 wallpaper[i].id = wallpaperImage[i]
		 wallpaper[i]:addEventListener("touch",popup)
		 wallpaper[i].anchorX,wallpaper[i].anchorY = 0,0
	end

	for i=1,floorCount do
		 floor[i] = display.newImage("이미지/가방/가구템/" .. floorImage[i] .. ".png")
		 floor[i].x,floor[i].y = display.contentWidth*0.5717 + display.contentWidth*0.1231*(i-1),display.contentHeight*0.2816
		 sceneGroup:insert(floor[i])
		 floor[i].id = floorImage[i]
		 floor[i]:addEventListener("touch",popup)
		 floor[i].anchorX,floor[i].anchorY = 0,0
	end

	for i=1,blanketCount do
		 blanket[i] = display.newImage("이미지/가방/가구템/" .. blanketImage[i] .. ".png")
		 blanket[i].x,blanket[i].y = display.contentWidth*0.0937 + display.contentWidth*0.1231*(i-1),display.contentHeight*0.6153
		 sceneGroup:insert(blanket[i])
		 blanket[i].id = blanketImage[i]
		 blanket[i]:addEventListener("touch",popup)
		 blanket[i].anchorX,blanket[i].anchorY = 0,0
	end

	for i=1,carpetCount do
		 carpet[i] = display.newImage("이미지/가방/가구템/" .. carpetImage[i] .. ".png")
		 carpet[i].x,carpet[i].y = display.contentWidth*0.5717 + display.contentWidth*0.1231*(i-1),display.contentHeight*0.6153
		 sceneGroup:insert(carpet[i])
		 carpet[i].id = carpetImage[i]
		 carpet[i]:addEventListener("touch",popup)
		 carpet[i].anchorX,carpet[i].anchorY = 0,0
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
