-- item_find_yellow.lua
-- 노랑마을 숨은그림찾기: 마이크
local composer = require( "composer" )
local scene = composer.newScene()
local findColor = require("item_find_color")

findColor.setup(scene, {
    colorId = 3,
    sceneName = "item_find_yellow",
    bgImage = "이미지/대화/우정배경/노랑.png",
    picImage = "이미지/숨은그림찾기/숨은그림찾기-마이크.png",
    answerImage = "이미지/숨은그림찾기/정답-마이크.png",
    s1x = 0.265, s1y = 0.85, s1w = 70, s1h = 200,
    s1Color = 0,
    micX = 0.2615, micY = 0.8655
})

return scene
