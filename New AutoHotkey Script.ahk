#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Initialize toggle state to off
ClickToggle := 0

; Define the rapid click rate (in milliseconds)
ClickDelay := 25

; Define the F4 hotkey to toggle rapid clicks
F4::
; Toggle the click state
ClickToggle := !ClickToggle
While ClickToggle
{
    Click, right ; Simulate a right mouse click
    Sleep, %ClickDelay% ; Wait for the specified delay
}
return


+e::ExitApp
