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

	

	local background_1 = display.newImage("이미지/이벤트/생일/1.png")
	background_1.x,background_1.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background_1)
	background_1.alpha = 0

	local background_2 = display.newImage("이미지/이벤트/생일/2.png")
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

	local green_daesapan = display.newImage("이미지/대화/대화창/모두.png")
	green_daesapan.x, green_daesapan.y = display.contentWidth*0.5,display.contentHeight*0.7176
	green_daesapan.anchorY = 0
	sceneGroup:insert(green_daesapan)
	green_daesapan.alpha = 0


	local option = {
      text = mainName,
      x = display.contentWidth*0.175,
      y = display.contentHeight*0.73,
      font = "font/NanumSquareRoundB",
      fontSize =45,
      align="center"
   } 

   local my = display.newText(option)
   my.anchorY = 0
   my.size = 45
   my.alpha = 1
   my:setFillColor(1)
   sceneGroup:insert(my)

	local select1 = display.newImage("이미지/대화/선택지/주인공.png")
	select1.x, select1.y = display.contentWidth*0.02, display.contentHeight*0.3500
	select1.anchorY, select1.anchorX = 0,0
	select1.alpha = 0
	sceneGroup:insert(select1)

	local select2 = display.newImage("이미지/대화/선택지/주인공.png")
	select2.x, select2.y = display.contentWidth*0.707, display.contentHeight*0.3500
	select2.anchorY, select2.anchorX = 0,0
	select2.alpha = 0
	sceneGroup:insert(select2)

	local myBday = audio.loadStream("음악/myBday.mp3")

	
		option1 = {
			text = "친구들과 나눠먹자",
			x=90,
			y=490,
			width=438,
			height=143,
			align = "center",
			font = "font/NanumSquareRoundB.ttf",
			fontSize = 36
		}
		option2 = {
			text = "혼자 먹자",
			x=1400,
			y=490,
			width=438,
			height=143,
			align = "center",
			font = "font/NanumSquareRoundB.ttf",
			fontSize = 36
		}

	
		select_daewha1=display.newText(option1)
		select_daewha1.anchorX,select_daewha1.anchorY = 0,0
		sceneGroup:insert(select_daewha1)
		select_daewha1.alpha = 0

		select_daewha2=display.newText(option2)
		select_daewha2.anchorX,select_daewha2.anchorY = 0,0
		sceneGroup:insert(select_daewha2)
		select_daewha2.alpha = 0
	

	local daewha = {}

	local text = {
		"(누군가 벨을 누른다)",
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

	daewha = {}
	daewha2 = {}

	for i = 1,7 do
		daewha[i] = display.newText(text[i],160,865,"font/NanumSquare_acB.ttf")
		daewha[i].anchorX,daewha[i].anchorY = 0,0
		daewha[i]:setFillColor(0)
		daewha[i].alpha = 0
		daewha[i].size = 30
		sceneGroup:insert(daewha[i])
	end

	for i = 1,3 do
		daewha2[i] = display.newText(text1[i],160,865,"font/NanumSquare_acB.ttf")
		daewha2[i].anchorX,daewha2[i].anchorY = 0,0
		daewha2[i]:setFillColor(0)
		daewha2[i].alpha = 0
		daewha2[i].size = 30
		sceneGroup:insert(daewha2[i])
	end

	j = 1

	local function another(event) 
		if event.phase == "began" then 
			if j == 1 then
				background_1.alpha = 0
				daewha[4].alpha = 0
				daewha[5].alpha = 1
				select_daewha1.alpha = 0
				select_daewha2.alpha = 0
				select1.alpha = 0
				select2.alpha = 0
				j = j+1
				my_daesapan:addEventListener("touch",another)
				green_daesapan:addEventListener("touch",another)
			elseif j == 2 then
				daewha[5].alpha = 0
				daewha2[j-1].alpha = 1
				background_2.alpha = 1
				j = j+1
			elseif j == 3 then
				daewha2[j-2].alpha = 0
				daewha2[j-1].alpha = 1
				green_daesapan.alpha=1
				my_daesapan.alpha = 0
				my.alpha = 0
				j = j+1
			elseif j == 4 then 
				daewha2[j-2].alpha = 0
				daewha2[j-1].alpha = 1
				green_daesapan.alpha=0
				my_daesapan.alpha = 1
				my.alpha = 1
				j = j+1
			elseif j == 5 then

				loadedSettings.friendship = loadedSettings.friendship + 3
		     	loadedSettings.friendship = loadedSettings.friendship + 3
     			 loadedSettings.red = loadedSettings.red + 2
     			 loadedSettings.yellow = loadedSettings.yellow + 2
     				 loadedSettings.green = loadedSettings.green + 2
     				 loadedSettings.blue = loadedSettings.blue + 2
     				 loadedSettings.purple = loadedSettings.purple + 2
     				 loadsave.saveTable(loadedSettings,"settings.json")

				audio.pause(myBday)
				local home = audio.loadStream("음악/집.mp3")
				audio.play(home)
				composer.removeScene("viewmonth_birthday")
				composer.gotoScene("view00Room")
			end
		end
	end

	i = 1
	local function first(event)
		if event.phase =="began" then 
			if i <3 then
				daewha[i].alpha = 0
				daewha[i+1].alpha = 1
				
				my.alpha = 1
				i = i+1
			elseif i == 3 then
				daewha[i].alpha = 0
				daewha[i+1].alpha = 1
				background_1.alpha = 1
				i = i +1
			elseif i == 4 then
				select_daewha1.alpha = 1
				select_daewha2.alpha = 1
				select1.alpha = 1
				select2.alpha = 1
				my_daesapan:removeEventListener("touch",first)
				select2:addEventListener("touch",first)
				select1:addEventListener("touch",another)
				i = i +1
			elseif i == 5 then
				daewha[i-1].alpha = 0
				daewha[6].alpha = 1
				select_daewha1.alpha = 0
				select_daewha2.alpha = 0
				select1.alpha = 0
				select2.alpha = 0
				my_daesapan:addEventListener("touch",first)
				select2:removeEventListener("touch",first)
				i = i+1
			elseif i == 6 then
				background_1.alpha = 1
				money.alpha = 1
				daewha[i].alpha = 0
				daewha[7].alpha = 1
				i = i+1
			elseif i == 7 then
				audio.pause(myBday)
				local home = audio.loadStream("음악/집.mp3")
				audio.play(home)
				composer.removeScene("viewmonth_birthday")
				composer.gotoScene("view00Room")
				loadedSettings.money = loadedSettings.money + 7
				loadsave.saveTable(loadedSettings, "settings.json")

			end

		end
	end

	my_daesapan:addEventListener("touch",first)
	daewha[1].alpha = 1




	
			

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