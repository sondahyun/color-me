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

	hobby[i] = 1
	stat_num = stat_num + 1


	if friend_stat[i] <101 then 
		if i == 1 then
			friend_stat[3] = friend_stat[3] + 3
		elseif i == 2 then
			friend_stat[1] = friend_stat[1] + 3
		elseif i == 3 then
			friend_stat[4] = friend_stat[4] + 3
		elseif i == 4 then
			friend_stat[2] = friend_stat[2] + 3
		else
			friend_stat[5] = friend_stat[5] + 3
		end
	end
	if stat_num < 101 then
		loadedSettings.hobby = loadedSettings.hobby +4
	end

	save()

	local background = display.newImageRect("이미지/홈/배경/가구포함.png",display.contentWidth, display.contentHeight)
	background.x,background.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background)

	local black = display.newRect(display.contentWidth/2,display.contentHeight/2,display.contentWidth,display.contentHeight)
	black.alpha = 0.5
	black:setFillColor(0)
	sceneGroup:insert(black)


	local options = {
		width = 1728,
		height = 972,
		numFrames = 30,
		sheetContentWidth=8640, sheetContentHeight=5832
	}


	useornot = composer.getVariable("useornot")

	if useornot == 1 then
		print("아이템있음, userornot" .. useornot)
		motion = graphics.newImageSheet("이미지/수정/취미/" .. i .. "템.png",options)
	else
		print("아이템없음, userornot" .. useornot)
		motion = graphics.newImageSheet("이미지/수정/취미/" .. i .. ".png",options)
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
	--study_motion.width = study_motion.width*2
	sceneGroup:insert(study_motion)


	
	study_motion:play()


	local function gotoback()
		study_motion:pause()
		study_motion:removeSelf()
		study_motion=nil
		motion=nil

		if loadedSettings.month == 2 then
			if loadedSettings.activity_num == 2 then 
				loadedSettings.month3_event = 1
				loadsave.saveTable(loadedSettings,"settings.json")
			--composer.removeScene("view02schedule")
			--composer.gotoScene("view03")
			end
		elseif loadedSettings.month == 4 then
			if loadedSettings.activity_num == 3 then 
				
				loadedSettings.month4_event = 1
				loadsave.saveTable(loadedSettings,"settings.json")
			--composer.removeScene("view02schedule")
			--composer.gotoScene("view03")
			end
		end
		composer.removeScene("view03_hobby")
		composer.removeHidden()

			if loadedSettings.month3_event == 1 then

				loadedSettings.month3_event = loadedSettings.month3_event + 1
				loadsave.saveTable(loadedSettings,"settings.json")

				--composer.removeScene("view03_hobby")
				audio.pause(loadedEndings.bgMusic)
				composer.gotoScene("viewmonth3_event")
				

			elseif loadedSettings.month4_event == 1 then
				loadedSettings.month4_event = loadedSettings.month4_event + 1
				loadsave.saveTable(loadedSettings,"settings.json")

				--composer.removeScene("view03_hobby")
				audio.pause(loadedEndings.bgMusic)
				composer.gotoScene("viewmonth4_event")

			elseif loadedSettings.month5_event == 1 then
				loadedSettings.month5_event = loadedSettings.month5_event + 1
				loadsave.saveTable(loadedSettings,"settings.json")

				--composer.removeScene("view03_hobby")
				audio.pause(loadedEndings.bgMusic)
				composer.gotoScene("viewmonth5_event")

			else 
				--composer.removeScene("view03_hobby")
				composer.gotoScene("view02schedule")
			end

	end

	timer.performWithDelay(3000,gotoback)
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
