--단풍달(4월) 우정 스크립트

local composer = require( "composer" )
local scene = composer.newScene()
local loadsave = require( "loadsave" )

function scene:create( event )
	local sceneGroup = self.view
	
	local loadedSettings = loadsave.loadTable( "settings.json" )
	mainName = loadedSettings.name-------수정

	--장면전환
	local options={
		effect="crossFade",
		time=1000
	}

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


	-- 배경 --
	local background = display.newImageRect("이미지/홈/배경/가구포함.png",display.contentWidth, display.contentHeight)
	background.x,background.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background)

	local background_1 = display.newImage("이미지/이벤트/4월/1.png")
	background_1.x,background_1.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background_1)
	background_1.alpha = 0

	local background_2 = display.newImage("이미지/이벤트/4월/2.png")
	background_2.x,background_2.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background_2)
	background_2.alpha = 0

	local background_3 = display.newImage("이미지/이벤트/4월/3.png")
	background_3.x,background_3.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background_3)
	background_3.alpha = 0

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

	-- 캐릭터 선언

	local green_default = display.newImage("이미지/캐릭터/솔리/기본.png")
	green_default.x, green_default.y = display.contentWidth*0.53,display.contentHeight/2
	sceneGroup:insert(green_default)
	green_default.alpha = 0

	local green_awakard = display.newImage("이미지/캐릭터/솔리/난감.png")
	green_awakard.x, green_awakard.y = display.contentWidth*0.53,display.contentHeight/2
	sceneGroup:insert(green_awakard)
	green_awakard.alpha = 0

	local green_happy = display.newImage("이미지/캐릭터/솔리/기쁨.png")
	green_happy.x, green_happy.y = display.contentWidth*0.53,display.contentHeight/2
	sceneGroup:insert(green_happy)
	green_happy.alpha = 0

	local sad_soli = display.newImage("이미지/캐릭터/솔리/슬픔.png")
	sad_soli.x, sad_soli.y =  display.contentWidth*0.53,display.contentHeight/2
	sceneGroup:insert(sad_soli)
	sad_soli.alpha = 0


	local blue_default = display.newImage("이미지/캐릭터/위즈/기본.png")
	blue_default.x, blue_default.y = display.contentWidth*0.53,display.contentHeight/2
	sceneGroup:insert(blue_default)
	blue_default.alpha = 0

	local blue_angry = display.newImage("이미지/캐릭터/위즈/화남.png")
	blue_angry.x, blue_angry.y =  display.contentWidth*0.53,display.contentHeight/2
	sceneGroup:insert(blue_angry)
	blue_angry.alpha = 0

	local blue_awakard = display.newImage("이미지/캐릭터/위즈/난감.png")
	blue_awakard.x, blue_awakard.y =  display.contentWidth*0.53,display.contentHeight/2
	sceneGroup:insert(blue_awakard)
	blue_awakard.alpha = 0

	local blue_happy = display.newImage("이미지/캐릭터/위즈/기쁨.png")
	blue_happy.x, blue_happy.y =  display.contentWidth*0.53,display.contentHeight/2
	sceneGroup:insert(blue_happy)
	blue_happy.alpha = 0

	-- 대사창 

	local my_daesapan = display.newImage("이미지/대화/대화창/주인공.png")
	my_daesapan.x, my_daesapan.y = display.contentWidth*0.5,display.contentHeight*0.7176
	my_daesapan.anchorY = 0
	sceneGroup:insert(my_daesapan)

	local green_daesapan = display.newImage("이미지/대화/대화창/솔리.png")
	green_daesapan.x, green_daesapan.y = display.contentWidth*0.5,display.contentHeight*0.7176
	green_daesapan.anchorY = 0
	sceneGroup:insert(green_daesapan)
	green_daesapan.alpha = 0

	local blue_daesapan = display.newImage("이미지/대화/대화창/위즈.png")
	blue_daesapan.x, blue_daesapan.y = display.contentWidth*0.5,display.contentHeight*0.7176
	blue_daesapan.anchorY = 0
	sceneGroup:insert(blue_daesapan)
	blue_daesapan.alpha = 0

	-- 선택창 --

	local select1 = display.newImage("이미지/대화/선택지/솔리.png")
	select1.x, select1.y = display.contentWidth*0.0998, display.contentHeight*0.3500
	select1.anchorY, select1.anchorX = 0,0
	select1.alpha = 0
	sceneGroup:insert(select1)

	local select2 = display.newImage("이미지/대화/선택지/솔리.png")
	select2.x, select2.y = display.contentWidth*0.6326, display.contentHeight*0.3500
	select2.anchorY, select2.anchorX = 0,0
	select2.alpha = 0
	sceneGroup:insert(select2)

	-- 텍스트 --

	

	daewha = {}
	daewha2 = {}
	daewha3 = {}

	select_daewha1 = {}
	select_daewha2 = {}

	select_text1 = {
		"그래 좋아!",
		"위즈 편을 들어준다."
	}
	select_text2 = {
		"아니, 난 쉬고 싶어.",
		"솔리에게 충고한다"
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

	local text = {
		"(누군가 벨을 누른다)",
		mainName .. "! 안녕? 시간 되면 위즈랑 같이 캠핑 안 갈래? 가서 마시멜로도 구워 먹자!",
		"좋아! 같이 놀러 가자!",
		"아니, 난 쉬고 싶어. 다음에 같이 가자!",
		"마쉬멜로우를 구워 먹으려면 불을 피워야겠지?",
		"응! 내가 나뭇가지를 주워 올게!",
		"잠깐만! 불 대신 연못에서 물을 구해오자. 오늘이야말로 물 속에서 불 피우기 키트를 써 볼 좋은 기회야.",
		"무, 물 속에서 불…? 그래! 내가 물을 구해 올게!",
		"으악!",
		"솔리야, 괜찮아?",
		"조심했어야지! 하마터면 큰일 날 뻔했잖아! 우리 행성에선 물 근처에 가면 중력에 세지는 것도 모르는 거야?",
		"콜록, 나는 그런 게 아니고… 콜록, 너네를 편게 해주고 싶어서 내가 하려고 한 건데…. 콜록.",
		"얘, 얘들아….",
		"마쉬멜로우 정말 맛있겠다~",
		"빨리 먹고 싶어!",
		"가끔 캠핑 오는 것도 좋은 것 같아. 다음에 또 오자!",
		"그래~"
	}


	local text1 = {
		"위즈야, 솔리가 우리를 배려하다 그런거니까…. 너무 화내지 말자.",
		"휴, 사실 나도 너무 놀라서…. 잠깐 흥분했나봐. 솔리야, 미안해.",
		"아, 아냐…. 나 괜찮아! 너희가 구해줬잖아. 정말 고마워!",
		"그래도 물가는 위험하니까 다음부턴 꼭 같이 하자.",
		"응! 알겠어. 고마워 얘들아!"	
	}

	local text2 = {
		"솔리야, 그래도 위험하면 말을 해야지…. 너무 배려한다고 혼자 모든 걸 할 필요는 없어. 우린 친구잖아.",
		"맞아. 내가 얼마나 놀랐는지 알아?",
		"으응…. 알겠어. 미안해."
	}

	local my = display.newText(mainName,display.contentWidth*0.1386,display.contentHeight*0.73,"font/잘풀리는오늘 Medium.ttf")
	my.anchorX,my.anchorY = 0,0
	my.size = 45
	my.alpha = 0
	my:setFillColor(1)
	sceneGroup:insert(my)


	for i = 1,17 do
		daewha[i] = display.newText(text[i],160,865,"font/NanumSquare_acB.ttf")
		daewha[i].anchorX,daewha[i].anchorY = 0,0
		daewha[i]:setFillColor(0)
		daewha[i].alpha = 0
		daewha[i].size = 30
		sceneGroup:insert(daewha[i])
	end

	for i = 1,5 do
		daewha2[i] = display.newText(text1[i],160,865,"font/NanumSquare_acB.ttf")
		daewha2[i].anchorX,daewha2[i].anchorY = 0,0
		daewha2[i]:setFillColor(0)
		daewha2[i].alpha = 0
		daewha2[i].size = 30
		sceneGroup:insert(daewha2[i])
	end

	for i = 1,3 do
		daewha3[i] = display.newText(text2[i],160,865,"font/NanumSquare_acB.ttf")
		daewha3[i].anchorX,daewha3[i].anchorY = 0,0
		daewha3[i]:setFillColor(0)
		daewha3[i].alpha = 0
		daewha3[i].size = 30
		sceneGroup:insert(daewha3[i])
	end

	local side = display.newText("어떻게 그런 기본적인 상식을 까먹을 수 있어? 그럴 거면 차라리 나를 시키지!",160,910,"font/NanumSquare_acB.ttf")
	side.anchorX,side.anchorY = 0,0
	side:setFillColor(0)
	side.alpha = 0
	side.size = 30
	sceneGroup:insert(side)

	i = 1

	u = 0

	j = 1

	local function last_scene(event) 
		if event.phase == "began" then
			if i == 13 then
				daewha2[5].alpha =0
				daewha3[3].alpha = 0
				green_daesapan.alpha = 0
				green_happy.alpha = 0
				green_awakard.alpha = 0
				transition.to(background_3,{alpha=1,delay=1000})
				green_daesapan:removeEventListener("touch",last_scene)
				background_3:addEventListener("touch",last_scene)
				i = i+1
			elseif i == 14 then
				daewha[i-1].alpha =0
				daewha[i].alpha = 1
				i = i+1
				green_daesapan.alpha = 1
				background_3:removeEventListener("touch",last_scene)
				green_daesapan:addEventListener("touch",last_scene)
				blue_daesapan:addEventListener("touch",last_scene)
				my_daesapan:addEventListener("touch",last_scene)
			elseif i == 15 then
				daewha[i-1].alpha =0
				daewha[i].alpha = 1
				i = i+1
				green_daesapan.alpha = 0
				my_daesapan.alpha = 1
				my.alpha = 1
			elseif i == 16 then 
				daewha[i-1].alpha =0
				daewha[i].alpha = 1
				i = i+1
				my_daesapan.alpha = 0 
				my.alpha = 0
				blue_daesapan.alpha = 1
			elseif i == 17 then
				daewha[i-1].alpha =0
				daewha[i].alpha = 1
				i = i+1
				blue_daesapan.alpha = 0
				green_daesapan.alpha = 1
			elseif i == 18 then 
				composer.removeScene("viewmonth4_event")
				audio.pause(eventMusic)
				local home = audio.loadStream( "음악/집.mp3" )
 audio.setVolume( loadedEndings.logValue )
                audio.play(home)
				composer.gotoScene("view02schedule")
			end
		end
	end

	local function choose1(event)
		if event.phase == "began" then
			if j == 1 then 
				loadedSettings.green = loadedSettings.green + 1
				loadsave.saveTable(loadedSettings, "settings.json")
				daewha[13].alpha = 0
				select1.alpha = 0
				select2.alpha = 0
				select_daewha1[2].alpha = 0
				select_daewha2[2].alpha = 0
				daewha2[j].alpha = 1
				j = j+1
				my_daesapan:addEventListener("touch",choose1)
				blue_daesapan:addEventListener("touch",choose1)
				green_daesapan:addEventListener("touch",choose1)
			elseif j == 2 then
				blue_awakard.alpha = 1
				my_daesapan.alpha = 0
				my.alpha = 0
				blue_daesapan.alpha = 1
				daewha2[j-1].alpha = 0
				daewha2[j].alpha = 1
				j = j+1
				
				
			elseif j == 3 then
				green_default.alpha = 1
				daewha2[j-1].alpha = 0
				daewha2[j].alpha = 1
				blue_awakard.alpha = 0
				blue_daesapan.alpha = 0
				green_daesapan.alpha = 1
				j = j+1
				
			elseif j == 4 then 
				daewha2[j-1].alpha = 0
				daewha2[j].alpha = 1
				green_daesapan.alpha = 0
				green_default.alpha = 0
				blue_default.alpha = 1
				blue_daesapan.alpha = 1
				j = j+1
				
				
			elseif j == 5 then
				daewha2[j-1].alpha = 0
				daewha2[j].alpha = 1
				green_daesapan.alpha = 1
				green_happy.alpha = 1
				blue_default.alpha = 0
				blue_daesapan.alpha = 0
				
				my_daesapan:removeEventListener("touch",choose1)
				blue_daesapan:removeEventListener("touch",choose1)
				green_daesapan:removeEventListener("touch",choose1)
				green_daesapan:addEventListener("touch",last_scene)
			end

		end
	end

	local function choose2(event)
		if event.phase == "began" then
			if j == 1 then
				daewha[13].alpha = 0
				select1.alpha = 0
				select2.alpha = 0
				select_daewha1[2].alpha = 0
				select_daewha2[2].alpha = 0
				my_daesapan.alpha = 1
				my.alpha = 1
				daewha3[j].alpha = 1
				j =j +1
				my_daesapan:addEventListener("touch",choose2)
				green_daesapan:addEventListener("touch",choose2)
				blue_daesapan:addEventListener("touch",choose2)
			elseif j == 2 then
				blue_daesapan.alpha = 1
				my_daesapan.alpha = 0
				my.alpha = 0
				blue_angry.alpha = 1
				daewha3[j-1].alpha = 0
				daewha3[j].alpha = 1
				j = j +1
			elseif j == 3 then
				daewha3[j-1].alpha = 0
				daewha3[j].alpha = 1
				blue_daesapan.alpha = 0
				blue_angry.alpha = 0
				green_awakard.alpha = 1
				green_daesapan.alpha = 1
				j = j +1
				my_daesapan:removeEventListener("touch",choose2)
				green_daesapan:removeEventListener("touch",choose2)
				blue_daesapan:removeEventListener("touch",choose2)
				green_daesapan:addEventListener("touch",last_scene)
			end

		end
	end

	local function bye(event)
		if event.phase == "began" then
			if j == 1 then
				my_daesapan.alpha = 1
				my.alpha=1
				green_daesapan.alpha = 0
				select1.alpha = 0
				select2.alpha = 0
				select_daewha1[1].alpha = 0
				select_daewha2[1].alpha = 0
				daewha[i].alpha = 0
				daewha[4].alpha = 1
				j =j+1
				my_daesapan:addEventListener("touch",bye)
			elseif j == 2 then
				composer.removeScene("viewmonth4_event")
				audio.pause(eventMusic)
				local home = audio.loadStream( "음악/집.mp3" )
				 audio.setVolume( loadedEndings.logValue )
                audio.play(home)
				composer.gotoScene("view02schedule")
			end
		end
	end

	local function first_scence(event)
		if event.phase == "began" then 
			print(i)
			if i==1 then
				daewha[i].alpha = 0
				daewha[i+1].alpha = 1
				green_default.alpha = 1
				my_daesapan.alpha = 0
				green_daesapan.alpha = 1

				select1.alpha = 1
				select2.alpha = 1
				select_daewha1[1].alpha = 1
				select_daewha2[1].alpha = 1

				my_daesapan:removeEventListener("touch",first_scence)
				select1:addEventListener("touch",first_scence)
				select2:addEventListener("touch",bye)
				i = i +1
			elseif i == 2 then
				daewha[i].alpha = 0
				daewha[i+1].alpha = 1
				my_daesapan.alpha = 1
				my.alpha=1
				green_daesapan.alpha = 0
				select1.alpha = 0
				select2.alpha = 0
				select_daewha1[1].alpha = 0
				select_daewha2[1].alpha = 0
				i = i+1
				
				select1:removeEventListener("touch",first_scence)
				select2:removeEventListener("touch",bye)
				green_daesapan:removeEventListener("touch",first_scence)
				my_daesapan:addEventListener("touch",first_scence)
			elseif i ==3 then 
			 	transition.to(background_1,{alpha=1,time=1000})
			 	
				daewha[i].alpha = 0
				green_default.alpha = 0
				my_daesapan.alpha = 0
				my.alpha = 0

				month.alpha = 0
				former.alpha=0
				former2.alpha=0
				next1.alpha=0
				next2.alpha=0
			 	select_daewha1[1]:removeEventListener("touch",first_scence)
			 	background_1:addEventListener("touch",first_scence)
			 	i = i+1
			elseif i == 4 then
			 	print(i)

			 	my_daesapan.alpha = 1
			 	my.alpha = 1
			 	green_default.alpha = 1
			 	daewha[i+1].alpha = 1
			 	background_1:removeEventListener("touch",first_scence)
			 	my_daesapan:addEventListener("touch",first_scence)
			 	i = i+1
			elseif i == 5 then 
			 	u = u+1
			 	my_daesapan.alpha = 0
			 	my.alpha = 0
			 	green_daesapan.alpha = 1
			 	daewha[i].alpha = 0
			 	daewha[i+1].alpha = 1
			 	
			 	my_daesapan:removeEventListener("touch",first_scence)
			 	green_daesapan:addEventListener("touch",first_scence)

			 	if u == 2 then 
			 		i = i+1
			 		u = 0
			 	end
			elseif i == 6 then
			 	
			 	my_daesapan.alpha = 1
			 	my.alpha = 1
			 	green_daesapan.alpha = 0
			 	daewha[i].alpha = 0
			 	daewha[i+1].alpha = 1
			 	
			 	my_daesapan:addEventListener("touch",first_scence)
			 	green_daesapan:removeEventListener("touch",first_scence)
			 	u = u+1
			 	if u == 2 then 
			 		i = i+1
			 		u = 0
			 	end
			
			elseif i == 7 then
				print(i)
				my_daesapan.alpha = 0
				my.alpha = 0
			 	green_daesapan.alpha = 1
			 	daewha[i].alpha = 0
			 	daewha[i+1].alpha = 1
			 	green_default.alpha = 0
			 	green_awakard.alpha = 1
			 	my_daesapan:removeEventListener("touch",first_scence)
			 	green_daesapan:addEventListener("touch",first_scence)
			 	u = u+1
			 	if u == 2 then 
			 		i = i+1
			 		u = 0
			 	end

			 elseif i == 8 then 
			 	
			 	green_daesapan.alpha = 0
				daewha[i].alpha = 0
				green_awakard.alpha = 0
				u = u+1
			 	if u == 2 then 
			 		transition.to(green_daesapan,{alpha=0,delay=1000,onComplete=function() green_daesapan.alpha = 1 daewha[i+1].alpha=1 i = i+1 u = 0 end})
			 	end
			elseif i == 9 then
			 	green_daesapan.alpha = 0
			 	daewha[i].alpha = 0
			 	green_daesapan:removeEventListener("touch",first_scence)
			 	u = u+1
			 	if u == 2 then 
			 	 transition.to(background_2,{alpha=1,time=1000,onComplete=function() background_2:addEventListener("touch",first_scence) i = i+1 u = 0 end})
			 	end
			elseif i == 10 then 
				background_2.alpha = 0
				my_daesapan.alpha = 1
				my.alpha = 1
				daewha[i].alpha=1
				
			 	my_daesapan:addEventListener("touch",first_scence)
			 	background_2:removeEventListener("touch",first_scence)
			 	 
			 	i = i+1
			 	
			 	
			 elseif i == 11 then
			 	my_daesapan.alpha = 0
			 	my.alpha = 0
			 	daewha[i-1].alpha = 0
			 	daewha[i].alpha = 1
			 	side.alpha = 1
			 	blue_daesapan.alpha = 1
			 	blue_angry.alpha = 1
			 	my_daesapan:removeEventListener("touch",first_scence)
			 	blue_daesapan:addEventListener("touch",first_scence)
			 	i = i+1
			 	
			 elseif i == 12 then 
			 	daewha[i-1].alpha = 0
			 	daewha[i].alpha = 1
			 	side.alpha = 0
			 	blue_daesapan.alpha = 0
			 	blue_angry.alpha = 0
			 	green_awakard.alpha = 1
			 	green_daesapan.alpha = 1
			 	blue_daesapan:removeEventListener("touch",first_scence)
			 	green_daesapan:addEventListener("touch",first_scence)
			 	i = i+1
			 elseif i == 13 then 
			 	daewha[i-1].alpha = 0
			 	daewha[i].alpha = 1
			 	my_daesapan.alpha = 1
			 	my.alpha = 1
			 	green_awakard.alpha = 0
			 	green_daesapan.alpha = 0
			 	green_daesapan:removeEventListener("touch",first_scence)

			 	select1.alpha = 1
			 	select2.alpha = 1
			 	select_daewha1[2].alpha = 1
			 	select_daewha2[2].alpha = 1
			 	select1:addEventListener("touch",choose1)
			 	select2:addEventListener("touch",choose2)

		

			end
		end
	end



	daewha[1].alpha = 1
	my_daesapan:addEventListener("touch",first_scence)













	
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