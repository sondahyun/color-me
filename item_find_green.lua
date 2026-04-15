-- item_find_green.lua
-- 초록마을 숨은그림찾기: 물뿌리개
local composer = require( "composer" )
local scene = composer.newScene()
local findColor = require("item_find_color")

findColor.setup(scene, {
    colorId = 5,
    sceneName = "item_find_green",
    bgImage = "이미지/대화/우정배경/초록.png",
    picImage = "이미지/숨은그림찾기/숨은그림찾기-물뿌리개.png",
    answerImage = "이미지/숨은그림찾기/정답-물뿌리개.png",
    s1x = 0.655, s1y = 0.625, s1w = 85, s1h = 120,
    s1Color = 0,
    micX = 0.6628, micY = 0.6248
})

return scene
