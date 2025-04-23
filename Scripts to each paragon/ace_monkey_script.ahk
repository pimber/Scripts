#NoEnv                      ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn                       ; Enable warnings to assist with detecting common errors.
SendMode Input              ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

; This function is used go flip to x page.
ToPage(page_number) {
    Loop, % (page_number - 1)
    {
        Sleep, 500
        MouseClick, left, 1640, 430
        Sleep, 500
    }
}

; This function is used to pick which map to use. The map layout follows like this
; 1 2 3
; 4 5 6
PickMap(map_number) {
    if (map_number = 1)
        MouseClick, left, 540, 270
    else if (map_number = 2)
        MouseClick, left, 965, 270
    else if (map_number = 3)
        MouseClick, left, 1390, 270
    else if (map_number = 4)
        MouseClick, left, 540, 590
    else if (map_number = 5)
        MouseClick, left, 965, 590
    else if (map_number = 6)
        MouseClick, left, 1390, 590
}

; This function is responsible for starting the deflation mode
StartDeflation(){
    Sleep, 1000
    MouseClick, left, 950, 950 ; Pressing the play btn
    Sleep, 1000
    ToPage(3) ; Go to page 3
    Sleep, 1000
    PickMap(5) ; Park Path map
    Sleep, 1000
    MouseClick, left, 630, 400 ; Picking easy mode
    Sleep, 1000
    MouseClick, left, 1285, 450 ; Picking deflation mode
    Sleep, 6000
    MouseClick, left, 960, 760 ; Press OK
    Sleep, 1000
}

; This function is used to start the next round of deflation, so the farming continues
StartNextRound(){
    Sleep, 750
    MouseClick, left, 960, 910
    Sleep, 750
    MouseClick, left, 700, 850
    Sleep, 6000
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
            Send, / ; Depending on which keyboard layout update button
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

    PlaceMonkey("v", 1500, 625, 3, 0, 2)
    PlaceMonkey("v", 1500, 710, 3, 0, 2)
    PlaceMonkey("v", 1500, 795, 3, 0, 2)
    PlaceMonkey("v", 1348, 625, 3, 0, 2)
    PlaceMonkey("v", 1348, 710, 0, 3, 2)
    PlaceMonkey("v", 1348, 795, 0, 3, 2)

    MouseClick, left, 1830, 1010
    Sleep, 500
    MouseClick, left, 1830, 1010
    Sleep, 500
}

; This function has a timer set to 7 min (Which should be more than enough for all of the paragon scripts)
; Where it click on two places on the scrren to handle the lvl pop ups
WaitXMin(minutes_in_ms){
    StartTime := A_TickCount
    Loop {
        Sleep, 500
        MouseClick, left, 900, 1050 ; You can adjust the position of the mouse click here
        Sleep, 500
        MouseClick, left, 920, 1050 ; and here
    } Until A_TickCount - StartTime > minutes_in_ms
}

; This function collects the functions to a "program"
StartMonkeyXPFarm(){
        while True {
            StartDeflation()
            Monkey()
            WaitXMin(420000) ; Based on your hardware you can set it to a lower time
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

; The script can be exited pressing ctrl + e, if anything happens
^e::ExitApp