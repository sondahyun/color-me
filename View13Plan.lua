-- 이번 달 활동 끝마치기
local composer = require( "composer" )
local scene = composer.newScene()
local loadsave = require( "loadsave" )

function scene:create( event )
	local sceneGroup = self.view
	local loadedSettings = loadsave.loadTable( "settings.json" )

	print("view13")
	local function touch2(event)

		composer.hideOverlay("View13Plan")
	end

	local options = {
		effect="fade",
		time = 1000
	}

	local function touch3(event)
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

			
			loadsave.saveTable(loadedSettings,"settings.json")

			-- 이벤트 발생 조건 여부 확인
			if loadedSettings.month==2 then

				if loadedSettings.month2_event==1 then
					composer.removeScene("view12Plan")
					composer.removeScene("View13Plan")
					composer.gotoScene("viewmonth2_event",options)
				else
					composer.removeScene("view12Plan")
					composer.removeScene("View13Plan")
					composer.gotoScene("likeability",options)

				end
			elseif loadedSettings.month==4 then
					composer.removeScene("view12Plan")
					composer.removeScene("View13Plan")
					composer.gotoScene("likeability",options)

			elseif loadedSettings.month==5 then
					composer.removeScene("view12Plan")
					composer.removeScene("View13Plan")
					composer.gotoScene("viewmonth5_event",options)

			elseif loadedSettings.month == 6 then 
				composer.removeScene("view12Plan")
				composer.removeScene("View13Plan")
				composer.gotoScene("likeability")

			else
				composer.removeScene("view12Plan")
				composer.removeScene("View13Plan")
				composer.gotoScene("view01_month",options)
			end
		end
	end

	

 -- 팝업창 버튼 객체 생성 및 리스너 추가
	local endspace = display.newImage("이미지/스케줄/마침경고.png")
	endspace.x, endspace.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(endspace)

	local yes= display.newImage("이미지/공통/yes버튼.png")
	yes.x, yes.y = display.contentWidth*0.41,display.contentHeight*0.6
	sceneGroup:insert(yes)
	yes:addEventListener("touch",touch3)

	local no= display.newImage("이미지/공통/no버튼.png")
	no.x, no.y = display.contentWidth*0.59,display.contentHeight*0.6
	sceneGroup:insert(no)
	no:addEventListener("touch",touch2)

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
		composer.removeScene("View13Plan")
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