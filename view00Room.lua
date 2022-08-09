--메인캐릭터의 방

local composer = require( "composer" )
local scene = composer.newScene()
local loadsave = require("loadsave")
local json = require( "json" )

function scene:create( event )
	local sceneGroup = self.view
	local loadedItems= loadsave.loadTable( "items.json" )
	item = composer.getVariable("item")
	two_check = composer.getVariable("two_check")
	composer.getVariable("home")

	local loadedSettings = loadsave.loadTable( "settings.json" )
	--local click1 = audio.loadStream( "음악/클릭3.wav" )
	local number = 1

	-- showoverlay 함수 사용 option
    local options = {
        isModal = true
    }

-- 관련 버튼 이동 리스너 함수

	local function touch1(event)
		audio.pause(home)
		composer.removeScene("view00Room")
		composer.gotoScene( "view01Map" )

	end


	local function touch2(event)
		composer.removeScene("view00Room")
		composer.gotoScene( "view03bag" )
	end

	-- 음악
	local click1 = audio.loadStream( "음악/스침.wav" )

	--스쳤을 때 커지는 거

	local i = 0
	local function bigbig (event)
		
		if (event.target.x-event.x)^2 + (event.target.y-event.y)^2 < 58^2 then
            -- i값을 지정해 놓는 이유는 범위 안에서는 크기가 더 늘어나거나 줄어들지 않고, 소리가 연이어 나오지 않음.
            if j == 0 then
                local backgroundMusicChannel = audio.play(click1)
                event.target.width = event.target.width*1.1
                event.target.height = event.target.height*1.1
                j = j + 1
            end
        
        elseif (event.target.x-event.x)^2 + (event.target.y-event.y)^2 > 58^2 then
            if j == 1 then
                event.target.width = event.target.width/11*10
                event.target.height = event.target.height/11*10
                j = j - 1 
            end
            
        end
	end

	local function touch3(event)
		if event.phase == "ended" then
			--print("dfd")
			composer.removeScene("view00Room")
			composer.gotoScene( "view02schedule" )
		end

	end

	local function touch4(event)
		--local click01 = audio.play(click1)
		composer.removeScene("view00Room")
		composer.gotoScene( "view00Room_friend" )
	end
	
-- 배경 객체
	local background = display.newImageRect("이미지/홈/배경/기본.png",display.contentWidth, display.contentHeight)
	background.x,background.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background)

--------벽지

	local  wall_grid = display.newImage("이미지/홈/홈화면꾸미기/격자무늬벽지.png")
	wall_grid.x,wall_grid.y = display.contentWidth*0.5,display.contentHeight*0.3537
	sceneGroup:insert(wall_grid)
	wall_grid.alpha = 0

	local  wall_dot = display.newImage("이미지/홈/홈화면꾸미기/도트무늬벽지.png")
	wall_dot.x,wall_dot.y = display.contentWidth*0.5,display.contentHeight*0.3537
	sceneGroup:insert(wall_dot)
	wall_dot.alpha = 0

	if loadedItems.grid_apply == 1 then 
		wall_grid.alpha = 1
		wall_dot.alpha = 0
	elseif loadedItems.dot_apply == 1 then 
		wall_grid.alpha = 0
		wall_dot.alpha = 1
	elseif loadedItems.white_apply == 1 then 
		wall_grid.alpha = 0
		wall_dot.alpha = 0
	elseif loadedItems.dot_apply == 0 and loadedItems.grid_apply == 0 then 
		wall_grid.alpha = 0
		wall_dot.alpha = 0
	end 

---------바닥
	local  floor_white = display.newImage("이미지/홈/홈화면꾸미기/흰색바닥.png")
	floor_white.x,floor_white.y = display.contentWidth*0.5,display.contentHeight*0.854
	sceneGroup:insert(floor_white)
	floor_white.alpha = 0

	local  floor_wood = display.newImage("이미지/홈/홈화면꾸미기/나무바닥.png")
	floor_wood.x,floor_wood.y = display.contentWidth*0.5,display.contentHeight*0.854
	sceneGroup:insert(floor_wood)
	floor_wood.alpha = 0

	if loadedItems.tree_apply == 1 then 
		floor_wood.alpha = 1
		floor_white.alpha = 0
	elseif loadedItems.fwhite_apply == 1 then 
		floor_wood.alpha = 0
		floor_white.alpha = 1
	elseif loadedItems.fblue_apply == 1 then 
		floor_wood.alpha = 0
		floor_white.alpha = 0
	elseif loadedItems.fwhite_apply == 0 and loadedItems.tree_apply == 0 then 
		floor_wood.alpha = 0
		floor_white.alpha = 0
	end

---------카페트
	local carpet_hrt = display.newImage("이미지/홈/홈화면꾸미기/하트카펫.png")
	carpet_hrt.x,carpet_hrt.y = display.contentWidth/2,display.contentHeight*0.853
	sceneGroup:insert(carpet_hrt)
	carpet_hrt.alpha = 0
	
	local carpet_rnd = display.newImage("이미지/홈/홈화면꾸미기/둥근카펫.png")
	carpet_rnd.x,carpet_rnd.y = display.contentWidth/2,display.contentHeight*0.853
	sceneGroup:insert(carpet_rnd)
	carpet_rnd.alpha = 0
	
	local carpet_sqr = display.newImage("이미지/홈/홈화면꾸미기/네모카펫.png")
	carpet_sqr.x,carpet_sqr.y = display.contentWidth/2,display.contentHeight*0.853
	sceneGroup:insert(carpet_sqr)
	carpet_sqr.alpha = 0

	if loadedItems.square_apply == 1 then 
		carpet_sqr.alpha = 1
		carpet_rnd.alpha = 0
		carpet_hrt.alpha = 0
	elseif loadedItems.circle_apply == 1 then 
		carpet_sqr.alpha = 0
		carpet_rnd.alpha = 1
		carpet_hrt.alpha = 0
	elseif loadedItems.heart_apply == 1 then 
		carpet_sqr.alpha = 0
		carpet_rnd.alpha = 0
		carpet_hrt.alpha = 1
	elseif loadedItems.square_apply == 0 and loadedItems.circle_apply == 0 and loadedItems.heart_apply == 0 then 
		carpet_sqr.alpha = 0
		carpet_rnd.alpha = 0
		carpet_hrt.alpha = 0
	end

-- 버튼 객체 및 리스너 추가
	local sch = display.newImage("이미지/홈/버튼/스케줄.png")
	sch.x,sch.y = display.contentWidth*0.75+13,display.contentHeight*0.9
	sceneGroup:insert(sch)
	sch:addEventListener("touch",touch3)
	sch:addEventListener("mouse",bigbig)

	local bag = display.newImage("이미지/홈/버튼/가방.png")
	bag.x,bag.y = display.contentWidth*0.835+13,display.contentHeight*0.9
	sceneGroup:insert(bag)
	bag:addEventListener("tap",touch2)
	bag:addEventListener("mouse",bigbig)

	local map = display.newImage("이미지/홈/버튼/지도.png")
	map.x,map.y = display.contentWidth*0.920+13,display.contentHeight*0.9
	sceneGroup:insert(map)
	map:addEventListener("tap",touch1)
	map:addEventListener("mouse",bigbig)

	local friend = display.newImage("이미지/홈/버튼/앨범.png")
	sceneGroup:insert(friend)
	friend.x, friend.y = display.contentWidth*0.06, display.contentHeight*0.88
	friend:addEventListener("touch",touch4)
	friend:addEventListener("mouse",bigbig)

-- 스탯 바 객체 생성.
	
	--play:toFront()

	

	local play = display.newRect(display.contentWidth*0.12,display.contentHeight*0.085, display.contentWidth*loadedSettings.fun*0.00174 ,display.contentHeight*0.023)
	play.anchorX,play.anchorY = 0,0.5
	play:setFillColor(0.643,0.384,0.666)
	sceneGroup:insert(play)

	local hobby = display.newRect(display.contentWidth*0.12,display.contentHeight*0.14, display.contentWidth*loadedSettings.hobby*0.00174 ,display.contentHeight*0.023)
	hobby.anchorX,hobby.anchorY = 0,0.5
	hobby:setFillColor(0.98, 0.556 , 0.219)
	sceneGroup:insert(hobby)

	local study = display.newRect(display.contentWidth*0.12,display.contentHeight*0.195, display.contentWidth*loadedSettings.study*0.00174 ,display.contentHeight*0.023)
	study.anchorX,study.anchorY = 0,0.5
	study:setFillColor(0.46,0.537,0.752)
	sceneGroup:insert(study)

	local friendly = display.newRect(display.contentWidth*0.12,display.contentHeight*0.254, display.contentWidth*loadedSettings.friendship*0.00174 ,display.contentHeight*0.023)
	friendly.anchorX,friendly.anchorY = 0,0.5
	friendly:setFillColor(0.933,0.474,0.474)
	sceneGroup:insert(friendly)

-- 스탯창 객체

	local stat = display.newImage("이미지/홈/스탯창2.png")
	stat.x, stat.y = display.contentWidth*0.18,display.contentHeight*0.15
	sceneGroup:insert(stat)

--가구 배치
	local  schedule = display.newImage("이미지/홈/가구/일정표.png")
	schedule.x,schedule.y = display.contentWidth*0.692,display.contentHeight*0.238
	sceneGroup:insert(schedule)

	local  bed = display.newImage("이미지/홈/가구/침대.png")
	bed.x,bed.y = display.contentWidth*0.1632,display.contentHeight*0.5634
	sceneGroup:insert(bed)

	local  desk = display.newImage("이미지/홈/가구/책상.png")
	desk.x,desk.y = display.contentWidth*0.8286,display.contentHeight*0.6185
	sceneGroup:insert(desk)

	local  rack = display.newImage("이미지/홈/가구/선반.png")
	rack.x,rack.y = display.contentWidth*0.4755,display.contentHeight*0.625
	sceneGroup:insert(rack)

	local  speaker = display.newImage("이미지/홈/가구/스피커.png")
	speaker.x,speaker.y = display.contentWidth*0.58,display.contentHeight*0.479
	sceneGroup:insert(speaker)

	local  chair = display.newImage("이미지/홈/가구/의자.png")
	chair.x,chair.y = display.contentWidth*0.7794,display.contentHeight*0.602
	sceneGroup:insert(chair)

	local  television = display.newImage("이미지/홈/가구/티비.png")
	television.x,television.y = display.contentWidth*0.4297,display.contentHeight*0.362
	sceneGroup:insert(television)

	local  bookShelf = display.newImage("이미지/홈/가구/책장.png")
	bookShelf.x,bookShelf.y = display.contentWidth*0.923,display.contentHeight*0.4597
	sceneGroup:insert(bookShelf)
	
	local woodTable = display.newImage("이미지/홈/가구/테이블.png")
	woodTable.x,woodTable.y = display.contentWidth*0.281,display.contentHeight*0.8056
	sceneGroup:insert(woodTable)
	
------이불
    local  blan_str = display.newImage("이미지/홈/홈화면꾸미기/줄무늬 이불세트.png")
	blan_str.x,blan_str.y = display.contentWidth*0.1685,display.contentHeight*0.552
	sceneGroup:insert(blan_str)
	blan_str.alpha =0

 	local  blan_flower = display.newImage("이미지/홈/홈화면꾸미기/꽃무늬 이불세트.png")
	blan_flower.x,blan_flower.y = display.contentWidth*0.167,display.contentHeight*0.55
	sceneGroup:insert(blan_flower)
	blan_flower.alpha =0

	if loadedItems.flower_apply == 1 then 
		blan_flower.alpha = 1
		blan_str.alpha = 0
	elseif loadedItems.sprite_apply == 1 then 
		blan_flower.alpha = 0
		blan_str.alpha = 1
	elseif loadedItems.white_apply == 1 then 
		blan_flower.alpha = 0
		blan_str.alpha = 0
	elseif loadedItems.sprite_apply == 0 and loadedItems.flower_apply == 0 then 
		blan_flower.alpha = 0
		blan_str.alpha = 0
	end 

----------화분
	local clover_pot = display.newImage("이미지/홈/홈화면꾸미기/클로버화분.png")
	clover_pot.x,clover_pot.y = display.contentWidth*0.238,display.contentHeight*0.71
	sceneGroup:insert(clover_pot)
	clover_pot.alpha = 0

	local cactus_pot = display.newImage("이미지/홈/홈화면꾸미기/선인장화분.png")
	cactus_pot.x,cactus_pot.y = display.contentWidth*0.238,display.contentHeight*0.713
	sceneGroup:insert(cactus_pot)
	cactus_pot.alpha = 0

	local violet_pot = display.newImage("이미지/홈/홈화면꾸미기/제비꽃화분.png")
	violet_pot.x,violet_pot.y = display.contentWidth*0.238,display.contentHeight*0.734
	sceneGroup:insert(violet_pot)
	violet_pot.alpha = 0

	local sunflower_pot = display.newImage("이미지/홈/홈화면꾸미기/해바라기화분.png")
	sunflower_pot.x,sunflower_pot.y = display.contentWidth*0.238,display.contentHeight*0.7
	sceneGroup:insert(sunflower_pot)
	sunflower_pot.alpha = 0

	if loadedItems.cactus_apply == 1 then 
		cactus_pot.alpha = 1
		violet_pot.alpha = 0
		sunflower_pot.alpha = 0
		clover_pot.alpha = 0
	elseif loadedItems.violet_apply == 1 then 
		cactus_pot.alpha = 0
		violet_pot.alpha = 1
		sunflower_pot.alpha = 0
		clover_pot.alpha = 0
	elseif loadedItems.sunflower_apply == 1 then 
		cactus_pot.alpha = 0
		violet_pot.alpha = 0
		sunflower_pot.alpha = 1
		clover_pot.alpha = 0
	elseif loadedItems.clover_apply == 1 then 
		cactus_pot.alpha = 0
		violet_pot.alpha = 0
		sunflower_pot.alpha = 0
		clover_pot.alpha = 1
	elseif loadedItems.clover_apply == 0 and loadedItems.sunflower_apply == 0 and loadedItems.violet_apply == 0 and loadedItems.cactus_apply == 0 then 
		cactus_pot.alpha = 0
		violet_pot.alpha = 0
		sunflower_pot.alpha = 0
		clover_pot.alpha = 0
	end

-----------액자
	local frame_b = display.newImage("이미지/홈/홈화면꾸미기/액자(블리).png")
	frame_b.x,frame_b.y = display.contentWidth*0.31,display.contentHeight*0.726
	sceneGroup:insert(frame_b)
	frame_b.alpha = 0

	local frame_l = display.newImage("이미지/홈/홈화면꾸미기/액자(레이).png")
	frame_l.x,frame_l.y = display.contentWidth*0.31,display.contentHeight*0.726
	sceneGroup:insert(frame_l)
	frame_l.alpha = 0

	local frame_s = display.newImage("이미지/홈/홈화면꾸미기/액자(솔리).png")
	frame_s.x,frame_s.y = display.contentWidth*0.31,display.contentHeight*0.726
	sceneGroup:insert(frame_s)
	frame_s.alpha = 0

	local frame_w = display.newImage("이미지/홈/홈화면꾸미기/액자(위즈).png")
	frame_w.x,frame_w.y = display.contentWidth*0.31,display.contentHeight*0.726
	sceneGroup:insert(frame_w)
	frame_w.alpha = 0

	local frame_j = display.newImage("이미지/홈/홈화면꾸미기/액자(조이).png")
	frame_j.x,frame_j.y = display.contentWidth*0.31,display.contentHeight*0.726
	sceneGroup:insert(frame_j)
	frame_j.alpha = 0

	if loadedItems.lay_apply == 1 then 
		frame_l.alpha = 1
		frame_w.alpha = 0
		frame_s.alpha = 0
		frame_j.alpha = 0
		frame_b.alpha = 0
	elseif loadedItems.wiz_apply == 1 then 
		frame_l.alpha = 0
		frame_w.alpha = 1
		frame_s.alpha = 0
		frame_j.alpha = 0
		frame_b.alpha = 0
	elseif loadedItems.soli_apply == 1 then 
		frame_l.alpha = 0
		frame_w.alpha = 0
		frame_s.alpha = 1
		frame_j.alpha = 0
		frame_b.alpha = 0
	elseif loadedItems.joy_apply == 1 then 
		frame_l.alpha = 0
		frame_w.alpha = 0
		frame_s.alpha = 0
		frame_j.alpha = 1
		frame_b.alpha = 0
	elseif loadedItems.bly_apply == 1 then 
		frame_l.alpha = 0
		frame_w.alpha = 0
		frame_s.alpha = 0
		frame_j.alpha = 0
		frame_b.alpha = 1
	elseif loadedItems.lay_apply == 0 and loadedItems.wiz_apply == 0 and loadedItems.soli_apply == 0 and loadedItems.joy_apply == 0 and loadedItems.bly_apply == 0 then 
		frame_l.alpha = 0
		frame_w.alpha = 0
		frame_s.alpha = 0
		frame_j.alpha = 0
		frame_b.alpha = 0
	end

 ----인형
	local rabbit_doll = display.newImage("이미지/홈/홈화면꾸미기/토끼인형.png")
	rabbit_doll.x,rabbit_doll.y = display.contentWidth*0.224,display.contentHeight*0.456
	sceneGroup:insert(rabbit_doll)
	rabbit_doll.alpha = 0

	local bear_doll = display.newImage("이미지/홈/홈화면꾸미기/곰인형.png")
	bear_doll.x,bear_doll.y = display.contentWidth*0.224,display.contentHeight*0.456
	sceneGroup:insert(bear_doll)
	bear_doll.alpha = 0

	if loadedItems.bear_apply == 1 then 
		bear_doll.alpha = 1
		rabbit_doll.alpha = 0
	elseif loadedItems.rabbit_apply == 1 then 
		bear_doll.alpha = 0
		rabbit_doll.alpha = 1
	elseif loadedItems.bear_apply == 0 and loadedItems.rabbit_apply == 0 then 
		bear_doll.alpha = 0
		rabbit_doll.alpha = 0
	end 

-- 코인 창 객체 
	local coin = display.newImage("이미지/공통/코인표시창.png")
	sceneGroup:insert(coin)
	coin.x, coin.y = display.contentWidth*0.9, display.contentHeight*0.08

-- 코인 객체, 글씨체 및 세이브 파일에 담겨진 보유 코인을 text에 담음
	local money = display.newText("",display.contentWidth*0.96, display.contentHeight*0.075,"font/NanumSquare_acB.ttf")
	money:setFillColor(0.964, 0.462, 0.411)
	money.anchorX = 1
	money.text = loadedSettings.money 
	money.size = 53
	sceneGroup:insert(money)

	-- 모션
	options = {
		width = 700,
		height = 800,
		numFrames = 17,
		sheetContentWidth=4200, sheetContentHeight=2400
	}

	data = {
		name = "main",
		start = 1,
		count = 17,
		time = 1000,
		loopCount = 0,
		loopDirection = "forward"
	}


	-- 주인공 객체
	normal = graphics.newImageSheet("애니매이션/모션/주인공(랜덤)/"..loadedItems.costume.. "/1.png", options)
	motion_normal = display.newSprite(normal,data)
	motion_normal.x, motion_normal.y = display.contentWidth*0.523,display.contentHeight*0.566
	sceneGroup:insert(motion_normal)
	motion_normal:play()

	function gotoback()
		if (main_motion ~= nil) then
			motion_normal.alpha = 1
			main_motion:pause()
			main_motion:removeSelf()
			main_motion=nil
			motion=nil
		end
	end

	function mainMotion(event)
		i = math.random(2, 5)
		timer.performWithDelay(3000,gotoback)
		motion = graphics.newImageSheet("애니매이션/모션/주인공(랜덤)/"..loadedItems.costume.. "/" .. i .. ".png", options)
		main_motion = display.newSprite(motion,data)
		main_motion.x, main_motion.y = display.contentWidth*0.523,display.contentHeight*0.566
		sceneGroup:insert(main_motion)	
		main_motion:play()
		if (motion_normal ~= nil) then
			motion_normal.alpha = 0
		end
	end
	motion_normal:addEventListener("touch",mainMotion)

-- 달력 글씨
	local month = display.newText("",display.contentWidth * 0.691, display.contentHeight * 0.162,"font/잘풀리는오늘 Medium.ttf")
	month:setFillColor(0)
	month.size = 40
	sceneGroup:insert(month)
-- 이전 달 할 일 1
	local former = display.newText("",display.contentWidth * 0.6225, display.contentHeight * 0.2325,"font/잘풀리는오늘 Medium.ttf")
	former.anchorX,former.anchorY = 0,0
	former:setFillColor(0.82,0.21,0.05)
	former.size = 20
	former.text = loadedSettings.former1
	sceneGroup:insert(former)
-- 이전 달 할 일 2
	local former2 = display.newText("",display.contentWidth * 0.6225, display.contentHeight * 0.2603,"font/잘풀리는오늘 Medium.ttf")
	former2.anchorX ,former2.anchorY = 0,0
	former2:setFillColor(0.82,0.21,0.05)
	former2.size = 20
	former2.text = loadedSettings.former2
	sceneGroup:insert(former2)
-- 다음 달 할 일 1
	local next1 = display.newText("dd",display.contentWidth * 0.6225, display.contentHeight * 0.3422,"font/잘풀리는오늘 Medium.ttf")
	next1.anchorX,next1.anchorY = 0,0
	next1:setFillColor(0)
	next1.size = 20
	next1.text = loadedSettings.next1
	sceneGroup:insert(next1)
-- 다음 달 할 일 2
	local next2 = display.newText("dd",display.contentWidth * 0.6225, display.contentHeight * 0.3722,"font/잘풀리는오늘 Medium.ttf")
	next2.anchorX,next2.anchorY = 0,0
	next2:setFillColor(0)
	next2.size = 20
	next2.text = loadedSettings.next2
	sceneGroup:insert(next2)

-- 세이브 파일에 따라 달력 글씨 바뀜
	if loadedSettings.month == 0 then
		month.text = "이른 봄의 달"
	elseif loadedSettings.month == 1 then
		month.text = "꽃 피는 달"
	elseif loadedSettings.month == 2 then
		month.text = "해변달"
	elseif loadedSettings.month == 3 then
		month.text = "단풍달"
	elseif loadedSettings.month == 4 then
		month.text = "도토리 달"
	elseif loadedSettings.month ==5 then
		month.text = "눈꽃 달"
	end

	local options = {
    	isModal = true
    	
	}

-- 이벤트 조건 설정. 1월달 + 1회성
	if loadedSettings.month == 0 then

		if loadedSettings.tutorial == 0 then

			composer.showOverlay("zopup_guide",options)
			loadedSettings.tutorial = loadedSettings.tutorial + 1
			loadsave.saveTable(loadedSettings,"settings.json")
		end

	end

	--샘플 볼륨 이미지
    local volumeButton = display.newImage("이미지/타이틀/설정.png")
    volumeButton.x,volumeButton.y = display.contentWidth * 0.13, display.contentHeight * 0.906
    sceneGroup:insert(volumeButton)

    --샘플볼륨함수--
    local function setVolume(event)
                composer.showOverlay( "volumeControl", options )
    end
    volumeButton:addEventListener("tap",setVolume)

	


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
		--composer.removeScene("view00Room")
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