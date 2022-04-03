-- 마을 클릭 시 뜨는 팝업창.
local composer = require( "composer" )
local scene = composer.newScene()
local loadsave = require( "loadsave" )

function scene:create( event )
	local sceneGroup = self.view

-- 배경 객체
	local background = display.newImageRect("이미지/마을/배경2.png",display.contentWidth, display.contentHeight)
	background.x,background.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background)

-- 마을 이미지 객체 
    local red = display.newImage("이미지/마을/빨강.png")
	red.x,red.y = display.contentWidth*0.223,display.contentHeight*0.297
	red.name = "1"
	sceneGroup:insert(red)
	local click1 = audio.loadStream( "음악/클릭1.wav" )
	
	local blue = display.newImage("이미지/마을/파랑.png")
	blue.x,blue.y = display.contentWidth*0.794,display.contentHeight*0.29
	blue.name = "2"
	sceneGroup:insert(blue)

	local yellow = display.newImage("이미지/마을/노랑.png")
	yellow.x,yellow.y = display.contentWidth*0.5,display.contentHeight*0.185	
	yellow.name = "3"
	sceneGroup:insert(yellow)

	local purple = display.newImage("이미지/마을/보라.png")
	purple.x,purple.y = display.contentWidth*0.217,display.contentHeight*0.698
	purple.name = "4"
	sceneGroup:insert(purple)

	local green = display.newImage("이미지/마을/초록.png")
	green.x,green.y = display.contentWidth*0.785,display.contentHeight*0.713
	green.name = "5"
	sceneGroup:insert(green)

	local em = display.newImage("이미지/마을/임시거처.png")
	em.x,em.y = display.contentWidth*0.5,display.contentHeight*0.829
	em.name = "6"
	sceneGroup:insert(em)

	local store = display.newImage("이미지/마을/상점.png")
	store.x,store.y = display.contentWidth*0.5,display.contentHeight*0.505
	store.name = "7"
	sceneGroup:insert(store)

	--장면전환
	local options={
		effect="crossFade",
		time=1000
	}

	local optioned = {
		isModal = true
	}

-- 이전 view01Map.lua 에서 가져온 타겟 객체의 값을 받아줌.
	color = composer.getVariable("color")
	local loadedSettings = loadsave.loadTable( "settings.json" )


-- 마을 방문
-- 월 별로 스크립트가 변화하므로 달에 따라 스크립트.lua도 달라져야 함.

	local function touch1(event)

		if event.phase == "began" then

			if loadedSettings.month == 5 then
				if loadedSettings.month6_event == 0 then
					loadedSettings.month6_event = loadedSettings.month6_event + 1
					loadsave.saveTable(loadedSettings,"settings.json")
				end
			end

				if loadedSettings.month ==0 then
					if loadedSettings.limited_num ~=2 then
						if color == "1" then
							if (loadedSettings.red_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth1_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						elseif color == "2" then
							if (loadedSettings.blue_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth1_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						elseif color == "3" then
							if (loadedSettings.yellow_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth1_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						elseif color == "4" then
							if (loadedSettings.purple_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth1_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						elseif color == "5" then
							if (loadedSettings.green_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth1_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						end
					else
						composer.showOverlay("zopup_limited",optioned)
					end
				elseif loadedSettings.month ==1 then
					if loadedSettings.limited_num ~=2 then
						if color == "1" then
							if (loadedSettings.red_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth2_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						elseif color == "2" then
							if (loadedSettings.blue_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth2_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						elseif color == "3" then
							if (loadedSettings.yellow_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth2_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						elseif color == "4" then
							if (loadedSettings.purple_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth2_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						elseif color == "5" then
							if (loadedSettings.green_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth2_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						end
					else
						composer.showOverlay("zopup_limited",optioned)
					end
				elseif loadedSettings.month ==2 then
					if loadedSettings.limited_num ~=2 then
						if color == "1" then
							if (loadedSettings.red_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth3_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						elseif color == "2" then
							if (loadedSettings.blue_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth3_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						elseif color == "3" then
							if (loadedSettings.yellow_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth3_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						elseif color == "4" then
							if (loadedSettings.purple_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth3_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						elseif color == "5" then
							if (loadedSettings.green_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth3_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						end
					else
						composer.showOverlay("zopup_limited",optioned)
					end
				elseif loadedSettings.month ==3 then
					if loadedSettings.limited_num ~=2 then
						if color == "1" then
							if (loadedSettings.red_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth4_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						elseif color == "2" then
							if (loadedSettings.blue_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth4_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						elseif color == "3" then
							if (loadedSettings.yellow_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth4_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						elseif color == "4" then
							if (loadedSettings.purple_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth4_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						elseif color == "5" then
							if (loadedSettings.green_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth4_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						end
					else
						composer.showOverlay("zopup_limited",optioned)
					end
				elseif loadedSettings.month ==4 then
					if loadedSettings.limited_num ~=2 then
						if color == "1" then
							if (loadedSettings.red_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth5_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						elseif color == "2" then
							if (loadedSettings.blue_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth5_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						elseif color == "3" then
							if (loadedSettings.yellow_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth5_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						elseif color == "4" then
							if (loadedSettings.purple_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth5_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						elseif color == "5" then
							if (loadedSettings.green_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth5_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						end
					else
						composer.showOverlay("zopup_limited",optioned)
					end
				elseif loadedSettings.month ==5 then
					if loadedSettings.limited_num ~=2 then
						if color == "1" then
							if (loadedSettings.red_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth6_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						elseif color == "2" then
							if (loadedSettings.blue_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth6_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						elseif color == "3" then
							if (loadedSettings.yellow_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth6_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						elseif color == "4" then
							if (loadedSettings.purple_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth6_script",options)
							else
								composer.showOverlay("zopup_limited",optioned)
							end
						elseif color == "5" then
							if (loadedSettings.green_num ~= 1) then
								composer.removeScene("view02Map")
								composer.gotoScene("viewmonth6_script",options)
							else
								--composer.removeScene("view02Map")
								composer.showOverlay("zopup_limited",optioned)
							end
						end
					else
						--composer.removeScene("view02Map")
						composer.showOverlay("zopup_limited",optioned)
					end
				end
						
				

		end

	end

-- 마을 별 게임 이동.
	local function touch2(event)
		if ( event.phase == "began" ) then
			if loadedSettings.game_num ~= 1 then
				-- 봄 피는 꽃 달
				if loadedSettings.month==1 then
					if loadedSettings.month2_event==0 then
						loadedSettings.month2_event = loadedSettings.month2_event + 1
						loadsave.saveTable(loadedSettings,"settings.json")
					end
				end

				if loadedSettings.month == 5 then
					if loadedSettings.month6_event == 0 then
						loadedSettings.month6_event = loadedSettings.month6_event + 1
						loadsave.saveTable(loadedSettings,"settings.json")
					end
				end

				if color == "1" then
				--빨강게임 이동
					composer.removeScene("view02Map")
					composer.gotoScene( "view02Map2" )
					
				elseif color == "2" then
				-- 파랑게임 이동
					composer.removeScene("view02Map")
					composer.gotoScene( "view02Map2" )
				elseif color == "3" then
					composer.removeScene("view02Map")
					composer.gotoScene( "view02Map2" )
					
				elseif color == "4" then
				-- 보라게임 이동
					composer.removeScene("view02Map")
					composer.gotoScene( "view02Map2" )
				elseif color == "5" then
				-- 초록게임 이동
					composer.removeScene("view02Map")
					composer.gotoScene( "view02Map2" )
				end

			else 
				--composer.removeScene("view02Map")
				composer.showOverlay( "zopup_limited" ,optioned)
			end
		end
	end
	local loadedItems= loadsave.loadTable( "items.json" )


	local function go_present(event)
		if event.phase == "began" then
			print(loadedSettings.gift_num)
			if loadedItems.itemCount == 0 then
				print("아이템없")
				composer.showOverlay("zopup_noitem",optioned)
			elseif loadedSettings.gift_num == 1 then
				print("dfasd")
				composer.showOverlay("zopup_gift_limited",optioned)
			else
				composer.setVariable("color_char",color)
				composer.removeScene("view02Map")
				composer.gotoScene("viewgift_bag")
			end
			
		end
	end

-- 마을 별 버튼
	local function button()
		maeulbt = display.newImage("이미지/마을/방문창/방문버튼.png")
		maeulbt.x,maeulbt.y = display.contentWidth*0.467,display.contentHeight*0.506

		sceneGroup:insert(maeulbt)

		gamebt = display.newImage("이미지/마을/방문창/탐방버튼.png")
		gamebt.x,gamebt.y = display.contentWidth*0.467,display.contentHeight*0.582
		
		sceneGroup:insert(gamebt)

		presentbt = display.newImage("이미지/마을/방문창/선물버튼.png")
		presentbt.x,presentbt.y = display.contentWidth*0.585,display.contentHeight*0.544
		presentbt:addEventListener("touch",go_present)
		sceneGroup:insert(presentbt)

		maeulbt:addEventListener("touch",touch1)
		gamebt:addEventListener("touch",touch2)
	end


-- 팝업창 닫기 함수
	local function gotohome(event)
		if  event.phase == "cancelled" then 
			event.target.width,event.target.height = 74,74
		elseif event.phase == "ended" then
			event.target.width,event.target.height = 74,74
				composer.removeScene("view02Map")
				composer.gotoScene("view01Map")
		end
	end


-- 타겟 네임에 따라 팝업 ui띄우기
	if color =="1" then
		redui = display.newImage("이미지/마을/방문창/빨강.png")
		redui.x,redui.y = display.contentWidth/2,display.contentHeight*0.496
		sceneGroup:insert(redui)
		button()

	elseif color =="2" then
		blueui = display.newImage("이미지/마을/방문창/파랑.png")
		blueui.x,blueui.y = display.contentWidth/2,display.contentHeight*0.496
		sceneGroup:insert(blueui)
		button()

	elseif color =="3" then
		yellowui = display.newImage("이미지/마을/방문창/노랑.png")
		yellowui.x,yellowui.y = display.contentWidth/2,display.contentHeight*0.496
		sceneGroup:insert(yellowui)
		button()

	elseif color =="4" then
		purpleui = display.newImage("이미지/마을/방문창/보라.png")
		purpleui.x,purpleui.y = display.contentWidth/2,display.contentHeight*0.496
		sceneGroup:insert(purpleui)
		button()

	elseif color =="5" then
		greenui = display.newImage("이미지/마을/방문창/초록.png")
		greenui.x,greenui.y = display.contentWidth/2,display.contentHeight*0.496
		sceneGroup:insert(greenui)
		button()
	end

	local exit = display.newImage("이미지/공통/x버튼.png")
	sceneGroup:insert(exit)
	exit.x, exit.y = display.contentWidth*0.625, display.contentHeight*0.34
	exit:addEventListener("touch",gotohome)

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

		composer.removeScene("view02Map")
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