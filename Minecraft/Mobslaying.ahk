#NoEnv                      ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn                       ; Enable warnings to assist with detecting common errors.
SendMode Input              ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

#Persistent
Toggle := False ; Initialize toggle to off

; This script simply makes so that you can toggle between slaying mobs by clicking in intervals so that you always hit with max force at a mob farm.
F2:: ; Press F2 to toggle the mouse button click loop on and off
    Toggle := !Toggle
    if (Toggle)
        SetTimer, ClickLoop, 10 ;
    else
        SetTimer, ClickLoop, Off ;
return

ClickLoop:
    Sleep 615 ; Adjust the sleep time as needed
    Click down
    Click up
    Sleep 10 ; Adjust the sleep time as needed
return
