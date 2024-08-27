
#NoEnv                      ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn                       ; Enable warnings to assist with detecting common errors.
SendMode Input              ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
Gui, +AlwaysOnTop
Gui, Font, s32 q3, Arial
Gui, Add, Text, vCoordText c00FF00, XXXXX YYYYY
Gui, Color, Black
WinSet, TransColor, Black 150

CoordMode, Mouse, Screen
SetTimer, Update, 50
Gui, Show, x0 y0 NA
return

Update(){
    MouseGetPos, mouseX, mouseY
    GuiControl,, CoordText, %mouseX%, %mouseY%
}

; Make the GUI always stay on top even in full-screen games
DllCall("SetWindowPos", "UInt", WinExist(), "UInt", -1, "Int", 0, "Int", 0, "Int", 0, "Int", 0, "UInt", 0x0001 | 0x0002)
