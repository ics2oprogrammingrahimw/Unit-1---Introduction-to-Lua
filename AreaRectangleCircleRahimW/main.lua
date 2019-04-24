-- Title: AreaOfRectangleAndCircle
-- Name: Your Name
-- Course: ICS2O/3C
-- This program....displays a colored rectangle with a border of a different color. It also calculates the rectangles area  and displays it on the screen.
-- Then i added the code to draw a circle of a different color. i used the radius to calculate the area and displayed this on the iPad
local areaText
local textsize = 50
local myRectangle
local widthOfRectangle = 349
local heightOfRectangle = 201
local AreaOfRectangle

--set backround color of the screen.Remember that colors are between 0 and 1.
display.setDefault("background", 78/255, 110/255, 100/255)

--removing the status bar
display.setStatusBar(display.HiddenStatusbar)


--draw the rectangle that is half the width and height of the screen size
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

-- anchor the rectangle in the top left corner on the screen and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 20
myRectangle.y = 20

-- set the width of the border
myRectangle.strokeWidth = 20

-- set the color of the rectangle
myRectangle:setFillColor(0.9, 0.1, 0.3)

--set the color of the border 
myRectangle:setStrokeColor(0, 1, 0)

-- calculate the area 
AreaOfRectangle = widthOfRectangle * heightOfRectangle

-- write the area on the screen. take into consideration the size of the font when positioning it on the screen
areaText = display.newText("The area of this rectangle with a width of \n" .. 

	widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is " .. 
	AreaOfRectangle .. " pixels².", 0, 0, Arial, textSize)

--anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 20
areaText.y = display.contentHeight/2

--set the color of the newText
areaText:setTextColor(1,1,1)

