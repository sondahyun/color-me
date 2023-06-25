--엔딩 화면
local composer = require( "composer" )
local scene = composer.newScene()
local loadsave = require( "loadsave" )
local objectsToDestroy = {}
function scene:create( event )
	local sceneGroup = self.view
	local loadedSettings = loadsave.loadTable( "settings.json" )
	local loadedEndings = loadsave.loadTable( "endings.json" )

	local endingMusic = audio.loadStream("음악/엔딩.mp3" )
 	audio.setVolume( loadedEndings.logValue )
    audio.play(endingMusic)

 	local options = {
        isModal = true
        
    }

	--우정 엔딩--
	local back = display.newRect(display.contentWidth/2,display.contentHeight/2, display.contentWidth,display.contentHeight)
	back:setFillColor(0)
	sceneGroup:insert(back)
	table.insert(objectsToDestroy, back)

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

	local colorName = {
		"빨강",
		"노랑",
		"초록",
		"보라",
		"파랑"
	}

	function max(...)
	    local args = {...}
	    local maxVal = args[1]
	    local maxColorCode = 1
	  
	    for i = 2, #args do
	        if args[i] > maxVal then
	            maxVal = args[i]
	            maxColorCode = i 
	        end
	    end
	  
	    return maxVal, maxColorCode
	end

	maxColorVal, maxColorCode = max( red, yellow, green, purple, blue ) -- max 호감도 스탯, max 호감도 컬러
	maxStatVal, maxStatCode = max( study, fun, hobby, friendship ) -- max 활동 스탯, max 활동 코드( 1: 공부, 2: 취미 , 3: hobby, 4 : 우정 )

	print( maxColorVal .. colorName[maxColorCode] )
	print( maxStatVal .. maxStatCode )

	endingName = ""

	pastel_end = {}
	for i = 1, 5 do
	  pastel_end[i] = 0
	end

	hidden_end = {}
	for i = 1, 3 do
	  hidden_end[i] = 0
	end

	mix_end = {}
	for i = 1, 6 do -- 주황, 청록, 바이올렛 순서
	  mix_end[i] = 0
	end

	friendship_end = {}
	for i = 1, 5 do
	  friendship_end[i] = 0
	end

-- 파스텔 엔딩 (조건 만족하지 않는 경우 나타남)
	local function pastel()
		endingName = "파스텔" .. colorName[maxColorCode]
		pastel_end[maxColorCode] = 1
	end

--활동/공부/취미 엔딩 (혼합)
	if (study >= 40) and (hobby >= 40) and (fun >= 40) and (friendship >= 40) then -- 모든 활동 스탯이 80이상일 경우 무지개
		hidden_end[3] = 1
		endingName = "무지개"
		loadedEndings.rainbow = hidden_end[3]
	elseif (maxStatVal >= 35) and (maxStatCode == 1) then -- 공부스탯이 70이상일 경우
		
		if (red >= 25) and (yellow >= 25) then
			endingName = "혼합(공부)주황"
			mix_end[1] = 1
			loadedEndings.orange = mix_end[1]

		elseif (blue >= 25) and (green >= 25) then
			endingName = "혼합(공부)청록"
			mix_end[2] = 1
			loadedEndings.chung = mix_end[2]
		elseif (red >= 25) and (blue >=25) and (purple>=30) then
			endingName = "혼합(공부)바이올렛"
			mix_end[3] = 1
			loadedEndings.violet = mix_end[3]
		else
			pastel()
		end
	elseif ((maxStatCode == 2) or (maxStatCode == 3)) and (maxStatVal >= 35) then -- hobby or fun 스탯이 70이상.
		if (red >= 25) and (yellow >= 25) then
			endingName = "혼합(활동)주황"
			mix_end[4] = 1
			loadedEndings.act_orange = mix_end[4]
		elseif (blue >= 25) and (green >= 25) then
			endingName = "혼합(활동)청록"
			mix_end[5] = 1
			loadedEndings.act_chung= mix_end[5]
		elseif (red >= 25) and (blue >=25) and (purple>=25) then
			endingName = "혼합(활동)바이올렛"
			mix_end[6] = 1
			loadedEndings.act_violet = mix_end[6]
		else
			pastel()
		end


--우정엔딩
	elseif (maxStatCode == 4) or (maxStatVal >= 35) then -- 우정스탯이 70 이상
		if  (maxColorVal >= 25) then
			endingName = "우정" .. colorName[maxColorCode]
			friendship_end[maxColorCode] = 1
			if (colorName[maxColorCode] == "빨강") then
				loadedEndings.red = 1
			elseif (colorName[maxColorCode] == "노랑") then
				loadedEndings.yellow = 1
			elseif (colorName[maxColorCode] == "초록") then
				loadedEndings.green = 1
			elseif (colorName[maxColorCode] == "파랑") then
				loadedEndings.blue = 1
			elseif (colorName[maxColorCode] == "보라") then
				loadedEndings.purple = 1
			end
		else
			pastel()
		end

--호감도 40 이하
	elseif (maxStatVal <= 20) or (maxColorVal <= 20) then -- 활동 스탯 및 호감도 스탯이 40이하일 경우
		--할로윈 이벤트에 따라 굿/배드 나뉨
		if loadedSettings.goodWhite == 1 then
			hidden_end[1] = 1
			loadedEndings.good = hidden_end[1] 
			endingName = "굿"
			
		elseif loadedSettings.badWhite == 1 then
			hidden_end[2] = 1
			loadedEndings.bad = 1
			endingName = "배드"
		else
			hidden_end[2] = 1
			loadedEndings.bad = hidden_end[2]
			endingName = "배드"
		end
		
--파스텔 엔딩
	else
		pastel()
	end

	transition.to(good,{time=2000,alpha=1})

	local function goback(event)
		if event.phase == "began" then 
			composer.removeScene("view99end")
			audio.pause(home)
			local titleMusic = audio.loadStream( "음악/메인 테마곡.mp3" )
			audio.play(titleMusic)
			composer.gotoScene("title")

		end
	end

	-- 배경
	local background = display.newImage("이미지/엔딩/엔딩카드/" .. endingName .. ".png")
	background.x, background.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background)
	background.alpha = 0
	table.insert(objectsToDestroy, background)
	transition.to(background,{time=2000,alpha=1,delay=2000})

	-- 화면이 점차 밝아짐
	local title = display.newImage("이미지/엔딩/타이틀로.png")
	title.x,title.y = display.contentWidth*0.0180,display.contentHeight*0.0277
	sceneGroup:insert(title)
	title.alpha = 0
	title.anchorX, title.anchorY = 0,0
	title:addEventListener("touch",goback)
	table.insert(objectsToDestroy, title)
	transition.to(title,{time=2000,alpha=1,delay=3000})

	-- 로드관련 코드
	if loadedEndings.end_num == 0 then 
		loadedEndings.end_num=loadedEndings.end_num+1
	end
	-- 저장
	loadedEndings.pastel_red = pastel_end[1]
	loadedEndings.pastel_yellow = pastel_end[2]
	loadedEndings.pastel_green = pastel_end[3]
	loadedEndings.pastel_purple = pastel_end[4]
	loadedEndings.pastel_blue = pastel_end[5]

	loadsave.saveTable(loadedEndings,"endings.json")

end

local function destroyObjects()
    for i = 1, #objectsToDestroy do
        display.remove(objectsToDestroy[i])
        objectsToDestroy[i] = nil
    end
    objectsToDestroy = nil
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
	destroyObjects()
	
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