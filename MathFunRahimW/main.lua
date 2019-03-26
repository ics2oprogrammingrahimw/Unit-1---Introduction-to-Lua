-- Title: MathFun
-- Name: Your Name
-- Course: ICS2O/3C
-- This program...displays math questions to the user if they get it right it tells
-- them so and if they get it wrong it tells them that 


display.setStatusBar(display.HiddenStatusBar)
display.setDefault("background", 25/255, 255/255, 25/255)




local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectObject



local function AskQuestion()
	randomOperator = math.random(1,4)

	-- **** FOR TESTING DELETE AFTER
	randomOperator = 4
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


local function NumericFieldListener( event )
	if ( event.phase == "began" ) then 


		event.target.text = ""

	elseif (event.phase == "submitted") then

		userAnswer = tonumber(event.target.text)

		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			timer.performWithDelay(2000, HideCorrect) 
		else
			incorrectObject.isVisible = true
			timer.performWithDelay(2000, HideIncorrect )
		end
	end
end
		
	


questionObject = display.newText( "" , display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject:setTextColor(100/255, 42/255, 198/255)

correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(100/255, 42/255, 198/255)
correctObject.isVisible = false

incorrectObject = display.newText("Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject:setTextColor(255/255, 25/255, 25/255)
incorrectObject.isVisible = false


numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.inputType = "number"

numericField:addEventListener( "userInput", NumericFieldListener)

AskQuestion()


