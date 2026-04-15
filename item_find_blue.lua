-- item_find_blue.lua
-- 파랑마을 숨은그림찾기: 확성기
local composer = require( "composer" )
local scene = composer.newScene()
local findColor = require("item_find_color")

findColor.setup(scene, {
    colorId = 2,
    sceneName = "item_find_blue",
    bgImage = "이미지/대화/우정배경/파랑.png",
    picImage = "이미지/숨은그림찾기/숨은그림찾기-확성기.png",
    answerImage = "이미지/숨은그림찾기/정답-확성기.png",
    s1x = 0.365, s1y = 0.41, s1w = 60, s1h = 60,
    s1Color = 0,
    micX = 0.367, micY = 0.41
})

return scene
