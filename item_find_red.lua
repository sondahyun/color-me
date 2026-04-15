-- item_find_red.lua
-- 빨강마을 숨은그림찾기: 하트수첩
local composer = require( "composer" )
local scene = composer.newScene()
local findColor = require("item_find_color")

findColor.setup(scene, {
    colorId = 1,
    sceneName = "item_find_red",
    bgImage = "이미지/대화/우정배경/빨강.png",
    picImage = "이미지/숨은그림찾기/숨은그림찾기-하트수첩.png",
    answerImage = "이미지/숨은그림찾기/정답-하트수첩.png",
    s1x = 0.585, s1y = 0.6, s1w = 70, s1h = 75,
    s1Color = 1,
    micX = 0.5865, micY = 0.597
})

return scene
