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
beam:scale(1,4)

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

bkg.width = display.contentWidth/2
bkg.height = display.contentHeight/2

bkg:toBack()

bkg:scale(3,3)
local function firstball()
	
	local ball1 = display.newImage("Images/super_ball.png", 0, 0)

	physics.addBody(ball1, {density=1.0, friction=0.7, bounce=0.9, radius=25})
end

local function secondBall()

	local ball2 = display.newImage("Images/super_ball.png", 1,0)

	
	ball2:scale(2, 2)

	physics.addBody(ball2, {density=1.0, friction=0.5, bounce=0.3, radius=12.5})
end



local function thirdball()

	local Ball3 = display.newImage("Images/super_ball.png", 1, 0)

	Ball3:scale(2.5,2.5)

	physics.addBody(Ball3, {density=1.5, friction=0.7, bounce=0.6, radius=80})
end


local function FourthBall()

	local Ball4 = display.newImage("Images/super_ball.png", 1, 0)

	Ball4:scale(2.2, 2.2)

	physics.addBody(Ball4, {density=1.0, friction=0.2, bounce=0.6})
end



timer.performWithDelay( 0, thirdball)

timer.performWithDelay( 1000, firstball)

timer.performWithDelay( 500, secondBall)

timer.performWithDelay( 700, FourthBall)




