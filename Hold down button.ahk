#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#MaxThreadsPerHotkey, 2
Toggle := 0

F1::
Toggle := !Toggle

If(Toggle){
    Click, Down
} else {
    Click, Up
}