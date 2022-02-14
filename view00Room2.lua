-----------------------------------------------------------------------------------------
--
-- view00Room.lua
--
-----------------------------------------------------------------------------------------
---튜토리얼---

local composer = require( "composer" )
local scene = composer.newScene()
local loadsave = require("loadsave")

function scene:create( event )
	local sceneGroup = self.view
	local click1 = audio.loadStream( "음악/클릭2.wav" )

	local sch = display.newImage("이미지/홈/버튼/스케줄.png")
	sch.x,sch.y = display.contentWidth*0.75+13,display.contentHeight*0.9
	sceneGroup:insert(sch)
	

	local bag = display.newImage("이미지/홈/버튼/가방.png")
	bag.x,bag.y = display.contentWidth*0.835+13,display.contentHeight*0.9
	sceneGroup:insert(bag)
	

	local map = display.newImage("이미지/홈/버튼/지도.png")
	map.x,map.y = display.contentWidth*0.920+13,display.contentHeight*0.9
	sceneGroup:insert(map)
	

	local friend = display.newImage("이미지/홈/버튼/앨범.png")
	sceneGroup:insert(friend)
	friend.x, friend.y = display.contentWidth*0.06, display.contentHeight*0.88
	

-- 스탯창 객체
	local stat = display.newImage("이미지/홈/스탯창.png")
	stat.x, stat.y = display.contentWidth*0.18,display.contentHeight*0.15
	sceneGroup:insert(stat)

-- 코인 창 객체 
	local coin = display.newImage("이미지/공통/코인표시창.png")
	sceneGroup:insert(coin)
	coin.x, coin.y = display.contentWidth*0.9, display.contentHeight*0.08

-- 코인 객체, 글씨체 및 세이브 파일에 담겨진 보유 코인을 text에 담음
	local money = display.newText("",1230,58,"font/NanumSquare_acB.ttf")
	money:setFillColor(0.964, 0.462, 0.411)
	money.anchorX = 1
	money.text = 200
	money.size = 45
	sceneGroup:insert(money)

	local black = display.newRect(display.contentWidth/2,display.contentHeight/2,display.contentWidth,display.contentHeight)
	black.alpha = 0.5
	black:setFillColor(0)
	sceneGroup:insert(black)




	-- 튜토리얼 장면 이미지 파일
	local scen = {
		"이미지/홈/가이드/1.png",
		"이미지/홈/가이드/2.png",
		"이미지/홈/가이드/3.png",
		"이미지/홈/가이드/4.png",
		"이미지/홈/가이드/5.png",
		"이미지/홈/가이드/6.png",
		"이미지/홈/가이드/7.png",
		"이미지/홈/가이드/8.png",
	}

	-- 객체 생성
	local show = {}

	for i=1,8 do
		show[i] = display.newImage(scen[i])
		show[i].x, show[i].y = display.contentWidth/2,display.contentHeight/2
		sceneGroup:insert(show[i])
		show[i].alpha = 0
	end

	-- 장면 넘김
	local i = 1

	-- 다음 장면 넘김
	local function next(event)
		if event.phase == "began" then 
			if i < 8 then
				i = i+1
				show[i-1].alpha = 0
				show[i].alpha = 1

			end
		end
	end

	-- 이전 장면 되돌아가기
	local function former(event)
		if event.phase == "began" then 
			if i > 1 then
				i = i-1
				show[i+1].alpha = 0
				show[i].alpha = 1

			end
		end
	end

	-- 기본 값.
	show[1].alpha = 1


	-- 다음 장면 버튼
	local move= display.newImage("이미지/홈/가이드/오른쪽버튼.png")
	move.x, move.y = 1220, display.contentHeight/2
	move.rotation = 180
	move:addEventListener("touch",next)
	sceneGroup:insert(move)
	
	-- 이전 장면 버튼
	local move1= display.newImage("이미지/홈/가이드/왼쪽버튼.png")
	move1.x, move1.y = 60, display.contentHeight/2
	move1:addEventListener("touch",former)
	sceneGroup:insert(move1)

	local function gotomap(event)
		if event.phase == "began" then
			composer.hideOverlay("view00Room2")

		end

	end

	local exit = display.newImage("이미지/공통/x버튼.png")
	sceneGroup:insert(exit)
	exit.x, exit.y = display.contentWidth*0.89, display.contentHeight*0.17
	exit:addEventListener("touch",gotomap)

	

	


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
		--composer.removeScene("view00Room")
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