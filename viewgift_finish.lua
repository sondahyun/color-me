-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local my = display.newText("mainName",190,505,"font/잘풀리는오늘 Medium.ttf")
	my.size = 30
	my.alpha = 0
	my:setFillColor(1)
	sceneGroup:insert(my)

	local color = 1

	local color_name = {
		"블리",
		"조이",
		"솔리",
		"위즈",
		"레이"
	}

	-- 배경 설정 -- 

	local background ={}

	local background_image = {
		"배경/캐릭터대화창-빨강마을배경.png",
		"배경/캐릭터대화창-노랑마을배경.png",
		"배경/캐릭터대화창-초록마을배경.png",
		"배경/캐릭터대화창-파랑마을배경.png",
		"배경/캐릭터대화창-보라마을배경.png"
	}

	for i = 1,5 do
		background[i] = display.newImage(background_image[i])
		background[i].x, background[i].y = display.contentWidth/2,display.contentHeight/2
		sceneGroup:insert(background[i])
		background[i].alpha = 0
	end

	background[color].alpha = 1

	-- 캐릭터 설정 --
	
	-- 기본 얼굴 --

	local default = {}

	local default_image ={
		"캐릭터-기본(그림자O)/캐릭터-블리(그림자O).png",
		"캐릭터-기본(그림자O)/캐릭터-조이(그림자O).png",
		"캐릭터-기본(그림자O)/캐릭터-솔리(그림자O).png",
		"캐릭터-기본(그림자O)/캐릭터-위즈(그림자O).png",
		"캐릭터-기본(그림자O)/캐릭터-레이(그림자O).png"
	}

	for i = 1,5 do
		default[i] = display.newImage(default_image[i])
		default[i].x, default[i].y = display.contentWidth/2,display.contentHeight/2
		sceneGroup:insert(default[i])
		default[i].alpha = 0
	end

	default[color].alpha = 1

	-- 기쁨 --

	local happy = {}

	local happy_image = {
		"캐릭터-기쁨(그림자O)/캐릭터-블리기쁨(그림자O).png",
		"캐릭터-기쁨(그림자O)/캐릭터-조이기쁨(그림자O).png",
		"캐릭터-기쁨(그림자O)/캐릭터-솔리기쁨(그림자O).png",
		"캐릭터-기쁨(그림자O)/캐릭터-위즈기쁨(그림자O).png",
		"캐릭터-기쁨(그림자O)/캐릭터-레이기쁨(그림자O).png"
	}

	for i = 1,5 do
		happy[i] = display.newImage(happy_image[i])
		happy[i].x,happy[i].y = display.contentWidth/2,display.contentHeight/2
		sceneGroup:insert(happy[i])
		happy[i].alpha = 0 
	end

	-- 난감 -- 

	local awkward = {}

	local awkward_image = {
		"캐릭터-난감(그림자O)/캐릭터-블리난감(그림자O).png",
		"캐릭터-난감(그림자O)/캐릭터-조이난감(그림자O).png",
		"캐릭터-난감(그림자O)/캐릭터-솔리난감(그림자O).png",
		"캐릭터-난감(그림자O)/캐릭터-위즈난감(그림자O).png",
		"캐릭터-난감(그림자O)/캐릭터-레이난감(그림자O).png"
	}

	for i = 1,5 do
		awkward[i] = display.newImage(awkward_image[i])
		awkward[i].x,awkward[i].y = display.contentWidth/2,display.contentHeight/2
		sceneGroup:insert(awkward[i])
		awkward[i].alpha = 0 
	end

	-- 슬픔 -- 

	local sad = {}

	local sad_image = {
		"캐릭터-슬픔(그림자O)/캐릭터-블리슬픔(그림자O).png",
		"캐릭터-슬픔(그림자O)/캐릭터-조이슬픔(그림자O).png",
		"캐릭터-슬픔(그림자O)/캐릭터-솔리슬픔(그림자O).png",
		"캐릭터-슬픔(그림자O)/캐릭터-위즈슬픔(그림자O).png",
		"캐릭터-슬픔(그림자O)/캐릭터-레이슬픔(그림자O).png"
	}

	for i = 1,5 do
		sad[i] = display.newImage(sad_image[i])
		sad[i].x,sad[i].y = display.contentWidth/2,display.contentHeight/2
		sceneGroup:insert(sad[i])
		sad[i].alpha = 0 
	end

	-- 화남 -- 

	local angry = {}

	local angry_image = {
		"캐릭터-화남(그림자O)/캐릭터-블리화남(그림자O).png",
		"캐릭터-화남(그림자O)/캐릭터-조이화남(그림자O).png",
		"캐릭터-화남(그림자O)/캐릭터-솔리화남(그림자O).png",
		"캐릭터-화남(그림자O)/캐릭터-위즈화남(그림자O).png",
		"캐릭터-화남(그림자O)/캐릭터-레이화남(그림자O).png"
	}

	for i = 1,5 do
		angry[i] = display.newImage(angry_image[i])
		angry[i].x,angry[i].y = display.contentWidth/2,display.contentHeight/2
		sceneGroup:insert(angry[i])
		angry[i].alpha = 0 
	end

	-- 대사판 -- 

	local daesapan = {}

	local daesapan_image = {
		"대화창-대사판/캐릭터대화창-대사창(블리).png",
		"대화창-대사판/캐릭터대화창-대사창(조이).png",
		"대화창-대사판/캐릭터대화창-대사창(솔리).png",
		"대화창-대사판/캐릭터대화창-대사창(위즈).png",
		"대화창-대사판/캐릭터대화창-대사창(레이).png"
	}


	for i = 1,5 do
		daesapan[i] = display.newImage(daesapan_image[i])
		daesapan[i].x, daesapan[i].y = display.contentWidth/2,display.contentHeight*0.8
		sceneGroup:insert(daesapan[i])
		daesapan[i].alpha = 0
	end


	local my_daesapan = display.newImage("대화창-대사판/캐릭터대화창-대사창(주인공).png")
	my_daesapan.x, my_daesapan.y = display.contentWidth/2,display.contentHeight*0.8
	sceneGroup:insert(my_daesapan)
	my_daesapan.alpha=1

	-- 선택지 --

	local choose1 = {}
	local choose2 = {}

	local choose_image = {
		"대화창-선택지버튼/캐릭터대화창-선택지(빨강마을).png",
		"대화창-선택지버튼/캐릭터대화창-선택지(노랑마을).png",
		"대화창-선택지버튼/캐릭터대화창-선택지(초록마을).png",
		"대화창-선택지버튼/캐릭터대화창-선택지(파랑마을).png",
		"대화창-선택지버튼/캐릭터대화창-선택지(보라마을).png"
	}

	for i = 1,5 do
		choose1[i] = display.newImage(choose_image[i])
		choose1[i].x, choose1[i].y = display.contentWidth*0.2,display.contentHeight*0.47
		sceneGroup:insert(choose1[i])
		choose1[i].alpha = 0

		choose2[i] = display.newImage(choose_image[i])
		choose2[i].x, choose2[i].y = display.contentWidth*0.8,display.contentHeight*0.47
		sceneGroup:insert(choose2[i])
		choose2[i].alpha = 0
	end
	-- 아이템 리스트 -- 

	-- 아이템 겟 --

	item_name = composer.getVariable("variable")
	
	local item = ""

	if item_name == "bag/block.png" then
		item = "뾰족 블록세트"
	elseif item_name == "bag/dog.png" then
		item = "냠냠 고급사료"
	elseif item_name == "bag/duck.png" then
		item = "노랑 목욕 오리"
	elseif item_name == "bag/heart.png" then
		item = "하트하트 응원봉"
	elseif item_name == "bag/kit.png" then
		item = "물속 불 피우기 실험키트"
	elseif item_name == "bag/perfume.png" then
		item = "블랙체리 향수"
	elseif item_name == "bag/pie.png" then
		item = "봄 피는 꽃 화분"
	elseif item_name == "bag/plant.png" then
		item = "봄피는 꽃 화분"
	elseif item_name == "bag/tiger.png" then
		item = "마마손 파이"
	elseif item_name == "bag/speaker.png" then
		item = "두배로 스피커"
	elseif item_name =="bag/pencil.png" then
		item = "스마트 연필"
	end
	

	local item_list ={}

	-- 블리

	item_list[1] = {
		"bag/perfume.png",
		"bag/heart.png",

		"bag/duck.png",
		"bag/pie.png",
		"bag/plant.png",
		"bag/dog.png"
	}

	item_list[2] ={
		"bag/duck.png",
		"bag/speaker.png",
		"bag/perfume.png",
		"bag/heart.png",
		"bag/pie.png",
		"bag/dog.png"
	}

	item_list[3] ={
		"bag/plant.png",
		"bag/pie.png",
		"bag/heart.png",
		"bag/dog.png",
		"bag/pencil.png",
		"bag/duck.png"
	}

	item_list[4] ={
		"bag/block.png",
		"bag/pencil.png",
		"bag/tiger.png",
		"bag/speaker.png",
		"bag/duck.png",
		"bag/kit.png"
	}

	item_list[5] ={
		"bag/tiger.png",
		"bag/dog.png",
		"bag/kit.png",
		"bag/duck.png",
		"bag/pie.png",
		"bag/block.png"
	}



	-- 대화 내용 -- 


	local name = "주인공"

	local perfect = {}
	local soso = {}
	local bad = {}

	local perfect_respone = 0
	local soso_respone = 0
	local bad_respone = 0
	

	local text_1 = {
		"우와! 이거 " .. item .. "이잖아! 내가 정말 가지고 싶었던 선물이야." .. name .. "이 이걸 내게 선물해줘서 정말 기뻐. 고마워!",
		"헉! 이건 내가 정말 좋아하는 " .. item .. "이잖아! 가지고 싶어 했던 건데 이렇게 선물해주다니.. 정말 고마워 " .. name .. "아!!",
		"어머, " .. item .. "이잖아~ 예전부터 갖고 싶었던 선물인데, 덕분에 가질 수 있게 되어서 기뻐! 정말 고마워, " .. name .. "~",
		"헉, "  .. item .. "! 지금 나에게 꼭 필요한 거잖아! 이야, 고마워 " .. name .. "! 너 정말 센스 있다!",
		item .. "?? 이, 이건... 내가 오래전부터 갖고 싶어 했던 거잖아...! " .. name .. ", 너는 정말 좋은 친구야. 소중하게 간직할게!"
	}

	local text_2 = {
		"이건 " .. item .. "이네? 나를 위해서 가져온 거구나. 음.. 고마워!",
		"우와~ 나에게 주는 거야? 의외의 선물인 걸. 그래도 네가 선물해 준 거니까 잘 받을게.",
		"응? " .. item .. "이네~ 평소엔 특별히 관심을 가져본 적이 없는 물건인데, 네가 선물해주니까 앞으로 정말 좋아질 것 같아!",
		"오, " .. item .. "? 별 관심 없던 물건이긴 하지만... 오늘부터 새로운 연구 대상으로 삼아볼게. 선물 고맙다!",
		item .. "...? 생각지도 못한 선물이네... 하지만 네가 주는 거라면 뭐든지 고맙게 받을 거야. 정말 고마워."
	}

	local text_3 = {
		"어.. 어라 이건 " .. item .. "이네! 마음만은 고마워. 그렇지만 이 선물을 더 좋아할 다른 친구가 있지 않을까?",
		"에엥? " ..  item .. "이네? 선물은 고맙지만, 많이 낯선 선물이네. 음... 그래 일단 고마워~",
		item .. "? 으응... 고 고마워... 다음부턴 이 선물은 나보다 더 필요한 사람에게 주는 것도 나쁘지 않을 것 같아..!",
		"으악, " .. item .. "?! ...성의는 고맙지만 나에게 어울리는 물건은 아닌 것 같아. 피에로 옷을 입은 갈릴레오 같은 느낌이랄까... (이건... 연구 대상으로도 삼기 힘들겠는걸.)",
		"엇... " .. item .. "이네... ...으음... 어떻게 사용해야 할지 곤란한 걸... ...그, 그래도 고마워..!"
	}

	for i = 1,5 do
		perfect[i] = display.newText(text_1[i],105,550,"font/NanumSquare_acB.ttf")
		perfect[i].anchorX,perfect[i].anchorY = 0,0
		perfect[i]:setFillColor(0)
		perfect[i].alpha = 0
		perfect[i].size = 25
		sceneGroup:insert(perfect[i])
	end

	for i = 1,5 do
		soso[i] = display.newText(text_2[i],105,550,"font/NanumSquare_acB.ttf")
		soso[i].anchorX,soso[i].anchorY = 0,0
		soso[i]:setFillColor(0)
		soso[i].alpha = 0
		soso[i].size = 25
		sceneGroup:insert(soso[i])
	end

	for i = 1,5 do
		bad[i] = display.newText(text_3[i],105,550,"font/NanumSquare_acB.ttf")
		bad[i].anchorX,bad[i].anchorY = 0,0
		bad[i]:setFillColor(0)
		bad[i].alpha = 0
		bad[i].size = 25
		sceneGroup:insert(bad[i])
	end

	-- 반응 함수 --


	local function respones(item_name,num_min,num_max)
		local answer = 0
		for i = num_min,num_max do
			if item_name == item_list[color][i] then 
				answer = 1
				return answer
			end
		end
		return answer
	end

	
	-- perfect 반응 -- 
	my_daesapan.alpha = 0
	daesapan[color].alpha = 1
	if respones(item_name,1,2) == 1 then
		perfect[color].alpha = 1
		happy[color].alpha = 1
		default[color].alpha = 0
	elseif respones(item_name,3,6) == 1 then 
		default[color].alpha = 0
		soso[color].alpha = 1
	else
		bad[color].alpha = 1
		default[color].alpha = 0
		awkward[color].alpha = 1
	end






end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
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