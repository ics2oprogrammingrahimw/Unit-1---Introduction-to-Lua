-- Title: LivesAndTimers
-- Name: Your Name
-- Course: ICS2O/3C
-- This program...gives a certain amount of lives and
-- displays a math question if answered
-- correctly says
-- so if answered incorrectly it takes away one of the lives


display.setStatusBar(display.HiddenStatusBar)

-------------------------------------------------------------------------
-- LOCAL VARIABLES
-------------------------------------------------------------------------

local questionObject
local correctObject
local incorrectObject

local numericField

local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer

local totalSeconds = 5
local secondsLeft = 5
local clockText
local countDownTimer

local lives = 3
local heart1
local heart2
local heart3

local score = -1
local scoreImage
local scoreText

local bkg

local equals

local GameOver

-------------------------------------------------------------------------
-- OBJECT CREATION (IMAGES, TEXT, ETC)
-------------------------------------------------------------------------

bkg = display.newImageRect("Images/S.jpg", 2048, 1536)

heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth* 7 / 8
heart1.y = display.contentHeight* 1 / 7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth* 6 / 8
heart2.y = display.contentHeight* 1 / 7

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth* 5 / 8
heart3.y = display.contentHeight* 1 / 7

scoreImage = display.newImageRect("Images/down.png", 200, 200)
scoreImage.x = display.contentWidth* 1 / 8
scoreImage.y = display.contentHeight* 1 / 7

score = score + 1 

scoreText = display.newText( score, display.contentWidth/3, display.contentHeight/8, nil, 50)


equals = display.newImageRect("Images/download.png", 100, 100)
equals.x = display.contentWidth* 2 / 8
equals.y = display.contentHeight* 0.9 / 7

heart1.isVisible = true
heart2.isVisible = true
heart3.isVisible = true

questionObject = display.newText( "" , display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject:setTextColor(0/255, 0/255, 0/255)

correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(100/255, 42/255, 198/255)
correctObject.isVisible = false

incorrectObject = display.newText("Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject:setTextColor(255/255, 25/255, 25/255)
incorrectObject.isVisible = false


numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.inputType = "number"

clockText = display.newText( "", display.contentCenterX, 80, native.systemFont, 72)
GameOver = display.newImageRect("Images/gameOver.png", 100, 100)
GameOver.x = display.contentWidth / 2
GameOver.y = display.contentHeight / 2
GameOver.isVisible = false
GameOver:scale(10.5,10)


-------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-------------------------------------------------------------------------

local function AskQuestion()
	
	randomOperator = math.random(1,4)
    randomNumber1 = math.random(0,4)
	randomNumber2 = math.random(0,4)

	if (randomOperator == 1) then

		correctAnswer = randomNumber1 + randomNumber2

		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
    elseif (randomOperator == 2) then
    	
		correctAnswer = randomNumber1 - randomNumber2

    	questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
    elseif (randomOperator == 3) then

    	correctAnswer = randomNumber1 * randomNumber2

    	questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "
    elseif (randomOperator == 4) then
    	correctAnswer = (randomNumber1 / randomNumber2) * 10
    	correctAnswer = math.round(correctAnswer)
    	correctAnswer = correctAnswer / 10
    	print ("correctAnswer = " .. correctAnswer)

    	questionObject.text = randomNumber1 .. " / " .. randomNumber2 .. " = "
    	math.round(correctAnswer)
    end
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function ResetTimer()
	secondsLeft = 6
end


local function NumericFieldListener( event )
	if ( event.phase == "began" ) then 

		event.target.text = ""
	elseif (event.phase == "submitted") then

		userAnswer = tonumber(event.target.text)

		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			score = score + 1
			ResetTimer()
			scoreText.text = score .. ""

			timer.performWithDelay(2000, HideCorrect) 
		else
			incorrectObject.isVisible = true
			timer.performWithDelay(2000, HideIncorrect )
			heart1.isVisible = false
			lives = lives - 1
			ResetTimer()

		end
	end
end

local function UpdateTime()

	secondsLeft = secondsLeft - 1

	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0 ) then

		secondsLeft = totalSeconds
		lives = lives - 1

		if (lives == 2 ) then
			heart1.isVisible = false
		elseif (lives == 1) then
			heart2.isVisible = false
		elseif ( lives == 0)  then
			heart3.isVisible = false
			GameOver.isVisible = true
			numericField.isVisible = false
		end
	end
end

local function StartTimer()

	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end

		
-------------------------------------------------------------------------
-- LISTENERS
-------------------------------------------------------------------------

numericField:addEventListener( "userInput", NumericFieldListener)

-------------------------------------------------------------------------
-- FUNCTION CALLS
-------------------------------------------------------------------------
StartTimer()
AskQuestion()


