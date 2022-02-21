-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

local loadsave = require( "loadsave" )
local json = require( "json" )

function scene:create( event )
	local sceneGroup = self.view
	
	local loadedSettings = loadsave.loadTable( "settings.json" )
	--local loadedItems= loadsave.loadTable( "items.json" )
	mainName = loadedSettings.name

	local background = display.newImageRect("이미지/홈/배경/가구포함.png",display.contentWidth, display.contentHeight)
	background.x,background.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background)

	-- 달력 글씨
	local month = display.newText("",display.contentWidth * 0.691, display.contentHeight * 0.162,"font/잘풀리는오늘 Medium.ttf")
	month:setFillColor(0)
	month.size = 40
	sceneGroup:insert(month)
-- 이전 달 할 일 1
	local former = display.newText("",display.contentWidth * 0.6225, display.contentHeight * 0.2325,"font/잘풀리는오늘 Medium.ttf")
	former.anchorX,former.anchorY = 0,0
	former:setFillColor(0.82,0.21,0.05)
	former.size = 20
	former.text = loadedSettings.former1
	sceneGroup:insert(former)
-- 이전 달 할 일 2
	local former2 = display.newText("",display.contentWidth * 0.6225, display.contentHeight * 0.2603,"font/잘풀리는오늘 Medium.ttf")
	former2.anchorX ,former2.anchorY = 0,0
	former2:setFillColor(0.82,0.21,0.05)
	former2.size = 20
	former2.text = loadedSettings.former2
	sceneGroup:insert(former2)
-- 다음 달 할 일 1
	local next1 = display.newText("dd",display.contentWidth * 0.6225, display.contentHeight * 0.3422,"font/잘풀리는오늘 Medium.ttf")
	next1.anchorX,next1.anchorY = 0,0
	next1:setFillColor(0)
	next1.size = 20
	next1.text = loadedSettings.next1
	sceneGroup:insert(next1)
-- 다음 달 할 일 2
	local next2 = display.newText("dd",display.contentWidth * 0.6225, display.contentHeight * 0.3722,"font/잘풀리는오늘 Medium.ttf")
	next2.anchorX,next2.anchorY = 0,0
	next2:setFillColor(0)
	next2.size = 20
	next2.text = loadedSettings.next2
	sceneGroup:insert(next2)

	if loadedSettings.month == 0 then
		month.text = "이른 봄의 달"
	elseif loadedSettings.month == 1 then
		month.text = "꽃 피는 달"
	elseif loadedSettings.month == 2 then
		month.text = "해변달"
	elseif loadedSettings.month == 3 then
		month.text = "단풍달"
	elseif loadedSettings.month == 4 then
		month.text = "도토리 달"
	elseif loadedSettings.month ==5 then
		month.text = "눈꽃 달"
	end

	local black = display.newRect(display.contentWidth/2,display.contentHeight/2,display.contentWidth,display.contentHeight)
	black.alpha = 0.5
	black:setFillColor(0)
	sceneGroup:insert(black)


	local background_1 = display.newImage("이미지/이벤트/생일/1.png")
	background_1.x,background_1.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background_1)
	background_1.alpha = 0

	local background_2 = display.newImage("이미지/이벤트/생일/1.png")
	background_2.x,background_2.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background_2)
	background_2.alpha = 0

	local money = display.newImage("이미지/이벤트/생일/돈.png")
	money.x,money.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(money)
	money.alpha = 0

	local my_daesapan = display.newImage("이미지/대화/대화창/주인공.png")
	my_daesapan.x, my_daesapan.y = display.contentWidth*0.5,display.contentHeight*0.7176
	my_daesapan.anchorY = 0
	sceneGroup:insert(my_daesapan)

	local green_daesapan = display.newImage("이미지/대화/대화창/솔리.png")
	green_daesapan.x, green_daesapan.y = display.contentWidth*0.5,display.contentHeight*0.7176
	green_daesapan.anchorY = 0
	sceneGroup:insert(green_daesapan)
	green_daesapan.alpha = 0


	local my = display.newText(mainName,display.contentWidth*0.1386,display.contentHeight*0.73,"font/잘풀리는오늘 Medium.ttf")
	my.anchorX,my.anchorY = 0,0
	my.size = 45
	my.alpha = 0
	my:setFillColor(1)
	sceneGroup:insert(my)

	local daewha = {}

	local text1 = {
		"(초인종 소리가 들려 나가보니 문 앞에 상자가 하나 놓여 있다)",
		"이게 뭐지?",
		"우와, 맛있어 보이는 케이크다...!",
		"콩 한쪽도 나눠먹는다고, 친구들과 다 같이 먹어야지!",
		"한 조각 밖에 없는데… 이 정도는 혼자 먹어도 되지 않을까?",
		"앗, 이게 뭐지? 용돈이다!"	
	}
	local text1= {
		"얘들아~ 다들 우리 집에 놀러 와. 케이크 같이 먹자!",
		"주인공아, 생일 축하해!",
		"다들 고마워!"
	}

	for i = 1,17 do
		daewha[i] = display.newText(text[i],160,865,"font/NanumSquare_acB.ttf")
		daewha[i].anchorX,daewha[i].anchorY = 0,0
		daewha[i]:setFillColor(0)
		daewha[i].alpha = 0
		daewha[i].size = 30
		sceneGroup:insert(daewha[i])
	end




	
			

end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then

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