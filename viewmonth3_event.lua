--단풍달(4월) 우정 스크립트

local composer = require( "composer" )
local scene = composer.newScene()
local loadsave = require( "loadsave" )

function scene:create( event )
	local sceneGroup = self.view
	
	-- 배경 --
	local background = display.newImageRect("이미지/홈/배경/가구포함.png",display.contentWidth, display.contentHeight)
	background.x,background.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background)

	local background_1 = display.newImage("이미지/이벤트/3월/1.png")
	background_1.x,background_1.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background_1)
	background_1.alpha = 0

	local background_2 = display.newImage("이미지/이벤트/3월/2.png")
	background_2.x,background_2.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background_2)
	background_2.alpha = 0

	local background_3 = display.newImage("이미지/이벤트/3월/3.png")
	background_3.x,background_3.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background_3)
	background_3.alpha = 0

	local black = display.newRect(display.contentWidth/2,display.contentHeight/2,display.contentWidth,display.contentHeight)
	black.alpha = 0
	black:setFillColor(0)
	sceneGroup:insert(black)

	local background_4 = display.newImage("이미지/이벤트/3월/4.png")
	background_4.x,background_4.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background_4)
	background_4.alpha = 0

	

	-- 캐릭터 선언

	local yellow_default = display.newImage("이미지/캐릭터/조이/기본.png")
	yellow_default.x, yellow_default.y = display.contentWidth*0.53,display.contentHeight/2
	sceneGroup:insert(yellow_default)
	yellow_default.alpha = 0

	local yellow_awakard = display.newImage("이미지/캐릭터/조이/난감.png")
	yellow_awakard.x, yellow_awakard.y = display.contentWidth*0.53,display.contentHeight/2
	sceneGroup:insert(yellow_awakard)
	yellow_awakard.alpha = 0

	local yellow_happy = display.newImage("이미지/캐릭터/조이/기쁨.png")
	yellow_happy.x, yellow_happy.y = display.contentWidth*0.53,display.contentHeight/2
	sceneGroup:insert(yellow_happy)
	yellow_happy.alpha = 0

	-- 대사창 

	local my_daesapan = display.newImage("이미지/대화/대화창/주인공.png")
	my_daesapan.x, my_daesapan.y = display.contentWidth*0.5,display.contentHeight*0.7176
	my_daesapan.anchorY = 0
	sceneGroup:insert(my_daesapan)

	local yellow_daesapan = display.newImage("이미지/대화/대화창/조이.png")
	yellow_daesapan.x, yellow_daesapan.y = display.contentWidth*0.5,display.contentHeight*0.7176
	yellow_daesapan.anchorY = 0
	sceneGroup:insert(yellow_daesapan)
	yellow_daesapan.alpha = 0


	-- 선택창 --

	local select1 = display.newImage("이미지/대화/선택지/조이.png")
	select1.x, select1.y = display.contentWidth*0.0998, display.contentHeight*0.3500
	select1.anchorY, select1.anchorX = 0,0
	select1.alpha = 0
	sceneGroup:insert(select1)

	local select2 = display.newImage("이미지/대화/선택지/조이.png")
	select2.x, select2.y = display.contentWidth*0.6326, display.contentHeight*0.3500
	select2.anchorY, select2.anchorX = 0,0
	select2.alpha = 0
	sceneGroup:insert(select2)

	-- 텍스트 --

	name = "주인공"

	daewha = {}
	daewha2 = {}
	daewha3 = {}

	select_daewha1 = {}
	select_daewha2 = {}

	select_text1 = {
		"그래 좋아!",
		"참가할래!"
	}
	select_text2 = {
		"아니, 난 쉬고 싶어.",
		"거절할래!"
	}

	local option1={}
	local option2={}
	for i =1,2 do
		option1[i] = {
			text = select_text1[i],
			x=233,
			y=490,
			width=438,
			height=143,
			align = "center",
			font = "font/NanumSquareRoundB.ttf",
			fontSize = 36
		}
		option2[i] = {
			text = select_text2[i],
			x=1254.73,
			y=490,
			width=438,
			height=143,
			align = "center",
			font = "font/NanumSquareRoundB.ttf",
			fontSize = 36
		}
	end

	for i=1,2 do
		select_daewha1[i]=display.newText(option1[i])
		select_daewha1[i].anchorX,select_daewha1[i].anchorY = 0,0
		sceneGroup:insert(select_daewha1[i])
		select_daewha1[i].alpha = 0

		select_daewha2[i]=display.newText(option2[i])
		select_daewha2[i].anchorX,select_daewha2[i].anchorY = 0,0
		sceneGroup:insert(select_daewha2[i])
		select_daewha2[i].alpha = 0
	end

	local text = {
		"(누군가 벨을 누른다)",
		name .. "! 뭐해? 나 지금 해변에 물놀이 갈 건데, 같이 갈래?",
		"좋아! 같이 놀러 가자!",
		"아니, 난 쉬고 싶어. 다음에 같이 가자!",
		"여름의 바다는 정말 아름다워! 파도가 노래하는 것 같아~",
		"그러게!",
		"앗, 저기! 축제를 하나봐.",
		"(조이가 가리킨 곳에는 '해변 노래자랑'이 열리고 있다)",
		"와, 노래자랑! 주인공아, 우리 저기 나가지 않을래? 나 꼭 나가보고 싶었거든!",
		"오늘 장기자랑도 나가보고 같이 놀아서 즐거웠어! 너랑 놀러가길 잘 한 것 같아~",
		"나도 즐거웠어."
	}


	local text2 = {
		"너무 갑작스러워서…. 난 안 나갈래. 대신 너를 열심히 응원할게! 응원엔 자신 있다구!",
		"음, 좀 갑작스럽긴 했지? 그래! 그럼 내가 멋지게 노래하고 상금 타올게! 우리 이걸로 맛있는 거 먹자!",
		"좋아! 화이팅이야!"	
	}

	local text1 = {
		"좋아, 실은 나도 노래자랑 참여하고 싶었어!",
		"우리 둘이 나간다면 우승은 따 놓은 당상이지~"
	}


	for i = 1,11 do
		daewha[i] = display.newText(text[i],160,865,"font/NanumSquare_acB.ttf")
		daewha[i].anchorX,daewha[i].anchorY = 0,0
		daewha[i]:setFillColor(0)
		daewha[i].alpha = 0
		daewha[i].size = 30
		sceneGroup:insert(daewha[i])
	end

	for i = 1,2 do
		daewha2[i] = display.newText(text1[i],160,865,"font/NanumSquare_acB.ttf")
		daewha2[i].anchorX,daewha2[i].anchorY = 0,0
		daewha2[i]:setFillColor(0)
		daewha2[i].alpha = 0
		daewha2[i].size = 30
		sceneGroup:insert(daewha2[i])
	end

	for i = 1,3 do
		daewha3[i] = display.newText(text2[i],160,865,"font/NanumSquare_acB.ttf")
		daewha3[i].anchorX,daewha3[i].anchorY = 0,0
		daewha3[i]:setFillColor(0)
		daewha3[i].alpha = 0
		daewha3[i].size = 30
		sceneGroup:insert(daewha3[i])
	end

	i = 1
	j = 1
	u = 0

	local function go_back(event)
		if event.phase == "began" then
			if j == 1 then 
				yellow_daesapan.alpha = 0
				select1.alpha = 0
				select2.alpha = 0
				select_daewha1[1].alpha = 0
				select_daewha2[1].alpha = 0
				my_daesapan.alpha = 1
				daewha[i].alpha = 0
				daewha[4].alpha = 1
				j = j+1
				my_daesapan:addEventListener("touch",go_back)
			elseif j == 2 then
				print("홈 화면으로!")
			end


		end
	end

	k = 1

	local function last_scene(event) 
		if event.phase == "began" then
			print(k)
			if k == 1 then
				u = u+1
				background.alpha = 0
				background_1.alpha = 0

				transition.to(black,{alpha=1,time=1000,onComplete=function() black:addEventListener("touch",last_scene) background_2.alpha=0 background_3.alpha =0 end})
				if u ==2 then
					k = k+1 
					u = 0
				end
			elseif k==2 then
				u = u+1
				black:removeEventListener("touch",last_scene)
				transition.to(background_4,{alpha=1,time=1000,onComplete=function() background_4:addEventListener("touch",last_scene) i = i+1 end})
				if u ==2 then
					k = k+1
					u = 0
				end
			elseif k==3 then
				
				background_4:removeEventListener("touch",last_scene)
				
				daewha[10].alpha = 1
				yellow_daesapan.alpha = 1
				yellow_happy.alpha = 1
				yellow_happy:addEventListener("touch",last_scene)
				my_daesapan:addEventListener("touch",last_scene)
				k=k+1
			elseif k==4 then
				daewha[10].alpha = 0
				daewha[11].alpha = 1
				yellow_daesapan.alpha = 0
				my_daesapan.alpha = 1
				my_daesapan:removeEventListener("touch",last_scene)
				yellow_daesapan:removeEventListener("touch",last_scene)
			end
		end
	end

	local function choose2(event) 
		if event.phase == "began" then
			print(j)
			if j == 1 then
				daewha[9].alpha = 0
				select1.alpha = 0
				select2.alpha = 0
				yellow_daesapan.alpha = 0
				select_daewha1[2].alpha = 0
				select_daewha2[2].alpha = 0
				my_daesapan.alpha = 1
				daewha3[j].alpha = 1
				j = j+1
				--select1:removeEventListener("touch",choose1)
			 	select2:removeEventListener("touch",choose2)

			elseif j == 2 then

			end


		end
	end


	local function choose1(event)
		if event.phase == "began" then
			if j == 1 then 
				daewha[9].alpha = 0
				select1.alpha = 0
				select2.alpha = 0
				select_daewha1[2].alpha = 0
				select_daewha2[2].alpha = 0
				daewha2[j].alpha = 1

				my_daesapan.alpha = 1
				yellow_daesapan.alpha = 0
				j = j+1
				select1:removeEventListener("touch",choose1)
				select2:removeEventListener("touch",choose2)
				my_daesapan:addEventListener("touch",choose1)
				yellow_daesapan:addEventListener("touch",choose1)
				
			elseif j == 2 then
				yellow_default.alpha = 0
				yellow_happy.alpha = 1
				my_daesapan.alpha = 0
				yellow_daesapan.alpha = 1
				daewha2[j-1].alpha = 0
				daewha2[j].alpha = 1
				j = j+1
				
			elseif j == 3 then

				yellow_happy.alpha = 0
				yellow_daesapan.alpha = 0
				daewha2[j-1].alpha = 0
				my_daesapan:removeEventListener("touch",choose1)
				yellow_daesapan:removeEventListener("touch",choose1)
				transition.to(background_2,{alpha=1,time=1000,onComplete=function() background_2:addEventListener("touch",last_scene) background.alpha = 0 background_1.alpha = 0 end})
				
			end

		end
	end

	local function first_scence(event)
		if event.phase == "began" then 
			print(i)
			if i==1 then
				daewha[i].alpha = 0
				daewha[i+1].alpha = 1
				yellow_default.alpha = 1
				my_daesapan.alpha = 0
				yellow_daesapan.alpha = 1

				select1.alpha = 1
				select2.alpha = 1
				select_daewha1[1].alpha = 1
				select_daewha2[1].alpha = 1

				my_daesapan:removeEventListener("touch",first_scence)
				select1:addEventListener("touch",first_scence)
				select2:addEventListener("touch",go_back)
				i = i +1
			elseif i == 2 then
				daewha[i].alpha = 0
				daewha[i+1].alpha = 1
				my_daesapan.alpha = 1
				yellow_daesapan.alpha = 0
				select1.alpha = 0
				select2.alpha = 0
				select_daewha1[1].alpha = 0
				select_daewha2[1].alpha = 0
				i = i+1
				select2:removeEventListener("touch",go_back)
				select1:removeEventListener("touch",first_scence)
				yellow_daesapan:removeEventListener("touch",first_scence)
				my_daesapan:addEventListener("touch",first_scence)
			elseif i ==3 then 
			 	transition.to(background_1,{alpha=1,time=1000})
			 	
				daewha[i].alpha = 0
				yellow_default.alpha = 0
				my_daesapan.alpha = 0

			 	select_daewha1[1]:removeEventListener("touch",first_scence)
			 	background_1:addEventListener("touch",first_scence)
			 	i = i+1
			 elseif i == 4 then
			 	print(i)
			 	yellow_daesapan.alpha = 1
			 	yellow_default.alpha = 1
			 	daewha[i+1].alpha = 1
			 	background_1:removeEventListener("touch",first_scence)
			 	yellow_daesapan:addEventListener("touch",first_scence)
			 	my_daesapan:addEventListener("touch",first_scence)
			 	i = i+1
			 elseif i == 5 then
			 	u = u+1

			 	daewha[i+1].alpha = 1
			 	daewha[i].alpha = 0
			 	my_daesapan.alpha = 1
			 	yellow_daesapan.alpha = 0
			 	if u == 2 then 
			 		i = i+1
			 		u = 0
			 	end
			 elseif i == 6 then
			 	u = u+1
			 	daewha[i+1].alpha = 1
			 	daewha[i].alpha = 0
			 	my_daesapan.alpha = 0
			 	yellow_daesapan.alpha = 1
			 	if u == 2 then 
			 		i = i+1
			 		u = 0
			 	end
			 elseif i == 7 then
			 	u = u +1
			 	daewha[i+1].alpha = 1
			 	daewha[i].alpha = 0
			 	my_daesapan.alpha = 1
			 	yellow_daesapan.alpha = 0
			 	if u == 2 then 
			 		i = i+1
			 		u = 0
			 	end
			elseif i == 8 then
				u = u +1 
			 	daewha[i+1].alpha = 1
			 	daewha[i].alpha = 0
			 	my_daesapan.alpha = 0
			 	yellow_daesapan.alpha = 1
			 	if u == 2 then 
			 		i = i+1
			 		u = 0
			 	end
			elseif i == 9 then
				
				select1.alpha = 1
			 	select2.alpha = 1
			 	select_daewha1[2].alpha = 1
			 	select_daewha2[2].alpha = 1
			 	select1:addEventListener("touch",choose1)
			 	select2:addEventListener("touch",choose2)
			 	my_daesapan:removeEventListener("touch",first_scence)
				yellow_daesapan:removeEventListener("touch",first_scence)
			end
		end
	end



	daewha[1].alpha = 1
	my_daesapan:addEventListener("touch",first_scence)
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