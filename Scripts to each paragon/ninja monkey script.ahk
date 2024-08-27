#NoEnv                      ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn                       ; Enable warnings to assist with //detecting common errors.
SendMode Input              ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

; This function is used go x times to the right on the map selection menu
ToPage(number_of_times) {
    Loop, % (number_of_times - 1)
    {
        Sleep, 500
        MouseClick, left, 1640, 430
        Sleep, 500
    }
}

; This function is responsible for starting the deflation mode
StartDeflation(){
    Sleep, 1000
    MouseClick, left, 830, 930 ; Pressing the play btn
    Sleep, 1000

    ; As im a bit lasy, i have used the same two maps to farm xp for all of the paragons.
    ; If you want to pick another map?
    ; You would need to open the mouse position script locate the x,y coordinates of the map and note it as you see below with meadow and park path.
    ; If the map is not on the first page, you need to use the GoLeft or GoRight function.
    ; Ex: If the map is on the 6th page it should looke like this
    ; ToPage(6) ; Flips to page 6
    ; MouseClick , left, x, y

    ; MouseClick to map here on this line
    MouseClick, left, 530, 260 ; Meadow

    Sleep, 1000
    MouseClick, left, 630, 400 ; Picking easy mode
    Sleep, 1000
    MouseClick, left, 1285, 450 ; Picking deflation mode
    Sleep, 5000
    MouseClick, left, 960, 760 ; Press OK
    Sleep, 1000
}

; This function is used to start the next round of deflation, so the farming continues
StartNextRound(){
    Sleep, 750
    MouseClick, left, 960, 910
    Sleep, 750
    MouseClick, left, 700, 850
    Sleep, 5000
}

; This function takes in the shortcut for the monkey. Ex shortcut for a monkey could be "x".
SelectMonkey(monkey_type){
    Sleep, 500
    Send, %monkey_type%
    Sleep, 500
}

; This function upgrades the monkey. Don't focus on the x, y coordinates here as these gets parsed from the PlaceMonkey function.
; The input parameters one, two and three represent the upgrade paths. So that one is the upper path, two is the middel path and three is the last path.
UpgradeMonkey(x, y, one, two, three){
    Sleep, 500
    MouseClick, left, x, y
    Sleep, 500
    if (one > 0) {
        k = 0
        while k < one {
            Sleep, 500
            Send, ,
            k++
        }
    }
    Sleep, 500
    if (two > 0) {
        k = 0
        while k < two {
            Sleep, 500
            Send, .
            k++
        }
    }
    Sleep, 500
    if (three > 0) {
        k = 0
        while k < three {
            Sleep, 500
            Send, / ; Depending on which keyboard update btn
            k++
        }
    }
    Sleep, 500
}

; This function takes in the other functions to place the monkey and upgrading them.
PlaceMonkey(monkey_type, x, y, one, two, three){
    MouseMove, x, y
    SelectMonkey(monkey_type)
    Sleep, 500
    MouseClick, left, x, y
    Sleep, 500
    UpgradeMonkey(x, y, one, two, three)
}

; This function is where create your setup. You need to make a new PlaceMonkey() for each new monkey you want to place.
; Like this: PlaceMonkey("shortcut", x, y, one, two, three)
Monkey(){
    Sleep, 500

    PlaceMonkey("D", 625, 555, 4, 0, 2)
    PlaceMonkey("D", 625, 495, 2, 0, 4)
    PlaceMonkey("D", 625, 400, 4, 0, 2)
    PlaceMonkey("D", 700, 400, 3, 0, 2)
    PlaceMonkey("D", 695, 495, 2, 0, 1)

    MouseClick, left, 1830, 1010
    Sleep, 500
    MouseClick, left, 1830, 1010
    Sleep, 500
}

; This function has a timer set to 8 min (Which should be more than enough for all of the paragon scripts)
; Where it click on two places on the scrren to handle the lvl pop ups
WaitXMin(minutes_in_ms){
    StartTime := A_TickCount
    Loop {
        Sleep, 500
        MouseClick, left, 250, 400 ; You can adjust the position of the mouse click here
        Sleep, 500
        MouseClick, left, 250, 450 ; and here
    } Until A_TickCount - StartTime > minutes_in_ms
}

; This function collects the functions to a "program"
StartMonkeyXPFarm(){
        while True {
            StartDeflation()
            Monkey()
            WaitXMin(360000) ; Depending on the performance on the PC, change the time between 6-7 min
            StartNextRound()
        }
}

; The script start when pressing ctrl + s, but only if the BTD6 is the active window
^s::
if WinActive("BloonsTD6"){
    StartMonkeyXPFarm()
}

; The script can pauses pressing ctrl + p, if anything happens
^p:: Pause