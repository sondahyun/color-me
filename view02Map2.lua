-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------
-- 게임 설명창
local composer = require( "composer" )
local scene = composer.newScene()
local loadsave = require( "loadsave" )

function scene:create( event )
	local sceneGroup = self.view

	local loadedSettings = loadsave.loadTable( "settings.json" )
	local click1 = audio.loadStream( "음악/클릭1.wav" )
	local background = display.newImageRect("이미지/마을/배경2.png",display.contentWidth, display.contentHeight)
	background.x,background.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background)

-- 화면 전환
	local options={
		effect="crossFade"
	}


-- 마을이미지
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
	store.x,store.y = display.contentWidth*0.5,display.contentHeight*0.505
	store.name = "7"
	sceneGroup:insert(store)

-- 타겟 컬러 값 가져오기
	color = composer.getVariable("color")

	local function gotomap(event)
		if event.phase == "began" then
			composer.removeScene("view02Map2")
			composer.gotoScene("view02Map")
		end

	end


-- 게임 이동
	local function gotogame(event)
		-- 이벤트 조건 설정
		loadedSettings.game_num = loadedSettings.game_num + 1
		
		if loadedSettings.month == 5 then
			if loadedSettings.month6_event == 0 then
				loadedSettings.month6_event = loadedSettings.month6_event + 1
			end
		end
		loadsave.saveTable(loadedSettings,"settings.json")
		
		if color == "1" then
			composer.removeScene("view02Map2")
			composer.gotoScene( "view05Dudu",options  )
		elseif color == "2" then
			composer.removeScene("view02Map2")
			composer.gotoScene( "view07Number" ,options )
		elseif color == "3" then
			composer.removeScene("view02Map2")
			composer.gotoScene( "view09Lemon" ,options )
		elseif color == "4"  then
			composer.removeScene("view02Map2")
			composer.gotoScene( "view18ring",options  )
		else
			composer.removeScene("view02Map2")
			composer.gotoScene( "view21card" ,options )
		end
	end


	local function exitt()
		exit = display.newImage("이미지/공통/x버튼.png")
		sceneGroup:insert(exit)
		exit.x, exit.y = display.contentWidth*0.948, display.contentHeight*0.09
		exit:addEventListener("touch",gotomap)
	end

	local function exitt2()
		exit2 = display.newImage("이미지/공통/x버튼.png")
		sceneGroup:insert(exit2)
		exit2.x, exit2.y = display.contentWidth*0.763, display.contentHeight*0.289
		exit2:addEventListener("touch",gotomap)
	end

	local function start()
		start = display.newImage("이미지/공통/start버튼.png")
		start.x, start.y =  display.contentWidth*0.399, display.contentHeight*0.642
		sceneGroup:insert(start)
		start:addEventListener("touch",gotogame)
	end



--월별 마을 방문 

	
--게임이동

			if loadedSettings.game_num ~= 1 then
				if color == "1" then
				--빨강게임 이동
					duduinfo = display.newImage("이미지/미니게임/마을지도_게임설명창/미니게임_게임설명(빨강마을).png")
					duduinfo.x, duduinfo.y = display.contentWidth/2, display.contentHeight/2
					sceneGroup:insert(duduinfo)

					exitt()
					exitt2()
					start()

				elseif color == "2" then
				-- 파랑게임 이동
					local numinfo = display.newImage("이미지/미니게임/마을지도_게임설명창/미니게임_게임설명(파랑마을).png")
					numinfo.x, numinfo.y = display.contentWidth/2, display.contentHeight/2
					sceneGroup:insert(numinfo)

					exitt()
					exitt2()
					start()
					
				elseif color == "3" then
					-- 노랑게임 이동
					local lemoninfo = display.newImage("이미지/미니게임/마을지도_게임설명창/미니게임_게임설명(노랑마을).png")
					lemoninfo.x, lemoninfo.y = display.contentWidth/2, display.contentHeight/2
					sceneGroup:insert(lemoninfo)

					exitt()
					exitt2()
					start()
				elseif color == "4" then
				-- 보라게임 이동
					print("보라")
					local ringinfo = display.newImage("이미지/미니게임/마을지도_게임설명창/미니게임_게임설명(보라마을).png")
					ringinfo.x, ringinfo.y = display.contentWidth/2, display.contentHeight/2
					sceneGroup:insert(ringinfo)

					exitt()
					exitt2()
					start()
				elseif color == "5" then
				-- 초록게임 이동
					print("초록")
					local miniinfo = display.newImage("이미지/미니게임/마을지도_게임설명창/미니게임_게임설명(초록마을).png")
					miniinfo.x, miniinfo.y = display.contentWidth/2, display.contentHeight/2
					sceneGroup:insert(miniinfo)

					exitt()
					exitt2()
					start()
				end

			else 
				composer.removeScene("view02Map2")
				composer.gotoScene( "view15limited" )
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

		composer.removeScene("view02Map2")
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