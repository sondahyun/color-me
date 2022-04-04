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

	local ending = display.newImage("이미지/타이틀/엔딩모음.png")
	ending.x, ending.y = display.contentWidth*0.95,display.contentHeight*0.9
	sceneGroup:insert(ending)

	local volumeButton = display.newImage("이미지/타이틀/설정.png")
    volumeButton.x,volumeButton.y = display.contentWidth * 0.87, display.contentHeight * 0.9
    sceneGroup:insert(volumeButton)

    local newgame = display.newImage("이미지/타이틀/새게임.png")
    newgame.x,newgame.y = display.contentWidth * 0.42, display.contentHeight * 0.9
    sceneGroup:insert(newgame)

    local loadgame = display.newImage("이미지/타이틀/로드버튼.png")
    loadgame.x,loadgame.y = display.contentWidth * 0.58, display.contentHeight * 0.9
    sceneGroup:insert(loadgame)

	local titlePopup = display.newImage("이미지/타이틀/이름설정팝업.png")
	titlePopup.x,titlePopup.y = display.contentWidth/2,display.contentHeight * 0.8
	titlePopup.alpha = 0
	sceneGroup:insert(titlePopup)

	local titleButton = display.newImage("이미지/타이틀/이름결정.png")
	titleButton.x,titleButton.y = display.contentWidth/2,display.contentHeight * 0.65
	titleButton.alpha = 0
	sceneGroup:insert(titleButton)


	local function gohome(event)
		if event.phase == "began" then
				composer.removeScene("title2_1")
				exit.alpha=0
				composer.gotoScene("title2")
				
		end
	end	

	newError = display.newImage("이미지/공통/팝업창/이름입력.png")
	sceneGroup:insert(newError)
	newError.x, newError.y = display.contentWidth/2,display.contentHeight/2
	exit = display.newImage("이미지/공통/x버튼.png")
	sceneGroup:insert(exit)
	exit.x, exit.y = display.contentWidth*0.645, display.contentHeight*0.375
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