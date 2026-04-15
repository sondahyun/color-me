-- item_find_purple.lua
-- 보라마을 숨은그림찾기: 글러브
local composer = require( "composer" )
local scene = composer.newScene()
local findColor = require("item_find_color")

findColor.setup(scene, {
    colorId = 4,
    sceneName = "item_find_purple",
    bgImage = "이미지/대화/우정배경/보라.png",
    picImage = "이미지/숨은그림찾기/숨은그림찾기-글러브.png",
    answerImage = "이미지/숨은그림찾기/정답-글러브.png",
    s1x = 0.333, s1y = 0.1, s1w = 90, s1h = 75,
    s1Color = 0,
    micX = 0.3333, micY = 0.1035
})

return scene
