-- 엔딩 파일
local loadsave = require( "loadsave" )
local composer = require( "composer" )
local scene = composer.newScene()
local json = require( "json" ) 

function scene:create( event )
	local sceneGroup = self.view

	
	print("title1")
    loadedEndings = loadsave.loadTable( "endings.json" )

    -- 배경 객체 생성

    local background = display.newImageRect("이미지/타이틀/메인.png",display.contentWidth, display.contentHeight)
	background.x,background.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background)

	local ending = display.newImage("이미지/타이틀/엔딩모음.png")
    ending.x, ending.y = display.contentWidth*0.05,display.contentHeight*0.9
    sceneGroup:insert(ending)

    local volumeButton = display.newImage("이미지/타이틀/설정.png")
    volumeButton.x,volumeButton.y = display.contentWidth * 0.87, display.contentHeight * 0.9
    sceneGroup:insert(volumeButton)

    --크레딧 버튼
    local credit = display.newImage("이미지/크레딧/버튼.png")
    credit.x, credit.y = display.contentWidth*0.95,display.contentHeight*0.9
    sceneGroup:insert(credit)
    --credit:addEventListener("touch",move)

    --스페셜 버튼
    local special = display.newImage("이미지/특별일러스트/버튼.png")
    special.x, special.y = display.contentWidth*0.13,display.contentHeight*0.9
    sceneGroup:insert(special)

	local back = display.newRect(display.contentWidth/2,display.contentHeight/2,display.contentWidth,display.contentHeight)
	back:setFillColor(0)
	back.alpha = 0.5
	sceneGroup:insert(back)


-- 엔딩 세이브 파일 배열 생성(세이브 파일은 배열로 생성이 불가능하므로 배열로 편히 사용하기 위해 앞에서 배열을 생성하여 세이브 파일을 넣어줄 필요가 있음)
-- 관련 엔딩을 봤을 때 1 값을 가짐.
	local color = {}

	for i = 1,6 do
		color[i] = {}
	end

	color[6][1] = loadedEndings.rainbow
	color[6][2] =loadedEndings.bonus

	color[4][1] = loadedEndings.orange
	color[4][2] = loadedEndings.chung
	color[4][3] = loadedEndings.violet
	color[4][4] = loadedEndings.act_orange
	color[4][5] = loadedEndings.act_chung
	color[4][6] = loadedEndings.act_violet

	color[2][1] = loadedEndings.red
	color[2][2] = loadedEndings.yellow
	color[2][3] = loadedEndings.blue
	color[2][4] = loadedEndings.green
	color[2][5] = loadedEndings.purple

	color[3][1] = loadedEndings.good
	color[3][2] = loadedEndings.bad


	color[5][1] = loadedEndings.pastel_red
	color[5][2] = loadedEndings.pastel_yellow
	color[5][3] = loadedEndings.pastel_blue
	color[5][4] = loadedEndings.pastel_green
	color[5][5] = loadedEndings.pastel_purple

	color[1][1] = loadedEndings.red
	color[1][2] = loadedEndings.yellow
	color[1][3] = loadedEndings.blue
	color[1][4] = loadedEndings.green
	color[1][5] = loadedEndings.purple
	color[1][6] = loadedEndings.pastel_red
	color[1][7] = loadedEndings.pastel_yellow
	color[1][8] = loadedEndings.pastel_blue
	color[1][9] = loadedEndings.pastel_green
	color[1][10] = loadedEndings.pastel_purple
	color[1][11] = loadedEndings.orange
	color[1][12] = loadedEndings.chung
	color[1][13] = loadedEndings.violet
	color[1][14] = loadedEndings.act_orange
	color[1][15] = loadedEndings.act_chung
	color[1][16] = loadedEndings.act_violet
	color[1][17] = loadedEndings.good
	color[1][18] = loadedEndings.bad




	 num = {}
	 num[1] = 18
	 num[2] = 5
	 num[3] = 2
	 num[4] = 6
	 num[5] = 5
	 num[6] = 2

	
-- 엔딩 객체 생성
	local chang = {}
	local button = {}

	local image = {
		"이미지/엔딩/모음창/모든엔딩.png",
		"이미지/엔딩/모음창/우정.png",
		"이미지/엔딩/모음창/히든.png",
		"이미지/엔딩/모음창/혼합.png",
		"이미지/엔딩/모음창/파스텔.png",
		"이미지/엔딩/모음창/베스트.png"
	}

	local image2 = {
		"이미지/엔딩/버튼/모든엔딩.png",
		"이미지/엔딩/버튼/우정.png",
		"이미지/엔딩/버튼/히든.png",
		"이미지/엔딩/버튼/혼합.png",
		"이미지/엔딩/버튼/파스텔.png",
		"이미지/엔딩/버튼/베스트.png"
	}

	local image3 = {
		"이미지/엔딩/미니색연필/우정/빨강.png",
		"이미지/엔딩/미니색연필/우정/노랑.png",
		"이미지/엔딩/미니색연필/우정/파랑.png",
		"이미지/엔딩/미니색연필/우정/초록.png",
		"이미지/엔딩/미니색연필/우정/보라.png",
		"이미지/엔딩/미니색연필/파스텔/빨강.png",
		"이미지/엔딩/미니색연필/파스텔/노랑.png",
		"이미지/엔딩/미니색연필/파스텔/파랑.png",
		"이미지/엔딩/미니색연필/파스텔/초록.png",
		"이미지/엔딩/미니색연필/파스텔/보라.png",
		"이미지/엔딩/미니색연필/혼합/공부주황.png",
		"이미지/엔딩/미니색연필/혼합/공부청록.png",
		"이미지/엔딩/미니색연필/혼합/공부바이올렛.png",
		"이미지/엔딩/미니색연필/혼합/활동주황.png",
		"이미지/엔딩/미니색연필/혼합/활동청록.png",
		"이미지/엔딩/미니색연필/혼합/활동바이올렛.png",
		"이미지/엔딩/미니색연필/히든/굿.png",
		"이미지/엔딩/미니색연필/히든/배드.png"
	}

	local image4 ={

		"이미지/엔딩/색연필/우정/빨강.png",
		"이미지/엔딩/색연필/우정/노랑.png",
		"이미지/엔딩/색연필/우정/파랑.png",
		"이미지/엔딩/색연필/우정/초록.png",
		"이미지/엔딩/색연필/우정/보라.png"

	}

	local image5 = {
		"이미지/엔딩/색연필/히든/굿.png",
		"이미지/엔딩/색연필/히든/배드.png"
	}

	local image6 = {
		"이미지/엔딩/색연필/혼합/공부주황.png",
		"이미지/엔딩/색연필/혼합/공부청록.png",
		"이미지/엔딩/색연필/혼합/공부바이올렛.png",
		"이미지/엔딩/색연필/혼합/활동주황.png",
		"이미지/엔딩/색연필/혼합/활동청록.png",
		"이미지/엔딩/색연필/혼합/활동바이올렛.png"
	}

	local image7 = {
		"이미지/엔딩/색연필/파스텔/빨강.png",
		"이미지/엔딩/색연필/파스텔/노랑.png",
		"이미지/엔딩/색연필/파스텔/파랑.png",
		"이미지/엔딩/색연필/파스텔/초록.png",
		"이미지/엔딩/색연필/파스텔/보라.png"
	}

	local image8 = {
		"이미지/엔딩/색연필/무지개.png",
		"이미지/엔딩/색연필/보상.png"
	}


	local i = 1
	local k = 0

	
-- 카테고리 별 색연필 창 객체 생성.
	for i=1,6 do
		chang[i] = display.newImage(image[i])
		chang[i].x, chang[i].y = display.contentWidth/2,display.contentHeight/2
		sceneGroup:insert(chang[i])
		chang[i].alpha = 0
	end


--색연필 객체 array
	local options = {
    	isModal = true
    	
	}

--  카테고리 별 팬 객체 생성
	local pen = {}

	for i=1,7 do
		pen[i] ={}
	end

-- 펜 눌렀을 때 엔딩 이미지 보여주기 위해 title3.lua 파일을 만들고 해당 펜에 대한 정보를 넘겨주기 위해 setvariable 사용.
	local function popup(event)
		if event.phase == "began" then
			local name = event.target.name
			composer.setVariable("name",name)
			composer.showOverlay("title3",options)
		end
	end



--1번쨰 index 색연필들(펜 이미지, 위치, 투명도, 펜 name, 그리고 popup touch 이벤트 리스너 추가)
	for i=1,18 do
		pen[1][i] = display.newImage(image3[i])
		if i > 10 then
			pen[1][i].x, pen[1][i].y = display.contentWidth*0.2314+(display.contentWidth*0.05094)*(i-11), display.contentHeight*0.5578
		else
			pen[1][i].x, pen[1][i].y = display.contentWidth*0.2314+(display.contentWidth*0.05094)*(i-1), display.contentHeight*0.2313
		end 
		pen[1][i].anchorX,pen[1][i].anchorY = 0,0
		sceneGroup:insert(pen[1][i])
		pen[1][i].alpha =color[1][i]
		pen[1][i].name = i
		pen[1][i]:addEventListener("touch",popup)
		
	end
	
--2번째 index 색연필들	
	for i=1,5 do
		pen[2][i] = display.newImage(image4[i])
		pen[2][i].x,pen[2][i].y =  display.contentWidth*0.258+(display.contentWidth*0.094)*(i-1), display.contentHeight*0.25590
		sceneGroup:insert(pen[2][i])
		pen[2][i].anchorX,pen[2][i].anchorY = 0,0
		pen[2][i].alpha = 0
		pen[2][i].name = i
		pen[2][i].anchorX,pen[2][i].anchorY = 0,0
		pen[2][i]:addEventListener("touch",popup)
	end
--3번째 index 색연필들
	for i=1,2 do
		pen[3][i] = display.newImage(image5[i])
		pen[3][i].x, pen[3][i].y = display.contentWidth*0.385+(display.contentWidth*0.1228)*(i-1), display.contentHeight*0.25590
		pen[3][i].alpha = 0
		--hidden[i]
		pen[3][i].name = i+16
		pen[3][i].anchorX,pen[3][i].anchorY = 0,0
		sceneGroup:insert(pen[3][i])
		pen[3][i]:addEventListener("touch",popup)
	end
--4번째 index 색연필들
	for i=1,6 do
		pen[4][i] = display.newImage(image6[i])
		pen[4][i].x, pen[4][i].y = display.contentWidth*0.212+(display.contentWidth*0.09355)*(i-1), display.contentHeight*0.25590
		pen[4][i].alpha = 0
		pen[4][i].name = i+10
		pen[4][i].anchorX,pen[4][i].anchorY=0,0
		sceneGroup:insert(pen[4][i])
		pen[4][i]:addEventListener("touch",popup)
	end
--5번째 index 색연필들
	for i=1,5 do
		pen[5][i] = display.newImage(image7[i])
		pen[5][i].x, pen[5][i].y =display.contentWidth*0.258+(display.contentWidth*0.094)*(i-1), display.contentHeight*0.25590
		pen[5][i].alpha = 0
		pen[5][i].name = i+5
		sceneGroup:insert(pen[5][i])
		pen[5][i].anchorX,pen[5][i].anchorY =0,0
		pen[5][i]:addEventListener("touch",popup)
	end
--6번째 index 색연필들
	for i=1,2 do
		pen[6][i] = display.newImage(image8[i])
		pen[6][i].x, pen[6][i].y = display.contentWidth*0.385+(display.contentWidth*0.1228)*(i-1), display.contentHeight*0.25590
		pen[6][i].alpha = 0
		pen[6][i].name = i+18
		pen[6][i].anchorX, pen[6][i].anchorY = 0,0
		sceneGroup:insert(pen[6][i])
		pen[6][i]:addEventListener("touch",popup)
	end

-- eixt 객체 생성 및 gotomap 리스너 추가
	local function gotomap(event)
		if event.phase == "began" then 
			event.target.width,event.target.height = 68.82,68.82
		elseif event.phase == "cancelled" then 
			event.target.width,event.target.height = 74,74
		elseif event.phase == "ended" then
			event.target.width,event.target.height = 74,74
			composer.removeScene("title1")
			composer.gotoScene("title")
		end
	end

	local exit = display.newImage("이미지/공통/x버튼.png")
	sceneGroup:insert(exit)
	exit.x, exit.y = display.contentWidth*0.16, display.contentHeight*0.2
	exit:addEventListener("touch",gotomap)



	

-- 카테고리 눌렀을 때 창 별로 색연필 다르게 나타내기
-- 기본 창
	chang[1].alpha = 1
	local function side(event)
		if event.phase == "began" then
			-- 기본 i값 1, i는 해당 창의 번호
			-- 이전 창과 해당 카테고리 창 투명도 변환
			chang[i].alpha = 0
			button[i].alpha = 1
			local k = 0
			-- 현재 창의 색연필 개수(num)까지 pen 투명도 0
			for j=1,num[i] do
				pen[i][j].alpha = 0
				
			end

			-- 타겟된 이벤트의 name은 해당 창의 고유 번호
			i = event.target.name
			-- 다음 창의 투명도와 버튼 투명도 설정
			chang[i].alpha = 1
			button[i].alpha = 0
			local m = 0 
			-- 타겟된 카테고리의 pen의 투명도 올리기
			for j = 1, num[i] do
				pen[i][j].alpha = color[i][j]
			end
			
		end

	end

	-- 버튼 객체 생성. 버튼 투명도는 기본적으로 1이지만, 창에 버튼 이미지가 박혀있기 때문에, 타겟된 창의 버튼의 투명도는 0으로 설정해야 한다.
	for i = 1,6 do
		button[i] = display.newImage(image2[i])
		button[i].x, button[i].y = 1596.5 , 299 + 105 * (i-1)
		sceneGroup:insert(button[i])
		button[i].name = i
		button[i]:addEventListener("touch",side)
		button[i].alpha = 1
	end

	button[1].alpha = 0
	
	
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
		-- C.alled when the scene is on screen and is about to move off screen
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