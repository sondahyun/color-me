local composer = require( "composer" )
local scene = composer.newScene()
local loadsave = require( "loadsave" )

function scene:create( event )
	local sceneGroup = self.view
	
	local loadedSettings = loadsave.loadTable( "settings.json" )

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

	local background_1 = display.newImageRect("이미지/대화/우정배경/빨강.png",display.contentWidth, display.contentHeight)
	background_1.x,background_1.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background_1)
	background_1.alpha = 0

	local background_2 = display.newImageRect("이미지/대화/우정배경/노랑.png",display.contentWidth, display.contentHeight)
	background_2.x,background_2.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background_2)
	background_2.alpha = 0

	local background_3 = display.newImageRect("이미지/대화/우정배경/초록.png",display.contentWidth, display.contentHeight)
	background_3.x,background_3.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background_3)
	background_3.alpha = 0

	local background_4 = display.newImageRect("이미지/대화/우정배경/파랑.png",display.contentWidth, display.contentHeight)
	background_4.x,background_4.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background_4)
	background_4.alpha = 0

	local background_5 = display.newImageRect("이미지/대화/우정배경/보라.png",display.contentWidth, display.contentHeight)
	background_5.x,background_5.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background_5)
	background_5.alpha = 0

	
	--블리

	local blli = display.newImage("이미지/캐릭터/블리/기본.png")
	blli.x, blli.y = display.contentWidth*0.53,display.contentHeight*0.5
	sceneGroup:insert(blli)
	blli.alpha = 0

	local happy_blli = display.newImage("이미지/캐릭터/블리/기쁨.png")
	happy_blli.x, happy_blli.y = display.contentWidth*0.53,display.contentHeight*0.5
	sceneGroup:insert(happy_blli)
	happy_blli.alpha = 0

	local nangam_blli = display.newImage("이미지/캐릭터/블리/난감.png")
	nangam_blli.x, nangam_blli.y = display.contentWidth*0.53,display.contentHeight*0.5
	sceneGroup:insert(nangam_blli)
	nangam_blli.alpha = 0

	local sad_blli = display.newImage("이미지/캐릭터/블리/슬픔.png")
	sad_blli.x, sad_blli.y = display.contentWidth*0.53,display.contentHeight*0.5
	sceneGroup:insert(sad_blli)
	sad_blli.alpha = 0

	local choose11 = display.newImage("이미지/대화/선택지/블리.png")
	choose11.x, choose11.y = display.contentWidth*0.23,display.contentHeight*0.47
	sceneGroup:insert(choose11)
	choose11.alpha = 0

	local choose12 = display.newImage("이미지/대화/선택지/블리.png")
	choose12.x, choose12.y = display.contentWidth*0.77,display.contentHeight*0.47
	sceneGroup:insert(choose12)
	choose12.alpha = 0

	--조이

	local joy = display.newImage("이미지/캐릭터/조이/기본.png")
	joy.x, joy.y = display.contentWidth*0.53,display.contentHeight*0.5
	sceneGroup:insert(joy)
	joy.alpha = 0

	local happy_joy = display.newImage("이미지/캐릭터/조이/기쁨.png")
	happy_joy.x, happy_joy.y = display.contentWidth*0.53,display.contentHeight*0.5
	sceneGroup:insert(happy_joy)
	happy_joy.alpha = 0

	local nangam_joy = display.newImage("이미지/캐릭터/조이/난감.png")
	nangam_joy.x, nangam_joy.y = display.contentWidth*0.53,display.contentHeight*0.5
	sceneGroup:insert(nangam_joy)
	nangam_joy.alpha = 0

	local sad_joy = display.newImage("이미지/캐릭터/조이/슬픔.png")
	sad_joy.x, sad_joy.y = display.contentWidth*0.53,display.contentHeight*0.5
	sceneGroup:insert(sad_joy)
	sad_joy.alpha = 0

	local choose21 = display.newImage("이미지/대화/선택지/조이.png")
	choose21.x, choose21.y = display.contentWidth*0.23,display.contentHeight*0.47
	sceneGroup:insert(choose21)
	choose21.alpha = 0

	local choose22 = display.newImage("이미지/대화/선택지/조이.png")
	choose22.x, choose22.y = display.contentWidth*0.77,display.contentHeight*0.47
	sceneGroup:insert(choose22)
	choose22.alpha = 0

--솔리

	local soli = display.newImage("이미지/캐릭터/솔리/기본.png")
	soli.x, soli.y = display.contentWidth*0.53,display.contentHeight*0.5
	sceneGroup:insert(soli)
	soli.alpha = 0
	local happy_soli = display.newImage("이미지/캐릭터/솔리/기쁨.png")
	happy_soli.x, happy_soli.y = display.contentWidth*0.53,display.contentHeight*0.5
	sceneGroup:insert(happy_soli)
	happy_soli.alpha = 0

	local nangam_soli = display.newImage("이미지/캐릭터/솔리/난감.png")
	nangam_soli.x, nangam_soli.y = display.contentWidth*0.53,display.contentHeight*0.5
	sceneGroup:insert(nangam_soli)
	nangam_soli.alpha = 0

	local sad_soli = display.newImage("이미지/캐릭터/솔리/슬픔.png")
	sad_soli.x, sad_soli.y = display.contentWidth*0.53,display.contentHeight*0.5
	sceneGroup:insert(sad_soli)
	sad_soli.alpha = 0

	local choose31 = display.newImage("이미지/대화/선택지/솔리.png")
	choose31.x, choose31.y = display.contentWidth*0.23,display.contentHeight*0.47
	sceneGroup:insert(choose31)
	choose31.alpha = 0

	local choose32 = display.newImage("이미지/대화/선택지/솔리.png")
	choose32.x, choose32.y = display.contentWidth*0.77,display.contentHeight*0.47
	sceneGroup:insert(choose32)
	choose32.alpha = 0


--위즈

	local wiz = display.newImage("이미지/캐릭터/위즈/기본.png")
	wiz.x, wiz.y = display.contentWidth*0.53,display.contentHeight*0.5
	sceneGroup:insert(wiz)
	wiz.alpha = 0

	local happy_wiz = display.newImage("이미지/캐릭터/위즈/기쁨.png")
	happy_wiz.x, happy_wiz.y = display.contentWidth*0.53,display.contentHeight*0.5
	sceneGroup:insert(happy_wiz)
	happy_wiz.alpha = 0

	local nangam_wiz = display.newImage("이미지/캐릭터/위즈/난감.png")
	nangam_wiz.x, nangam_wiz.y = display.contentWidth*0.53,display.contentHeight*0.5
	sceneGroup:insert(nangam_wiz)
	nangam_wiz.alpha = 0

	local sad_wiz = display.newImage("이미지/캐릭터/위즈/슬픔.png")
	sad_wiz.x, sad_wiz.y = display.contentWidth*0.53,display.contentHeight*0.5
	sceneGroup:insert(sad_wiz)
	sad_wiz.alpha = 0

	local choose41 = display.newImage("이미지/대화/선택지/위즈.png")
	choose41.x, choose41.y = display.contentWidth*0.23,display.contentHeight*0.47
	sceneGroup:insert(choose41)
	choose41.alpha = 0

	local choose42 = display.newImage("이미지/대화/선택지/위즈.png")
	choose42.x, choose42.y = display.contentWidth*0.77,display.contentHeight*0.47
	sceneGroup:insert(choose42)
	choose42.alpha = 0

--보라
	
	local lay = display.newImage("이미지/캐릭터/레이/기본.png")
	lay.x, lay.y = display.contentWidth*0.53,display.contentHeight*0.5
	sceneGroup:insert(lay)
	lay.alpha = 0

	local alay = display.newImage("이미지/캐릭터/레이/기본.png")
	alay.x, alay.y = display.contentWidth*0.53,display.contentHeight*0.5
	sceneGroup:insert(alay)
	alay.alpha = 0

	local happy_lay = display.newImage("이미지/캐릭터/레이/기쁨.png")
	happy_lay.x, happy_lay.y = display.contentWidth*0.53,display.contentHeight*0.5
	sceneGroup:insert(happy_lay)
	happy_lay.alpha = 0
	
	local sad_lay = display.newImage("이미지/캐릭터/레이/슬픔.png")
	sad_lay.x, sad_lay.y = display.contentWidth*0.53,display.contentHeight*0.5
	sceneGroup:insert(sad_lay)
	sad_lay.alpha = 0

	local choose51 = display.newImage("이미지/대화/선택지/레이.png")
	choose51.x, choose51.y = display.contentWidth*0.23,display.contentHeight*0.47
	sceneGroup:insert(choose51)
	choose51.alpha = 0

	local choose52 = display.newImage("이미지/대화/선택지/레이.png")
	choose52.x, choose52.y = display.contentWidth*0.77,display.contentHeight*0.47
	sceneGroup:insert(choose52)
	choose52.alpha = 0

	local main_ch = display.newImage("이미지/캐릭터/주인공/기쁨.png")
	main_ch.x, main_ch.y = display.contentWidth*0.53,display.contentHeight*0.5
	sceneGroup:insert(main_ch)
	main_ch.alpha = 0

	local script_1 = display.newImage("이미지/대화/대화창/블리.png")
	script_1.x,script_1.y =  display.contentWidth*0.5,display.contentHeight*0.7176
	sceneGroup:insert(script_1)
	script_1.alpha = 0
	script_1.anchorY=0

	local script_2 = display.newImage("이미지/대화/대화창/조이.png")
	script_2.x, script_2.y = display.contentWidth*0.5,display.contentHeight*0.7176
	sceneGroup:insert(script_2)
	script_2.alpha = 0
	script_2.anchorY=0

	local script_3 = display.newImage("이미지/대화/대화창/솔리.png")
	script_3.x, script_3.y =  display.contentWidth*0.5,display.contentHeight*0.7176
	sceneGroup:insert(script_3)
	script_3.alpha = 0
	script_3.anchorY=0

	local script_4 = display.newImage("이미지/대화/대화창/위즈.png")
	script_4.x, script_4.y =  display.contentWidth*0.5,display.contentHeight*0.7176
	sceneGroup:insert(script_4)
	script_4.alpha = 0
	script_4.anchorY=0

	local script_5 = display.newImage("이미지/대화/대화창/레이.png")
	script_5.x, script_5.y =  display.contentWidth*0.5,display.contentHeight*0.7176
	sceneGroup:insert(script_5)
	script_5.alpha = 0
	script_5.anchorY=0

	local my_daesapan = display.newImage("이미지/대화/대화창/주인공.png")
	my_daesapan.x, my_daesapan.y = display.contentWidth/2,display.contentHeight*0.7176
	sceneGroup:insert(my_daesapan)
	my_daesapan.alpha=0
	my_daesapan.anchorY=0

   local my = display.newText(mainName,190,505,"font/잘풀리는오늘 Medium.ttf")
	my.size = 45
	my.alpha = 0
	my.x, my.y = display.contentWidth * 0.170,display.contentHeight*0.75
	my:setFillColor(1)
	sceneGroup:insert(my)

	local daewha11 = {}
	local daewha12 = {}
	local daewha13 = {}

	local text11 = {
		mainName  .."아. 나를 좀 도와줄 수 있니?"
	}

	local text12 = {
		"당연하지! 무슨 일이야?",
		"당연하지! 무슨 일이야?",
		"정말이야?, 고마워!",
		"내가 어릴  적에  선물로  받아서  정말  아끼던  하트  모양의  수첩  기억나니?",
		"그래!  정말  예쁜  빨간색에  반짝이는  하트  스티커도  붙였던  그  수첩  말이야.",
		"거기에  내가  겪었던  소중한  일들도  적어놓고  아끼는  그림도  끼워  넣었는데,\n그걸  잃어버렸어….",
		"부탁이야. 내  수첩을  찾아줘!",
		"'블리의 하트 다이어리'를 찾아보자!"
	}

	local text13 = {
		"미안. 지금은 좀 바쁜걸.",
		"미안. 지금은 좀 바쁜걸.",
		"그렇구나… 그럼 난 가볼게."
	}

		daewha11[1] = display.newText(text11[1],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		daewha11[1].anchorX,daewha11[1].anchorY = 0,0
		daewha11[1]:setFillColor(0)
		daewha11[1].alpha = 0
		daewha11[1].size = 30
		sceneGroup:insert(daewha11[1])

	for i = 1,8 do
		daewha12[i] = display.newText(text12[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		daewha12[i].anchorX,daewha12[i].anchorY = 0,0
		daewha12[i]:setFillColor(0)
		daewha12[i].alpha = 0
		daewha12[i].size = 30
		sceneGroup:insert(daewha12[i])
	end

	for i =1,3 do
		daewha13[i] = display.newText(text13[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		daewha13[i].anchorX,daewha13[i].anchorY = 0,0
		daewha13[i]:setFillColor(0)
		daewha13[i].alpha = 0
		daewha13[i].size = 30
		sceneGroup:insert(daewha13[i])
	end

local daewha21 = {}
	local daewha22 = {}
	local daewha23 = {}

	local text21 = {
		mainName  .."아. 나를 좀 도와줘~!"
	}

	local text22 = {
		"그래, 내가 도와줄게!",
		"그래, 내가 도와줄게!",
		"우와. 역시".. mainName  .."밖에 없어!",
		"실은 말이야…. \n오늘 밤 내 방에서 “신나는 노래부르기 파티!”를 열어야하는데 마이크를 잃어버렸지 뭐야.",
		"노란색 음표 장식이 달린 마이크가 없다면, 노래 파티는 열 수 없게 돼!",
		"소중한 마이크 찾는 걸 도와줘 ".. mainName  .."!",
		"'조이의 마이크'를 찾아보자!"
	}

	local text23 = {
		"지금은 좀 바쁜걸.",
		"지금은 좀 바쁜걸.",
		"정말 바쁜 일인데.... 그래, 잘있어."
	}

		daewha21[1] = display.newText(text21[1],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		daewha21[1].anchorX,daewha21[1].anchorY = 0,0
		daewha21[1]:setFillColor(0)
		daewha21[1].alpha = 0
		daewha21[1].size = 30
		sceneGroup:insert(daewha21[1])

	for i = 1,7 do
		daewha22[i] = display.newText(text22[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		daewha22[i].anchorX,daewha22[i].anchorY = 0,0
		daewha22[i]:setFillColor(0)
		daewha22[i].alpha = 0
		daewha22[i].size = 30
		sceneGroup:insert(daewha22[i])
	end

	for i =1,3 do
		daewha23[i] = display.newText(text23[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		daewha23[i].anchorX,daewha23[i].anchorY = 0,0
		daewha23[i]:setFillColor(0)
		daewha23[i].alpha = 0
		daewha23[i].size = 30
		sceneGroup:insert(daewha23[i])
	end


	local daewha31 = {}
	local daewha32 = {}
	local daewha33 = {}


	local text31 = {
		mainName  .."~ 나 부탁 하나만 해도 될까?"
	}

	local text32 = {
		"응, 당연하지!",
		"응, 당연하지!",
		"정말~?  그러면  혹시  날  도와줄  수  있을까?",
		"오늘  내가  화분에  물을  주려고  새로운  물뿌리개를  샀는데,\n집으로  돌아오던  와중에 그만  잃어버렸어….",
		"멀지  않은  곳에  있을  텐데,  혹시  네가  ‘쑥쑥  자라요  물뿌리개’를  찾아줄  수  있겠니?",
		"'솔리의 물뿌리개'를 찾아보자!"

	}

	local text33 = {
		"미안해, 지금은 조금 힘들어.",
		"미안해, 지금은 조금 힘들어.",
		"그렇구나.... 아냐, 스스로 해결해 볼게."
	}
		
		daewha31[1] = display.newText(text31[1],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		daewha31[1].anchorX,daewha31[1].anchorY = 0,0
		daewha31[1]:setFillColor(0)
		daewha31[1].alpha = 0
		daewha31[1].size = 30
		sceneGroup:insert(daewha31[1])

	for i = 1,6 do
		daewha32[i] = display.newText(text32[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		daewha32[i].anchorX,daewha32[i].anchorY = 0,0
		daewha32[i]:setFillColor(0)
		daewha32[i].alpha = 0
		daewha32[i].size = 30
		sceneGroup:insert(daewha32[i])
	end

	for i =1,3 do
		daewha33[i] = display.newText(text33[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		daewha33[i].anchorX,daewha33[i].anchorY = 0,0
		daewha33[i]:setFillColor(0)
		daewha33[i].alpha = 0
		daewha33[i].size = 30
		sceneGroup:insert(daewha33[i])
	end


	local daewha41 = {}
	local daewha42 = {}
	local daewha43 = {}

	local text41 = {
		mainName  .."! 너, 시간 좀 있나?"
	}

	local text42 = {
		"응! 무슨 일이야?",
		"응! 무슨 일이야?",
		"잘  됐다.  나  좀  도와줘!",
		"내가 이번에  ‘호랑이도 제 말 하면  오는가?’ 실험 연구를  하고 있는데,\n거기에  꼭 필요한  걸  잃어버렸지  뭐야.",
		"아마  여기  근처  어딘가에  있을  텐데….",
		"‘여보세요  확성기’가  없으면  호랑이가  내  목소리를  들을  수  없을  거야. ",
		mainName .. ", ‘여보세요  확성기’를  찾아주라!",
		"'위즈의 여보세요 확성기'를 찾아보자!"
	}

	local text43 = {
		"아니, 지금은 바빠",
		"아니, 지금은 바빠",
		"아, 그러냐. 그럼 다음에 보자!"
	}

		daewha41[1] = display.newText(text41[1],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		daewha41[1].anchorX,daewha41[1].anchorY = 0,0
		daewha41[1]:setFillColor(0)
		daewha41[1].alpha = 0
		daewha41[1].size = 30
		sceneGroup:insert(daewha41[1])

	for i = 1,8 do
		daewha42[i] = display.newText(text42[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		daewha42[i].anchorX,daewha42[i].anchorY = 0,0
		daewha42[i]:setFillColor(0)
		daewha42[i].alpha = 0
		daewha42[i].size = 30
		sceneGroup:insert(daewha42[i])
	end

	for i =1,3 do
		daewha43[i] = display.newText(text43[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		daewha43[i].anchorX,daewha43[i].anchorY = 0,0
		daewha43[i]:setFillColor(0)
		daewha43[i].alpha = 0
		daewha43[i].size = 30
		sceneGroup:insert(daewha43[i])
	end

	local daewha51 = {}
	local daewha52 = {}
	local daewha53 = {}

	local text51 = {
		mainName  .."...! 나 잠깐 도와줄 수 있어...?"
	}

	local text52 = {
		"그럼. 무슨 일 있어?",
		"그럼. 무슨 일 있어?",
		"있지, 오늘 내가 새로운 복싱 글러브를 구매했어.",
		"기쁜 마음으로 돌아오는길에 갑자기 거센 바람이 불어서 글러브가 날아가버렸지 뭐야…… ",
		"혹시 바쁘지 않다면 내 복싱 글러브를 찾아줄 수 있을까?",
		"'레이의 글러브'를 찾아보자!"
	}

	local text53 = {
		"어쩌지? 지금은 바빠서...",
		"어쩌지? 지금은 바빠서...",
		"그, 그래...? 큰일이네, 어떡하지..."
	}

		daewha51[1] = display.newText(text51[1],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		daewha51[1].anchorX,daewha51[1].anchorY = 0,0
		daewha51[1]:setFillColor(0)
		daewha51[1].alpha = 0
		daewha51[1].size = 30
		sceneGroup:insert(daewha51[1])

	for i = 1,6 do
		daewha52[i] = display.newText(text52[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		daewha52[i].anchorX,daewha52[i].anchorY = 0,0
		daewha52[i]:setFillColor(0)
		daewha52[i].alpha = 0
		daewha52[i].size = 30
		sceneGroup:insert(daewha52[i])
	end

	for i =1,3 do
		daewha53[i] = display.newText(text53[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		daewha53[i].anchorX,daewha53[i].anchorY = 0,0
		daewha53[i]:setFillColor(0)
		daewha53[i].alpha = 0
		daewha53[i].size = 30
		sceneGroup:insert(daewha53[i])
	end


	local num = 0
	local function touch4(event)
		if num == 1 then
			composer.removeScene("viewmonth2_script")
			composer.gotoScene("view01Map",options)
		end

		num = num + 1
			
		
	end

	local loadedSettings = loadsave.loadTable( "settings.json" )

	local color = composer.getVariable("color")

	--print(loadedSettings.limited_num)

	if color == "1" then
					local i = 0
					local j = 0

					local function next1_1(event)

						if event.phase == "began" then
							
							if j == 0 then
								daewha12[2].alpha = 0
								blli.alpha = 0
								happy_blli.alpha = 1
								my_daesapan.alpha = 0
								my.alpha = 0
								daewha12[3].alpha = 1
								j = j+1
								script_1.alpha = 1
								my_daesapan:removeEventListener("touch",next1_1)
								script_1:addEventListener("touch",next1_1)
							elseif j == 1 then
								daewha12[3].alpha = 0
								daewha12[4].alpha = 1
								j = j+1
							elseif j == 2 then
								daewha12[4].alpha = 0
								daewha12[5].alpha = 1
								j = j+1
							elseif j == 3 then
								daewha12[5].alpha = 0
								daewha12[6].alpha = 1
								j = j+1
							elseif j == 4 then
								daewha12[6].alpha = 0
								daewha12[7].alpha = 1
								j = j+1
							elseif j == 5 then
								happy_blli.alpha = 0
								main_ch.alpha=1
								daewha12[7].alpha = 0
								daewha12[8].alpha = 1
								script_1.alpha = 0
								my_daesapan.alpha=1
								my.alpha = 1
								j = j+1
								script_1:removeEventListener("touch",next1_1)
								my_daesapan:addEventListener("touch",next1_1)
							else
								my_daesapan:removeEventListener("touch",next1_1)
									loadsave.saveTable(loadedSettings, "settings.json")
									composer.removeScene("item_find_event")
									composer.gotoScene("item_find_success",options)
							end
						end
					end

					

					local function next1(event)
						if event.phase == "began" then
							loadedSettings.red = loadedSettings.red + 5
							loadsave.saveTable(loadedSettings,"settings.json")
							my_daesapan.alpha=1
							my.alpha = 1
							daewha11[1].alpha = 0
							choose11.alpha = 0
							choose12.alpha = 0
							daewha12[1].alpha = 0
							daewha13[1].alpha = 0
							daewha12[2].alpha = 1
							choose11:removeEventListener("touch",next1)
							script_1.alpha = 0
							my_daesapan:addEventListener("touch",next1_1)
						end

					end

					local function next1_2(event)

						if event.phase == "began" then
							
							if j == 0 then
								blli.alpha = 0
								sad_blli.alpha = 1
								my_daesapan.alpha = 0
								my.alpha = 0
								daewha13[2].alpha = 0
								daewha13[3].alpha = 1
								j = j+1
								script_1.alpha = 1
								my_daesapan:removeEventListener("touch",next1_2)
								script_1:addEventListener("touch",next1_2)
							else
								script_2:removeEventListener("touch",next1_2)
									composer.removeScene("item_find_event")
									composer.gotoScene("item_find_fail",options)
							end
						end
					end

					local function next2(event)
						if event.phase == "began" then
							loadedSettings.red = loadedSettings.red + 2
							loadsave.saveTable(loadedSettings,"settings.json")		
							daewha11[1].alpha = 0
							my_daesapan.alpha=1
							my.alpha = 1
							choose11.alpha = 0
							choose12.alpha = 0
							daewha13[1].alpha = 0
							daewha13[2].alpha = 1
							daewha12[1].alpha = 0
							choose12:removeEventListener("touch",next1)
							script_1.alpha = 0
							my_daesapan:addEventListener("touch",next1_2)
						end

					end

					local function next(event)
						if event.phase == "began" then
								script_1:removeEventListener("touch",next)
								choose11.alpha = 1
								daewha12[1].alpha = 1
								daewha12[1]:setFillColor(1)
								daewha12[1].size=36
								daewha12[1].anchorX,daewha12[1].anchorY = 0.5,0.5
								daewha12[1].x,daewha12[1].y = display.contentWidth*0.23,display.contentHeight*0.47
				
								choose12.alpha = 1
								daewha13[1].alpha = 1
								daewha13[1]:setFillColor(1)
								daewha13[1].size=36
								daewha13[1].anchorX,daewha13[1].anchorY = 0.5,0.5
								daewha13[1].x,daewha13[1].y = display.contentWidth*0.77,display.contentHeight*0.47

								choose11:addEventListener("touch",next1)
								choose12:addEventListener("touch",next2)
						end
					end


					background_1.alpha = 1
					blli.alpha = 1
					script_1.alpha = 1
					daewha11.alpha = 1
					daewha11[1].alpha = 1
					script_1:addEventListener("touch",next)			


	elseif color == "2" then
			
					local i = 0
					local j = 0

					local function next1_1(event)

						if event.phase == "began" then
							
							if j == 0 then
							wiz.alpha = 0
								happy_wiz.alpha = 1
								my_daesapan.alpha = 0
								my.alpha = 0
								daewha42[2].alpha = 0
								daewha42[3].alpha = 1
								j = j+1
								my_daesapan:removeEventListener("touch",next1_1)
								script_4.alpha = 1
								script_4:addEventListener("touch",next1_1)
							elseif j == 1 then 
								j=j+1
								daewha42[3].alpha = 0
								daewha42[4].alpha = 1
							elseif j == 2 then 
								j=j+1
								daewha42[4].alpha = 0
								daewha42[5].alpha = 1
							elseif j == 3 then 
								j=j+1
								daewha42[5].alpha = 0
								daewha42[6].alpha = 1
							elseif j == 4 then 
								j=j+1
								daewha42[6].alpha = 0
								daewha42[7].alpha = 1
							elseif j == 5 then 
								happy_wiz.alpha = 0
								main_ch.alpha=1
								my_daesapan.alpha = 1
								my.alpha = 1
								j=j+1
								script_4.alpha = 0
								daewha42[7].alpha = 0
								daewha42[8].alpha = 1
								script_4:removeEventListener("touch",next1_1)
								my_daesapan:addEventListener("touch",next1_1)
							else
								my_daesapan:removeEventListener("touch",next1_1)
								loadsave.saveTable(loadedSettings, "settings.json")
								composer.removeScene("item_find_event")
								composer.gotoScene("view01_month",options)
							end
						end
					end

					

					local function next1(event)
						if event.phase == "began" then
							loadedSettings.blue = loadedSettings.blue + 2
							loadsave.saveTable(loadedSettings,"settings.json")
							daewha41[1].alpha = 0
							my_daesapan.alpha=1
							my.alpha = 1
							choose41.alpha = 0
							choose42.alpha = 0
							daewha42[1].alpha = 0
							daewha42[2].alpha = 1
							daewha43[1].alpha = 0
							choose41:removeEventListener("touch",next1)
							script_4.alpha = 0
							my_daesapan:addEventListener("touch",next1_1)
						end

					end

					local function next1_2(event)

						if event.phase == "began" then
							
							if j == 0 then
								wiz.alpha = 0
								sad_wiz.alpha = 1
								my_daesapan.alpha = 0
								my.alpha = 0
								daewha43[2].alpha = 0
								daewha43[3].alpha = 1
								j = j+1
								my_daesapan:removeEventListener("touch",next1_2)
								script_4.alpha = 1
								script_4:addEventListener("touch",next1_2)
							else
									script_4:removeEventListener("touch",next1_2)
									loadsave.saveTable(loadedSettings, "settings.json")
									composer.removeScene("item_find_event")
									composer.gotoScene("view01_month",options)
							end
						end
					end

					local function next2(event)
						if event.phase == "began" then
							loadedSettings.blue = loadedSettings.blue + 5
							loadsave.saveTable(loadedSettings,"settings.json")	
							daewha41[1].alpha = 0
							my_daesapan.alpha=1
							my.alpha = 1
							choose41.alpha = 0
							choose42.alpha = 0
							daewha43[1].alpha = 0
							daewha43[2].alpha = 1
							daewha42[1].alpha = 0
							choose42:removeEventListener("touch",next1)
							script_4.alpha = 0
							my_daesapan:addEventListener("touch",next1_2)
						end

					end

					local function next(event)
						if event.phase == "began" then			
								script_4:removeEventListener("touch",next)
								choose41.alpha = 1
								daewha42[1].alpha = 1
								daewha42[1]:setFillColor(1)
								daewha42[1].size=36
								daewha42[1].anchorX,daewha42[1].anchorY = 0.5,0.5
								daewha42[1].x,daewha42[1].y = display.contentWidth*0.23,display.contentHeight*0.47
				
								choose42.alpha = 1
								daewha43[1].alpha = 1
								daewha43[1]:setFillColor(1)
								daewha43[1].size=36
								daewha43[1].anchorX,daewha43[1].anchorY = 0.5,0.5
								daewha43[1].x,daewha43[1].y = display.contentWidth*0.77,display.contentHeight*0.47

								choose41:addEventListener("touch",next1)
								choose42:addEventListener("touch",next2)
						end
					end


					background_4.alpha = 1
					wiz.alpha = 1
					script_4.alpha = 1
					daewha41.alpha = 1
					daewha41[1].alpha = 1
					script_4:addEventListener("touch",next)


	elseif color == "3" then
		
					local i = 0
					local j = 0

					local function next1_1(event)

						if event.phase == "began" then
							
							if j == 0 then
								happy_joy.alpha = 1
								joy.alpha = 0
								my_daesapan.alpha = 0
								my.alpha = 0
								daewha22[2].alpha = 0
								daewha22[3].alpha = 1
								j = j+1
								script_2.alpha = 1
								my_daesapan:removeEventListener("touch",next1_1)
								script_2:addEventListener("touch",next1_1)
							elseif j == 1 then 
								j=j+1
								daewha22[3].alpha = 0
								daewha22[4].alpha = 1
							elseif j == 2 then 
								j=j+1
								daewha22[4].alpha = 0
								daewha22[5].alpha = 1
							elseif j == 3 then 
								j=j+1
								daewha22[5].alpha = 0
								daewha22[6].alpha = 1
							elseif j == 4 then 
								happy_joy.alpha = 0
								main_ch.alpha=1
								my_daesapan.alpha = 1
								my.alpha = 1
								j=j+1
								script_2.alpha = 0
								daewha22[6].alpha = 0
								daewha22[7].alpha = 1
								script_2:removeEventListener("touch",next1_1)
								my_daesapan:addEventListener("touch",next1_1)
							else
								my_daesapan:removeEventListener("touch",next1_1)
									loadsave.saveTable(loadedSettings, "settings.json")
									composer.removeScene("item_find_event")
									composer.gotoScene("view01_month",options)
							end
						end
					end

					

					local function next1(event)
						if event.phase == "began" then
							loadedSettings.yellow = loadedSettings.yellow + 5
							loadsave.saveTable(loadedSettings,"settings.json")
							daewha21[1].alpha = 0
							my_daesapan.alpha=1
							my.alpha = 1
							choose21.alpha = 0
							choose22.alpha = 0
							daewha22[1].alpha = 0
							daewha22[2].alpha = 1
							daewha23[1].alpha = 0
							choose21:removeEventListener("touch",next1)
							script_2.alpha = 0
							my_daesapan:addEventListener("touch",next1_1)
						end

					end

					local function next1_2(event)

						if event.phase == "began" then
							
							if j == 0 then
								joy.alpha = 0
								sad_joy.alpha = 1
								my_daesapan.alpha = 0
								my.alpha = 0
								daewha23[2].alpha = 0
								daewha23[3].alpha = 1
								j = j+1
								script_2.alpha = 1
								my_daesapan:removeEventListener("touch",next1_2)
								script_2:addEventListener("touch",next1_2)
							else
								script_2:removeEventListener("touch",next1_2)
								loadsave.saveTable(loadedSettings, "settings.json")
								composer.removeScene("item_find_event")
								composer.gotoScene("view01_month",options)
							end
						end
					end

					local function next2(event)
						if event.phase == "began" then
							loadedSettings.yellow = loadedSettings.yellow + 2
							loadsave.saveTable(loadedSettings,"settings.json")					
							daewha21[1].alpha = 0
							my_daesapan.alpha=1
							my.alpha = 1
							choose21.alpha = 0
							choose22.alpha = 0
							daewha23[1].alpha = 0
							daewha23[2].alpha = 1
							daewha22[1].alpha = 0
							choose22:removeEventListener("touch",next2)
							script_2.alpha = 0
							my_daesapan:addEventListener("touch",next1_2)
						end

					end

					local function next(event)
						if event.phase == "began" then								
								script_2:removeEventListener("touch",next)
								choose21.alpha = 1
								daewha22[1].alpha = 1
								daewha22[1]:setFillColor(1)
								daewha22[1].size=36
								daewha22[1].anchorX,daewha22[1].anchorY = 0.5,0.5
								daewha22[1].x,daewha22[1].y = display.contentWidth*0.23,display.contentHeight*0.47
				
								choose22.alpha = 1
								daewha23[1].alpha = 1
								daewha23[1]:setFillColor(1)
								daewha23[1].size=36
								daewha23[1].anchorX,daewha23[1].anchorY = 0.5,0.5
								daewha23[1].x,daewha23[1].y = display.contentWidth*0.77,display.contentHeight*0.47

								choose21:addEventListener("touch",next1)
								choose22:addEventListener("touch",next2)

						end
					end


					background_2.alpha = 1
					joy.alpha = 1
					script_2.alpha = 1
					daewha21.alpha = 1
					daewha21[1].alpha = 1
					script_2:addEventListener("touch",next)
			
	elseif color == "4" then
					local i = 0
					local j = 0

					local function next1_1(event)

						if event.phase == "began" then
							
							if j == 0 then
								lay.alpha = 0
								happy_lay.alpha = 1
								my_daesapan.alpha = 0
								my.alpha = 0
								daewha52[2].alpha = 0
								daewha52[3].alpha = 1
								j = j+1
								script_5.alpha = 1
								my_daesapan:removeEventListener("touch",next1_1)
								script_5:addEventListener("touch",next1_1)
							elseif j == 1 then 
								j=j+1
								daewha52[3].alpha = 0
								daewha52[4].alpha = 1
							elseif j == 2 then 
								j=j+1
								daewha52[4].alpha = 0
								daewha52[5].alpha = 1
							elseif j == 3 then 
								happy_lay.alpha = 0
								main_ch.alpha=1
								j=j+1
								my_daesapan.alpha = 1
								my.alpha = 1
								script_5.alpha = 0
								daewha52[5].alpha = 0
								daewha52[6].alpha = 1
								script_5:removeEventListener("touch",next1_1)
								my_daesapan:addEventListener("touch",next1_1)
							else
								my_daesapan:removeEventListener("touch",next1_1)
								loadsave.saveTable(loadedSettings, "settings.json")
								composer.removeScene("item_find_event")
								composer.gotoScene("view01_month",options)
							end
						end
					end

					

					local function next1(event)
						if event.phase == "began" then
							loadedSettings.purple = loadedSettings.purple + 5
							loadsave.saveTable(loadedSettings,"settings.json")
							daewha51[1].alpha = 0
							my_daesapan.alpha=1
							my.alpha = 1
							choose51.alpha = 0
							choose52.alpha = 0
							daewha52[1].alpha = 0
							daewha52[2].alpha = 1
							daewha53[1].alpha = 0
							choose51:removeEventListener("touch",next1)
							script_5.alpha = 0
							my_daesapan:addEventListener("touch",next1_1)
						end

					end

					local function next1_2(event)

						if event.phase == "began" then
							
							if j == 0 then
								
								lay.alpha = 0
								sad_lay.alpha = 1
								my_daesapan.alpha = 0
								my.alpha = 0
								daewha53[2].alpha = 0
								daewha53[3].alpha = 1
								j = j+1
								script_5.alpha = 1
								my_daesapan:removeEventListener("touch",next1_2)
								script_5:addEventListener("touch",next1_2)

							else
									script_5:removeEventListener("touch",next1_2)
									loadsave.saveTable(loadedSettings, "settings.json")
									composer.removeScene("item_find_event")
									composer.gotoScene("view01_month",options)
							end
						end
					end

					local function next2(event)
						if event.phase == "began" then
							loadedSettings.purple = loadedSettings.purple + 2
							loadsave.saveTable(loadedSettings,"settings.json")					
							daewha51[1].alpha = 0
							my_daesapan.alpha=1
							my.alpha = 1
							choose51.alpha = 0
							choose52.alpha = 0
							daewha53[1].alpha = 0
							daewha53[2].alpha = 1
							daewha52[1].alpha = 0
							choose52:removeEventListener("touch",next1)
							script_5.alpha = 0
							my_daesapan:addEventListener("touch",next1_2)
						end

					end

					local function next(event)
						if event.phase == "began" then
								script_5:removeEventListener("touch",next)
								choose51.alpha = 1
								daewha52[1].alpha = 1
								daewha52[1]:setFillColor(1)
								daewha52[1].size=36
								daewha52[1].anchorX,daewha52[1].anchorY = 0.5,0.5
								daewha52[1].x,daewha52[1].y = display.contentWidth*0.23,display.contentHeight*0.47
				
								choose52.alpha = 1
								daewha53[1].alpha = 1
								daewha53[1]:setFillColor(1)
								daewha53[1].size=36
								daewha53[1].anchorX,daewha53[1].anchorY = 0.5,0.5
								daewha53[1].x,daewha53[1].y = display.contentWidth*0.77,display.contentHeight*0.47

								choose51:addEventListener("touch",next1)
								choose52:addEventListener("touch",next2)
						end
					end


					background_5.alpha = 1
					lay.alpha = 1
					script_5.alpha = 1
					daewha51.alpha = 1
					daewha51[1].alpha = 1
					script_5:addEventListener("touch",next)

				
	elseif color == "5" then

					local i = 0
					local j = 0

					local function next1_1(event)

						if event.phase == "began" then
							
							if j == 0 then
								soli.alpha = 0
								happy_soli.alpha = 1
								my_daesapan.alpha = 0
								my.alpha = 0
								daewha32[2].alpha = 0
								daewha32[3].alpha = 1
								j = j+1
								script_3.alpha = 1
								my_daesapan:removeEventListener("touch",next1_1)
								script_3:addEventListener("touch",next1_1)
							elseif j == 1 then 
								j=j+1
								daewha32[3].alpha = 0
								daewha32[4].alpha = 1
							elseif j == 2 then 
								j=j+1
								daewha32[4].alpha = 0
								daewha32[5].alpha = 1
							elseif j == 3 then 
								happy_soli.alpha = 0
								main_ch.alpha=1
								my_daesapan.alpha = 1
								my.alpha = 1
								j=j+1
								script_3.alpha = 0
								daewha32[5].alpha = 0
								daewha32[6].alpha = 1
								script_3:removeEventListener("touch",next1_1)
								my_daesapan:addEventListener("touch",next1_1)
							else
								my_daesapan:removeEventListener("touch",next1_1)
								loadsave.saveTable(loadedSettings, "settings.json")
								composer.removeScene("item_find_event")
								composer.gotoScene("view01_month",options)
							end
						end
					end

					

					local function next1(event)
						if event.phase == "began" then
							loadedSettings.green = loadedSettings.green + 2
							loadsave.saveTable(loadedSettings,"settings.json")
							daewha31[1].alpha = 0
							my_daesapan.alpha=1
							my.alpha = 1
							choose31.alpha = 0
							choose32.alpha = 0
							daewha32[1].alpha = 0
							daewha32[2].alpha = 1
							daewha33[1].alpha = 0
							choose31:removeEventListener("touch",next1)
							script_3.alpha = 0
							my_daesapan:addEventListener("touch",next1_1)
						end

					end

					local function next1_2(event)

						if event.phase == "began" then
							
							if j == 0 then
								
								soli.alpha = 0
								sad_soli.alpha = 1
								my_daesapan.alpha = 0
								my.alpha = 0
								daewha33[2].alpha = 0
								daewha33[3].alpha = 1
								j = j+1
								script_3.alpha = 1
								my_daesapan:removeEventListener("touch",next1_2)
								script_3:addEventListener("touch",next1_2)
							else
								script_3:removeEventListener("touch",next1_2)
								loadsave.saveTable(loadedSettings, "settings.json")
								composer.removeScene("item_find_event")
								composer.gotoScene("view01_month",options)
							end
						end
					end

					local function next2(event)
						if event.phase == "began" then
							loadedSettings.green = loadedSettings.green + 5
							loadsave.saveTable(loadedSettings,"settings.json")				
							daewha31[1].alpha = 0
							my_daesapan.alpha=1
							my.alpha = 1
							choose31.alpha = 0
							choose32.alpha = 0
							daewha33[1].alpha = 0
							daewha33[2].alpha = 1
							daewha32[1].alpha = 0
							choose32:removeEventListener("touch",next1)
							script_3.alpha = 0
							my_daesapan:addEventListener("touch",next1_2)
						end

					end

					local function next(event)
						if event.phase == "began" then								
								script_3:removeEventListener("touch",next)
								choose31.alpha = 1
								daewha32[1].alpha = 1
								daewha32[1]:setFillColor(1)
								daewha32[1].size=36
								daewha32[1].anchorX,daewha32[1].anchorY = 0.5,0.5
								daewha32[1].x,daewha32[1].y = display.contentWidth*0.23,display.contentHeight*0.47
				
								choose32.alpha = 1
								daewha33[1].alpha = 1
								daewha33[1]:setFillColor(1)
								daewha33[1].size=36
								daewha33[1].anchorX,daewha33[1].anchorY = 0.5,0.5
								daewha33[1].x,daewha33[1].y = display.contentWidth*0.77,display.contentHeight*0.47

								choose31:addEventListener("touch",next1)
								choose32:addEventListener("touch",next2)
						end
					end


					background_3.alpha = 1
					soli.alpha = 1
					script_3.alpha = 1
					daewha31.alpha = 1
					daewha31[1].alpha = 1
					script_3:addEventListener("touch",next)
	end
			-- 초록마을 이동


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