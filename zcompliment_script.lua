--칭찬 스크립트
local composer = require( "composer" )
local scene = composer.newScene()
local loadsave = require( "loadsave" )

function scene:create( event )
	print("zcompliment_script로 들어옴")
	local sceneGroup = self.view
	
	local loadedSettings = loadsave.loadTable( "settings.json" )
	mainName = loadedSettings.name

	--장면전환
	local options={
		effect="crossFade",
		time=1000
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

	local option = {
      text = mainName,
      x = display.contentWidth*0.175,
      y = display.contentHeight*0.73,
      font = "font/NanumSquareRoundB",
      fontSize =45,
      align="center"
   } 

   local my = display.newText(option)
   my.anchorY = 0
   my.size = 45
   my.alpha = 0
   my:setFillColor(1)
   sceneGroup:insert(my)

	--블리
	local daewha1 = {}
	local daewha2 = {}
	local daewha3 = {}

	--2월
	local text1 = {
		mainName  .."은 무엇이든 열심히 하는 것 같아. 열심히 한다는 건 정말 힘든 일인데 대단해. 나는 너의 그런 점이 좋아!"
	}
	--4월
	local text2 = {
		"동화 속 공주님은 항상 상냥하고 따뜻한 마음씨를 가지고 있어. 그리고 "..mainName  .."은 공주님처럼 따뜻해!"
	}
	--6월
	local text3 = {
		mainName  .."은 아름다운 사랑 이야기 같은 말을 하는구나! 언제나 친구를 웃게 해주는 말을 하는 "..mainName  .."은 정말 멋져!"
	}

	i = 1
	--2월
	daewha1[i] = display.newText(text1[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
	daewha1[i].anchorX,daewha1[i].anchorY = 0,0
	daewha1[i]:setFillColor(0)
	daewha1[i].alpha = 0
	daewha1[i].size = 30
	sceneGroup:insert(daewha1[i])
	--4월
	daewha2[i] = display.newText(text2[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
	daewha2[i].anchorX,daewha2[i].anchorY = 0,0
	daewha2[i]:setFillColor(0)
	daewha2[i].alpha = 0
	daewha2[i].size = 30
	sceneGroup:insert(daewha2[i])
	--6월
	daewha3[i] = display.newText(text3[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
	daewha3[i].anchorX,daewha3[i].anchorY = 0,0
	daewha3[i]:setFillColor(0)
	daewha3[i].alpha = 0
	daewha3[i].size = 30
	sceneGroup:insert(daewha3[i])

	--조이
	local daewha4 = {}
	local daewha5 = {}
	local daewha6 = {}

	--2월
	local text4 = {
		 mainName .."! 넌 정말 활발하구나! ".. mainName .."과 같이 있으면 항상 즐겁게 노래할 수 있을 것 같아!"
	}
	--4월
	local text5 = {
		"너 그거 아니? 레몬과 바나나는 잘 어울리는 음식이야. 그리고 너와 나는 마치 레몬과 바나나 같아."
	}
	--6월
	local text6 = {
		"정말 최고야! 마치 앙코르를 부르는 완벽한 무대 같았어! 같이 해내기 위해서 최선을 다한 "..mainName.."은 박수받아 마땅해. "
	}

	i = 1
	--2월
	daewha4[i] = display.newText(text4[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
	daewha4[i].anchorX,daewha4[i].anchorY = 0,0
	daewha4[i]:setFillColor(0)
	daewha4[i].alpha = 0
	daewha4[i].size = 30
	sceneGroup:insert(daewha4[i])
	--4월
	daewha5[i] = display.newText(text5[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
	daewha5[i].anchorX,daewha5[i].anchorY = 0,0
	daewha5[i]:setFillColor(0)
	daewha5[i].alpha = 0
	daewha5[i].size = 30
	sceneGroup:insert(daewha5[i])
	--6월
	daewha6[i] = display.newText(text6[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
	daewha6[i].anchorX,daewha6[i].anchorY = 0,0
	daewha6[i]:setFillColor(0)
	daewha6[i].alpha = 0
	daewha6[i].size = 30
	sceneGroup:insert(daewha6[i])


	--위즈
	local daewha7 = {}
	local daewha8 = {}
	local daewha9 = {}

	--2월
	local text7 = {
		mainName  .."아, 우리… 내가 생각했던 것보다 더 말이 잘 통하는 것 같아. 그런 거 있잖아, '상식이 통하는 사이'!"
	}
	--4월
	local text8 = {
		"언젠가 책에서 봤는데, 친구는 또 다른 나래. "..mainName.."너에게서 꽤 자주 내가 보여! 똑똑하고 호기심 많은 모습 말이야!"
	}
	--6월
	local text9 = {
		"이건 비밀인데, 내가 새로 시작한 연구가 있거든. 지혜와 상식을 갖춘 너에게만 살짝 알려줄게. 바로… '마른하늘에 날벼락 맞는 법'이야! 참여하고 싶으면 언제든지 오라구. 너라면 환영이야!"
	}


	i = 1
	--2월
	daewha7[i] = display.newText(text7[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
	daewha7[i].anchorX,daewha7[i].anchorY = 0,0
	daewha7[i]:setFillColor(0)
	daewha7[i].alpha = 0
	daewha7[i].size = 30
	sceneGroup:insert(daewha7[i])
	--4월
	daewha8[i] = display.newText(text8[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
	daewha8[i].anchorX,daewha8[i].anchorY = 0,0
	daewha8[i]:setFillColor(0)
	daewha8[i].alpha = 0
	daewha8[i].size = 30
	sceneGroup:insert(daewha8[i])
	--6월
	daewha9[i] = display.newText(text9[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
	daewha9[i].anchorX,daewha9[i].anchorY = 0,0
	daewha9[i]:setFillColor(0)
	daewha9[i].alpha = 0
	daewha9[i].size = 30
	sceneGroup:insert(daewha9[i])



	--솔리
	local daewha10 = {}
	local daewha11 = {}
	local daewha12 = {}

	--2월
	local text10 = {
		mainName  .."아, 이전에 아이스크림을 나에게 양보해줘서 정말 고마워~ 다정한 너를 위해 오늘은 내가 민트 초콜릿을 준비했는데, 같이 먹을래?"
	}
	--4월
	local text11 = {
		mainName.."아, 너와 함께 수목원에 갈 수 있어서 너무 즐거웠어~ 다른 곳을 갈 수 있었는데도 내가 좋아하는 수목원을 선택한 너는 정말 배려심이 넘치는 것 같아."
	}
	--6월
	local text12 = {
		mainName.."아, 너는 정말 마음이 따뜻한 사람인 것 같아. 너는 우리를 품어주는 녹색 숲처럼 넓은 마음을 가졌어. 언제나 고마워~"
	}


	i = 1
	--2월
	daewha10[i] = display.newText(text10[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
	daewha10[i].anchorX,daewha10[i].anchorY = 0,0
	daewha10[i]:setFillColor(0)
	daewha10[i].alpha = 0
	daewha10[i].size = 30
	sceneGroup:insert(daewha10[i])
	--4월
	daewha11[i] = display.newText(text11[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
	daewha11[i].anchorX,daewha11[i].anchorY = 0,0
	daewha11[i]:setFillColor(0)
	daewha11[i].alpha = 0
	daewha11[i].size = 30
	sceneGroup:insert(daewha11[i])
	--6월
	daewha12[i] = display.newText(text12[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
	daewha12[i].anchorX,daewha12[i].anchorY = 0,0
	daewha12[i]:setFillColor(0)
	daewha12[i].alpha = 0
	daewha12[i].size = 30
	sceneGroup:insert(daewha12[i])

	
	--레이
	local daewha13 = {}
	local daewha14 = {}
	local daewha15 = {}

	--2월
	local text13 = {
		mainName  .."아, 내가 놀이터에서 제대로 대답하지 못했을 때 도와줘서 고마워. 나도 언젠간 너처럼 용감해질 수 있겠지…?"
	}
	--4월
	local text14 = {
		mainName.."아,  너는 참 용감하고 다정해. 무서운 책을 혼자서 읽지 못하는 나를 위해 곁에 있어주다니…… 너와 함께라면 뭐든 가능할 것 같아."
	}
	--6월
	local text15 = {
		mainName.."아, 용감한 네 모습을 보며 나도 함께 용기를 얻고 있어. 너를 본받아서 나도 더욱 용감한 사람이 되도록 노력할게!"
	}


	i = 1
	--2월
	daewha13[i] = display.newText(text13[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
	daewha13[i].anchorX,daewha13[i].anchorY = 0,0
	daewha13[i]:setFillColor(0)
	daewha13[i].alpha = 0
	daewha13[i].size = 30
	sceneGroup:insert(daewha13[i])
	--4월
	daewha14[i] = display.newText(text14[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
	daewha14[i].anchorX,daewha14[i].anchorY = 0,0
	daewha14[i]:setFillColor(0)
	daewha14[i].alpha = 0
	daewha14[i].size = 30
	sceneGroup:insert(daewha14[i])
	--6월
	daewha15[i] = display.newText(text15[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
	daewha15[i].anchorX,daewha15[i].anchorY = 0,0
	daewha15[i]:setFillColor(0)
	daewha15[i].alpha = 0
	daewha15[i].size = 30
	sceneGroup:insert(daewha15[i])




	local num = 0
	local function touch4(event)
		if num == 1 then
			composer.removeScene("zcompliment_script")
			composer.gotoScene("view01Map",options)
		end

		num = num + 1
			
		
	end

	local loadedSettings = loadsave.loadTable( "settings.json" )

	local color = composer.getVariable("color")

	--print(loadedSettings.limited_num)

	if color == "1" then --블리
		local function next(event) 
			if event.phase == "began" then
				composer.removeScene("zcompliment_script")
				composer.gotoScene("view01Map",options)	
			end
		end
		if loadedSettings.script6 == 1 then
			local i = 1
			background_1.alpha = 1
			happy_blli.alpha = 1
			daewha3[i].alpha = 1
			script_1.alpha = 1
			script_1:addEventListener("touch", next)
		elseif loadedSettings.script4 == 1 then
			local i = 1
			background_1.alpha = 1
			happy_blli.alpha = 1
			daewha2[i].alpha = 1
			script_1.alpha = 1	
			script_1:addEventListener("touch", next)
		elseif loadedSettings.script2 == 1 then
			local i = 1
			background_1.alpha = 1
			happy_blli.alpha = 1
			daewha1[i].alpha = 1
			script_1.alpha = 1
			script_1:addEventListener("touch", next)
		end
		
	elseif color == "2" then --위즈
		local function next(event) 
			if event.phase == "began" then
				composer.removeScene("zcompliment_script")
				composer.gotoScene("view01Map",options)	
			end
		end
		if loadedSettings.script6 == 1 then
			local i = 1
			background_4.alpha = 1
			happy_wiz.alpha = 1
			daewha9[i].alpha = 1
			script_4.alpha = 1
			script_4:addEventListener("touch", next)
		elseif loadedSettings.script4 == 1 then
			local i = 1
			background_4.alpha = 1
			happy_wiz.alpha = 1
			daewha8[i].alpha = 1
			script_4.alpha = 1
			script_4:addEventListener("touch", next)
		elseif loadedSettings.script2 == 1 then
			local i = 1
			background_4.alpha = 1
			happy_wiz.alpha = 1
			daewha7[i].alpha = 1
			script_4.alpha = 1
			script_4:addEventListener("touch", next)
		end
	elseif color == "3" then --조이
		local function next(event) 
			if event.phase == "began" then
				composer.removeScene("zcompliment_script")
				composer.gotoScene("view01Map",options)	
			end
		end
		if loadedSettings.script6 == 1 then
			local i = 1
			background_2.alpha = 1
			happy_joy.alpha = 1
			daewha6[i].alpha = 1
			script_2.alpha = 1
			script_2:addEventListener("touch", next)
		elseif loadedSettings.script4 == 1 then
			local i = 1
			background_2.alpha = 1
			happy_joy.alpha = 1
			daewha5[i].alpha = 1
			script_2.alpha = 1
			script_2:addEventListener("touch", next)
		elseif loadedSettings.script2 == 1 then
			local i = 1
			background_2.alpha = 1
			happy_joy.alpha = 1
			daewha4[i].alpha = 1
			script_2.alpha = 1
			script_2:addEventListener("touch", next)
		end		
	
	elseif color == "4" then --레이
		local function next(event) 
			if event.phase == "began" then
				composer.removeScene("zcompliment_script")
				composer.gotoScene("view01Map",options)	
			end
		end
		if loadedSettings.script6 == 1 then
			local i = 1
			background_5.alpha = 1
			happy_lay.alpha = 1
			daewha15[i].alpha = 1
			script_5.alpha = 1
			script_5:addEventListener("touch", next)
		elseif loadedSettings.script4 == 1 then
			local i = 1
			background_5.alpha = 1
			happy_lay.alpha = 1
			daewha14[i].alpha = 1
			script_5.alpha = 1
			script_5:addEventListener("touch", next)
		elseif loadedSettings.script2 == 1 then
			local i = 1
			background_5.alpha = 1
			happy_lay.alpha = 1
			daewha13[i].alpha = 1
			script_5.alpha = 1
			script_5:addEventListener("touch", next)
		end
	
	elseif color == "5" then --솔리
		local function next(event) 
			if event.phase == "began" then
				composer.removeScene("zcompliment_script")
				composer.gotoScene("view01Map",options)	
			end
		end
		if loadedSettings.script6 == 1 then
			local i = 1
			background_3.alpha = 1
			happy_soli.alpha = 1
			daewha12[i].alpha = 1
			script_3.alpha = 1
			script_3:addEventListener("touch", next)
		elseif loadedSettings.script4 == 1 then
			local i = 1
			background_3.alpha = 1
			happy_soli.alpha = 1
			daewha11[i].alpha = 1
			script_3.alpha = 1
			script_3:addEventListener("touch", next)
		elseif loadedSettings.script2 == 1 then
			local i = 1
			background_3.alpha = 1
			happy_soli.alpha = 1
			daewha10[i].alpha = 1
			script_3.alpha = 1
			script_3:addEventListener("touch", next)
		end
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