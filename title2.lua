local loadsave = require( "loadsave" )
local composer = require( "composer" )
local scene = composer.newScene()
local json = require( "json" ) 

function scene:create( event )
	local sceneGroup = self.view

	print("title2")
	--로드
	local loadedEndings = loadsave.loadTable( "endings.json" )

	--local titleMusic = audio.loadStream( "음악/타이틀.mp3" )

	local background = display.newImageRect("이미지/타이틀/메인.png",display.contentWidth, display.contentHeight)
	background.x,background.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background)

	local ending = display.newImage("이미지/타이틀/엔딩모음.png")
	ending.x, ending.y = display.contentWidth*0.05,display.contentHeight*0.9
	sceneGroup:insert(ending)

	--크레딧 버튼
    local credit = display.newImage("이미지/크레딧/버튼.png")
    credit.x, credit.y = display.contentWidth*0.95,display.contentHeight*0.9
    sceneGroup:insert(credit)
    --credit:addEventListener("touch",move)

    --스페셜 버튼
    local special = display.newImage("이미지/특별일러스트/버튼.png")
    special.x, special.y = display.contentWidth*0.13,display.contentHeight*0.9
    sceneGroup:insert(special)

	local volumeButton = display.newImage("이미지/타이틀/설정.png")
    volumeButton.x,volumeButton.y = display.contentWidth * 0.87, display.contentHeight * 0.9
    sceneGroup:insert(volumeButton)

    local newgame = display.newImage("이미지/타이틀/새게임.png")
    newgame.x,newgame.y = display.contentWidth * 0.42, display.contentHeight * 0.9
    sceneGroup:insert(newgame)

    local loadgame = display.newImage("이미지/타이틀/로드버튼.png")
    loadgame.x,loadgame.y = display.contentWidth * 0.58, display.contentHeight * 0.9
    sceneGroup:insert(loadgame)

	local titlePopup = display.newImage("이미지/타이틀/이름설정팝업.png")
	titlePopup.x,titlePopup.y = display.contentWidth/2,display.contentHeight/2
	titlePopup.alpha = 0
	sceneGroup:insert(titlePopup)

	local titleButton = display.newImage("이미지/타이틀/이름결정.png")
	titleButton.x,titleButton.y = display.contentWidth/2,display.contentHeight * 0.65
	titleButton.alpha = 0
	sceneGroup:insert(titleButton)

	--이름 입력을 위한 텍스트상자 생성--
	local defaultField
	local function textListener( event )
 
    	if ( event.phase == "began" ) then
        	-- User begins editing "defaultField"
 
    	elseif ( event.phase == "ended" or event.phase == "submitted" ) then
        	-- Output resulting text from "defaultField"
        	print( event.target.text )
 
    	elseif ( event.phase == "editing" ) then
        	print( event.newCharacters )
        	print( event.oldText )
        	print( event.startPosition )
        	print( event.text )
    	end
	end

	titlePopup.alpha = 1
	titleButton.alpha = 1

		-- Create text field

	local function make_text()
		defaultField = native.newTextField( display.contentWidth/2,display.contentHeight * 0.56, 370, 60 )
		defaultField:addEventListener( "userInput", textListener )
		defaultField.font = native.newFont( "font/잘풀리는오늘 Medium.ttf", 40)
		defaultFied = ""
		defaultField.align = "center"
		sceneGroup:insert(defaultField)
	end
	make_text()

	-- 검은 화면
	local back = display.newRect(display.contentWidth/2,display.contentHeight/2, display.contentWidth,display.contentHeight)
	back:setFillColor(0)
	sceneGroup:insert(back)
	back.alpha = 0

	-- 화면전환 이펙트
	local options={
		effect = "fade",
		time = 2000
	}

	local function gotomap(event)
		if event.phase == "began" then 
			event.target.width,event.target.height = 68.82,68.82
		elseif event.phase == "cancelled" then 
			event.target.width,event.target.height = 74,74
		elseif event.phase == "ended" then
			event.target.width,event.target.height = 74,74
			
			defaultField:removeSelf()
			defaultField = nil
				composer.removeScene("title2")
				composer.gotoScene("title")

		end
	end


	local exit1 = display.newImage("이미지/공통/작은x버튼.png")
	sceneGroup:insert(exit1)
	exit1.x, exit1.y = display.contentWidth*0.68, display.contentHeight*0.28
	exit1:addEventListener("touch",gotomap)

	
	local function startNew(event)
		--색깔 또는 이름을 선택하지 않았을 시 에러 팝업창으로 넘어간다
		if defaultField.text == "" then
			defaultField:removeSelf()
			defaultField = nil
			composer.removeScene("title2")
			composer.gotoScene("title2_1")
		else
				--게임 진행을 위한 저장 데이터들 생성
				
				loadedEndings = loadsave.loadTable( "endings.json" )
				loadedEndings.end_num = 0
				loadsave.saveTable(loadedEndings,"endings.json")
				local gameSettings = {
    				money = 2000,
    				fun = 0,
    				hobby = 0,
    				study = 0,
    				friendship =0,
    			
    				red = 0,
    				yellow = 0,
    				green = 0,
    				blue = 0,
    				purple = 0,
    				month = 0,
    				limited_num= 0,
    				red_num = 0,
    				blue_num = 0,
    				yellow_num = 0,
    				green_num = 0,
    				purple_num = 0,
    				game_num = 0,
    				activity_num = 0,
    				friend_num = 0,
    				gift_num=0,
    				play1_num =0,
    				play2_num=0,
    				play3_num=0,
    				play4_num=0,
    				play5_num=0,
    				hobby1_num = 0,
    				hobby2_num = 0,
    				hobby3_num = 0,
    				hobby4_num = 0,
    				hobby5_num = 0,
    				study1_num = 0,
    				study2_num = 0,
    				study3_num = 0,
    				study4_num = 0,
    				study5_num = 0,
    				friend1_num = 0,
    				friend2_num = 0,
    				friend3_num = 0,
    				friend4_num = 0,
    				friend5_num = 0,
    				show1 = 0,
    				show2= 0,
    				show3= 0,
    				show4= 0,
    				show5= 0,
    				show6= 0,
    				show7= 0,

    				month1_event = 0,
    				month2_event = 0,
    				month3_event = 0,
    				month4_event = 0,
    				month5_event = 0,
    				month6_event = 0,

    				tutorial = 0,

    				badWhite = 0,
    				goodWhite = 0,

    				former1 = "",
    				former2 = "",
    				former01 = "",
    				former02 = "",
    				next1 = "",
    				next2 = "",
    				name = defaultField.text,
    				test = 0,
    				script2 = 0,
    				script4 = 0,
    				script6 = 0
				}
				loadsave.saveTable( gameSettings, "settings.json" )
				local itme = {

						itemCount = 0,
						item1 = "없음",
						item2 = "없음",
						item3 = "없음",
						item4 = "없음",
						item5 = "없음",
						item6 = "없음",
						item7 = "없음",
						item8 = "없음",
						item9 = "없음",
						item10 = "없음",
						item11 = "없음",
						item12 = "없음",
						item13 = "없음",
						item14 = "없음",
						item15 = "없음",
						item16 = "없음",
						item17 = "없음",


						item1Count = 0,
						item2Count = 0,
						item3Count = 0,
						item4Count = 0,
						item5Count = 0,
						item6Count = 0,
						item7Count = 0,
						item8Count = 0,
						item9Count = 0,
						item10Count = 0,
						item11Count = 0,
						item12Count = 0,
						item13Count = 0,
						item14Count = 0,
						item15Count = 0,
						item16Count = 0,
						item17Count = 0,

						decoCount = 0,
						deco1 = "없음",
						deco2 = "없음",
						deco3 = "없음",
						deco4 = "없음",
						deco5 = "없음",
						deco6 = "없음",
						deco7 = "없음",
						deco8 = "없음",
						deco9 = "없음",
						deco10 = "없음",
						deco11 = "없음",
						deco12 = "없음",
						deco13 = "없음",
						deco14 = "없음",
						deco15 = "없음",

						d1Sold=1,
						d2Sold=1,
						d3Sold=1,
						d4Sold=1,
						d5Sold=1,
						d6Sold=1,
						d7Sold=1,
						d8Sold=1,
						d9Sold=1,
						d10Sold=1,
						d11Sold=1,
						d12Sold=1,
						d13Sold=1,
						d14Sold=1,
						d15Sold=1,


						interiorCount = 23,
						wallpaper1 = "흰색벽지",
						wallpaper2 = "없음",
						wallpaper3 = "없음",
						wallpaperCount = 1,
						floor1 = "푸른바닥",
						floor2 = "없음",
						floor3 = "없음",
						floorCount = 1,
						blanket1 = "파랑이불",
						blanket2 = "없음",
						blanket3 = "없음",
						blanketCount = 1,
						carpet1 = "없음",
						carpet2 = "없음",
						carpet3 = "없음",
						carpetCount = 0,
						plant1 = "없음",
						plant2 = "없음",
						plant3 = "없음",
						plant4 = "없음",
						plantCount = 0,
						doll1 = "없음",
						doll2 = "없음",
						dollCount = 0,
						frame1 = "없음",
						frame2 = "없음",
						frame3 = "없음",
						frame4 = "없음",
						frame5 = "없음",
						frameCount = 0,
						
						grid_apply = 0,
						dot_apply = 0,
						white_apply = 1,

						flower_apply = 0,
						sprite_apply = 0,
						blue_apply = 1,

						tree_apply = 0,
						fblue_apply = 1,
						fwhite_apply = 0,

						square_apply=0,
						circle_apply=0,
						heart_apply=0,

						cactus_apply=0,
						violet_apply=0,
						sunflower_apply=0,
						clover_apply=0,

						bear_apply=0,
						rabbit_apply=0,

						lay_apply=0,
						wiz_apply=0,
						soli_apply=0,
						bly_apply=0,
						joy_apply=0,

						costume_normal = 1,
						costume_walnut = 0,
						costume_pirate = 0,
						costume_detective = 0,
						costume_summer = 0,
						costume_devil = 0,
						costume_pyjamas = 0,
						costume_troublemaker = 0,
						costume_nerd = 0,
						costume_princess = 0,
						costume = "기본",

						costumeBuy = {{ name = "꼬마악마", buy = 0, cost = 40},
						{ name = "탐정", buy = 0, cost = 50},
						{ name = "해적", buy = 0, cost = 50},
						{ name = "공주님", buy = 0, cost = 50},
						{ name = "병정인형", buy = 0, cost = 50},
						{ name = "수면잠옷", buy = 0, cost = 30},
						{ name = "여름해변", buy = 0, cost = 30},
						{ name = "말썽쟁이", buy = 0, cost = 25},
						{ name = "모범친구", buy = 0, cost = 25},
						{ name = "기본", buy = 1, cost = 0}}
					}

			
				local serializedJSON = json.encode(itme)
				local itmes = json.decode(serializedJSON)
				--loadsave.saveTable(custumeBuy, "items.json")


				loadsave.saveTable( itmes ,"items.json" )
				composer.setVariable("name",defaultField.text)
				defaultField:removeSelf()
				defaultField = nil
				
				titleButton.alpha = 0
				titlePopup.alpha = 0
				exit1.alpha = 0

				composer.removeScene("title2")
				composer.gotoScene( "tutorial",options)
				audio.pause( titleMusic )
				local tutorialMusic = audio.loadStream( "음악/튜토리얼.mp3" )
       			audio.setVolume( loadedEndings.logValue )
				audio.play(tutorialMusic)
			end
	end
	titleButton:addEventListener("tap",startNew)


	
	

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