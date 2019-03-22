-- Title: MovingImages
-- Name: Rahim Williasms
-- Course: ICS2O/3C
-- This program moves a beetleship across the screen and then makes it fade out. I added another object that moves in a different direction as well as a background image

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 3

-- background image with the width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local CashSound = audio.loadSound( "Sounds/Cash.mp3")
local CashSoundChannel 
local WrongSound = audio.loadSound( "Sounds.wrongSound(1).mp3")
local WrongSoundChannel 

-- character image with with width and height 
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

--set the image to be transparent
beetleship.alpha = 0

--set the inatial x and y position of the beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/03

--Function: MoveShip
--Input:this function accepsts an event listener
--output:None
-- Description: this function adds thr scroll speed to the x-value of the ship
local function MoveShip(event)

	-- add the scroll speed the the x-value of the ship 
	beetleship.x = beetleship.x + scrollSpeed
	beetleship.alpha = beetleship.alpha + 0.005
	WrongSoundChannel = audio.play(wrongSound)
end

Runtime:addEventListener("enterFrame", MoveShip)


scrollSpeed = 4

local planet = display.newImageRect("Images/planet.png", 200, 200)

planet.alpha = 1

planet.x = 1024
planet.y = display.contentHeight/10

local function MovePlanet(event)

	planet.x = planet.x - scrollSpeed
	planet.alpha = planet.alpha - 0.002
	CashSoundChannel = audio.play(cashSound)
end

Runtime:addEventListener ("enterFrame", MovePlanet)