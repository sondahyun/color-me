local loadsave = require( "loadsave" )
local composer = require( "composer" )
local scene = composer.newScene()
local json = require( "json" ) 

function scene:create( event )
    local sceneGroup = self.view
-- 객체 생성
    print("title")
    -- showoverlay 함수 사용 option
    local options = {
        isModal = true
    }

    local background = display.newImageRect("이미지/타이틀/메인.png",display.contentWidth, display.contentHeight)
    background.x,background.y = display.contentWidth/2,display.contentHeight/2
    sceneGroup:insert(background)

    local newgame = display.newImage("이미지/타이틀/새게임.png")
    newgame.x,newgame.y = display.contentWidth * 0.42, display.contentHeight * 0.9
    sceneGroup:insert(newgame)

    local loadgame = display.newImage("이미지/타이틀/로드버튼.png")
    loadgame.x,loadgame.y = display.contentWidth * 0.58, display.contentHeight * 0.9
    sceneGroup:insert(loadgame)

    local titlePopup = display.newImage("이미지/타이틀/이름설정팝업.png")
    titlePopup.x,titlePopup.y = display.contentWidth/2,display.contentHeight/2
    titlePopup.alpha = 0
    sceneGroup:insert(titlePopup)

    local titleButton = display.newImage("이미지/타이틀/이름결정.png")
    titleButton.x,titleButton.y = display.contentWidth/2, display.contentHeight * 0.65
    titleButton.alpha = 0
    sceneGroup:insert(titleButton)

    --샘플 볼륨 이미지
    local volumeButton = display.newImage("이미지/타이틀/설정.png")
    volumeButton.x,volumeButton.y = display.contentWidth * 0.87, display.contentHeight * 0.9
    sceneGroup:insert(volumeButton)

    --샘플볼륨함수--
    local function setVolume(event)
        composer.showOverlay( "volumeControl", options )
    end
    volumeButton:addEventListener("tap",setVolume)

-- 엔딩 제이쓴 파일 생성
    local path = system.pathForFile( "endings.json", system.DocumentsDirectory)
 
    local file, errorString = io.open( path, "r" )
    if not file then
        print("make an ending file")
        --엔딩관련 데이터 파일 생성
        local endings = {
            rainbow = 0,
            bonus = 0,
            orange = 0,
            violet = 0,
            act_orange = 0,
            act_chung = 0,
            act_violet = 0,
            red = 0,
            yellow = 0,
            blue = 0,
            green = 0,
            purple = 0,
            good = 0,
            bad = 0,
            pastel_red = 0,
            pastel_yellow = 0,
            pastel_blue = 0,
            pastel_green = 0,
            pastel_purple = 0,
            end_num = 0,
            bgMusic = "음악/튜토리얼.mp3",
            logValue = "0.5",
            slider = 50,
            logValue_effect = "0.5",
            slider_effect = 50
        }
        loadsave.saveTable( endings, "endings.json" )
    end



    loadedEndings = loadsave.loadTable( "endings.json" )
    
-- showoverlay 함수 사용 option

    local options = {
        isModal = true
        
    }

    local j = 0
    local function bigbig1 (event)
        --print(event.target.width .. event.target.height)
        if (event.target.x-event.x)^2 + (event.target.y-event.y)^2 < 40^2 then
            -- i값을 지정해 놓는 이유는 범위 안에서는 크기가 더 늘어나거나 줄어들지 않고, 소리가 연이어 나오지 않음.
            if j == 0 then
                local backgroundMusicChannel = audio.play(click1)
                event.target.width = event.target.width*1.1
                event.target.height = event.target.height*1.1
                j = j + 1
            end
        
        elseif (event.target.x-event.x)^2 + (event.target.y-event.y)^2 > 40^2 then
            if j == 1 then
                event.target.width = event.target.width/11*10
                event.target.height = event.target.height/11*10
                j = j - 1 
            end
            
        end
    end

    local function specialMove(event)
        if event.phase == "began" then
            special:removeEventListener("mouse",bigbig1)
            composer.showOverlay("title4(special)",options)
        end
    end

    --크레딧 버튼
    local credit = display.newImage("이미지/크레딧/버튼.png")
    credit.x, credit.y = display.contentWidth*0.95,display.contentHeight*0.9
    sceneGroup:insert(credit)
    credit:addEventListener("mouse",bigbig1)
    --credit:addEventListener("touch",specialMove)

    --스페셜 버튼
    local special = display.newImage("이미지/특별일러스트/버튼.png")
    special.x, special.y = display.contentWidth*0.13,display.contentHeight*0.9
    sceneGroup:insert(special)
    special:addEventListener("mouse",bigbig1)


    -- 엔딩 이미지 객체 생성 및 move 이벤트 리스너 추가

    local function move(event)
        if event.phase == "began" then
            composer.removeScene("title")
            composer.gotoScene("title1")
        end
    end

    local ending = display.newImage("이미지/타이틀/엔딩모음.png")
    ending.x, ending.y = display.contentWidth*0.05,display.contentHeight*0.9
    sceneGroup:insert(ending)
    ending:addEventListener("touch",move)
    ending:addEventListener("mouse",bigbig1)
    volumeButton:addEventListener("mouse",bigbig1)

    -- 270.9,98.7
    local i = 0
    local function bigbig (event)
        if ((event.target.x-event.x)^2 < 13000) and ((event.target.y-event.y)^2<1700) then
            -- i값을 지정해 놓는 이유는 범위 안에서는 크기가 더 늘어나거나 줄어들지 않고, 소리가 연이어 나오지 않음.
            if i == 0 then
               -- local backgroundMusicChannel = audio.play(click1)
                event.target.width = event.target.width*1.1
                event.target.height = event.target.height*1.1
                i = i + 1
            end
        end
        if ((event.x-event.target.x)^2 > 9000) then
            if i == 1 then
                event.target.width = event.target.width/11*10
                event.target.height = event.target.height/11*10
                i = i - 1 
            end
        elseif ((event.target.y-event.y)^2>1100) then
            if i == 1 then
                event.target.width = event.target.width/11*10
                event.target.height = event.target.height/11*10
                i = i - 1 
            end
        end
    end

    
-- newgame 객체 생성 및 openpopup 리스너 추가
    local function openPopup()
        composer.removeScene("title")
        composer.gotoScene("title2")
    end
    newgame:addEventListener("touch",openPopup)
    newgame:addEventListener("mouse",bigbig)

    -- 화면전환 이펙트
    local options1={
        effect = "fade",
        time = 2000
    }


    local function startLoad(event)
            --세이브 파일 불러오기--
            -- Path for the file to read
            local path = system.pathForFile( "settings.json", system.DocumentsDirectory)
 
            -- Open the file handle
            local file, errorString = io.open( path, "r" )
 
            if not file or (loadedEndings.end_num==1) then
                composer.showOverlay( "nosave", options )
            else
                composer.removeScene("title")
                composer.gotoScene( "view00Room")
                -- ,options1
                audio.pause( titleMusic )
                local home = audio.loadStream( "음악/집.mp3" )
                audio.setVolume( loadedEndings.logValue )
                audio.play(home)
            end
    end
    loadgame:addEventListener("touch",startLoad)
    loadgame:addEventListener("mouse",bigbig)



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