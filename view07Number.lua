--파랑마을 카드 게임

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	-- 배경 설정
	local background = display.newImageRect("이미지/미니게임/미니게임_파랑마을/미니게임_숫자게임 배경(파랑마을).png",display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2
	sceneGroup:insert( background )

	--타이머와 코인 그림--
	local time = display.newImageRect("이미지/미니게임/미니게임_시간타이머.png", display.contentWidth/7.91, display.contentHeight/3.78)
	time.anchorX, time.anchorY =0,0
	time.x,time.y = display.contentWidth/1.180, display.contentHeight/21.53
	sceneGroup:insert(time)
	
	local limit = 15
	local showLimit = display.newText(limit,display.contentWidth/1.1,display.contentHeight/5.555,"font/잘풀리는오늘 Medium.ttf")
	
	showLimit:setFillColor(1,0,0)
	showLimit.size = 80
	sceneGroup:insert(showLimit)



	--카드 생성
	local cards = { }
	local cardGroup = display.newGroup()

	for i = 1, 16 do
		cards[i] = 0
	end

	currentNum = 1

	--카드 클릭시
	local function click( event )
		if event.target.id == 16 and event.target.id == currentNum then
			timer.cancelAll()
			if limit > 10 then
				composer.setVariable("score2", 15)
			else
				composer.setVariable("score2", 10)
			end
			composer.removeScene("view07Number")
			composer.gotoScene("view08Number")
		elseif event.target.id == currentNum then
			display.remove(event.target)
			currentNum = currentNum + 1
		end
	end

	--카드에 이미지 및 아이디 부여
	for i = 1, 16 do
		local card = display.newImage(cardGroup, "이미지/미니게임/미니게임_파랑마을/미니게임_숫자게임 구슬" .. i .. "(파랑마을).png")
		card:addEventListener("touch", click)
		card.id = i

		local looping = 1

		while looping == 1 do
			local num = math.random(1, 16)
			if cards[num] == 0 then
				cards[num] = card
				looping = 0
			end
		end
	end


	--카드 위치 설정
	local startX, startY =  display.contentWidth/2.3 , display.contentHeight/5.3
	local currentX, currentY = startX, startY

	for i = 1, 16 do
		cards[i].x, cards[i].y =  currentX, currentY
		if i == 2 then
			currentX = display.contentWidth/4.5
			currentY = display.contentHeight/2.45
		elseif i == 7 then
			currentX = display.contentWidth/3.3
			currentY = display.contentHeight/1.6
		elseif i == 11 then
			currentX = display.contentWidth/4.3
			currentY = display.contentHeight/1.2
		else
			currentX = currentX + display.contentWidth/7.3988
		end
	end

	sceneGroup:insert(cardGroup)


	-- 시간 제한 --
	local function timeAttack( event )
		limit = limit - 1
		showLimit.text = limit

		if limit == 0 then
			composer.setVariable("score2", 5)
			composer.removeScene("view07Number")
			composer.gotoScene("view08Number")
		end
	end
	 
	timer.performWithDelay( 1500, timeAttack, 0)

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

local function catch( event )
	if ( event.target.isFocus ) then
		display.remove(event.target)
	end
end


---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene