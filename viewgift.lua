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
	local loadedItems= loadsave.loadTable( "items.json" )
	mainName = loadedSettings.name
	loadedSettings.gift_num = loadedSettings.gift_num+1
	loadsave.saveTable(loadedSettings, "settings.json")

	
	local color_char = composer.getVariable("color_char")
	if color_char == "1" then
		color = 1 
	elseif color_char == "2" then
		color = 2
	elseif color_char == "5" then
		color = 3
	elseif color_char == "4" then
		color = 4
	elseif color_char == "3" then
		color = 5
	end
	local color_name = {
		"블리",
		"조이",
		"솔리",
		"위즈",
		"레이"
	}

	-- 배경 설정 -- 

	local background ={}

	local background_image = {
		"이미지/대화/우정배경/빨강.png",
		"이미지/대화/우정배경/노랑.png",
		"이미지/대화/우정배경/초록.png",
		"이미지/대화/우정배경/파랑.png",
		"이미지/대화/우정배경/보라.png"
	}

	for i = 1,5 do
		background[i] = display.newImage(background_image[i])
		background[i].x, background[i].y = display.contentWidth/2,display.contentHeight/2
		sceneGroup:insert(background[i])
		background[i].alpha = 0
	end

	background[color].alpha = 1

	-- 캐릭터 설정 --
	
	-- 기본 얼굴 --

	local default = {}

	for i = 1,5 do
		default[i] = display.newImage("이미지/캐릭터/" .. color_name[i] .. "/기본.png")
		default[i].x, default[i].y = display.contentWidth/2,display.contentHeight/2
		sceneGroup:insert(default[i])
		default[i].alpha = 0
	end

	default[color].alpha = 1

	-- 기쁨 --

	local happy = {}


	for i = 1,5 do
		happy[i] = display.newImage("이미지/캐릭터/" .. color_name[i] .. "/기쁨.png")
		happy[i].x,happy[i].y = display.contentWidth/2,display.contentHeight/2
		sceneGroup:insert(happy[i])
		happy[i].alpha = 0 
	end

	-- 난감 -- 

	local awkward = {}

	for i = 1,5 do
		awkward[i] = display.newImage("이미지/캐릭터/" .. color_name[i] .. "/난감.png")
		awkward[i].x,awkward[i].y = display.contentWidth/2,display.contentHeight/2
		sceneGroup:insert(awkward[i])
		awkward[i].alpha = 0 
	end

	-- 슬픔 -- 

	local sad = {}

	for i = 1,5 do
		sad[i] = display.newImage("이미지/캐릭터/" .. color_name[i] .. "/슬픔.png")
		sad[i].x,sad[i].y = display.contentWidth/2,display.contentHeight/2
		sceneGroup:insert(sad[i])
		sad[i].alpha = 0 
	end

	-- 화남 -- 

	local angry = {}

	for i = 1,5 do
		angry[i] = display.newImage("이미지/캐릭터/" .. color_name[i] .. "/화남.png")
		angry[i].x,angry[i].y = display.contentWidth/2,display.contentHeight/2
		sceneGroup:insert(angry[i])
		angry[i].alpha = 0 
	end

	-- 대사판 -- 

	local daesapan = {}

	for i = 1,5 do
		daesapan[i] = display.newImage("이미지/대화/대화창/" .. color_name[i] .. ".png")
		daesapan[i].x, daesapan[i].y = display.contentWidth*0.5,display.contentHeight*0.7176
		daesapan[i].anchorY = 0
		sceneGroup:insert(daesapan[i])
		daesapan[i].alpha = 0
	end


	local my_daesapan = display.newImage("이미지/대화/대화창/주인공.png")
	my_daesapan.x, my_daesapan.y = display.contentWidth*0.5,display.contentHeight*0.7176
	my_daesapan.anchorY = 0
	sceneGroup:insert(my_daesapan)
	my_daesapan.alpha=1

	-- 선택지 --

	local choose1 = {}
	local choose2 = {}


	for i = 1,5 do
		choose1[i] = display.newImage("이미지/대화/선택지/" .. color_name[i] .. ".png")
		choose1[i].x, choose1[i].y = display.contentWidth*0.0998, display.contentHeight*0.3500
		choose1[i].anchorY, choose1[i].anchorX = 0,0
		sceneGroup:insert(choose1[i])
		choose1[i].alpha = 0

		choose2[i] = display.newImage("이미지/대화/선택지/" .. color_name[i] .. ".png")
		choose2[i].x, choose2[i].y =  display.contentWidth*0.6326, display.contentHeight*0.3500
		choose2[i].anchorY, choose2[i].anchorX = 0,0
		sceneGroup:insert(choose2[i])
		choose2[i].alpha = 0
	end

	-- 대화 내용 --

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


	local daewha ={}
	local perfect = {}

	local perfect_respone = 0
	local soso_respone = 0
	local bad_respone = 0
	
	local text_1 = {
		"앗,저기 있잖아....",
		"오늘은 " .. color_name[color] .. "의 생일이야. 축하해줄까?",
		"아, 아무것도 아니야.",
		"뭐야, 싱겁기는.",
		"준비된 선물이 없어."
	}


		option1 = {
			text = "선물을 주자!",
			x=233,
			y=490,
			width=438,
			height=143,
			align = "center",
			font = "font/NanumSquareRoundB.ttf",
			fontSize = 36
		}
		option2 = {
			text = "주지 말자",
			x=1254.73,
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




	for i = 1,5 do
		daewha[i] = display.newText(text_1[i],display.contentWidth*0.0833,display.contentHeight*0.8009,"font/NanumSquare_acB.ttf")
		daewha[i].anchorX,daewha[i].anchorY = 0,0
		daewha[i]:setFillColor(0)
		daewha[i].alpha = 0
		daewha[i].size = 30
		sceneGroup:insert(daewha[i])
	end



	local j = 1

	local function next2(event)
		if event.phase == "began" then
			
		end
	end

	u = 1

	local function choice1(event)
		if event.phase == "began" then
			
			if u == 1 then
				print(loadedItems.itemCount)
				choose1[color].alpha = 0
				choose2[color].alpha = 0
				daewha[j].alpha = 0
				select_daewha1.alpha = 0
				select_daewha2.alpha = 0
				my_daesapan:removeEventListener("touch",next)
				my_daesapan:addEventListener("touch",choice1)
				--local gift = 1
				-- 선물이 없을 때
				if loadedItems.itemCount == 0 then
					
					daewha[5].alpha = 1
					u =u +1
				else 
					composer.setVariable("color",color)
					composer.removeScene("viewgift")
					composer.gotoScene("viewgift_bag")
				end
			elseif u == 2 then 
				composer.removeScene("viewgift")
				composer.gotoScene("view01Map")
			end
		end
	end

	local function choice2(event)
		if event.phase == "began" then
			--3번째
			choose1[color].alpha = 0
			choose2[color].alpha = 0
			select_daewha1.alpha = 0
			select_daewha2.alpha = 0
			daewha[j].alpha = 0
			daewha[j+1].alpha = 1
			j = j+1
		end
	end

	local function next(event)
		if event.phase == "began" then
			--2번째 대사--
			if j ==1 then
				daewha[j].alpha = 0
				daewha[j+1].alpha = 1
				choose1[color].alpha = 1
				choose2[color].alpha = 1
				select_daewha1.alpha = 1
				select_daewha2.alpha = 1
				j = j+1

			--4번째 대사--

			elseif j==3 then
				composer.removeScene("viewgift")
				composer.gotoScene("view01Map")
			end
			
		end
	end
	--daesapan[color].alpha = 1
	my_daesapan.alpha = 1
	my_daesapan:addEventListener("touch",next)
	choose1[color]:addEventListener("touch",choice1)
	choose2[color]:addEventListener("touch",choice2)

	daewha[1].alpha = 1

	print("생성")




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