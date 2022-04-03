--해변달(3월) 이벤트 스크립트
local composer = require( "composer" )
local scene = composer.newScene()
local loadsave = require( "loadsave" )

function scene:create( event )
	local sceneGroup = self.view
	
	local loadedSettings = loadsave.loadTable( "settings.json" )
	
	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
	
	-- create a white background to fill screen

	  --샘플 볼륨 이미지
    local volumeButton = display.newImage("이미지/타이틀/설정.png")
    volumeButton.x,volumeButton.y = display.contentWidth * 0.87, display.contentHeight * 0.9
    sceneGroup:insert(volumeButton)

    --샘플볼륨함수--
    local function setVolume(event)
        composer.showOverlay( "volumeControl", option )
    end
    volumeButton:addEventListener("tap",setVolume)

	 local option = {
        isModal = true
        
    }

	local eventMusic = audio.loadStream( "음악/계절.mp3" )
 	audio.setVolume( loadedEndings.logValue )
    audio.play(eventMusic)

	local background = display.newImage("이미지/홈/배경/가구포함.png")
	background.x, background.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background)
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
	former2:setFillColor(0)
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

	local background_1 = display.newImage("이미지/이벤트/3월/1.png")
	background_1.x,background_1.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background_1)
	background_1.width, background_1.height = display.contentWidth,display.contentHeight
	background_1.alpha = 0

	local sing1 = display.newImage("이미지/이벤트/3월/2.png")
	sing1.x, sing1.y  = display.contentWidth*0.5,display.contentHeight*0.5
	sceneGroup:insert(sing1)
	sing1.alpha = 0

	local sing = display.newImage("이미지/이벤트/3월/3.png")
	sing.x, sing.y  = display.contentWidth*0.5,display.contentHeight*0.5
	sceneGroup:insert(sing)
	sing.alpha = 0

	local black_box = display.newRect(display.contentWidth/2,display.contentHeight/2, display.contentWidth,display.contentHeight)
	black_box.alpha = 0
	black_box:setFillColor(0)
	sceneGroup:insert(black_box)

	local home = display.newImage("이미지/이벤트/3월/4.png")
	home.x, home.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(home)
	home.alpha = 0
	
	local joy = display.newImage("이미지/캐릭터/조이/기본.png")
	joy.x, joy.y =  display.contentWidth*0.53,display.contentHeight/2
	sceneGroup:insert(joy)

	local happy_joy = display.newImage("이미지/캐릭터/조이/기쁨.png")
	happy_joy.x, happy_joy.y =  display.contentWidth*0.53,display.contentHeight/2
	sceneGroup:insert(happy_joy)
	happy_joy.alpha = 0

	local nangam_joy = display.newImage("이미지/캐릭터/조이/난감.png")
	nangam_joy.x, nangam_joy.y =  display.contentWidth*0.53,display.contentHeight/2
	sceneGroup:insert(nangam_joy)
	nangam_joy.alpha = 0


	local daesapan = display.newImage("이미지/대화/대화창/조이.png")
	daesapan.x, daesapan.y = display.contentWidth/2,display.contentHeight*0.7176
	daesapan.anchorY=0
	sceneGroup:insert(daesapan)

	local my_daesapan = display.newImage("이미지/대화/대화창/주인공.png")
	my_daesapan.x, my_daesapan.y = display.contentWidth/2,display.contentHeight*0.7176
	my_daesapan.anchorY = 0
	sceneGroup:insert(my_daesapan)
	my_daesapan.alpha=0

	local choose1 = display.newImage("이미지/대화/선택지/조이.png")
	choose1.x, choose1.y = display.contentWidth*0.0998,display.contentHeight*0.3500
	choose1.anchorX,choose1.anchorY = 0,0
	sceneGroup:insert(choose1)
	choose1.alpha = 0


	local choose2 = display.newImage("이미지/대화/선택지/조이.png")
	choose2.x, choose2.y = display.contentWidth*0.6326,display.contentHeight*0.3500
	choose2.anchorX,choose2.anchorY = 0,0
	sceneGroup:insert(choose2)
	choose2.alpha = 0



	mainName = loadedSettings.name
	
--display.contentWidth*0.1386,
	local my = display.newText(mainName,display.contentWidth*0.1386,display.contentHeight*0.73,"font/잘풀리는오늘 Medium.ttf")
	my.anchorX,my.anchorY = 0,0
	my.size = 45
	my.alpha = 1
	my:setFillColor(1)
	sceneGroup:insert(my)


--초반 대사--
	local text0 ={
		"(누군가 벨을 누른다)",
		mainName .. "! 뭐해? 나 지금 해변에 물놀이 갈 건데, 같이 갈래?",
		"그래 좋아!",
		"아니, 난 쉬고 싶어.\n 다음에 같이 가자!",
		"좋아! 같이 놀러 가자!",
		"아니, 난 쉬고 싶어. 다음에 같이 가자!"
	}
	
	local text1 = {
		"여름의 바다는 정말 아름다워! 파도가 노래하는 것 같아~",
		"그러게!",
		"앗, 저기! 축제를 하나봐.",
		"(조이가 가리킨 곳에는 '해변 노래자랑'이 열리고 있다)",
		"와, 노래자랑! 주인공아, 우리 저기 나가지 않을래? 나 꼭 나가보고 싶었거든!"
	}

	local text2 = {

		"거절할래!",
		"너무 갑작스러워서…. 난 안 나갈래. 대신 너를 열심히 응원할게! 응원엔 자신 있다구!",
		"음, 좀 갑작스럽긴 했지? 그래! 그럼 내가 멋지게 노래하고 상금 타올게! 우리 이걸로 맛있는 거 먹자!",
		"좋아! 화이팅이야!",
		"(조이가 노래하는 모습)"

	}

	local text3 = {

		"참가할래!",
		"좋아, 실은 나도 노래자랑 참여하고 싶었어!",
		"우리 둘이 나간다면 우승은 따 놓은 당상이지~",
		"(조이와 주인공이 노래하는 모습)"

	}

	local text4 = {
		"오늘 장기자랑도 나가보고 같이 놀아서 즐거웠어! 너랑 놀러가길 잘 한 것 같아~",
		"나도 즐거웠어."
	}

	local daewha0 = {}
	local daewha1 = {}
	local daewha2 = {}
	local daewha3 = {}
	local daewha4 = {}

	for i = 1,6 do
		daewha0[i] = display.newText(text0[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		daewha0[i].anchorX,daewha0[i].anchorY = 0,0
		daewha0[i]:setFillColor(0)
		daewha0[i].alpha = 0
		daewha0[i].size = 30
		sceneGroup:insert(daewha0[i])
	end

	for i = 1,5 do
		daewha1[i] = display.newText(text1[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		daewha1[i].anchorX,daewha1[i].anchorY = 0,0
		daewha1[i]:setFillColor(0)
		daewha1[i].alpha = 0
		daewha1[i].size = 30
		sceneGroup:insert(daewha1[i])
	end

	for i = 1,5 do
		daewha2[i] = display.newText(text2[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		daewha2[i].anchorX,daewha2[i].anchorY = 0,0
		daewha2[i]:setFillColor(0)
		daewha2[i].alpha = 0
		daewha2[i].size = 30
		sceneGroup:insert(daewha2[i])
	end

	for i = 1,4 do
		daewha3[i] = display.newText(text3[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		daewha3[i].anchorX,daewha3[i].anchorY = 0,0
		daewha3[i]:setFillColor(0)
		daewha3[i].alpha = 0
		daewha3[i].size = 30
		sceneGroup:insert(daewha3[i])
	end

	for i = 1,2 do
		daewha4[i] = display.newText(text4[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		daewha4[i].anchorX,daewha4[i].anchorY = 0,0
		daewha4[i]:setFillColor(0)
		daewha4[i].alpha = 0
		daewha4[i].size = 30
		sceneGroup:insert(daewha4[i])
	end

	select_daewha1 = {}
	select_daewha2 = {}

	select_text1 = {
		"그래 좋아!",
		"참가할래!"
	}
	select_text2 = {
		"아니, 난 쉬고 싶어.",
		"거절할래!"
	}

	local option1={}
	local option2={}
	for i =1,2 do
		option1[i] = {
			text = select_text1[i],
			x=233,
			y=490,
			width=438,
			height=143,
			align = "center",
			font = "font/NanumSquareRoundB.ttf",
			fontSize = 36
		}
		option2[i] = {
			text = select_text2[i],
			x=1254.73,
			y=490,
			width=438,
			height=143,
			align = "center",
			font = "font/NanumSquareRoundB.ttf",
			fontSize = 36
		}
	end

	for i=1,2 do
		select_daewha1[i]=display.newText(option1[i])
		select_daewha1[i].anchorX,select_daewha1[i].anchorY = 0,0
		sceneGroup:insert(select_daewha1[i])
		select_daewha1[i].alpha = 0

		select_daewha2[i]=display.newText(option2[i])
		select_daewha2[i].anchorX,select_daewha2[i].anchorY = 0,0
		sceneGroup:insert(select_daewha2[i])
		select_daewha2[i].alpha = 0
	end

	daewha0[1].alpha = 1
	my_daesapan.alpha = 1
	joy.alpha = 0
	local k = 0
	local m = 0
	local n = 2
	local h = 3
	local w = 3

	local i = 0
	local j = 0


	local function last(event)

		if event.phase == "began" then
			if j == 0 then
				black_box.alpha = 0
				daewha4[2].alpha=1
				my_daesapan.alpha = 1
				my.alpha = 1
				display.remove(daewha4[1])
				j = j+1
			else 
				daesapan:removeEventListener("touch",last)
				composer.removeScene("viewmonth3_event")
				audio.pause(eventMusic)
				local home = audio.loadStream( "음악/집.mp3" )
 audio.setVolume( loadedEndings.logValue )
                audio.play(home)
				composer.gotoScene("view02schedule")
			end

			
		end

	end


	local function show(event)

		if event.phase == "began" then
			if i == 0 then

				transition.to(home,{time=1000,alpha=1})
				i = i + 1

			elseif i == 1 then

				black_box:removeEventListener("touch",show)
				
				happy_joy.alpha = 1
				daesapan.alpha = 1
				daewha4[1].alpha = 1
				daesapan:addEventListener("touch",last)
				
			end

			
		end

	end


	local function second_2(event)
		if event.phase == "began" then
			if w < 5 then
				if w == 3 then
					nangam_joy.alpha = 1
					joy.alpha = 0
					my_daesapan.alpha = 0
					my.alpha = 0
				else

					my_daesapan.alpha =1
					my.alpha = 1
				end

				daewha2[w-1].alpha = 0
				daewha2[w].alpha = 1
				w = w + 1
			elseif w == 5 then
				daewha2[4].alpha = 0
				nangam_joy.alpha = 0
				daesapan.alpha = 0
				my_daesapan.alpha = 0
				my.alpha = 0
				transition.to(sing1,{time=2000,alpha=1})
				transition.to(black_box,{time=2000,alpha=1,delay=6000})
				black_box:addEventListener("touch",show)

			end

		end
	end

	local function one_box(event)

		if event.phase == "began" then

			choose1.alpha = 0
			choose2.alpha = 0
			daewha1[4].alpha = 0
			select_daewha1[2].alpha =0
			select_daewha2[2].alpha = 0
			daewha2[2].alpha = 1
			my_daesapan.alpha =1
			my.alpha = 1

			daesapan:addEventListener("touch",second_2)
			choose1:removeEventListener("touch",one_box)
			

		end
	end

	local function third_2(event)

		if event.phase == "began" then

			if h < 4 then
				if h == 3 then
					happy_joy.alpha = 1
					joy.alpha = 0
					my_daesapan.alpha = 0
					my.alpha = 0
				else
					happy_joy.alpha = 0
					joy.alpha = 1
					my_daesapan.alpha =1
					my.alpha = 1
				end

				daewha3[h-1].alpha = 0
				daewha3[h].alpha = 1
				h = h + 1

			else
				daesapan:removeEventListener("touch",third_2)
				daewha3[3].alpha = 0
				happy_joy.alpha = 0
				daesapan.alpha = 0
				my_daesapan.alpha = 0
				my.alpha = 0
				transition.to(sing,{time=2000,alpha=1})
				transition.to(black_box,{time=2000,alpha=1,delay=6000})
				black_box:addEventListener("touch",show)
			end
		end

		
	end

	local function two_box(event)
		if event.phase == "began" then

			loadedSettings.yellow = loadedSettings.yellow + 1
			loadsave.saveTable(loadedSettings, "settings.json")

			choose1.alpha = 0
			choose2.alpha = 0
			daewha1[4].alpha = 0
			select_daewha1[2].alpha =0
			select_daewha2[2].alpha = 0
			daewha3[2].alpha = 1
			my_daesapan.alpha =1
			my.alpha = 1

			daesapan:addEventListener("touch",third_2)
			choose1:removeEventListener("touch",one_box)
			choose2:removeEventListener("touch",two_box)


		end
	end

	local function second_1(event)
		if event.phase == "began" then
			if n == 2 then 
				my_daesapan.alpha = 1
				my.alpha = 1
			else
				my_daesapan.alpha = 0
				my.alpha = 0

			end

			daewha1[n-1].alpha = 0
			daewha1[n].alpha = 1
			n = n+1

			if n == 5 then

				daesapan:removeEventListener("touch",second_1)

				choose1.alpha = 1
				choose2.alpha = 1

				

				select_daewha1[2].alpha =1
				select_daewha2[2].alpha = 1

				choose2:addEventListener("touch",one_box)
				choose1:addEventListener("touch",two_box)


			end

		end
	end

	local function next_back(event)

		if event.phase == "began" then

			if m == 0 then
				m = m +1

			else
				joy.alpha = 1
				daesapan.alpha = 1
				daewha1[1].alpha = 1
				background:removeEventListener("touch",next_back)
				daesapan:addEventListener("touch",second_1)
			end

		end

	end

	local function bye(event)
		if event.phase == "began" then 
			if v == 1 then
				print("b1")
				choose1:removeEventListener("touch",second)
				daewha0[2].alpha = 0
				choose1.alpha = 0
				choose2.alpha = 0
				select_daewha1[1].alpha =0
				select_daewha2[1].alpha = 0

				daewha0[6].alpha = 1
				my_daesapan.alpha = 1
				my.alpha = 1
				v = v+1
			else
				print("b2")
				daesapan:removeEventListener("touch",bye)
				composer.removeScene("viewmonth3_event")
				audio.pause(eventMusic)
				local home = audio.loadStream( "음악/집.mp3" )
 				audio.setVolume( loadedEndings.logValue )
                audio.play(home)
				composer.gotoScene("view02schedule")
				--composer.removeScene("viewmonth3_event - 복사본")
				--composer.gotoScene("view12Plan")
			end
		end
	end

	local function second(event)
		print("second func")
		if event.phase == "began" then

			if k == 0 then
				daewha0[2].alpha = 0
				choose1.alpha = 0
				choose2.alpha = 0
				select_daewha1[1].alpha =0
				select_daewha2[1].alpha =0

				daewha0[5].alpha = 1
				choose1:removeEventListener("touch",second)
				daesapan:addEventListener("touch",second)
				choose2:removeEventListener("touch",bye)
				k = k+1
			else
				background_1.alpha = 1
				joy.alpha = 0
				daewha0[5].alpha = 0
				daesapan.alpha = 0
				background:addEventListener("touch",next_back)
				daesapan:removeEventListener("touch",second)
			end
		end

	end

	local j = 0 

	local v = 1

	

	local function first(event)

		if event.phase == "began" then

			if j == 0 then
				joy.alpha = 1
				my_daesapan.alpha = 0
				my.alpha = 0
				daewha0[1].alpha = 0
				daewha0[2].alpha = 1
				j = j+1
			else
				choose1.alpha = 1
				choose2.alpha = 1

				select_daewha1[1].alpha =1
				select_daewha2[1].alpha = 1

				choose1:addEventListener("touch",second)
				choose2:addEventListener("touch",bye)
				daesapan:removeEventListener("touch",first)
			end

			

		end

	end

	daesapan:addEventListener("touch",first)

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
		composer.removeScene("viewmonth3_event")
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