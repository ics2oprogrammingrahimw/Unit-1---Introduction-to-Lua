-- Title: TouchAndDrag
-- Name: Rahim Williams
-- Course: ICS2O/3C
-- This program...has two images on the screen,
--when i click and drag on the image it moves with my finger


display.setStatusBar(display.HiddenStatusBar)

local backgroundimage = display.newImageRect("Images/Purplegirl.png", 150, 150)
local Purplegirl = display.newImageRect("Images/background.png", 2048, 1536)
local PurplegirlWidth = Purplegirl.width
local PurplegirlHeight = Purplegirl.height 

local pinkgirl = display.newImageRect("Images/Pinkgirl.png", 150, 150)
local pinkgirlWidth = pinkgirl.width 
local pinkgirlHeight = pinkgirl.height
 
local alreadyTouchedpurplegirl = false
local alreadyTouchedpinkgirl = false

Purplegirl.x = 400
Purplegirl.y = 500

pinkgirl.x = 300
pinkgirl.y = 200

local function pinkgirlListener(touch)

    if (touch.phase == "began") then
    	if (alreadyTouchedpurplegirl == false) then
    		alreadyTouchedpinkgirl = true
    	end
    end

    if ( (touch.phase == "moved") and (alreadyTouchedpurplegirl == true) ) then
    	Purplegirl.x = touch.x
    	Purplegirl.y = touch.y
    end

    if (touch.phase == "ended") then
        alreadyTouchedpurplegirl = false
        alreadyTouchedpinkgirl = false
    end
end

pinkgirl:addEventListener("touch", pinkgirlListener)


local function purplegirlListener(touch)

    if (touch.phase == "began") then
    	if (alreadyTouchedpurplegirl == false) then
    		alreadyTouchedpinkgirl = true
    	end
    end

    if ( (touch.phase == "moved") and (alreadyTouchedpurplegirl == true) ) then
    	Purplegirl.x = touch.x
    	Purplegirl.y = touch.y
    end

    if (touch.phase == "ended") then
        alreadyTouchedpurplegirl = false
        alreadyTouchedpinkgirl = false
    end
end

purplegirl:addEventListener("touch", purplegirlListener)


