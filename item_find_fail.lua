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

	local daewha12 = {}

	local text12 = {
		"못  찾았어?  어떡해…. ",
		"도대체  어디에서  잃어버린  걸까? \n꼭  찾고  싶었는데.",
		"그래도  도와줘서  고마워!"
	}

	for i = 1,3 do
		daewha12[i] = display.newText(text12[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		daewha12[i].anchorX,daewha12[i].anchorY = 0,0
		daewha12[i]:setFillColor(0)
		daewha12[i].alpha = 0
		daewha12[i].size = 30
		sceneGroup:insert(daewha12[i])
	end


	local daewha22 = {}

	local text22 = {
		"안타깝네.  그래도  찾아주려고  해서  고마워.",
		"그나저나  내  노래  주머니가  없으면  나는  겁쟁이에  게으름뱅이가  될거야…. \n이를  어쩌지?",
		"아무튼  고마워.  나는  이만  가볼게!"
	}

	for i = 1,3 do
		daewha22[i] = display.newText(text22[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		daewha22[i].anchorX,daewha22[i].anchorY = 0,0
		daewha22[i]:setFillColor(0)
		daewha22[i].alpha = 0
		daewha22[i].size = 30
		sceneGroup:insert(daewha22[i])
	end

	local daewha32 = {}

	local text32 = {
		mainName..",  혹시  못  찾은  거야?",
		"그렇구나…  아쉽다.\n  괜찮아,  내가  다시  한  번  찾아볼게.",
		"그래도  도와줘서  고마워."
	}

	for i = 1,3 do
		daewha32[i] = display.newText(text32[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		daewha32[i].anchorX,daewha32[i].anchorY = 0,0
		daewha32[i]:setFillColor(0)
		daewha32[i].alpha = 0
		daewha32[i].size = 30
		sceneGroup:insert(daewha32[i])
	end

	local daewha42 = {}

	local text42 = {
		"못 찾았어? 이런, 확성기에 발이라도 달렸나?",
		"그게 없으면 연구도 불가능한데…. \n내가  한  번  더  찾아보지,",
		 "뭐. 그나저나  도와줘서  고맙다!"
	}

	for i = 1,3 do
		daewha42[i] = display.newText(text42[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		daewha42[i].anchorX,daewha42[i].anchorY = 0,0
		daewha42[i]:setFillColor(0)
		daewha42[i].alpha = 0
		daewha42[i].size = 30
		sceneGroup:insert(daewha42[i])
	end

	local daewha52 = {}

	local text52 = {
		"역시  찾기  어렵지…?",
		"그냥  잃어버렸다고  생각해야겠다….",
		"그래도  도와줘서  고마워."
	}

	for i = 1,3 do
		daewha52[i] = display.newText(text52[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		daewha52[i].anchorX,daewha52[i].anchorY = 0,0
		daewha52[i]:setFillColor(0)
		daewha52[i].alpha = 0
		daewha52[i].size = 30
		sceneGroup:insert(daewha52[i])
	end

	local num = 0
	
	local loadedSettings = loadsave.loadTable( "settings.json" )

	local color = composer.getVariable("color")

	--print(loadedSettings.limited_num)

	if color == "1" then
					local j = 0

					local function next1(event)

						if event.phase == "began" then
							
							if j == 0 then
								daewha12[1].alpha = 0
								daewha12[2].alpha = 1
								j = j+1
							elseif j == 1 then
								daewha12[2].alpha = 0
								daewha12[3].alpha = 1
								j = j+1
							else
									script_1:removeEventListener("touch",next1)
									loadsave.saveTable(loadedSettings, "settings.json")
									composer.removeScene("item_find_fail")
									if loadedSettings.month == 6 then 
										composer.gotoScene("view99end")
									else
										composer.gotoScene("view01_month",options)
									end
							end
						end
					end

					background_1.alpha = 1
					sad_blli.alpha = 1
					script_1.alpha = 1
					daewha12.alpha = 1
					daewha12[1].alpha = 1
					script_1:addEventListener("touch",next1)			


	elseif color == "2" then
					local j = 0

					local function next1(event)

						if event.phase == "began" then
							
							if j == 0 then
								daewha42[1].alpha = 0
								daewha42[2].alpha = 1
								j = j+1
							elseif j == 1 then 
								daewha42[2].alpha = 0
								daewha42[3].alpha = 1
								j = j+1
							else
								my_daesapan:removeEventListener("touch",next1)
								loadsave.saveTable(loadedSettings, "settings.json")
								composer.removeScene("item_find_fail")
								if loadedSettings.month == 6 then 
									composer.gotoScene("view99end")
								else
									composer.gotoScene("view01_month",options)
								end
							end
						end
					end

					background_4.alpha = 1
					sad_wiz.alpha = 1
					script_4.alpha = 1
					daewha42.alpha = 1
					daewha42[1].alpha = 1
					script_4:addEventListener("touch",next1)


	elseif color == "3" then
					local j = 0

					local function next1(event)

						if event.phase == "began" then
							
							if j == 0 then
								daewha22[1].alpha = 0
								daewha22[2].alpha = 1
								j = j+1
							elseif j == 1 then 
								daewha22[2].alpha = 0
								daewha22[3].alpha = 1
								j = j+1
							else
								script_2:removeEventListener("touch",next1)
									loadsave.saveTable(loadedSettings, "settings.json")
									composer.removeScene("item_find_fail")
									if loadedSettings.month == 6 then 
										composer.gotoScene("view99end")
									else
										composer.gotoScene("view01_month",options)
									end
							end
						end
					end

					background_2.alpha = 1
					sad_joy.alpha = 1
					script_2.alpha = 1
					daewha22.alpha = 1
					daewha22[1].alpha = 1
					script_2:addEventListener("touch",next1)
			
	elseif color == "4" then
					local j = 0

					local function next1(event)

						if event.phase == "began" then
							
							if j == 0 then
								daewha52[1].alpha = 0
								daewha52[2].alpha = 1
								j = j+1
							elseif j == 1 then 
								daewha52[2].alpha = 0
								daewha52[3].alpha = 1
								j = j+1
							else
								script_5:removeEventListener("touch",next1)
								loadsave.saveTable(loadedSettings, "settings.json")
								composer.removeScene("item_find_fail")
								if loadedSettings.month == 6 then 
									composer.gotoScene("view99end")
								else
									composer.gotoScene("view01_month",options)
								end
							end
						end
					end

					background_5.alpha = 1
					sad_lay.alpha = 1
					script_5.alpha = 1
					daewha52.alpha = 1
					daewha52[1].alpha = 1
					script_5:addEventListener("touch",next1)

				
	elseif color == "5" then
					local j = 0

					local function next1(event)

						if event.phase == "began" then
							
							if j == 0 then
								daewha32[1].alpha = 0
								daewha32[2].alpha = 1
								j = j+1
							elseif j == 1 then 
								daewha32[2].alpha = 0
								daewha32[3].alpha = 1
								j = j+1
							else
								script_3:removeEventListener("touch",next1)
								loadsave.saveTable(loadedSettings, "settings.json")
								composer.removeScene("item_find_fail")
								if loadedSettings.month == 6 then 
									composer.gotoScene("view99end")
								else
									composer.gotoScene("view01_month",options)
								end
							end
						end
					end

					background_3.alpha = 1
					sad_soli.alpha = 1
					script_3.alpha = 1
					daewha32.alpha = 1
					daewha32[1].alpha = 1
					script_3:addEventListener("touch",next1)
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