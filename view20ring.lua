--링 통과하는 게임 진행하는 화면


local composer = require( "composer" )

local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	--require
	local physics = require ("physics")
	physics.start()

	local value1 = {}
	for i=1,10 do
		value1[i] = math.random(0,200)
	end

	local value2 = {}
	for i=1,10 do
		value2[i] = 900 + i * 400
	end
	
	--배경화면
	local bg = display.newImage( "image/ring_bg.png", display.contentWidth, display.contentHeight)
    bg.x = display.contentWidth/2
    bg.y = display.contentHeight/2
    sceneGroup:insert(bg)

	--객체
	local user = display.newImageRect("image/user3.png", 100, 140)
	user.x = 300
	user.y = 200
	user.rotation = 65
	physics.addBody(user, "dynamic", {density=.10, friction=.2, bounce=0.2, radius=15})
	sceneGroup:insert(user)

--그룹
	local rint = {}
	local rintGroup = display.newGroup()
	
    local inv4 = {}
	local inv3 = {}
    local walld = {}
    for i=1,10 do
        walld[i] = display.newImage("image/long_ring.png")
        walld[i].x = value2[i]
        walld[i].y = 500+value1[i]
        sceneGroup:insert(walld[i])
        --physics.addBody(walld[i], "static")   

		inv4[i] = display.newImage("image/rint1.png")
		inv4[i].x = value2[i]
		inv4[i].y = 9 + value1[i]
		sceneGroup:insert(inv4[i])
		physics.addBody(inv4[i], "static")

		inv3[i] = display.newImage("image/rint3.png")
		inv3[i].x = value2[i]
		inv3[i].y = 689+value1[i]
		sceneGroup:insert(inv3[i])
		physics.addBody(inv3[i], "static")
       
	end

    

	--all()
	local inv1 = display.newImage("image/invisible.png")
	inv1.x = 0
	inv1.y = -10
	physics.addBody(inv1, "static")
	local inv2 = display.newImage("image/invisible.png")
	inv2.x = 0
	inv2.y = 730
	physics.addBody(inv2, "static")
	
	sceneGroup:insert(inv1)
	sceneGroup:insert(inv2)




	--function
	function movewall(self, event)
		if self.x < -2700 then
			self.x = 1300
		else
			self.x = self.x - 5	
		end
    end
    
    for i=1, 10 do
        walld[i].enterFrame = movewall
        Runtime:addEventListener("enterFrame", walld[i])
        inv3[i].enterFrame = movewall
        Runtime:addEventListener("enterFrame", inv3[i])
        inv4[i].enterFrame = movewall
        Runtime:addEventListener("enterFrame", inv4[i])
    end

	function activeUser(self, event)
		self:applyForce(0, -1.5, self.x, self.y)
	end

	function touchScreen(event)
		if event.phase == "began" then
			user.enterFrame = activeUser
			Runtime:addEventListener("enterFrame", user)
		end
		
		if event.phase == "ended" then
			Runtime:removeEventListener("enterFrame", user)
		end
	end

	Runtime:addEventListener("touch",touchScreen)

	--timer
	local time = 0
 
	local function Timer(event)
		time = time + 1
		composer.setVariable("score", time)

		if  time == 15  then

			inv1:removeEventListener( "collision" )
			inv2:removeEventListener( "collision" )

			for i=1,10 do
    
       			inv3[i]:removeEventListener( "collision" )
        		inv4[i]:removeEventListener( "collision" )
        		Runtime:removeEventListener("enterFrame", inv3[i])
        		Runtime:removeEventListener("enterFrame", inv4[i])
        		Runtime:removeEventListener("enterFrame", walld[i])
			end

			Runtime:removeEventListener("touch",touchScreen)
			Runtime:removeEventListener("enterFrame", user)

         	display.remove(user)

			composer.setVariable("score", time)
			composer.removeScene("view19ring") --game
			composer.gotoScene("view20ring") --gameover

			timer.cancel( event.source )
	 
			
		end
	end
	
	local tmr = timer.performWithDelay(1000, Timer, 15)

	local function onLocalCollision( self, event )
 
		if ( event.phase == "began" ) then



			inv1:removeEventListener( "collision" )
			inv2:removeEventListener( "collision" )

			for i=1,10 do
    
       			inv3[i]:removeEventListener( "collision" )
        		inv4[i]:removeEventListener( "collision" )
        		Runtime:removeEventListener("enterFrame", inv3[i])
        		Runtime:removeEventListener("enterFrame", inv4[i])
        		Runtime:removeEventListener("enterFrame", walld[i])
			end

			composer.setVariable("score", time)
			--transition.
			timer.cancel(tmr)

			Runtime:removeEventListener("touch",touchScreen)
			Runtime:removeEventListener("enterFrame", user)

         	display.remove(user)
         	

			composer.removeScene("view19ring")
			composer.gotoScene("view20ring")
	 
		
			
		end
	end
	 
	user.collision = onLocalCollision
	user:addEventListener( "collision" )
	
	inv1.collision = onLocalCollision
	inv1:addEventListener( "collision" )
	inv2.collision = onLocalCollision
	inv2:addEventListener( "collision" )

    for i=1,10 do
        --walld[i].collision = onLocalCollision
        --walld[i]:addEventListener( "collision" )
        inv3[i].collision = onLocalCollision
        inv3[i]:addEventListener( "collision" )
        inv4[i].collision = onLocalCollision
        inv4[i]:addEventListener( "collision" )
	end
	
	
	-- all objects must be added to group (e.g. self.view)

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
		composer.removeScene("view19ring")
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
