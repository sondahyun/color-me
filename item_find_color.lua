-- item_find_color.lua
-- 숨은그림찾기 공통 로직 모듈 (함수 모듈, scene이 아님)
-- 각 래퍼 파일에서 고유한 scene 객체를 생성한 후 이 모듈의 setup 함수를 호출

local composer = require( "composer" )
local M = {}

function M.setup(scene, config)
    local colorId     = config.colorId
    local sceneName   = config.sceneName
    local bgImage     = config.bgImage
    local picImage    = config.picImage
    local answerImage = config.answerImage
    local s1x, s1y, s1w, s1h = config.s1x, config.s1y, config.s1w, config.s1h
    local s1Color     = config.s1Color or 0
    local micX, micY  = config.micX, config.micY

    function scene:create( event )
        local sceneGroup = self.view

        composer.setVariable("color", colorId)

        -- 클릭 영역 (투명 사각형)
        local S1 = display.newRect(display.contentWidth * s1x, display.contentHeight * s1y, s1w, s1h)
        S1:setFillColor(s1Color)
        sceneGroup:insert(S1)

        -- 배경
        local background = display.newImageRect(bgImage, display.contentWidth, display.contentHeight)
        background.x, background.y = display.contentWidth * 0.5, display.contentHeight * 0.5
        sceneGroup:insert(background)

        local frame2 = display.newImage("이미지/숨은그림찾기/틀2.png")
        frame2.x, frame2.y = display.contentWidth * 0.5, display.contentHeight * 0.5
        sceneGroup:insert(frame2)

        local pic = display.newImageRect(picImage, display.contentWidth * 0.5, display.contentHeight * 0.9)
        pic.x, pic.y = display.contentWidth * 0.5, display.contentHeight * 0.5
        sceneGroup:insert(pic)

        local mic = display.newImage(answerImage)
        mic.x, mic.y = display.contentWidth * micX, display.contentHeight * micY
        mic.alpha = 0
        sceneGroup:insert(mic)

        local frame1 = display.newImage("이미지/숨은그림찾기/틀1.png")
        frame1.x, frame1.y = display.contentWidth * 0.5, display.contentHeight * 0.5
        sceneGroup:insert(frame1)

        -- 기회 표시 (3회)
        local try1 = display.newImage("이미지/숨은그림찾기/기회.png")
        try1.x, try1.y = display.contentWidth * 0.173, display.contentHeight * 0.142
        sceneGroup:insert(try1)

        local try2 = display.newImage("이미지/숨은그림찾기/기회.png")
        try2.x, try2.y = display.contentWidth * 0.173, display.contentHeight * 0.246
        sceneGroup:insert(try2)

        local try3 = display.newImage("이미지/숨은그림찾기/기회.png")
        try3.x, try3.y = display.contentWidth * 0.173, display.contentHeight * 0.35
        sceneGroup:insert(try3)

        -- 성공 표시
        local success = display.newImage("이미지/숨은그림찾기/O.png")
        success.x, success.y = display.contentWidth * micX, display.contentHeight * micY
        success.alpha = 0
        sceneGroup:insert(success)

        -- 타이머 UI
        local timeImg = display.newImageRect("이미지/미니게임/미니게임_시간타이머.png", display.contentWidth / 7.91, display.contentHeight / 3.78)
        timeImg.anchorX, timeImg.anchorY = 0, 0
        timeImg.x, timeImg.y = display.contentWidth / 1.180, display.contentHeight / 21.53
        sceneGroup:insert(timeImg)

        local limit = 30
        local showLimit = display.newText(limit, display.contentWidth / 1.1, display.contentHeight / 5.555, "font/잘풀리는오늘 Medium.ttf")
        showLimit:setFillColor(1, 0, 0)
        showLimit.size = 80
        sceneGroup:insert(showLimit)

        -- 정답 클릭
        local function find(event)
            success.alpha = 1
            mic.alpha = 1
            timer.cancelAll()
            composer.setVariable("color", colorId)
            composer.removeScene(sceneName)
            composer.gotoScene("item_find_success", { effect = "fade", time = 1000 })
        end
        S1:addEventListener("tap", find)

        -- 오답 클릭
        local i = 0
        local function tryWrong(event)
            i = i + 1
            if i == 1 then display.remove(try3) end
            if i == 2 then display.remove(try2) end
            if i == 3 then
                display.remove(try1)
                timer.cancelAll()
                composer.setVariable("color", colorId)
                composer.removeScene(sceneName)
                composer.gotoScene("item_find_fail", { effect = "fade", time = 1000 })
            end
        end
        frame1:addEventListener("tap", tryWrong)

        -- 타임어택
        local function timeAttack(event)
            limit = limit - 1
            showLimit.text = limit
            if limit == 0 then
                timer.cancelAll()
                composer.setVariable("color", colorId)
                composer.removeScene(sceneName)
                composer.gotoScene("item_find_fail", { effect = "fade", time = 1000 })
            end
        end
        timer.performWithDelay(1000, timeAttack, 0)
    end

    function scene:show( event ) end
    function scene:hide( event ) end
    function scene:destroy( event ) end

    scene:addEventListener( "create", scene )
    scene:addEventListener( "show", scene )
    scene:addEventListener( "hide", scene )
    scene:addEventListener( "destroy", scene )
end

return M
