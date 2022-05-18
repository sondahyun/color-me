--엔딩 화면
local composer = require( "composer" )
local scene = composer.newScene()
local loadsave = require( "loadsave" )

function scene:create( event )
	local sceneGroup = self.view
	local loadedSettings = loadsave.loadTable( "settings.json" )
	local loadedEndings = loadsave.loadTable( "endings.json" )

	local endingMusic = audio.loadStream("음악/엔딩.mp3" )
 	audio.setVolume( loadedEndings.logValue )
    audio.play(endingMusic)

      --샘플 볼륨 이미지
    local volumeButton = display.newImage("이미지/타이틀/설정.png")
    volumeButton.x,volumeButton.y = display.contentWidth * 0.87, display.contentHeight * 0.9
    sceneGroup:insert(volumeButton)

    --샘플볼륨함수--
    local function setVolume(event)
        composer.showOverlay( "volumeControl", options )
    end
    volumeButton:addEventListener("tap",setVolume)

 local options = {
        isModal = true
        
    }

	--우정 엔딩--
	local back = display.newRect(display.contentWidth/2,display.contentHeight/2, display.contentWidth,display.contentHeight)
	back:setFillColor(0)
	sceneGroup:insert(back)

	--무지개 엔딩 --
	local rainbow = display.newImage("이미지/엔딩/엔딩카드/무지개.png")
	rainbow.x, rainbow.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(rainbow)
	rainbow.alpha = 0

	local mix_red = display.newImage("이미지/엔딩/엔딩카드/우정빨강.png")
	mix_red.x, mix_red.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(mix_red)
	mix_red.alpha = 0

	local mix_yellow = display.newImage("이미지/엔딩/엔딩카드/우정노랑.png")
	mix_yellow.x, mix_yellow.y =display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(mix_yellow)
	mix_yellow.alpha =0
	local mix_blue = display.newImage("이미지/엔딩/엔딩카드/우정파랑.png")
	mix_blue.x,mix_blue.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(mix_blue)
	mix_blue.alpha = 0
	local mix_purple = display.newImage("이미지/엔딩/엔딩카드/우정보라.png")
	mix_purple.x, mix_purple.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(mix_purple)
	mix_purple.alpha = 0
	local mix_green = display.newImage("이미지/엔딩/엔딩카드/우정초록.png")
	mix_green.x, mix_green.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(mix_green)
	mix_green.alpha = 0

	--혼합엔딩--

	local violet = display.newImage("이미지/엔딩/엔딩카드/혼합(공부)바이올렛.png")
	violet.x, violet.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(violet)
	violet.alpha = 0

	local act_violet = display.newImage("이미지/엔딩/엔딩카드/혼합(활동)바이올렛.png")
 	act_violet.x, act_violet.y = display.contentWidth/2,display.contentHeight/2 
 	sceneGroup:insert(act_violet)
 	act_violet.alpha = 0

	local orange = display.newImage("이미지/엔딩/엔딩카드/혼합(공부)주황.png")
	orange.x, orange.y =  display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(orange)
	orange.alpha = 0

	local act_orange = display.newImage("이미지/엔딩/엔딩카드/혼합(활동)주황.png")
	act_orange.x, act_orange.y =display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(act_orange)
	act_orange.alpha = 0

	local chung = display.newImage("이미지/엔딩/엔딩카드/혼합(공부)청록.png")
	chung.x, chung.y =  display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(chung)
	chung.alpha = 0

	local act_chung = display.newImage("이미지/엔딩/엔딩카드/혼합(활동)청록.png")
	act_chung.x, act_chung.y =display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(act_chung)
	act_chung.alpha = 0

	--히든엔딩

	local good = display.newImage("이미지/엔딩/엔딩카드/굿.png")
	good.x, good.y = display.contentWidth/2,display.contentHeight/2 
	sceneGroup:insert(good)
	good.alpha = 0

	local bad = display.newImage("이미지/엔딩/엔딩카드/배드.png")
	bad.x, bad.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(bad)
	bad.alpha = 0

	local pastell_yellow = display.newImage("이미지/엔딩/엔딩카드/파스텔노랑.png")
	pastell_yellow.x, pastell_yellow.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(pastell_yellow)
	pastell_yellow.alpha = 0

	local pastell_purple = display.newImage("이미지/엔딩/엔딩카드/파스텔보라.png")
	pastell_purple.x, pastell_purple.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(pastell_purple)
	pastell_purple.alpha = 0

	local pastell_red = display.newImage("이미지/엔딩/엔딩카드/파스텔빨강.png")
	pastell_red.x, pastell_red.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(pastell_red)
	pastell_red.alpha = 0

	local pastell_blue = display.newImage("이미지/엔딩/엔딩카드/파스텔파랑.png")
	pastell_blue.x, pastell_blue.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(pastell_blue)
	pastell_blue.alpha =0

-- 여태 모아두었던 스탯
-- 스탯의 값에 따라 엔딩 화면 바뀜

	study = loadedSettings.study
	fun = loadedSettings.fun
	hobby = loadedSettings.hobby
	friendship = loadedSettings.friendship

	red = loadedSettings.red 
	yellow = loadedSettings.yellow
	green = loadedSettings.green
	purple = loadedSettings.purple
	blue = loadedSettings.blue

-- 파스텔 엔딩
	local function pastel()
		if (red >= yellow) and (red >= green) and (red >= blue) and (red >= purple)  then
			transition.to(pastell_red,{time=2000,alpha=1})
			loadedEndings.pastel_red = 1
		elseif (yellow >= red) and (yellow >= green) and (yellow >= blue) and (yellow >= purple)  then
			transition.to(pastell_yellow,{time=2000,alpha=1})
			loadedEndings.pastel_yellow = 1
		elseif (green >= red) and (green >= yellow) and (green >= blue) and (green >= purple)  then
			transition.to(pastell_green,{time=2000,alpha=1})
			loadedEndings.pastel_green = 1
		elseif (blue >= red) and (blue >= yellow) and (blue >= green) and (blue >= purple)  then
			transition.to(pastell_blue,{time=2000,alpha=1})
			loadedEndings.pastel_blue= 1
		elseif (purple >= red) and (purple >= yellow) and (purple >= green) and (purple >= blue) then
			transition.to(pastell_purple,{time=2000,alpha=1})
			loadedEndings.pastel_purple = 1
		end
	end

--활동/공부/취미 엔딩 (혼합)
	if (study >= 80) and (hobby >= 80) and (fun >= 80) and (friendship >= 80) then
		transition.to(rainbow,{time=2000,alpha=1})
		loadedEndings.rainbow = 1
	elseif (study >= fun) and (study >= hobby) and (study >= friendship) and (study >= 70) then
		
		if (red >= 50) and (yellow >= 50) then
			transition.to(orange,{time=2000,alpha=1})
			loadedEndings.orange=1

		elseif (blue >= 50) and (green >= 50) then
			transition.to(chung,{time=2000,alpha=1})
			loadedEndings.chung=1
		elseif (red >= 50) and (blue >=50) and (purple>=60) then
			transition.to(violet,{time=2000,alpha=1})
			loadedEndings.violet=1
		else
			pastel()
		end
	elseif ((hobby >= study) and (hobby >= friendship) and (fun >= 70)) or ((fun >= study) and (fun >= friendship) and (fun >= 70)) then
		if (red >= 50) and (yellow >= 50) then
			transition.to(act_orange,{time=2000,alpha=1})
			loadedEndings.act_orange=1
		elseif (blue >= 50) and (green >= 50) then
			transition.to(act_chung,{time=2000,alpha=1})
			loadedEndings.act_chung=1
		elseif (red >= 50) and (blue >=50) and (purple>=50) then
			transition.to(act_violet,{time=2000,alpha=1})
			loadedEndings.act_violet=1
		else
			pastel()
		end


--우정엔딩
	elseif (friendship >= study) and (friendship >= fun) and (friendship >= hobby) and (friendship >= 70) then
		if  (red >= yellow) and (red >= green) and (red >= blue) and (red >= purple) and (red >= 50) then
			transition.to(mix_red,{time=2000,alpha=1})
			 loadedEndings.red =1
		elseif (yellow >= red) and (yellow >= green) and (yellow >= blue) and (yellow >= purple) and (yellow >=50) then
			transition.to(mix_yellow,{time=2000,alpha=1})
			loadedEndings.yellow=1
		elseif (green >= red) and (green >= yellow) and (green >= blue) and (green >= purple) and (green >= 50) then
			transition.to(mix_green,{time=2000,alpha=1})
			loadedEndings.green =1
		elseif (blue >= red) and (blue >= yellow) and (blue >= green) and (blue >= purple) and (blue >=50) then
			transition.to(mix_blue,{time=2000,alpha=1})
			 loadedEndings.blue=1
		elseif (purple >= red) and (purple >= yellow) and (purple >= green) and (purple >= blue) and (purple >= 50) then
			transition.to(mix_purple,{time=2000,alpha=1})
			loadedEndings.purple =1
		else
			pastel()
		end

--호감도 40 이하
	elseif (friendship <= 40) and (fun <= 40) and (hobby <= 40 ) and (study <= 40) and (red <= 40) and (yellow <= 40) and (green <= 40) and (blue <= 40) and (purple <= 40) then
		--할로윈 이벤트에 따라 굿/배드 나뉨
		if loadedSettings.goodWhite == 1 then

			loadedEndings.good = 1

			transition.to(good,{time=2000,alpha=1})
		elseif loadedSettings.badWhite == 1 then
			loadedEndings.bad = 1
			transition.to(bad,{time=2000,alpha=1})
		else
			loadedEndings.bad = 1
			transition.to(bad,{time=2000,alpha=1})
		end
		
--파스텔 엔딩
	else
		pastel()
	end

	local function goback(event)
		if event.phase == "began" then 
			composer.removeScene("view99end")
			audio.pause(home)
			local titleMusic = audio.loadStream( "음악/타이틀.mp3" )
			audio.play(titleMusic)
			composer.gotoScene("title")

		end
	end

-- 화면이 점차 밝아짐
	local title = display.newImage("이미지/엔딩/타이틀로.png")
	title.x,title.y = display.contentWidth*0.0180,display.contentHeight*0.0277
	sceneGroup:insert(title)
	title.alpha = 0
	title.anchorX, title.anchorY = 0,0
	title:addEventListener("touch",goback)
	transition.to(title,{time=2000,alpha=1,delay=3000})

-- 모든 엔딩 봤을 떄 bonus 엔딩 확인 가능
	if (best == 1) and (friend1 == 1) and (friend2==2) and (friend3==1) and (friend4==1) and (friend5 == 1) and (mix1 == 1) and (mix2 == 1) and (mix3 == 1) and (mix4 == 1) and (mix5 == 1) and (mix6 == 1) and (pastel1==1) and (pastel2 == 1) and (pastel3==1) and (pastel4 == 1) and (pastel5 == 1) and (hidden1==1) and (hidden2 == 1) then
		loadedEndings.bonus = 1 
	end
	if loadedEndings.end_num == 0 then 
		loadedEndings.end_num=loadedEndings.end_num+1
	end

	loadsave.saveTable(loadedEndings,"endings.json")

	

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
		composer.removeScene("viewmonth5_event")
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