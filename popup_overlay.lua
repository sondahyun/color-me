-- popup_overlay.lua
-- 공통 팝업 오버레이 모듈
-- 사용법: composer.setVariable("popup_image", 이미지경로)
--         composer.setVariable("popup_exit_x", X비율)
--         composer.setVariable("popup_exit_y", Y비율)
--         composer.setVariable("popup_scene_name", 씬이름)
--         composer.showOverlay("popup_overlay", { isModal = true })

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
    local sceneGroup = self.view

    local popupImage = composer.getVariable("popup_image")
    local exitX = composer.getVariable("popup_exit_x") or 0.695
    local exitY = composer.getVariable("popup_exit_y") or 0.4
    local sceneName = composer.getVariable("popup_scene_name") or "popup_overlay"

    local black = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
    black.alpha = 0.5
    black:setFillColor(0)
    sceneGroup:insert(black)

    local popup = display.newImage(popupImage)
    popup.x, popup.y = display.contentWidth * 0.5, display.contentHeight * 0.5
    sceneGroup:insert(popup)

    local function go_back(event)
        if event.phase == "began" then
            composer.hideOverlay(sceneName)
        end
    end

    local exit = display.newImage("이미지/공통/x버튼.png")
    exit.x, exit.y = display.contentWidth * exitX, display.contentHeight * exitY
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
