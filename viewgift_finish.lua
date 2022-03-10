-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local loadsave = require( "loadsave" )
local json = require( "json" )

function scene:create( event )
	local sceneGroup = self.view
	
	local loadedSettings = loadsave.loadTable( "settings.json" )
	mainName = loadedSettings.name

	
	local color = composer.getVariable("color")
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
		"이미지/대화/우정배경/빨강.png",
		"이미지/대화/우정배경/노랑.png",
		"이미지/대화/우정배경/초록.png",
		"이미지/대화/우정배경/파랑.png",
		"이미지/대화/우정배경/보라.png"
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

	for i = 1,5 do
		default[i] = display.newImage("이미지/캐릭터/" .. color_name[i] .. "/기본.png")
		default[i].x, default[i].y = display.contentWidth/2,display.contentHeight/2
		sceneGroup:insert(default[i])
		default[i].alpha = 0
	end

	-- 기쁨 --

	local happy = {}


	for i = 1,5 do
		happy[i] = display.newImage("이미지/캐릭터/" .. color_name[i] .. "/기쁨.png")
		happy[i].x,happy[i].y = display.contentWidth/2,display.contentHeight/2
		sceneGroup:insert(happy[i])
		happy[i].alpha = 0 
	end

	-- 난감 -- 
	local awkward = {}

	for i = 1,5 do
		awkward[i] = display.newImage("이미지/캐릭터/" .. color_name[i] .. "/난감.png")
		awkward[i].x,awkward[i].y = display.contentWidth/2,display.contentHeight/2
		sceneGroup:insert(awkward[i])
		awkward[i].alpha = 0 
	end

	-- 슬픔 -- 

	local sad = {}

	for i = 1,5 do
		sad[i] = display.newImage("이미지/캐릭터/" .. color_name[i] .. "/슬픔.png")
		sad[i].x,sad[i].y = display.contentWidth/2,display.contentHeight/2
		sceneGroup:insert(sad[i])
		sad[i].alpha = 0 
	end

	-- 화남 -- 

	local angry = {}

	for i = 1,5 do
		angry[i] = display.newImage("이미지/캐릭터/" .. color_name[i] .. "/화남.png")
		angry[i].x,angry[i].y = display.contentWidth/2,display.contentHeight/2
		sceneGroup:insert(angry[i])
		angry[i].alpha = 0 
	end

	-- 대사판 -- 

	local daesapan = {}

	for i = 1,5 do
		daesapan[i] = display.newImage("이미지/대화/대화창/" .. color_name[i] .. ".png")
		daesapan[i].x, daesapan[i].y = display.contentWidth*0.5,display.contentHeight*0.7176
		daesapan[i].anchorY = 0
		sceneGroup:insert(daesapan[i])
		daesapan[i].alpha = 0
	end


	local my_daesapan = display.newImage("이미지/대화/대화창/주인공.png")
	my_daesapan.x, my_daesapan.y = display.contentWidth*0.5,display.contentHeight*0.7176
	my_daesapan.anchorY = 0
	sceneGroup:insert(my_daesapan)
	my_daesapan.alpha=1


	-- 아이템 겟 --

	item_name = composer.getVariable("item")

	if item_name == "블록" then
		item = "뾰족 블록세트"
	elseif item_name == "사료" then
		item = "냠냠 고급사료"
	elseif item_name == "오리" then
		item = "노랑 목욕 오리"
	elseif item_name == "응원봉" then
		item = "하트하트 응원봉"
	elseif item_name == "실험세트" then
		item = "물속 불 피우기 실험키트"
	elseif item_name == "향수" then
		item = "블랙체리 향수"
	elseif item_name == "호랑이" then
		item = "호랑이 가죽"
	elseif item_name == "화분" then
		item = "봄피는 꽃 화분"
	elseif item_name == "파이" then
		item = "마마손 파이"
	elseif item_name == "스피커" then
		item = "두배로 스피커"
	elseif item_name =="망토" then
		item = "히어로 망토"
	elseif item_name =="머리핀" then
		item = "하트 뿅뿅 머리핀"
	elseif item_name =="민초" then
		item = "민트초코 아이스크림"
	elseif item_name =="액자" then
		item = "빈 액자"
	elseif item_name =="헤드셋" then
		item = "나만 듣고 싶은 헤드셋"
	elseif item_name =="안경닦이" then
		item = "내 말이 맞아 안경닦이"
	end
	

	local item_list ={}
	local present_list = {}

	-- 블리

	item_list[1] = {
		"향수",
		"응원봉",
		"오리",
		"파이",
		"화분",
		"사료"
	}

	item_list[2] ={
	
		"오리",
		"스피커",
		"향수",
		"응원봉",
		"파이",
		"사료"
	}

	item_list[3] ={
		"화분",
		"파이",
		"응원봉",
		"사료",
		"연필",
		"오리"
	}

	item_list[4] ={
		"블록",
		"연필",
		"호랑이",
		"스피커",
		"오리",
		"실험세트"
	}

	item_list[5] ={
		"호랑이",
		"사료",
		"실험세트",
		"오리",
		"파이",
		"블록"
	}

	
	present_list={
		"향수",
		"스피커",
		"화분",
		"실험세트",
		"호랑이"
	}




	-- 대화 내용 -- 


	local name = mainName

	local perfect = {}
	local soso = {}
	local bad = {}

	local perfect_respone = 0
	local soso_respone = 0
	local bad_respone = 0

	local birthday_good = {}
	local birthday_bad = {}
	

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
		"으악, " .. item .. "?! ...성의는 고맙지만 나에게 어울리는 물건은 아닌 것 같아. 피에로 옷을 입은 갈릴레오 같은 느낌이랄까...\n(이건... 연구 대상으로도 삼기 힘들겠는걸.)",
		"엇... " .. item .. "이네... ...으음... 어떻게 사용해야 할지 곤란한 걸... ...그, 그래도 고마워..!"
	}

	local text_4 = {
		"꺄아! 이거 내 생일 선물이야? 내가 좋아하는 달달한 체리향 향수잖아! 세상이 빨간 하트로 차오르는 기분이야.",
		"세상에, 두배로 스피커! 내가 제일 갖고 싶었던 거야! 고마워, 얼른 스피커로 노래 틀자! 뭐가 좋을까? 오늘은 발라드를 틀어도 신날 것 같아!",
		"우와아, 이거 나한테 꼭 필요한 거야! 어떻게 내 마음을 읽었어? 신기하다…. 정말 고마워!",
		"이야- ‘물 속에서 불 피우기’라니! 멋진걸! 다음 연구 주제는 이걸로 해야겠어! 최고다! 고마워!",
		"내 생일 선물이야? 고마워! 네 선물 덕분에 좀 더 용감한 색연필이 될 수 있을 것 같아!"
	}

	local text_5 = {
		"이거… 내 선물이야? … 그래, 고마워.",
		"으음…. 고마워…. 지금부터 이걸 가지고 어떻게 신나게 놀지 생각해볼게…!",
		"내 선물이구나…! 정말 고마워…. 자, 잘… 쓸게.",
		"아, 선물… 고마워. 그런데 다른 선물이 더 좋았을 것 같기도… 아냐, 신경 쓰지 마.",
		"우, 우와 선물 고마워…! 그, 그런데 나 오늘 망토를 빨아야 해서 바쁘거든…. 먼저 가볼게!"
	}

	for i = 1,5 do
		perfect[i] = display.newText(text_1[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		perfect[i].anchorX,perfect[i].anchorY = 0,0
		perfect[i]:setFillColor(0)
		perfect[i].alpha = 0
		perfect[i].size = 30
		sceneGroup:insert(perfect[i])
	end

	for i = 1,5 do
		soso[i] = display.newText(text_2[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		soso[i].anchorX,soso[i].anchorY = 0,0
		soso[i]:setFillColor(0)
		soso[i].alpha = 0
		soso[i].size = 30
		sceneGroup:insert(soso[i])
	end

	for i = 1,5 do
		bad[i] = display.newText(text_3[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		bad[i].anchorX,bad[i].anchorY = 0,0
		bad[i]:setFillColor(0)
		bad[i].alpha = 0
		bad[i].size = 30
		sceneGroup:insert(bad[i])
	end

	for i = 1,5 do
		birthday_good[i] = display.newText(text_4[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		birthday_good[i].anchorX,birthday_good[i].anchorY = 0,0
		birthday_good[i]:setFillColor(0)
		birthday_good[i].alpha = 0
		birthday_good[i].size = 30
		sceneGroup:insert(birthday_good[i])
	end

	for i = 1,5 do
		birthday_bad[i] = display.newText(text_5[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		birthday_bad[i].anchorX,birthday_bad[i].anchorY = 0,0
		birthday_bad[i]:setFillColor(0)
		birthday_bad[i].alpha = 0
		birthday_bad[i].size = 30
		sceneGroup:insert(birthday_bad[i])
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

	local function find_birth(color, month)
		local answer = 0
		if ((color==1) and (loadedSettings.month==1)) or ((color == 2) and (loadedSettings.month==2)) or ((color == 3) and (loadedSettings.month==3)) or ((color == 4) and (loadedSettings.month==0)) or ((color == 5) and (loadedSettings.month==5)) then
			answer = 1
		end
		return answer
	end

	local function color_stat(color)
		loadedSettings.friendship = loadedSettings.friendship + 8
		if color == 1 then
			loadedSettings.red = loadedSettings.red + 8
		elseif color == 2 then
			loadedSettings.yellow = loadedSettings.yellow + 8
		elseif color == 3 then
			loadedSettings.green = loadedSettings.green + 8
		elseif color == 4 then
			loadedSettings.blue = loadedSettings.blue + 8
		elseif color == 5 then
			loadedSettings.purple = loadedSettings.purple + 8
		end
	end

	local function present_stat_good(color)
		if color == 1 then
			loadedSettings.red = loadedSettings.red + 4
		elseif color == 2 then
			loadedSettings.yellow = loadedSettings.yellow + 4
		elseif color == 3 then
			loadedSettings.green = loadedSettings.green + 4
		elseif color == 4 then
			loadedSettings.blue = loadedSettings.blue + 4
		elseif color == 5 then
			loadedSettings.purple = loadedSettings.purple + 4
		end
	end

	local function present_stat_soso(color)
		if color == 1 then
			loadedSettings.red = loadedSettings.red + 2
		elseif color == 2 then
			loadedSettings.yellow = loadedSettings.yellow + 2
		elseif color == 3 then
			loadedSettings.green = loadedSettings.green + 2
		elseif color == 4 then
			loadedSettings.blue = loadedSettings.blue + 2
		elseif color == 5 then
			loadedSettings.purple = loadedSettings.purple + 2
		end
	end


	my_daesapan.alpha = 0
	daesapan[color].alpha = 1
	-- perfect 반응 -- 


	if find_birth(color,loadedSettings.month) == 1 then
		default[color].alpha = 0
		if item_name == present_list[color] then
			color_stat(color)
			happy[color].alpha = 1
			birthday_good[color].alpha = 1
		else
			loadedSettings.friendship = loadedSettings.friendship + 3
			birthday_bad[color].alpha = 1
			awkward[color].alpha = 1
		end
		

	else
		if respones(item_name,1,2) == 1 then
			perfect[color].alpha = 1
			happy[color].alpha = 1
			default[color].alpha = 0
			present_stat_good(color)
		elseif respones(item_name,3,6) == 1 then 
			default[color].alpha = 1
			soso[color].alpha = 1
			present_stat_soso(color)
		else
			bad[color].alpha = 1
			default[color].alpha = 0
			awkward[color].alpha = 1
		end
	end

	loadsave.saveTable(loadedSettings, "settings.json")
	
	local function go_back(event)
		if event.phase == "began" then
			composer.removeScene("viewgift_finish")
			composer.gotoScene("view01Map")
		end
	end

	daesapan[color]:addEventListener("touch",go_back)






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