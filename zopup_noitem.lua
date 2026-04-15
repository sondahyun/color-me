-- zopup_noitem.lua (래퍼)
-- 아이템 없음 팝업
local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
    local sceneGroup = self.view

    local black = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
    black.alpha = 0.5
    black:setFillColor(0)
    sceneGroup:insert(black)

    local popup = display.newImage("이미지/공통/팝업창/아이템없음.png")
    popup.x, popup.y = display.contentWidth * 0.5, display.contentHeight * 0.5
    sceneGroup:insert(popup)

    local function go_back(event)
        if event.phase == "began" then
            composer.hideOverlay("zopup_noitem")
        end
    end

    local exit = display.newImage("이미지/공통/x버튼.png")
    exit.x, exit.y = display.contentWidth * 0.645, display.contentHeight * 0.368
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
