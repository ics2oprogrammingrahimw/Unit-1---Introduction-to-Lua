display.setStatusBar(display.HiddenStatusBar)
display.setDefault("background", 0/255, 249/255, 199/255)

local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectObject


local function AskQuestion()

	randomNumber1 = math.random(0, 10)
	randomNumber2 = math.random(0, 10)

	correctAnswer = randomNumber1 + randomNumber2

	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
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
questionObject:setTextColor(155/255, 42/255, 198/255)

correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(155/255, 42/255, 198/255)
correctObject.isVisible = false

incorrectObject = display.newText("Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject:setTextColor(255/255, 25/255, 25/255)
incorrectObject.isVisible = false


numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.inputType = "number"

numericField:addEventListener( "userInput", NumericFieldListener)

AskQuestion()






