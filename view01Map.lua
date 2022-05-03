--마을 맵

local composer = require( "composer" )
local scene = composer.newScene()
local loadsave = require( "loadsave" )

function scene:create( event )
	local sceneGroup = self.view
	
	local background = display.newImageRect("이미지/마을/배경2.png",display.contentWidth, display.contentHeight)
	background.x,background.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background)

	local loadedSettings = loadsave.loadTable( "settings.json" )
    local loadedEndings = loadsave.loadTable( "endings.json" )

-- 이벤트 발생 조건 설정.

	if loadedSettings.month == 0 then
		if loadedSettings.month1_event ==1 then
			loadedSettings.month1_event = loadedSettings.month1_event + 1
			loadsave.saveTable(loadedSettings,"settings.json")
			composer.removeScene("view01Map")
			composer.gotoScene("viewmonth1_event")
			
		end
	end

	if loadedSettings.month == 5 then
		if loadedSettings.month6_event == 1 then
			loadedSettings.month6_event = loadedSettings.month6_event + 1
			loadsave.saveTable(loadedSettings,"settings.json")
			composer.removeScene("view01Map")
			composer.gotoScene("viewmonth6_event")
		end
	end


	


-- 마을 맵 마을 객체 생성.
	local red = display.newImage("이미지/마을/빨강.png")
	red.x,red.y = display.contentWidth*0.223,display.contentHeight*0.297
	red.name = "1"
	sceneGroup:insert(red)
	
	local blue = display.newImage("이미지/마을/파랑.png")
	blue.x,blue.y = display.contentWidth*0.794,display.contentHeight*0.29
	blue.name = "2"
	sceneGroup:insert(blue)

	local yellow = display.newImage("이미지/마을/노랑.png")
	yellow.x,yellow.y = display.contentWidth*0.5,display.contentHeight*0.185
	
	yellow.name = "3"
	sceneGroup:insert(yellow)

	local purple = display.newImage("이미지/마을/보라.png")
	purple.x,purple.y = display.contentWidth*0.217,display.contentHeight*0.698
	purple.name = "4"
	sceneGroup:insert(purple)

	local green = display.newImage("이미지/마을/초록.png")
	green.x,green.y = display.contentWidth*0.785,display.contentHeight*0.713
	green.name = "5"
	sceneGroup:insert(green)

	local em = display.newImage("이미지/마을/임시거처.png")
	em.x,em.y = display.contentWidth*0.5,display.contentHeight*0.829
	em.name = "6"
	sceneGroup:insert(em)

	local store = display.newImage("이미지/마을/상점.png")
	store.x,store.y = display.contentWidth*0.437,display.contentHeight*0.505
	store.name = "7"
	sceneGroup:insert(store)

	local store2 = display.newImage("이미지/마을/꾸미기샵.png")
	store2.x,store2.y = display.contentWidth*0.588,display.contentHeight*0.532
	store2.name = "8"
	sceneGroup:insert(store2)

	local click1 = audio.loadStream( "음악/스침.wav" )
	
-- 마을 객체 커서 범위 설정. 범위 밖으로 나가면 마을 크기 작아지고 안으로 들어가면 마을 크기 커짐.
	local i = 0
	local function bigbig (event)
		
		if (event.target.x-event.x)^2 + (event.target.y-event.y)^2 < 110^2 then
			-- i값을 지정해 놓는 이유는 범위 안에서는 크기가 더 늘어나거나 줄어들지 않고, 소리가 연이어 나오지 않음.
			if i == 0 then
				local backgroundMusicChannel = audio.play(click1)
				event.target.width = event.target.width*1.1
				event.target.height = event.target.height*1.1
				i = i + 1
			end
		
		elseif (event.target.x-event.x)^2 + (event.target.y-event.y)^2 > 110^2 then
			if i == 1 then
				event.target.width =event.target.width/11*10
				event.target.height =event.target.height/11*10
				i = i - 1 
			end
			
		end
	end

	local color = 0

	
-- 리스너 함수 생성
	local function touch_ui (event)
		if event.phase == "began" then
			color = event.target.name

			if color == "6" then
				local click01 = audio.play(click1)
				local home = audio.loadStream( "음악/집.mp3" )
				audio.setVolume( loadedEndings.logValue )
				audio.play(home)
				loadedEndings.bgMusic = "음악/집.mp3"
        		loadsave.saveTable(loadedEndings,"endings.json")
				composer.removeScene("view01Map")
				composer.gotoScene( "view00Room" )

			elseif color == "7" then
				local click01 = audio.play(click1)
				local storeMusic = audio.loadStream( "음악/상점.mp3" )
				audio.setVolume( loadedEndings.logValue )
				audio.play(storeMusic);
				loadedEndings.bgMusic = "음악/상점.mp3"
        		loadsave.saveTable(loadedEndings,"endings.json")
				composer.removeScene("view1Map")
				composer.gotoScene( "view04Store" )

			elseif color == "8" then
				local click01 = audio.play(click1)
				local storeMusic = audio.loadStream( "음악/상점.mp3" )
				audio.setVolume( loadedEndings.logValue )
				audio.play(storeMusic);
				loadedEndings.bgMusic = "음악/상점.mp3"
        		loadsave.saveTable(loadedEndings,"endings.json")
				composer.removeScene("view1Map")
				composer.gotoScene( "view04Deco" )

			else
				local click01 = audio.play(click1)
				composer.setVariable("color", color)
				composer.removeScene("view1Map")
				composer.gotoScene("view02Map")

			end
		end
	end

-- 리스너 추가
	red:addEventListener("mouse",bigbig)
	blue:addEventListener("mouse",bigbig)
	yellow:addEventListener("mouse",bigbig)
	purple:addEventListener("mouse",bigbig)
	green:addEventListener("mouse",bigbig)
	em:addEventListener("mouse",bigbig)
	store:addEventListener("mouse",bigbig)
	store2:addEventListener("mouse",bigbig)

	red:addEventListener("touch",touch_ui)
	blue:addEventListener("touch",touch_ui)
	yellow:addEventListener("touch",touch_ui)
	purple:addEventListener("touch",touch_ui)
	green:addEventListener("touch",touch_ui)
	store:addEventListener("touch",touch_ui)
	em:addEventListener("touch",touch_ui)
	store2:addEventListener("touch",touch_ui)





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
		composer.removeScene("view01Map")
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