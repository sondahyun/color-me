--튜토리얼 장면 1부터 7
local loadsave = require( "loadsave" )
local composer = require( "composer" )
local scene = composer.newScene()
local widget = require("widget")
local json = require( "json" ) 

function scene:create( event )
	local sceneGroup = self.view
	local loadedSettings = loadsave.loadTable( "settings.json" )

	local image = display.newImage("이미지/(신)튜토리얼/0_6-2/" .. 0 .. ".png")
	image.x, image.y = display.contentWidth/2,display.contentHeight/2
	image:toBack()
	image.alpha = 0

	local image1 = display.newImage("이미지/(신)튜토리얼/0_6-2/" .. 0 .. ".png")
	image1.x, image1.y = display.contentWidth/2,display.contentHeight/2
	image1:toBack()

    local startBt = display.newImage("이미지/(신)튜토리얼/start버튼.png")
    startBt.x,startBt.y = display.contentWidth * 0.69, display.contentHeight * 0.42
    startBt.alpha = 1

    local skipBt = display.newImage("이미지/(신)튜토리얼/skip버튼.png")
    skipBt.x,skipBt.y = display.contentWidth * 0.84, display.contentHeight * 0.42
    skipBt.alpha = 1

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
	finger.x, finger.y = 1169.13+140,56.63 + 200
	finger.alpha = 0
	sceneGroup:insert(finger)
	
	finger:play()
	finger.rotation = 270

	--finger location & rotation--
	local fingerLocation = {
		{56.75 - 100 ,890.24 - 250 }, -- 앨범 아이콘
		{1031.57 - 250 ,405.87 + 250}, -- 앨범 블리
		{190.53 - 100,890.97 - 250}, -- 설정 아이콘
		{1395.39 + 330,201.72 - 120}, -- 오디오 설정 x버튼
		{87 + 800,30}, -- 스탯창
		{87 + 800,30}, -- 스탯창
		{1169.13 + 600,56.63 + 180}, -- 달력
		{1169.13+140,56.63 + 200}, -- 코인창
		{1470.7 - 100,891.34 - 250} -- 스케줄 아이콘
	}

	local isFinger = {
		1,1,0,1,0,
		1,1,1,0,0,
		1,1,0,0,1,
		0,0
	}

	local fingerRotation = {
		360, -- 아래
		270, -- 오른쪽,
		360, 
		90, -- 왼쪽
		90,
		90,
		90,
		270,
		360
	}

	local index = 0
	local i = 1

	local function nextScript(event)
		if(index==0) then
			startBt.alpha = 0
			skipBt.alpha = 0
			image.alpha=1
			image:addEventListener("tap",nextScript)
		end
		index = index +1
		if(index > 17) then
			sceneGroup:insert(image1)
			sceneGroup:insert(skipBt)
			sceneGroup:insert(startBt)
			composer.removeScene("view01_guide(new)")
			composer.gotoScene("view01_guide(new)2")
		end

		if(isFinger[index]==1) then
			finger.alpha = 1
			finger.x, finger.y = fingerLocation[i][1], fingerLocation[i][2]
			finger.rotation = fingerRotation[i]
			i = i+1
		else
			finger.alpha = 0
		end

		image.fill = {
		 	type = "image",
		 	filename = "이미지/(신)튜토리얼/0_6-2/" .. index .. ".png"
		}

	end

	local function goRoom(event)
		sceneGroup:insert(image1)
		sceneGroup:insert(skipBt)
		sceneGroup:insert(startBt)
		composer.removeScene("view01_guide(new)")
		composer.gotoScene("view00Room")
	end

	startBt:addEventListener("tap",nextScript)
	skipBt:addEventListener("tap",goRoom)
 	
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