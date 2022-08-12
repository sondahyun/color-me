--Likeability 2/4/6월에 발생
local composer = require( "composer" )
local scene = composer.newScene()
local loadsave = require( "loadsave" )

function scene:create( event )
	local sceneGroup = self.view
	local loadedSettings = loadsave.loadTable( "settings.json" )

	local find1 = composer.getVariable("find1")
	local find2= composer.getVariable("find2")
	local find3 = composer.getVariable("find3")
	local find4 = composer.getVariable("find4")
	local find5 = composer.getVariable("find5")

	local background = display.newImageRect("이미지/홈/배경/가구있는배경.png",display.contentWidth, display.contentHeight)
	background.x,background.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background)

	local paint = { 0,0,0 }
	local rect = display.newRect( display.contentWidth*0.5, display.contentHeight*0.5, display.contentWidth, display.contentHeight )
	rect.fill = paint
	sceneGroup:insert(rect)
	rect.alpha = 0

	local my_daesapan = display.newImage("이미지/대화/대화창/주인공.png")
	my_daesapan.x, my_daesapan.y = display.contentWidth*0.5,display.contentHeight*0.851
	sceneGroup:insert(my_daesapan)
	my_daesapan.alpha=1

	local letter1 = display.newImage("이미지/호감도/편지 도착.png")
	letter1.x, letter1.y = display.contentWidth*0.505, display.contentHeight*0.5
	--letter1.width = 310
	--letter1.height = 310
	sceneGroup:insert(letter1)
	letter1.alpha=1

	local letter2 = display.newImage("이미지/호감도/편지 확인.png")
	letter2.x, letter2.y = display.contentWidth*0.431, display.contentHeight*0.561
	sceneGroup:insert(letter2)
	letter2.alpha=0

	local bt = display.newImage("이미지/공통/x버튼.png")
	bt.x, bt.y = display.contentWidth*0.858,display.contentHeight*0.137
	sceneGroup:insert(bt)
	bt.alpha=0

	local text = display.newText("어라? 문 앞에 편지가 와있네??", 105,550, "font/NanumSquareRoundR.ttf", 30)
	sceneGroup:insert(text)
	text:setFillColor(alpha)
	text.anchorX,text.anchorY = 0,0
	text.x, text.y = display.contentWidth * 0.084,display.contentHeight*0.8

	mainName = loadedSettings.name
	local text2 = display.newText(mainName, 190,505, "font/잘풀리는오늘 Medium.ttf")
	sceneGroup:insert(text2)
	text2.size = 45
	--text:setFillColor(alpha)
	text2.x, text2.y = display.contentWidth * 0.17,display.contentHeight*0.75


	local month = display.newText("",888,115,"font/잘풀리는오늘 Medium.ttf",40)
	month:setFillColor(0)
	month.size = 25
	month.x, month.y =  display.contentWidth*0.69, display.contentHeight*0.162
	sceneGroup:insert(month)
-- 이전 달 할 일 1
	local former = display.newText("",793,175,"font/NanumSquareRoundB.ttf",20)
	former.anchorX = 0
	former:setFillColor(0.8, 0.2, 0.1)
	former.size = 15
	former.x, former.y = display.contentWidth*0.622, display.contentHeight*0.244
	former.text = loadedSettings.former1
	sceneGroup:insert(former)
-- 이전 달 할 일 2
	local former2 = display.newText("",793,197,"font/NanumSquareRoundB.ttf",20)
	former2.anchorX = 0
	former2:setFillColor(0.8, 0.2, 0.1)
	former2.size = 15
	former2.x, former2.y=display.contentWidth*0.622, display.contentHeight*268
	former2.text = loadedSettings.former2
	sceneGroup:insert(former2)
-- 다음 달 할 일 1
	local next1 = display.newText("dd",793,254,"font/NanumSquareRoundB.ttf",20)
	next1.anchorX = 0
	next1:setFillColor(0)
	next1.size = 15
	next1.x, next1.y =display.contentWidth*0.622, display.contentHeight*0.352
	next1.text = loadedSettings.next1
	sceneGroup:insert(next1)
-- 다음 달 할 일 2
	local next2 = display.newText("dd",793,276,"font/NanumSquareRoundB.ttf",20)
	next2.anchorX = 0
	next2:setFillColor(0)
	next2.size = 15
	next2.x, next2.y = display.contentWidth*0.622, display.contentHeight*0.375
	next2.text = loadedSettings.next2
	sceneGroup:insert(next2)

--3으로 임의로 나눔.
	local red = loadedSettings.red / 5
	local yellow = loadedSettings.yellow / 5
	local blue = loadedSettings.blue / 5
	local green = loadedSettings.green / 5
	local purple = loadedSettings.purple /5
	
	if red > 5 then
		red = 5
	elseif yellow > 5 then
		yellow=5 
	elseif blue> 5 then
		blue =5
	elseif green > 5 then
		green =5
	elseif purple > 5 then
		purple = 5
	end  
	
	local hrt1 = {}
	local hrt2 = {}
	local hrt3 = {}
	local hrt4 = {}
	local hrt5 = {}
	print(red.. "red"..green.."green" .. yellow .."yellow"..blue.."blue"..purple.."purple")
	
	 for i = 1,red do
        hrt1[i] = display.newImage("이미지/호감도/호감도 하트.png")
        hrt1[i].x, hrt1[i].y = display.contentWidth*(0.269 + ((i-1) * 0.025)), display.contentHeight*0.519
        hrt1[i].alpha = 0
		print(red.. "red" .. i)
		sceneGroup:insert(hrt1[i])
	end

	 for i = 1, green do
        hrt2[i] = display.newImage("이미지/호감도/호감도 하트.png")
        hrt2[i].x, hrt2[i].y = display.contentWidth*(0.448 + ((i-1) * 0.025)), display.contentHeight*0.519
        hrt2[i].alpha = 0
		sceneGroup:insert(hrt2[i])
		print(green.."green" .. i)
	end

	for i = 1, yellow do
        hrt3[i] = display.newImage("이미지/호감도/호감도 하트.png")
        hrt3[i].x, hrt3[i].y = display.contentWidth*(0.627 + ((i-1) * 0.025)), display.contentHeight*0.519
        hrt3[i].alpha = 0
		print(yellow.."yellow" .. i)
		sceneGroup:insert(hrt3[i])
	end

	for i = 1, blue do
        hrt4[i] = display.newImage("이미지/호감도/호감도 하트.png")
        hrt4[i].x, hrt4[i].y = display.contentWidth*(0.359 + ((i-1) * 0.025)), display.contentHeight*0.792
        hrt4[i].alpha = 0
		sceneGroup:insert(hrt4[i])
		print(blue.."blue" .. i)
	end

	for i = 1, purple do
        hrt5[i] = display.newImage("이미지/호감도/호감도 하트.png")
        hrt5[i].x, hrt5[i].y = display.contentWidth*(0.538 + ((i-1) * 0.025)), display.contentHeight*0.792
        hrt5[i].alpha = 0
		sceneGroup:insert(hrt5[i])
		print(purple.."purple" .. i)
	end


	loadedSettings.month = loadedSettings.month -1
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
	local options = {
		effect="fade",
		time = 1000
	}
	print("likeability")
	
	local function touch(event)
		letter1.alpha = 0
		my_daesapan.alpha= 0
		letter2.alpha = 1
		text.alpha = 0
		text2.alpha = 0
		month.alpha = 0
		former2.alpha = 0
		former.alpha = 0
		next2.alpha = 0
		next1.alpha = 0
		bt.alpha = 1
		rect.alpha = 0.5
		--hrt5.alpha = 1
		for i = 1,red do
			hrt1[i].alpha = 1
		end

		for i = 1,green do
			hrt2[i].alpha = 1
		end

		for i = 1,yellow do
			hrt3[i].alpha = 1
		end

		for i = 1,blue do
			hrt4[i].alpha = 1
		end

		for i = 1,purple do
			hrt5[i].alpha = 1
		end
		letter1:removeEventListener("touch",touch)
	end

	local function touch2(event)
		loadedSettings.month = loadedSettings.month + 1
		if loadedSettings.month == 6 then
			print("byebye")
			composer.removeScene("likeability")
			if find1 == 1 then
				composer.setVariable("find1", 2)	
				loadsave.saveTable(loadedSettings,"settings.json")	
				composer.gotoScene("item_find_event",options)
			elseif find2 == 1 then
				composer.setVariable("find2", 2)	
				loadsave.saveTable(loadedSettings,"settings.json")
				composer.gotoScene("item_find_event",options)
			elseif find3 == 1 then
				composer.setVariable("find3", 2)
				loadsave.saveTable(loadedSettings,"settings.json")
				composer.gotoScene("item_find_event",options)
			elseif find4 == 1 then
				composer.setVariable("find4", 2)	
				loadsave.saveTable(loadedSettings,"settings.json")
				composer.gotoScene("item_find_event",options)
			elseif find5 == 1 then
				composer.setVariable("find5", 2)
				loadsave.saveTable(loadedSettings,"settings.json")	
				composer.gotoScene("item_find_event",options)
			else
				composer.gotoScene("view99end",options)
			end
		else
			composer.removeScene("likeability")
			print(find1)
			if find1 == 1 then
				composer.setVariable("find1", 2)	
				loadsave.saveTable(loadedSettings,"settings.json")	
				composer.gotoScene("item_find_event",options)
			elseif find2 == 1 then
				composer.setVariable("find2", 2)	
				loadsave.saveTable(loadedSettings,"settings.json")
				composer.gotoScene("item_find_event",options)
			elseif find3 == 1 then
				composer.setVariable("find3", 2)
				loadsave.saveTable(loadedSettings,"settings.json")
				composer.gotoScene("item_find_event",options)
			elseif find4 == 1 then
				composer.setVariable("find4", 2)	
				loadsave.saveTable(loadedSettings,"settings.json")
				composer.gotoScene("item_find_event",options)
			elseif find5 == 1 then
				composer.setVariable("find5", 2)
				loadsave.saveTable(loadedSettings,"settings.json")	
				composer.gotoScene("item_find_event",options)
			else
				composer.gotoScene("view01_month",options)
			end
		end
	end


	letter1:addEventListener("tap",touch)
	bt:addEventListener("tap",touch2)

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
		composer.removeScene("View13Plan")
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