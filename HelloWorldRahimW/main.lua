-- Title: HelloWorld
-- Name: Rahim W
-- Course: ICS2O/3C
-- This program displays Hello to the simulator and to the command terminal.
-----------------------------------------------------------------------------------

--print "hello, world" to the command terminal
print ("HelloWorld -by Rahim")

display.setDefault("background", 110/255, 11/255, 248/255)

--create a local variable
local text1

--displays text on the screen at position x = 487 and y = 499 with
-- a default font style and the font size of 60
text1 = display.newText( "Hello World -by Rahim", 499, 381, nil, 55)