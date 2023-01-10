--튜토리얼 장면 마지막.
local loadsave = require( "loadsave" )
local composer = require( "composer" )
local scene = composer.newScene()
local widget = require("widget")
local json = require( "json" ) 

function scene:create( event )
	local sceneGroup = self.view
	local loadedSettings = loadsave.loadTable( "settings.json" )
	mainName = loadedSettings.name

	local image = display.newImage("이미지/(신)튜토리얼/8_8-7/" .. 0 .. ".png")
	image.x, image.y = display.contentWidth/2,display.contentHeight/2
	image:toBack()

	-- finger animation 
	local sheetOptions =
	{
	    width = 300,
	    height = 300,
	    numFrames = 18,
	    sheetContentWidth=1800, sheetContentHeight=900
	}

	local fingerMotion = graphics.newImageSheet("이미지/(신)튜토리얼/손가락.png",sheetOptions)

	local sequencesFinger = {
		name = "finger",
		start = 1,
		count = 17,
		time = 1000,
		loopCount = 0,
		loopDirection = "forward"
	}

	local finger = display.newSprite(fingerMotion,sequencesFinger)
	finger.anchorX,finger.anchorY = 0,0
	finger.x, finger.y = 1169.13+470,356.63 + 270
	finger.alpha = 1
	sceneGroup:insert(finger)
	
	finger:play()

	local desc = display.newText("어서 와라. 처음 보는 얼굴인데, 네 이름이..."..mainName  .. "이구나.\n나는 모북. 이 상점의 주인이란다. 여기서 구입한 물건들은 활동 시 사용하거나 친구들에게 선물할 수 있지.", display.contentWidth*0.394,display.contentHeight*0.835, "font/NanumSquare_acB.ttf", 30)
	desc:setFillColor(0)
	desc.alpha=0


	local index = 0

	local function nextScript(event)
		index = index +1
		if(index==3) then
			desc.alpha = 1
		elseif(index==4) then
			desc.alpha=0
		end
		if(index > 25) then
			loadedSettings.money = loadedSettings.money + 10
			loadsave.saveTable(loadedSettings,"settings.json")
			sceneGroup:insert(desc)
			composer.removeScene("view01_guide(new)3")
			composer.gotoScene("view00Room")
		end

		finger.alpha = 0
		if(index==1) then

		finger.alpha = 1
			finger.x, finger.y = 1080 ,190
			finger.rotation = 45
		end

		image.fill = {
		 	type = "image",
		 	filename = "이미지/(신)튜토리얼/8_8-7/" .. index .. ".png"
		}
	end

	image:addEventListener("tap",nextScript)
 	
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