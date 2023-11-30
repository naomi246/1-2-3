import GUI
setscreen ("graphics:800;600")
colorback (85)
var score, opt /*Optimal Score*/, count2, count3, sum, c : int := 0
var roll, intans : int
var startTime, endTime, totalTime, mark : real
var intfont := Font.New ("Times New Roman:50")
var textfont := Font.New ("Times New Roman:15")
var subfont := Font.New ("Times New Roman:25")
var ans : string
var starx : int := 100
var stary : int := 500
var starx2 : int := 120
var stary2 : int := 520

procedure rightanswer
    score := score + 1
    opt := opt + 1
end rightanswer

procedure wronganswer
    opt := opt + 1
end wronganswer


var x, x2 : int := 150
var y, y2 : int := 150
%Dice rolling mechanism
procedure draw (diceRoll : int)
    Draw.FillBox (x, y, x2 + 80, y2 + 80, red)

    case diceRoll of

	label 1 :

	    Draw.FillOval (x + 40, y + 40, 5, 5, 31)

	label 2 :

	    Draw.FillOval (x + 70, y + 70, 5, 5, 31)
	    Draw.FillOval (x + 10, y + 10, 5, 5, 31)

	label 3 :

	    Draw.FillOval (x + 70, y + 70, 5, 5, 31)
	    Draw.FillOval (x + 40, y + 40, 5, 5, 31)
	    Draw.FillOval (x + 10, y + 10, 5, 5, 31)

	label 4 :

	    Draw.FillOval (x + 10, y + 70, 5, 5, 31)
	    Draw.FillOval (x + 70, y + 70, 5, 5, 31)
	    Draw.FillOval (x + 10, y + 10, 5, 5, 31)
	    Draw.FillOval (x + 70, y + 10, 5, 5, 31)

	label 5 :

	    Draw.FillOval (x + 10, y + 70, 5, 5, 31)
	    Draw.FillOval (x + 70, y + 70, 5, 5, 31)
	    Draw.FillOval (x + 40, y + 40, 5, 5, 31)
	    Draw.FillOval (x + 10, y + 10, 5, 5, 31)
	    Draw.FillOval (x + 70, y + 10, 5, 5, 31)

	label 6 :

	    Draw.FillOval (x + 10, y + 70, 5, 5, 31)
	    Draw.FillOval (x + 70, y + 70, 5, 5, 31)
	    Draw.FillOval (x + 10, y + 40, 5, 5, 31)
	    Draw.FillOval (x + 10, y + 10, 5, 5, 31)
	    Draw.FillOval (x + 70, y + 10, 5, 5, 31)
	    Draw.FillOval (x + 70, y + 40, 5, 5, 31)
    end case
end draw

procedure stats
    cls
    put "THANK YOU SO MUCH FOR PLAYING!"
    delay (1000)
    for star : 1 .. 5
	randint (c, 1, 15)
	drawstar (starx, stary, starx2, stary2, c)
	starx += 150
	starx2 += 150
    end for
    delay (1000)
    put ""
    put "You answered ", opt, " question in total! "
    delay (1000)
    put score, " of which you answered correctly."
    put ""
    delay (1000)
    put "That leaves you with a total score of..."
    delay (2000)
    put (score / opt) * 100, "%!!!"
    put ""
    mark := (score / opt) * 100
    if mark >= 90 then
	put "You've earned a GOLD MEDAL! GREAT WORK!!"
	drawfilloval (600, 300, 100, 100, yellow)
	Draw.Text ("1", 585, 280, intfont, white)
    elsif mark < 90 and mark >= 60 then
	put "You've earned a SILVER MEDAL! GOOD STUFF!"
	drawfilloval (600, 300, 100, 100, grey)
	Draw.Text ("2", 585, 280, intfont, white)
    elsif mark < 60 and mark <= 59 then
	put "You've earned a BRONZE MEDAL! HOORAY!"
	drawfilloval (590, 280, 100, 100, 41)
	Draw.Text ("3", 585, 280, intfont, white)
    end if
    startTime := Time.Sec
    loop
	delay (1000)
	randint (x, 0, maxx)
	randint (y, 0, maxy)
	randint (c, 1, 15)
	drawfilloval (x, y, 5, 5, c)
	endTime := Time.Sec
	exit when (endTime - startTime) = 30
    end loop

end stats



procedure levelThree
    cls
    Draw.Text ("Ok, here comes a bigger challenge...3 dice in 3 seconds!", 100, 300, textfont, red)
    startTime := Time.Sec
    sum := 0
    for dicenum : 1 .. 3
	randint (roll, 1, 6)
	sum += roll
	x += 220
	x2 += 220
	draw (roll)
	x -= 440
	x2 -= 440
    end for
    x += 660
    x2 += 660

    put "Value: " ..
    get ans
    loop
	exit when strintok (ans)
	put "There are no letters on the dice that you see on screen! Enter the sum of all dice (an integer value):" ..
	get ans
    end loop
    intans := strint (ans)
    endTime := Time.Sec
    totalTime := (endTime - startTime)
    if intans = sum and totalTime <= 3 then
	count3 := count3 + 1
    end if
    if intans = sum and totalTime <= 3 and count3 = 1 then
	cls
	Draw.Text ("Nice one!", 345, 300, subfont, red)
	delay (1000)
	var tryagainbutton2 : int := GUI.CreateButton (350, 560, 0, "Next please!", levelThree)
	rightanswer
    elsif intans = sum and totalTime <= 3 and count3 = 2 then
	cls
	Draw.Text ("Keep it up!", 347, 300, subfont, red)
	delay (1000)
	var tryagainbutton2 : int := GUI.CreateButton (350, 530, 0, "Keep 'em coming", levelThree)
	rightanswer
    elsif intans = sum and totalTime <= 3 and count3 = 3 then
	cls
	Draw.Text ("You got this!", 360, 300, subfont, red)
	var levelThreeButton : int := GUI.CreateButton (350, 500, 0, "WOO!", levelThree)
	rightanswer
    elsif intans = sum and totalTime <= 3 and count3 = 4 then
	cls
	Draw.Text ("Just one more...", 400, 300, subfont, red)
	var levelThreeButton : int := GUI.CreateButton (350, 470, 0, "Almost there...", levelThree)
	rightanswer
    elsif intans = sum and totalTime <= 3 and count3 = 5 then
	cls
	Draw.Text ("CONGRATS! YOU MADE IT PAST ALL THE STAGES OF THE GAME!", 100, 300, textfont, red)
	Draw.Text ("Would like to look at your stats and  your prize?", 100, 200, textfont, red)
	var statsPrizesButton : int := GUI.CreateButton (100, 100, 0, "Stats and Prizes", stats)
	rightanswer
    elsif intans not= sum and totalTime <= 3 then
	cls
	put "Uhh oh! The correct answer was ", sum, "!"
	delay (1000)
	put "You took ", totalTime, " seconds. Why don't you try again?"
	var tryagainbutton3 : int := GUI.CreateButton (350, 450, 0, "I CAN DO IT!", levelThree)
	wronganswer
    elsif intans = sum and totalTime > 3 then
	cls
	put "You inputted the right value...but you took longer than 3 seconds. Try again?"
	var tryagainbutton3 : int := GUI.CreateButton (350, 450, 0, "I CAN DO IT!", levelThree)
	wronganswer
    elsif intans not= sum and totalTime > 3 then
	cls
	put "Uh oh! The correct answer was ", sum, "..."
	delay (1000)
	put "And it looks like it took you more than 3 seconds. Your total time was ", startTime, " seconds."
	put "Wanna try again?"
	var tryagainbutton3 : int := GUI.CreateButton (350, 450, 0, "I CAN DO IT!", levelThree)
	wronganswer
    end if
end levelThree



procedure levelTwo
    cls
    Draw.Text ("This time you'll have 5 seconds to add up two dice!", 200, 300, textfont, red)
    startTime := Time.Sec
    sum := 0
    for dicenum : 1 .. 2
	randint (roll, 1, 6)
	sum += roll
	x += 120
	x2 += 120
	draw (roll)
	x -= 360
	x2 -= 360
    end for
    x += 480
    x2 += 480
    put "Value: " ..
    get ans
    loop
	exit when strintok (ans)
	put "There are no letters on the dice that you see on screen! Enter the sum of all dice (an integer value):"
	get ans
    end loop
    intans := strint (ans)
    endTime := Time.Sec
    totalTime := (endTime - startTime)
    if intans = sum and totalTime <= 5 then
	count2 := count2 + 1
    end if
    if intans = sum and totalTime <= 5 and count2 = 1 then
	cls
	Draw.Text ("Good job!...But can you do it again?", 180, 300, subfont, red)
	delay (1000)
	var tryagainbutton2 : int := GUI.CreateButton (360, 200, 0, "Of course!", levelTwo)
	rightanswer
    elsif intans = sum and totalTime <= 5 and count2 = 2 then
	cls
	Draw.Text ("Two correct!! You're on a streak! But can you keep it up?!", 25, 300, subfont, red)
	delay (1000)
	var tryagainbutton2 : int := GUI.CreateButton (400, 170, 0, "Duh.", levelTwo)
	rightanswer
    elsif intans = sum and totalTime <= 5 and count2 = 3 then
	cls
	drawfill (maxx, maxy, 85, 85)
	Draw.Text ("3!?... I think you're ready for a challenge!", 100, 300, subfont, red)
	var levelThreeButton : int := GUI.CreateButton (350, 250, 0, "I was born ready.", levelThree)
	rightanswer
    elsif intans not= sum and totalTime <= 5 then
	cls
	put "Uhh oh! The correct answer was ", sum, "!"
	delay (1000)
	put "You took ", totalTime, " seconds. Why don't you try again?"
	var tryagainbutton2 : int := GUI.CreateButton (350, 100, 0, "I CAN DO IT!", levelTwo)
	wronganswer
    elsif intans = sum and totalTime > 5 then
	cls
	put "You inputted the right value...but you took longer than 5 seconds. Try again?"
	var tryagainbutton2 : int := GUI.CreateButton (350, 300, 0, "I CAN DO IT!", levelTwo)
	wronganswer
    elsif totalTime > 5 and intans not= sum then
	cls
	put "Uh oh! The correct answer was ", sum, "..."
	delay (1000)
	put "And it looks like it took you more than 5 seconds. Your total time was ", startTime, " seconds."
	put "Wanna try again?"
	var tryagainbutton2 : int := GUI.CreateButton (400, 300, 0, "I CAN DO IT!", levelTwo)
	wronganswer
    end if
end levelTwo


procedure levelOne
    cls
    drawfill (maxx, maxy, 85, 85)
    startTime := Time.Sec
    Draw.Text ("Let's start of easy! You have 10 seconds to enter the value of the dice!", 150, 300, textfont, red)
    randint (roll, 1, 6)
    draw (roll)
    put "Value: " ..
    get ans

    loop
	exit when strintok (ans)
	put "There are no letters on the die that you see on screen! Enter the sum of all dice (an integer value): " ..
	get ans
    end loop

    intans := strint (ans)
    endTime := Time.Sec
    totalTime := (endTime - startTime)
    if intans = roll and totalTime <= 10 then
	cls
	drawfill (maxx, maxy, 85, 85)
	Draw.Text ("NICE!", 360, 300, subfont, red)
	delay (700)
	Draw.Text ("Looks like you've got the hang of it!", 270, 200, textfont, red)
	delay (1000)
	var levelTwoButton : int := GUI.CreateButton (375, 75, 0, "YEAH", levelTwo)
	rightanswer
    elsif intans not= roll and totalTime <= 10 then
	cls
	put "Uhh oh! The correct answer was ", roll, "!"
	put "You took ", totalTime, " seconds. Why don't you try again?"
	var tryagainbutton : int := GUI.CreateButton (350, 300, 0, "YOU CAN DO IT!", levelOne)
	wronganswer
    elsif totalTime > 10 and intans = roll then
	put "You inputted the right value...but you took longer than 10 seconds. Try again?"
	var tryagainbutton : int := GUI.CreateButton (400, 300, 0, "YOU CAN DO IT!", levelOne)
	wronganswer
    elsif totalTime > 10 and intans not= roll then
	cls
	put "Uh oh! The correct answer was ", roll, "..."
	delay (1000)
	put "And it looks like it took you more than 10 seconds. Your total time was ", startTime, " seconds."
	put "Wanna try again?"
	var tryagainbutton : int := GUI.CreateButton (400, 300, 0, "YOU CAN DO IT!", levelOne)
	wronganswer
    end if
end levelOne


procedure rules
    cls
    drawfill (maxx, maxy, 85, 85)
    Draw.Text ("Here are the rule of the game:", 25, 500, subfont, red)
    Draw.Text ("1. Calculate the sum of ALL dice on screen", 100, 400, textfont, red)
    Draw.Text ("2. Input the number as fast as you can (make sure to input an integer value!)", 100, 300, textfont, red)
    Draw.Text ("The better you are, the faster it gets. Ready?", 25, 200, subfont, red)
    var gamebutton : int := GUI.CreateButton (380, 10, 0, "Let's go!", levelOne)
end rules


%Intro screen
drawfill (maxx, maxy, 85, 85)
delay (1000)
Draw.Text ("Can you count? GREAT! Then this game is for you!", 50, 500, subfont, red)
delay (1000)
drawfillstar (260, 300, 280, 320, 31)
drawfillstar (520, 300, 540, 320, 31)
delay (1000)
Draw.Text ("1, 2, 3!", 310, 300, intfont, red)
draw (1)
x += 220
x2 += 220
draw (2)
x += 220
x2 += 220
draw (3)
x -= 220
x2 -= 220

var startbutton : int := GUI.CreateButton (377, 25, 0, "START", rules)


loop
    exit when GUI.ProcessEvent
end loop








