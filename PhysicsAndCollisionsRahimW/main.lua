-- Title: PhysicsAndCollisions
-- Name: Your Name
-- Course: ICS2O/3C
-- This program...displays bouncing balls with a background and a beam 

display.setStatusBar(display.HiddenStatusBar)

local physics = require("physics")

physics.start()

local ground = display.newImage("Images/ground.png", 0, 0)

ground.x = display.contentWidth/2
ground.y = 768

ground.width = display.contentWidth

physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

local beam = display.newImage("Images/beam.png")

beam.x = display.contentCenterX/5
beam.y = display.contentCenterY*1.65

beam.x = display.contentWidth/24
beam.y = display.contentHeight*9/10

beam:rotate(-45)

beam:toBack()

physics.addBody(beam, "static", {friction=0.5, bounce=0.3})

local bkg = display.newImage("Images/bkg.png", 0, 0)

bkg.x = display.contentCenterX
bkg.y = display.contentCenterY

bkg.x = display.contentWidth
bkg.y = display.contentHeight

bkg:toBack()

local function firstball()
	
	local ball1 = display.newImage("Images/super_ball.png", 0, 0)

	physics.addBody(ball1, {density=1.0, friction=0.5, bounce=0.3, radius=25})
end

local function secondBall()

	local ball2 = display.newimage("Images/super_ball.png", 0, 0)

	physics.addBody(ball2, {density=1.0, friction=0.5, bounce=0.3, radius=12.5})

	ball2:scale(0.5, 0.5)
end

timer.performWithDelay( 0, firstball)

timer.performWithDelay( 500, secondball)



