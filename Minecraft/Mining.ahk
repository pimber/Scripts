#NoEnv                      ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn                       ; Enable warnings to assist with detecting common errors.
SendMode Input              ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.


#MaxThreadsPerHotkey, 2
Toggle := 0

; This script simply makes so that you can toggle between holding left mouse btn up or down when you want to afk mine at a cobble generator.
F1::
Toggle := !Toggle

If(Toggle){
    Click, Down
} else {
    Click, Up
}