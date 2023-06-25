--튜토리얼 장면 6-3부터 7-3
local loadsave = require( "loadsave" )
local composer = require( "composer" )
local scene = composer.newScene()
local widget = require("widget")
local json = require( "json" ) 
local objectsToDestroy = {}

function scene:create( event )
	local sceneGroup = self.view
	local loadedSettings = loadsave.loadTable( "settings.json" )
	
	local image = display.newImage("이미지/(신)튜토리얼/6-3_7-3/" .. 0 .. ".png")
	image.x, image.y = display.contentWidth/2,display.contentHeight/2
	image:toBack()
	table.insert(objectsToDestroy, image)

    local noBt = display.newImage("이미지/공통/no버튼.png")
    noBt.x,noBt.y = display.contentWidth * 0.578, display.contentHeight * 0.608
    noBt.alpha = 0
    noBt.height = 68
    noBt.width = 239
    table.insert(objectsToDestroy, noBt)

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
	table.insert(objectsToDestroy, finger)
	
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


	--투명 유령버튼 코드
    local ghost_button = display.newImage("이미지/(신)튜토리얼/투명버튼.png")
    ghost_button.x, ghost_button.y = display.contentWidth/2,display.contentHeight/2
	ghost_button:scale( 5, 5)
	table.insert(objectsToDestroy, ghost_button)
	
	local isButton = {
		0,0,0,0,
		1,0,0,1,
		1,0,1,0,0,
		1,0,0,1
	}

	local buttonLocation = {
		{700 , 1000}, -- 활동 마치기 버튼
		{1800, 100}, -- x버튼
		{1700, 1000}, -- 가방버튼
		{783, 150}, -- 일반버튼
		{1138 , 150}, -- 꾸미기버튼
		{1800, 100} -- x버튼
	}


	local index = 0
	local i = 1
	--유령버튼 인덱스
	local gi = 1
	local function nextScript(event)
		index = index +1
		if(index==7) then
			noBt.alpha = 1
			ghost_button:removeEventListener("tap",nextScript)
		elseif(index==8) then
			noBt.alpha = 0
			ghost_button:addEventListener("tap",nextScript)	
		end
		if(index > 17) then
			sceneGroup:insert(noBt)
			sceneGroup:insert(ghost_button)
			ghost_button:removeEventListener("tap",nextScript)
			sceneGroup = nil
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

		--유령버튼코드
		if(isButton[index]==1) then
			ghost_button.x, ghost_button.y = buttonLocation[gi][1], buttonLocation[gi][2]
			gi = gi+1
			if(isButton[index-1]== 0) then
				if(index == 5) then
					ghost_button:scale( 0.2, 0.1)
				else
					ghost_button:scale( 0.15, 0.15)
				end
			end
		else
			ghost_button.x, ghost_button.y = display.contentWidth/2,display.contentHeight/2
			if(isButton[index-1]~= 0 and index ~= 1) then
				if(index == 6) then
					ghost_button:scale( 5, 10)
				else
					ghost_button:scale( 5, 5)
				end
			end
		end

		image.fill = {
		 	type = "image",
		 	filename = "이미지/(신)튜토리얼/6-3_7-3/" .. index .. ".png"
		}
	end

	ghost_button:addEventListener("tap",nextScript)
	noBt:addEventListener("tap",nextScript) 	
end

local function destroyObjects()
    for i = 1, #objectsToDestroy do
        display.remove(objectsToDestroy[i])
        objectsToDestroy[i] = nil
    end
    objectsToDestroy = nil
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
	destroyObjects()
	
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