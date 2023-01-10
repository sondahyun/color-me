--튜토리얼 장면 6-3부터 7-3
local loadsave = require( "loadsave" )
local composer = require( "composer" )
local scene = composer.newScene()
local widget = require("widget")
local json = require( "json" ) 

function scene:create( event )
	local sceneGroup = self.view
	local loadedSettings = loadsave.loadTable( "settings.json" )
	
	local image = display.newImage("이미지/(신)튜토리얼/6-3_7-3/" .. 0 .. ".png")
	image.x, image.y = display.contentWidth/2,display.contentHeight/2
	image:toBack()

    local noBt = display.newImage("이미지/공통/no버튼.png")
    noBt.x,noBt.y = display.contentWidth * 0.578, display.contentHeight * 0.608
    noBt.alpha = 0
    noBt.height = 68
    noBt.width = 239

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
		{662 - 150 , 866 - 170 }, -- 활동 마치기 버튼 위
		{1106 + 150 , 756 + 170}, -- no 버튼 아래
		{1830 + 150, 235 + 170}, -- x버튼 아래
		{1655- 150, 811 - 170}, -- 가방버튼 위
		{783 + 150, 319 + 170}, -- 일반버튼 아래
		{1138 + 150 , 295 + 170}, -- 꾸미기버튼 아래
		{1819 + 150, 242 + 170}, -- x버튼 아래
	}

	local isFinger = {
		0,0,0,0,
		1,0,1,1,1,
		0,1,0,0,1,
		0,0,1
	}

	local fingerRotation = {
		360, -- 아래
		180, --위
		180,
		360,
		180,
		180,
		180
	}

	local index = 0
	local i = 1

	local function nextScript(event)
		index = index +1
		if(index==7) then
			noBt.alpha = 1
			image:removeEventListener("tap",nextScript)
		elseif(index==8) then
			noBt.alpha = 0
			image:addEventListener("tap",nextScript)	
		end
		if(index > 17) then
			sceneGroup:insert(noBt)
			composer.removeScene("view01_guide(new)2")
			composer.gotoScene("view01_guide(new)3")
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
		 	filename = "이미지/(신)튜토리얼/6-3_7-3/" .. index .. ".png"
		}
	end

	image:addEventListener("tap",nextScript)
	noBt:addEventListener("tap",nextScript) 	
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