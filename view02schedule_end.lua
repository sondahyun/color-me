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
print("스케줄end")
	local options = {
		effect="fade",
		time = 1000
	}

	local find1 = composer.getVariable("find1")
	local find2= composer.getVariable("find2")
	local find3 = composer.getVariable("find3")
	local find4 = composer.getVariable("find4")
	local find5 = composer.getVariable("find5")

	local function end_month(event)
		if event.phase == "began" then
			-- 모든 값 리셋
			loadedSettings.month = loadedSettings.month + 1

			loadedSettings.limited_num = 0
			loadedSettings.red_num = 0
			loadedSettings.yellow_num = 0
			loadedSettings.blue_num = 0
			loadedSettings.green_num = 0 
			loadedSettings.purple_num =0
			loadedSettings.game_num = 0
			loadedSettings.activity_num = 0
    			loadedSettings.play1_num =0
    			loadedSettings.play2_num=0
    			loadedSettings.play3_num=0
    			loadedSettings.play4_num=0
    			loadedSettings.play5_num=0
    			loadedSettings.hobby1_num = 0
    			loadedSettings.hobby2_num = 0
    			loadedSettings.hobby3_num = 0
    			loadedSettings.hobby4_num = 0
    			loadedSettings.hobby5_num = 0
    			loadedSettings.study1_num = 0
    			loadedSettings.study2_num = 0
    			loadedSettings.study3_num = 0
    			loadedSettings.study4_num = 0
    			loadedSettings.study5_num = 0
    			loadedSettings.friend_num = 0
    			loadedSettings.friend1_num = 0
    			loadedSettings.friend2_num = 0
    			loadedSettings.friend3_num = 0
    			loadedSettings.friend4_num = 0
    			loadedSettings.friend5_num = 0
    			loadedSettings.show1 = 0
    			loadedSettings.show2 = 0
    			loadedSettings.show3 = 0
    			loadedSettings.show4 = 0
    			loadedSettings.show5 = 0
    			loadedSettings.show6 = 0
    			loadedSettings.show7 = 0
    			loadedSettings.gift_num=0

			
			loadsave.saveTable(loadedSettings,"settings.json")

			-- 이벤트 발생 조건 여부 확인
			if loadedSettings.month==2 then

				if loadedSettings.month2_event==1 then
					composer.removeScene("view02schedule")
					composer.removeScene("view02schedule_end")
					audio.pause(loadedEndings.bgMusic)
					composer.gotoScene("viewmonth2_event",options)
				else
					composer.removeScene("view02schedule")
					composer.removeScene("view02schedule_end")
					composer.gotoScene("likeability",options)

				end
			elseif loadedSettings.month==4 then
					composer.removeScene("view02schedule")
					composer.removeScene("view02schedule_end")
					composer.gotoScene("likeability",options)

			elseif loadedSettings.month==5 then
					composer.removeScene("view02schedule")
					composer.removeScene("view02schedule_end")
					audio.pause(loadedEndings.bgMusic)
					composer.gotoScene("viewmonth5_event",options)

			elseif loadedSettings.month == 3 then -- 원래는 6
				composer.removeScene("view02schedule")
				composer.removeScene("view02schedule_end")
				audio.pause(loadedEndings.bgMusic)

				if find1 == 1 then
					composer.setVariable("find1", 2)	
					loadsave.saveTable(loadedSettings,"settings.json")	
					composer.gotoScene("item_find_event",options)
				elseif find2 == 1 then
					composer.setVariable("find2", 2)	
					loadsave.saveTable(loadedSettings,"settings.json")
					composer.gotoScene("item_find_event",options)
				elseif find3 == 1 then
					composer.setVariable("find3", 2)
					loadsave.saveTable(loadedSettings,"settings.json")
					composer.gotoScene("item_find_event",options)
				elseif find4 == 1 then
					composer.setVariable("find4", 2)	
					loadsave.saveTable(loadedSettings,"settings.json")
					composer.gotoScene("item_find_event",options)
				elseif find5 == 1 then
					composer.setVariable("find5", 2)
					loadsave.saveTable(loadedSettings,"settings.json")	
					composer.gotoScene("item_find_event",options)
				else
					composer.gotoScene("view01_month",options)
				end
				composer.gotoScene("view99end")

			else
				composer.removeScene("view02schedule")
				composer.removeScene("view02schedule_end")

				if find1 == 1 then
					composer.setVariable("find1", 2)	
					loadsave.saveTable(loadedSettings,"settings.json")	
					composer.gotoScene("item_find_event",options)
				elseif find2 == 1 then
					composer.setVariable("find2", 2)	
					loadsave.saveTable(loadedSettings,"settings.json")
					composer.gotoScene("item_find_event",options)
				elseif find3 == 1 then
					composer.setVariable("find3", 2)
					loadsave.saveTable(loadedSettings,"settings.json")
					composer.gotoScene("item_find_event",options)
				elseif find4 == 1 then
					composer.setVariable("find4", 2)	
					loadsave.saveTable(loadedSettings,"settings.json")
					composer.gotoScene("item_find_event",options)
				elseif find5 == 1 then
					composer.setVariable("find5", 2)
					loadsave.saveTable(loadedSettings,"settings.json")	
					composer.gotoScene("item_find_event",options)
				else
					composer.gotoScene("view01_month",options)
				end
			end
		end
	end


	local black = display.newRect(display.contentWidth/2,display.contentHeight/2,display.contentWidth,display.contentHeight)
	black.alpha = 0.5
	black:setFillColor(0)
	sceneGroup:insert(black)

	local function go_back(event)
		if event.phase == "began" then
			composer.hideOverlay("view02schedule_end")
		end
	end

	local exit = display.newImage("이미지/스케줄/제한/마침경고.png")
	exit.x, exit.y = display.contentWidth/2, display.contentHeight/2
	sceneGroup:insert(exit)

	local yes_button = display.newImage("이미지/공통/yes버튼.png")
	yes_button.x,yes_button.y = display.contentWidth*0.43,display.contentHeight*0.59
	yes_button.width = yes_button.width*0.8
	yes_button.height = yes_button.height*0.8
	sceneGroup:insert(yes_button)
	yes_button:addEventListener("touch",end_month)

	local no_button = display.newImage("이미지/공통/no버튼.png")
	no_button.x,no_button.y = display.contentWidth*0.57,display.contentHeight*0.59
	no_button.width = no_button.width*0.8
	no_button.height = no_button.height*0.8
	no_button:addEventListener("touch",go_back)
	sceneGroup:insert(no_button)

	
	
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
