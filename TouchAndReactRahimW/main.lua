-- Title: TouchAndReact
-- Name: Your Name
-- Course: ICS2O/3C
-- This program... when i click on the blue button a red 
--button appears as well as the word "clicked", a picture and a sound effect.
--When i release the button it returns to a blue button

display.setStatusBar(display.HiddenStatusBar)

display.setDefault ("background", 102/255, 51/255, 0/255)

local bluebutton = display.newImageRect("Images/Fast Button Inactive@2x.png",198, 96)
bluebutton.x = display.contentWidth/2
bluebutton.y = display.contentHeight/2
bluebutton.isVisible = true


local redbutton = display.newImageRect("Images/Fast Button Active@2x.png",198, 96)
redbutton.x = display.contentWidth/2
redbutton.y = display.contentHeight/2
redbutton.isVisible = false

local Click = display.newImageRect("Images/Click.png",200, 200)
Click.x = display.contentWidth/4
Click.y = display.contentHeight/2
Click.isVisible = false

local textObject = display.newText ("Clicked!", 0, 0, nil, 50)
textObject.x =  display.contentWidth/2
textObject.y =  display.contentHeight/3
textObject:setTextColor (1, 1, 0)
textObject.isVisible = false

local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		bluebutton.isVisible = false
		redbutton.isVisible = true
		textObject.isVisible = true
		Click.isVisible = true
	end

	if (touch.phase == "ended") then
		bluebutton.isVisible = true
		redbutton.isVisible = false
		textObject.isVisible = false
	end
end

bluebutton:addEventListener("touch", BlueButtonListener)

