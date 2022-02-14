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

	-- 데이터 베이스 불러오기 --
	local i = composer.getVariable("number")
	local stat_num = loadedSettings.activity_num

	local study = {
		loadedSettings.study1_num, 
		loadedSettings.study2_num, 
		loadedSettings.study3_num, 
		loadedSettings.study4_num, 
		loadedSettings.study5_num
	}
	local play = {
		loadedSettings.play1_num,
		loadedSettings.play2_num, 
		loadedSettings.play3_num, 
		loadedSettings.play4_num, 
		loadedSettings.play5_num
	}
	local hobby = {
		loadedSettings.hobby1_num,
		loadedSettings.hobby2_num, 
		loadedSettings.hobby3_num, 
		loadedSettings.hobby4_num, 
		loadedSettings.hobby5_num 
	}

	local friend_stat = {
		loadedSettings.red,
		loadedSettings.yellow,
		loadedSettings.green,
		loadedSettings.blue,
		loadedSettings.purple
	}

	local function save() 
		loadedSettings.activity_num = stat_num
		loadedSettings.study1_num = study[1]
		loadedSettings.study2_num = study[2]
		loadedSettings.study3_num = study[3]
		loadedSettings.study4_num = study[4]
		loadedSettings.study5_num = study[5]

		loadedSettings.play1_num = play[1]
		loadedSettings.play2_num = play[2]
		loadedSettings.play3_num = play[3] 
		loadedSettings.play4_num = play[4]
		loadedSettings.play5_num = play[5]

		loadedSettings.hobby1_num = hobby[1]
		loadedSettings.hobby2_num = hobby[2]
		loadedSettings.hobby3_num = hobby[3]
		loadedSettings.hobby4_num = hobby[4]
		loadedSettings.hobby5_num = hobby[5]

		loadedSettings.red = friend_stat[1]
		loadedSettings.yellow = friend_stat[2]
		loadedSettings.green = friend_stat[3]
		loadedSettings.blue = friend_stat[4]
		loadedSettings.purple = friend_stat[5]

		loadsave.saveTable(loadedSettings,"settings.json")
	end

	study[i] = 1
	stat_num = stat_num + 1

	friend_stat[i] = friend_stat[i] + 3
	if stat_num < 101 then
		loadedSettings.study = loadedSettings.study +4
	end

	save()

	local background = display.newImage("이미지/스케줄/배경요소/배경.png")
	background.x, background.y = display.contentWidth/2, display.contentHeight/2
	sceneGroup:insert(background)

	local options = {
		width = 1920,
		height = 1080,
		numFrames = 30,
		sheetContentWidth=9600, sheetContentHeight=6480
	}

	if i == 1 then
		motion = graphics.newImageSheet("애니매이션/공부/1.png",options)
	elseif i == 2 then
		motion = graphics.newImageSheet("애니매이션/공부/2.png",options)
	elseif i == 3 then
		motion = graphics.newImageSheet("애니매이션/공부/3.png",options)
	elseif i == 4 then
		motion = graphics.newImageSheet("애니매이션/공부/4.png",options)
	elseif i == 5 then
		motion = graphics.newImageSheet("애니매이션/공부/5.png",options)
	end

 
	local data = {
		name = "study",
		start = 1,
		count = 28,
		time = 2000,
		loopCount = 5,
		loopDirection = "forward"
	}

	
	local study_motion = display.newSprite(motion,data)
	study_motion.x, study_motion.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(study_motion)


	
	study_motion:play()


	local function gotoback()
		--timer.cancelAll()
		study_motion:pause()
		composer.removeScene("view03")
		composer.gotoScene("view02_스케줄창")
	end

	timer.performWithDelay(2000,gotoback)
	--timer.performWithDelay(3000,gotobck)

	

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
