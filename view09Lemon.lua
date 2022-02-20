-----------------------------------------------------------------------------------------
--
-- view09Lemon.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

-- 배경 객체
	local background = display.newImageRect("이미지/미니게임/미니게임_노랑마을/미니게임_레몬게임 배경(노랑마을).png",display.contentWidth, display.contentHeight)
	background.x,background.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background)

-- physics 생성 시작
	local phyics = require "physics"
	phyics.start()

-- 시간, 점수 객체
	local time = display.newImageRect("이미지/미니게임/미니게임_시간타이머.png", display.contentWidth/7.91, display.contentHeight/3.78)
	time.anchorX, time.anchorY =0,0
	time.x,time.y = display.contentWidth/1.180, display.contentHeight/21.53
	sceneGroup:insert(time)

	local score = display.newImageRect("이미지/미니게임/미니게임_코인창.png", display.contentWidth/9.3, display.contentHeight/4.26)
	score.anchorX, score.anchorY =0,0
	score.x,score.y = display.contentWidth/33.166, display.contentHeight/13.2482826
	sceneGroup:insert(score)

	local score_num = 0
	local score1 = 15
	local score_num = 15

	local showScore = display.newText(score1,display.contentWidth/12,display.contentHeight/5.555,"font/잘풀리는오늘 Medium.ttf") 
	showScore:setFillColor(1,0,0) 
	showScore.size = 73
	sceneGroup:insert(showScore)

	local limit = 20
	local showLimit = display.newText(limit,display.contentWidth/1.1,display.contentHeight/5.555,"font/잘풀리는오늘 Medium.ttf")
	
	showLimit:setFillColor(1,0,0)
	showLimit.size =80
	sceneGroup:insert(showLimit)

-- 바닥 객체, phyics body 추가
	local floor = display.newImage("이미지/미니게임/미니게임_노랑마을/미니게임_레몬게임 바닥(노랑마을).png")
	floor.name = "floor"
	floor.x=display.contentWidth/2 
	floor.y=display.contentHeight/1.105
	phyics.addBody(floor,"static")
	sceneGroup:insert(floor)

	local lemon = {}
	local lemons = display.newGroup()

	local n
	local m = 0
	local k 
	local s 

-- 랜덤 lemon 생성
	local function newlemon()
			m = m+1
			n = math.random(display.contentWidth*0.1,display.contentWidth*0.9)
			k = math.random(1,5)
			s = math.random(1,2)

			-- 레몬과 벌레 렌덤으로 하나 내려옴
			if s ==1   then
				lemon[1] = display.newImageRect("이미지/미니게임/미니게임_노랑마을/미니게임_레몬게임 레몬(노랑마을).png", display.contentWidth/22.0233999, display.contentHeight/16.0810006)
				lemon[1].name = "lemon"
			end
			if s ==2 then
				lemon[2] = display.newImageRect("이미지/미니게임/미니게임_노랑마을/미니게임_레몬게임 메모지렁이(노랑마을).png", display.contentWidth/13.9251523, display.contentHeight/11.568)
				lemon[2].name = "bug"
			end

			-- 레몬/벌레 처음 위치 + body 추가
			lemon[s].x, lemon[s].y = n,-25
			phyics.addBody(lemon[s],{density=1.0, friction=0,bounce=0, radius=25})
			lemon[s].gravityScale = 0.5 *k
			sceneGroup:insert(lemon[s])

			score:toFront()
			time:toFront()
			showScore:toFront()
			showLimit:toFront()

	end

-- pen 객체 추가 및 마우스에 따라 x축 변화

	local pen = display.newImageRect("이미지/미니게임/미니게임_노랑마을/미니게임_레몬게임 바구니(노랑마을).png",display.contentWidth/11.0471807,display.contentHeight/3.37922403)
	pen.name = "pen"
	pen.anchorY = 0
	pen.x,pen.y = display.contentWidth/2.199, display.contentHeight/1.46260208
	phyics.addBody(pen,"static")
	sceneGroup:insert(pen)

	function move1(event)
		if event.x < display.contentWidth*0.1 then
			pen.x = display.contentWidth*0.1 
		elseif event.x > display.contentWidth*0.9 then
			pen.x = display.contentWidth*0.9
		else
			pen.x = event.x
		end
	end

	function remove1(object)
		object:remove()
	end

-- 레몬과 벌레가 부딪혔을 때 점수 상승 및 점수 하락
	function oncoll(self,event)
		if event.phase == "began" then
			if event.other.name == "lemon" or event.other.name == "bug" then
				if event.target.name == "floor" then
					timer.performWithDelay( 1000,event.other:removeSelf())
					event.other=nil
					m = m-1
				end
				if event.target.name == "pen" and event.other.y < display.contentHeight/1.444719 then
					if event.other.name == "bug" then
						if score_num > 0 then
							score_num = score_num - 1
						end
							if score_num%5==0 then
								score1 = score_num
								showScore.text = score1
							end 
					end
					event.other:removeSelf()
					event.other=nil
					m = m-1
				end
			end
		end
	end

	-- 타임어택

	local function timeAttack( event )

		limit = limit - 1
		showLimit.text = limit

		if limit == 0 then
			Runtime:removeEventListener("mouse",move1)
			timer.cancelAll()
			composer.setVariable("score2", score1)
			composer.removeScene("view09Lemon")
			composer.gotoScene("view10Lemon")
		end
	end
	 
	timer.performWithDelay( 1000, timeAttack, 0 )

	Runtime:addEventListener("mouse",move1)

	-- 0.7초마다 레몬 생성.
	timer.performWithDelay( 700, newlemon,-1)
	timer.performWithDelay( 700, newlemon,-1)
	pen.collision = oncoll
    pen:addEventListener( "collision" )
    floor.collision = oncoll
    floor:addEventListener( "collision" )

	pen:toFront()
	showLimit:toFront()


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
		composer.removeScene("view09Lemon")
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