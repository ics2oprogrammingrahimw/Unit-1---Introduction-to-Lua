-- Title: WhackAMole
-- Name: Your Name
-- Course: ICS2O/3C
-- This program...shows a random mole and once you click on it it diapears


display.setStatusBar(display.HiddenStatusBar)

display.setDefault("background", 1, 0, 0)




local mole = display.newImage( "Images/Frank.png", 0, 0)

mole.x = display.contentCenterX
mole.y = display.contentCenterY

mole:scale(1,1)
mole.isVisible = false

local score = 0




local scoreText

function PopUp()

	mole.x = math.random( 0, display.contentWidth)
	mole.y = math.random( 0, display.contentHeight)
	mole.isVisible = true
	timer.performWithDelay(500, Hide)
end

function PopUpDelay()
	timer.performWithDelay( 3000, PopUp)
end

function Hide()
	mole.isVisible = false
	PopUpDelay()
end

function GameStart()
	PopUpDelay()
end

function Whacked(event)
	if (event.phase == "began") then
		score = score + 1
		scoreText.text = score .. ""	
	end
end

scoreText = display.newText( score, display.contentWidth/3, display.contentHeight/2, nil, 100)	

mole:addEventListener("touch", Whacked)
GameStart()
