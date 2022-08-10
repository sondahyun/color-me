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

	local function go_one(event)
		if event.phase == "began" then
			composer.removeScene("view03bag_deco2")
			composer.gotoScene("view03bag_deco")
		end
	end

	local function go_clothes(event)
		if event.phase == "began" then
			composer.removeScene("view03bag_deco")
			composer.gotoScene("view03bag_deco3_clothes")
		end
	end


	local update1 = display.newImage("이미지/가방/꾸미기배경2.png")
	update1.x, update1.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(update1)

	local basic_button= display.newImage("이미지/가방/일반.png")
	basic_button.x, basic_button.y = display.contentWidth*0.3066, display.contentHeight*0.0774
	basic_button.anchorX,basic_button.anchorY=0,0
	basic_button:addEventListener("touch",go_popup)
	sceneGroup:insert(basic_button)

	local pretty_button= display.newImage("이미지/가방/꾸미기_완료.png")
	pretty_button.x, pretty_button.y = display.contentWidth*0.5, display.contentHeight*0.0774
	sceneGroup:insert(pretty_button)
	pretty_button.anchorX,pretty_button.anchorY=0,0

	local left_button = display.newImage("이미지/가방/가구버튼1.png")
	left_button.x, left_button.y = display.contentWidth*0.444,display.contentHeight*0.8966
	sceneGroup:insert(left_button)
	left_button:addEventListener("touch",go_one)
	left_button.anchorX,left_button.anchorY=0,0

	local right_buttoned = display.newImage("이미지/가방/가구버튼2_클릭.png")
	right_buttoned.x, right_buttoned.y = display.contentWidth*0.4795,display.contentHeight*0.8966
	sceneGroup:insert(right_buttoned)
	right_buttoned.anchorX,right_buttoned.anchorY=0,0
	right_buttoned.alpha = 1

	local clothes_button = display.newImage("이미지/가방/꾸미기(옷)버튼(클릭x).png")
	clothes_button.x, clothes_button.y = display.contentWidth* 0.5280833 ,display.contentHeight*0.8966
	sceneGroup:insert(clothes_button)
	clothes_button:addEventListener("touch",go_clothes)
	clothes_button.anchorX,clothes_button.anchorY=0,0

	local exit = display.newImage("이미지/공통/x버튼.png")
	exit.x, exit.y = display.contentWidth*0.9207, display.contentHeight*0.0438
	exit.anchorX, exit.anchorY = 0,0
	sceneGroup:insert(exit)
	exit:addEventListener("touch",go_back)

	--아이템 목록--

	local plant = {}
	local doll = {}
	local frame = {}

	--아이템 목록--

	local plantImage = {}
	local dollImage = {}
	local frameImage = {}
	
	plantImage[1] = loadedItems.plant1
	plantImage[2] = loadedItems.plant2
	plantImage[3] = loadedItems.plant3
	plantImage[4] = loadedItems.plant4

	dollImage[1] = loadedItems.doll1
	dollImage[2] = loadedItems.doll2

	frameImage[1] = loadedItems.frame1
	frameImage[2] = loadedItems.frame2
	frameImage[3] = loadedItems.frame3

	plantCount=loadedItems.plantCount
	dollCount=loadedItems.dollCount
	frameCount=loadedItems.frameCount

	--아이템 함수--
	local function popup(event)
		if event.phase == "began" then
			composer.setVariable("two_check",1)
			composer.setVariable("item",event.target.id)
			composer.showOverlay("view03bag_deco_popup",options)
		end
	end

	for i=1,plantCount do
		 plant[i] = display.newImage("이미지/가방/가구템/" .. plantImage[i] .. ".png")
		 plant[i].x,plant[i].y = display.contentWidth*0.0937 + display.contentWidth*0.1231*(i-1),display.contentHeight*0.2816
		 sceneGroup:insert(plant[i])
		 plant[i].id = plantImage[i]
		 plant[i]:addEventListener("touch",popup)
		 plant[i].anchorX,plant[i].anchorY = 0,0
	end

	for i=1,dollCount do
		 doll[i] = display.newImage("이미지/가방/가구템/" .. dollImage[i] .. ".png")
		 doll[i].x,doll[i].y = display.contentWidth*0.6946 + display.contentWidth*0.1231*(i-1),display.contentHeight*0.2816
		 sceneGroup:insert(doll[i])
		 doll[i].id = dollImage[i]
		 doll[i]:addEventListener("touch",popup)
		 doll[i].anchorX,doll[i].anchorY = 0,0
	end

	for i=1,frameCount do
		 frame[i] = display.newImage("이미지/가방/가구템/" .. frameImage[i] .. ".png")
		 frame[i].x,frame[i].y = display.contentWidth*0.2079 + display.contentWidth*0.1231*(i-1),display.contentHeight*0.6153
		 sceneGroup:insert(frame[i])
		 frame[i].id = frameImage[i]
		 frame[i]:addEventListener("touch",popup)
		 frame[i].anchorX,frame[i].anchorY = 0,0
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
