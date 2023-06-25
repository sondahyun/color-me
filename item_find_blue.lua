-----------------------------------------------------------------------------------------
--
-- view09Lemon.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	composer.setVariable( "color", 2 )

-- 클릭 객체

	local S1=display.newRect(display.contentWidth*0.365, display.contentHeight*0.41,60,60)
	S1:setFillColor(0)
	sceneGroup:insert(S1)

-- 배경 객체
	local background = display.newImageRect("이미지/대화/우정배경/파랑.png",display.contentWidth, display.contentHeight)
	background.x,background.y = display.contentWidth*0.5,display.contentHeight*0.5
	sceneGroup:insert(background)

	local frame2= display.newImage("이미지/숨은그림찾기/틀2.png")
	frame2.x,frame2.y = display.contentWidth*0.5,display.contentHeight*0.5
	sceneGroup:insert(frame2)

	local pic = display.newImageRect("이미지/숨은그림찾기/숨은그림찾기-확성기.png",display.contentWidth*0.5, display.contentHeight*0.9)
	pic.x,pic.y = display.contentWidth*0.5,display.contentHeight*0.5
	sceneGroup:insert(pic)

	local mic = display.newImage("이미지/숨은그림찾기/정답-확성기.png")
	mic.x,mic.y = display.contentWidth*0.367,display.contentHeight*0.41
	mic.alpha=0
	sceneGroup:insert(mic)

	local frame1 = display.newImage("이미지/숨은그림찾기/틀1.png")
	frame1.x,frame1.y = display.contentWidth*0.5,display.contentHeight*0.5
	sceneGroup:insert(frame1)

-- 기회 객체
	local try1 = display.newImage("이미지/숨은그림찾기/기회.png")
	try1.x,try1.y = display.contentWidth*0.173,display.contentHeight*0.142
	sceneGroup:insert(try1)

	local try2 = display.newImage("이미지/숨은그림찾기/기회.png")
	try2.x,try2.y = display.contentWidth*0.173,display.contentHeight*0.246
	sceneGroup:insert(try2)

  local try3 = display.newImage("이미지/숨은그림찾기/기회.png")
	try3.x,try3.y = display.contentWidth*0.173,display.contentHeight*0.35
	sceneGroup:insert(try3)

-- 성공 객체
	local success = display.newImage("이미지/숨은그림찾기/O.png")
	success.x,success.y = display.contentWidth*0.367,display.contentHeight*0.41
	success.alpha=0
	sceneGroup:insert(success)





-- 시간 객체
	local time = display.newImageRect("이미지/미니게임/미니게임_시간타이머.png", display.contentWidth/7.91, display.contentHeight/3.78)
	time.anchorX, time.anchorY =0,0
	time.x,time.y = display.contentWidth/1.180, display.contentHeight/21.53
	sceneGroup:insert(time)

	local limit = 30
	local showLimit = display.newText(limit,display.contentWidth/1.1,display.contentHeight/5.555,"font/잘풀리는오늘 Medium.ttf")
	showLimit:setFillColor(1,0,0)
	showLimit.size =80
	sceneGroup:insert(showLimit)


	local f=0
	local function find(event)
		success.alpha=1
		mic.alpha=1
		f=f+1
		timer.cancelAll()
		composer.setVariable("color", 2)      
		composer.removeScene( "item_find_blue" )
      local options={
			effect ="fade",
			time=1000
		}
	  composer.gotoScene("item_find_success",options) 
  end
  S1:addEventListener("tap",find)

    local i=0
    local function try(event)
    	i=i+1
    	if i==1 then
    		display.remove(try3)
    	end
    	if i==2 then
    		display.remove(try2)
    	end 
    	if i==3 then
    		display.remove(try1)
        timer.cancelAll()
		composer.setVariable("color", 2) 
        composer.removeScene( "item_find_blue" )
      	local options={
				effect ="fade",
				time=1000
				}
	  		composer.gotoScene("item_find_fail",options)  
    	end
    end
    frame1:addEventListener("tap",try)

	-- 타임어택

	local function timeAttack( event )

		limit = limit - 1
		showLimit.text = limit

		if limit == 0 then
			local options={
				effect ="fade",
				time=1000
				}
			timer.cancelAll()
			composer.setVariable("color", 2) 
			composer.removeScene("item_find_blue")
			composer.gotoScene("item_find_fail",options)
		end
	end
	 
	timer.performWithDelay( 1000, timeAttack, 0 )


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