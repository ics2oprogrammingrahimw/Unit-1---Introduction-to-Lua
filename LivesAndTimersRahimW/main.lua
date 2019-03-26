-- Title: LivesAndTimers
-- Name: Your Name
-- Course: ICS2O/3C
-- This program...gives a certain amount of lives and
-- displays a math question if answered
-- correctly says
-- so if answered incorrectly it takes away one of the lives

local totalSeconds = 5
local secondsLeft = 5
local clockText
local countDownTimer

local lives = 3
local heart1
local heart2
local heart3

heart1 = display.newImageRect("Images/heart.png" 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7



local function UpdateTime()
	secondsLeft = secondsLeft - 1


	clockText = secondsLeft .. ""

	if (secondsLeft == 0 )then 

		secondsLeft = totalSeconds
		lives = lives - 1

		if (lives == 2) then
			heart2.isVisible = false
		elseif (lives == 1) then
			heart1.isVisible = false
		end
	end
end

local function StartTimer()

	countDownTimer = timer.performWithDelay ( 1000, UpdateTime, 0)
end

-----------------------------------------------------------------------------------------


