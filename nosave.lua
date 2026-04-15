-- nosave.lua (래퍼)
-- 저장할 게임이 없을 때 로드를 눌렀을 시 뜨는 팝업창
local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
    local sceneGroup = self.view

    local black = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
    black.alpha = 0.5
    black:setFillColor(0)
    sceneGroup:insert(black)

    local popup = display.newImage("이미지/공통/팝업창/로드게임실패.png")
    popup.x, popup.y = display.contentWidth/2, display.contentHeight/2
    sceneGroup:insert(popup)

    local function go_back(event)
        if event.phase == "began" then
            composer.hideOverlay("nosave")
        end
    end

    local exit = display.newImage("이미지/공통/x버튼.png")
    exit.x, exit.y = display.contentWidth * 0.64, display.contentHeight * 0.375
    sceneGroup:insert(exit)
    exit:addEventListener("touch", go_back)
end

function scene:show( event ) end
function scene:hide( event ) end
function scene:destroy( event ) end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene
