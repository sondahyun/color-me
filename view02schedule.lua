-----------------------------------------------------------------------------------------
--
-- 스케줄.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local loadsave = require( "loadsave" )
local json = require( "json" )

function scene:create( event )
	local sceneGroup = self.view
	composer.removeHidden()
	local loadedSettings = loadsave.loadTable( "settings.json" )

	
	--터치 제한

	local option = {
		isModal = true
	}

	-- 데이터 베이스 불러오기 --
	local game_num = loadedSettings.game_num
	local stat_num = loadedSettings.activity_num
	local friendly_num = loadedSettings.friend_num

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

	local loadedItems= loadsave.loadTable( "items.json" )
	
	-- 활동 시 필요한 아이템 확인을 위한 객체 생성

	local items = {}
	
	items[1] = loadedItems.item1--/loadedSettings.item1
	items[2] = loadedItems.item2--/loadedSettings.item1	
	items[3] = loadedItems.item3--/loadedSettings.item1		
	items[4] = loadedItems.item4--/loadedSettings.item1		
	items[5] = loadedItems.item5--/loadedSettings.item1		
	items[6] = loadedItems.item6--/loadedSettings.item1		
	items[7] = loadedItems.item7--/loadedSettings.item1		
	items[8] = loadedItems.item8--/loadedSettings.item1		
	items[9] = loadedItems.item9--/loadedSettings.item1		
	items[10] = loadedItems.item10--/loadedSettings.item1		
	items[11] = loadedItems.item11--/loadedSettings.item1		
	items[12] = loadedItems.item12--/loadedSettings.item1
	items[13] = loadedItems.item13--/loadedSettings.item1		
	items[14] = loadedItems.item14--/loadedSettings.item1		
	items[15] = loadedItems.item15--/loadedSettings.item1
	items[16] = loadedItems.item16--/loadedSettings.item1		



	-- 활동 끝마치기 --
	local function exit_month(event)
		if event.phase == "began" then 
			composer.showOverlay("view02schedule_end",option)
		end
	end

	-- 가이드 창 불러오기 --
	local function tutorial(event)
		if event.phase == "began" then
			composer.showOverlay("zopup_guide",option)
		end
	end

	-- home 화면으로 --
	local function go_back(event)
		if event.phase == "began" then
			composer.removeScene("view02schedulee")
			composer.gotoScene("view00Room")
		end
	end


	-- 배경 요소 -- 
	
	local background = display.newImage("이미지/스케줄/배경요소/배경.png")
	background.x, background.y = display.contentWidth/2, display.contentHeight/2
	sceneGroup:insert(background)

	local schedule = display.newImage("이미지/스케줄/배경요소/선택창배경.png")
	schedule.x, schedule.y = display.contentWidth*0.02812,display.contentHeight*0.039
	schedule.anchorX,schedule.anchorY = 0,0

	sceneGroup:insert(schedule)

	local pencil = display.newImage("이미지/캐릭터/주인공/기본.png")
	pencil.x, pencil.y = display.contentWidth*0.7288, display.contentHeight*0.4153
	pencil.width, pencil.height = display.contentWidth*0.1826,display.contentHeight*0.5103
	pencil.anchorX,pencil.anchorY = 0,0
	sceneGroup:insert(pencil)

	local exit = display.newImage("이미지/공통/x버튼.png")
	exit.x, exit.y = display.contentWidth*0.9207, display.contentHeight*0.0438
	exit.anchorX, exit.anchorY = 0,0
	sceneGroup:insert(exit)
	exit:addEventListener("touch",go_back)


	-- 스탯 게이지 --

	local play_bar = display.newRect(display.contentWidth*0.7440,display.contentWidth*0.04583,display.contentHeight*0.25*(loadedSettings.fun/100) ,display.contentHeight*0.0146)
	play_bar.anchorX,play_bar.anchorY = 0,0.5
	play_bar:setFillColor(0.643,0.384,0.666)
	sceneGroup:insert(play_bar)

	local hobby_bar = display.newRect(display.contentWidth*0.7440,display.contentWidth*0.0718, display.contentHeight*0.25*(loadedSettings.hobby/100) ,display.contentHeight*0.0146)
	hobby_bar.anchorX,hobby_bar.anchorY = 0,0.5
	hobby_bar:setFillColor(0.98, 0.556 , 0.219)
	sceneGroup:insert(hobby_bar)

	local study_bar = display.newRect(display.contentWidth*0.7440,display.contentWidth*0.0979, display.contentHeight*0.25*(loadedSettings.study/100) ,display.contentHeight*0.0146)
	study_bar.anchorX,study_bar.anchorY = 0,0.5
	study_bar:setFillColor(0.46,0.537,0.752)
	sceneGroup:insert(study_bar)

	local friendly_bar = display.newRect(display.contentWidth*0.7440,display.contentWidth*0.1239, display.contentHeight*0.25*(loadedSettings.friendship/100) ,display.contentHeight*0.0146)
	friendly_bar.anchorX,friendly_bar.anchorY = 0,0.5
	friendly_bar:setFillColor(0.933,0.474,0.474)
	sceneGroup:insert(friendly_bar)



	local stat = display.newImage("이미지/스케줄/배경요소/스탯창.png")
	stat.x, stat.y = display.contentWidth*0.675,display.contentHeight*0.039
	stat.anchorX,stat.anchorY = 0,0
	sceneGroup:insert(stat)

	local guide_button = display.newImage("이미지/스케줄/배경요소/가이드.png")
	guide_button.x, guide_button.y = display.contentWidth*0.02812,display.contentHeight*0.8987
	guide_button.anchorX,guide_button.anchorY = 0,0
	sceneGroup:insert(guide_button)
	guide_button:addEventListener("touch",tutorial)

	local exit_butoon = display.newImage("이미지/스케줄/제한/마침버튼.png")
	exit_butoon.x, exit_butoon.y = display.contentWidth*0.2113,display.contentHeight*0.8847
	exit_butoon.anchorX,exit_butoon.anchorY = 0,0
	exit_butoon:addEventListener("touch",exit_month)
	sceneGroup:insert(exit_butoon)

	local text = display.newImage("이미지/스케줄/배경요소/말풍선.png")
	text.x, text.y = display.contentWidth*0.7326,display.contentHeight*0.2885
	text.anchorX,text.anchorY = 0,0
	sceneGroup:insert(text)

	-- 버튼 --

	-- 선택 활동 현황 --

	local game_button = display.newImage("이미지/스케줄/활동전/게임.png")
	game_button.x, game_button.y = display.contentWidth*0.3634,display.contentHeight*0.1402
	game_button.anchorX,game_button.anchorY = 0,0
	sceneGroup:insert(game_button)

	local gamed_button = display.newImage("이미지/스케줄/활동후/게임.png")
	gamed_button.x, gamed_button.y = display.contentWidth*0.3634,display.contentHeight*0.1402
	gamed_button.anchorX,gamed_button.anchorY = 0,0
	sceneGroup:insert(gamed_button)
	gamed_button.alpha = game_num

	local stat_button = {}
	local stated_button = {}

	for i= 1,4 do
		stat_button[i] = display.newImage("이미지/스케줄/활동전/스탯.png")
		stat_button[i].x, stat_button[i].y = display.contentWidth*0.40317+display.contentWidth*0.04193*(i-1),display.contentHeight*0.1402
		stat_button[i].anchorX,stat_button[i].anchorY = 0,0
		sceneGroup:insert(stat_button[i])

		stated_button[i] = display.newImage("이미지/스케줄/활동후/스탯.png")
		stated_button[i].x, stated_button[i].y = display.contentWidth*0.40317+display.contentWidth*0.04193*(i-1),display.contentHeight*0.1402
		stated_button[i].anchorX,stated_button[i].anchorY = 0,0
		stated_button[i].alpha = 0
		sceneGroup:insert(stated_button[i])
	end


	for i=1,stat_num do
		stated_button[i].alpha = 1
	end

	local friend_button = {}
	local friended_button = {}

	for i = 1,2 do
		friend_button[i]  = display.newImage("이미지/스케줄/활동전/우정.png")
		friend_button[i].x, friend_button[i].y = display.contentWidth*0.5718+display.contentWidth*0.04193*(i-1),display.contentHeight*0.1402
		friend_button[i].anchorX,friend_button[i].anchorY = 0,0
		sceneGroup:insert(friend_button[i])

		friended_button[i]  = display.newImage("이미지/스케줄/활동후/우정.png")
		friended_button[i].x, friended_button[i].y = display.contentWidth*0.5718+display.contentWidth*0.04193*(i-1),display.contentHeight*0.1402
		friended_button[i].anchorX,friended_button[i].anchorY = 0,0
		friended_button[i].alpha=0
		sceneGroup:insert(friended_button[i])
	end

	for i=1,friendly_num do 
		friended_button[i].alpha = 1
	end


	-- 공부 함수
	local function study_function(event)
		if event.phase == "began" then 
			local i = event.target.name
			if (stat_num>=4) then
				composer.showOverlay("view02schedule_alarm",option)
			elseif (study[i]>0) then
				composer.showOverlay("zopup_same",option)
			else
				local location = 0

				for i=1,16 do
					if items[i] == "연필" then 
						location = i
						break
					end
				end

				composer.setVariable("number",i)


				if (location == 0) or (loadedItems.itemCount == 0) then
					composer.setVariable("useornot",0)
					composer.removeScene("view02schedule")
					composer.gotoScene("view03")
				else
					composer.setVariable("item","연필")
					composer.setVariable("format",1)
					composer.setVariable("location",location)
					composer.showOverlay("view02schedule_item",option)
				end
			end
		end
	end

	--놀이 함수--
	local function play_function(event)
		if event.phase == "began" then 
			local i = event.target.name
			local item_name = event.target.id

			if (stat_num>=4) then
				composer.showOverlay("view02schedule_alarm",option)
			elseif (play[i]>0) then
				composer.showOverlay("zopup_same",option)
			else
				local location = 0

				for i=1,16 do
					if items[i] == item_name then 
						location = i
						break
					end
				end

				print(item_name .. ":" .. location)
				composer.setVariable("number",i)

				if (location == 0) or (loadedItems.itemCount == 0) then
					composer.setVariable("useornot",0)
					composer.removeScene("view02schedule")
					composer.gotoScene("view03_fun")
				else
					composer.setVariable("item",item_name)
					composer.setVariable("format",2)
					composer.setVariable("location",location)
					composer.showOverlay("view02schedule_item",option)
				end
			
			end
		end
	end


	--취미 함수--
	local function hobby_function(event)
		if event.phase == "began" then 
			local i = event.target.name 
			local item_name = event.target.id
			if (stat_num>=4) then
				composer.showOverlay("view02schedule_alarm",option)
			elseif (hobby[i]>0) then
				composer.showOverlay("zopup_same",option)
			else
				local location = 0

				for i=1,16 do
					if items[i] == item_name then 
						location = i
						break
					end
				end

				composer.setVariable("number",i)
				--composer.removeScene("view02schedule")

				if (location == 0) or (loadedItems.itemCount == 0) then
					composer.setVariable("useornot",0)
					composer.removeScene("view02schedule") 
					composer.gotoScene("view03_hobby")
				else
					composer.setVariable("item",item_name)
					composer.setVariable("format",3)
					composer.setVariable("location",location)
					composer.showOverlay("view02schedule_item",option)
				end
			
			end
		end
	end

	-- 공부 버튼

	local study_button = {}

	for i=1,5 do
		study_button[i]  = display.newImage("이미지/스케줄/공부버튼/공부" .. i .. ".png")
		study_button[i].x, study_button[i].y = display.contentWidth*0.0553+display.contentWidth*0.1210*(i-1),display.contentHeight*0.3056
		study_button[i].anchorX,study_button[i].anchorY = 0,0
		study_button[i].name = i
		sceneGroup:insert(study_button[i])
		study_button[i]:addEventListener("touch",study_function)
	end

	-- 놀이 버튼

	local play_button = {}
	local play_item = {
		"머리핀",
		"오리",
		"사료",
		"안경닦이",
		"망토"
	}

	for i=1,5 do
		play_button[i]  = display.newImage("이미지/스케줄/놀이버튼/놀이" .. i .. ".png")
		play_button[i].x, play_button[i].y = display.contentWidth*0.0560,display.contentHeight*0.4848+display.contentHeight*0.0722*(i-1)
		play_button[i].anchorX,play_button[i].anchorY = 0,0
		play_button[i].name = i
		play_button[i].id = play_item[i]
		sceneGroup:insert(play_button[i])
		play_button[i]:addEventListener("touch",play_function)
	end

	-- 취미 버튼

	local hobby_button = {}
	local hobby_item = {
		"민초",
		"응원봉",
		"블록",
		"헤드셋",
		"파이"
	}

	for i=1,5 do
		hobby_button[i]  = display.newImage("이미지/스케줄/취미버튼/취미" .. i .. ".png")
		hobby_button[i].x, hobby_button[i].y = display.contentWidth*0.3586,display.contentHeight*0.4848+display.contentHeight*0.0722*(i-1)
		hobby_button[i].anchorX,hobby_button[i].anchorY = 0,0
		sceneGroup:insert(hobby_button[i])
		hobby_button[i].name = i
		hobby_button[i].id = hobby_item[i]
		hobby_button[i]:addEventListener("touch",hobby_function)
	end

	-- 이번달 일정

	local month_to_do = {}
	local month_content = {
		loadedSettings.former1,
		loadedSettings.former2 
	}

	for i = 1,2 do 
		month_to_do[i] = display.newText(month_content[i],display.contentWidth*0.0568,display.contentHeight*0.13+display.contentHeight*0.03472*(i-1),"font/NanumSquareRoundR")
		month_to_do[i].size = 30
		month_to_do[i].anchorX,month_to_do[i].anchorY = 0,0
		month_to_do[i]:setFillColor(0)
		sceneGroup:insert(month_to_do[i])
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