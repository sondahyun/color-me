--메인캐릭터의 방

local composer = require( "composer" )
local scene = composer.newScene()
local loadsave = require("loadsave")
local json = require( "json" )

function scene:create( event )
	local sceneGroup = self.view

	local loadedSettings = loadsave.loadTable( "settings.json" )
-- 배경 객체
	local background = display.newImageRect("이미지/홈/배경/가구포함.png",display.contentWidth, display.contentHeight)
	background.x,background.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background)

-- 스탯 바 객체 생성.
	local play = display.newRect(154,65, loadedSettings.fun*2.25 ,25)
	play.anchorX,play.anchorY = 0,0.5
	play:setFillColor(0.643,0.384,0.666)
	sceneGroup:insert(play)

-- 스탯창 객체
	local stat = display.newImage("이미지/홈/스탯창.png")
	stat.x, stat.y = display.contentWidth*0.18,display.contentHeight*0.15
	sceneGroup:insert(stat)

-- 코인 창 객체 
	local coin = display.newImage("이미지/공통/코인표시창.png")
	sceneGroup:insert(coin)
	coin.x, coin.y = display.contentWidth*0.9, display.contentHeight*0.08

-- 코인 객체, 글씨체 및 세이브 파일에 담겨진 보유 코인을 text에 담음
	local money = display.newText("",display.contentWidth*0.96, display.contentHeight*0.075,"font/NanumSquare_acB.ttf")
	money:setFillColor(0.964, 0.462, 0.411)
	money.anchorX = 1
	money.text = loadedSettings.money 
	money.size = 53
	sceneGroup:insert(money)

	local black = display.newRect(display.contentWidth/2,display.contentHeight/2,display.contentWidth,display.contentHeight)
	black.alpha = 0.5
	black:setFillColor(0)
	sceneGroup:insert(black)

	-- showoverlay 함수 사용 option
    local options = {
        isModal = true
    }

	--배경

	local function go_back(event)
		if event.phase == "began" then
			composer.removeScene("view00Room_friend")
			composer.gotoScene("view00Room")
		end
	end

	local function go_popup(event)
		if event.phase == "began" then
			composer.showOverlay("zopup_update",options)
			--composer.gotoScene("view00Room")
		end
	end

	local function popup(event)
		if event.phase == "began" then
			composer.setVariable("color",event.target.name)
			composer.showOverlay("view00Room_friend_popup",options)
		end
	end

	local exit = display.newImage("이미지/공통/x버튼.png")
	exit.x, exit.y = display.contentWidth*0.9207, display.contentHeight*0.0438
	exit.anchorX, exit.anchorY = 0,0
	sceneGroup:insert(exit)
	exit:addEventListener("touch",go_back)


	local tag2 = display.newImage("이미지/앨범/친구목록/태그2.png")
	tag2.x,tag2.y = display.contentWidth*0.0989,display.contentHeight*0.0319
	tag2.anchorX, tag2.anchorY= 0,0
	sceneGroup:insert(tag2)
	tag2:addEventListener("touch",go_popup)


	local background_friend = display.newImage("이미지/앨범/친구목록/배경.png")
	background_friend.x,background_friend.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background_friend)

	local tag = display.newImage("이미지/앨범/친구목록/태그.png")
	tag.x,tag.y = display.contentWidth*0.1676,display.contentHeight*0.0319
	tag.anchorX, tag.anchorY= 0,0
	sceneGroup:insert(tag)

	local friend = {}
	local xx ={
		display.contentWidth*0.5372,
		display.contentWidth*0.7744,
		display.contentWidth*0.5848,
		display.contentWidth*0.6558,
		display.contentWidth*0.7269
	}
	local yy ={
		display.contentHeight*0.3758,
		display.contentHeight*0.3758,
		display.contentHeight*0.6163,
		display.contentHeight*0.2284,
		display.contentHeight*0.6163
	}

	print("dfsaij;lfks")
	for i= 1,5 do
		friend[i] = display.newImage("이미지/앨범/친구목록/" .. i .. ".png")
		friend[i].x=xx[i]
		friend[i].y=yy[i]
		friend[i].anchorX,friend[i].anchorY = 0,0
		friend[i].name = i
		friend[i]:addEventListener("touch",popup)
		sceneGroup:insert(friend[i])
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