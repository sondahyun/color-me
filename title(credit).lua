--이름 또는 색상을 선택하지 않았을 시 뜨는 에러 팝업창

local loadsave = require( "loadsave" )
local composer = require( "composer" )
local scene = composer.newScene()
local json = require( "json" ) 

function scene:create( event )
	local sceneGroup = self.view

	print("title2_1")
	local background = display.newImageRect("이미지/타이틀/메인.png",display.contentWidth, display.contentHeight)
	background.x,background.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background)

	--크레딧 버튼
    local credit = display.newImage("이미지/크레딧/버튼.png")
    credit.x, credit.y = display.contentWidth*0.95,display.contentHeight*0.9
    sceneGroup:insert(credit)


    local ending = display.newImage("이미지/타이틀/엔딩모음.png")
    ending.x, ending.y = display.contentWidth*0.05,display.contentHeight*0.9
    sceneGroup:insert(ending)

    local newgame = display.newImage("이미지/타이틀/새게임.png")
    newgame.x,newgame.y = display.contentWidth * 0.42, display.contentHeight * 0.9
    sceneGroup:insert(newgame)

    local loadgame = display.newImage("이미지/타이틀/로드버튼.png")
    loadgame.x,loadgame.y = display.contentWidth * 0.58, display.contentHeight * 0.9
    sceneGroup:insert(loadgame)

    local volumeButton = display.newImage("이미지/타이틀/설정.png")
    volumeButton.x,volumeButton.y = display.contentWidth * 0.87, display.contentHeight * 0.9
    sceneGroup:insert(volumeButton)



	local function gohome(event)
		if event.phase == "began" then
				composer.removeScene("title(credit)")
				exit.alpha=0
				composer.gotoScene("title")
				
		end
	end	

	creditContent = display.newImage("이미지/홈/크레딧/크레딧1.png")
	creditContent.x, creditContent.y = display.contentWidth/2, display.contentHeight/2
	sceneGroup:insert(creditContent)

	creditButton = {}

	local function next(event)
		if event.phase == "began" then
			i = event.target.id 
			creditContent.fill = {type="image",filename="이미지/홈/크레딧/크레딧" .. i .. ".png"}
		end
	end

	for i = 1, 2 do
		creditButton[i] = display.newImage("이미지/홈/크레딧/버튼" .. i .. ".png")
		creditButton[i].x, creditButton[i].y = display.contentWidth/2 - 150 + 100*(i), display.contentHeight/2 + 280
		sceneGroup:insert(creditButton[i])
		creditButton[i].id = i
		creditButton[i]:addEventListener("touch",next)
	end

	exit = display.newImage("이미지/공통/x버튼.png")
	sceneGroup:insert(exit)
	exit.x, exit.y = display.contentWidth*0.743, display.contentHeight*0.28
	exit:addEventListener("touch",gohome)
	

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