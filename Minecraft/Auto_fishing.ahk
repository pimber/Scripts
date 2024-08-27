#NoEnv                      ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn                       ; Enable warnings to assist with detecting common errors.
SendMode Input              ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

;!IMPORTANT
; Remeber to go into %appdata%.minecraft and find the file options.txt
; open in any text editor and finde the line: pause_on_lost_focus and set this value to false
; and
; To make sure that animation in windows is enabled. Settings > Animation effects and enable effects

; To exit script
^e::ExitApp

; To pause script
^p::Pause

; When the script is active, make sure to select the volume mixer by pressing shift + W.
; This allows the script to switch between Minecraft and the volume mixer.
^w::
WinGetActiveTitle, titlen

; Begin script
^b::
MouseClick, right,,,1
Sleep, 100
WinActivate, %titlen%
starttime := A_TickCount
startWalkTimer := A_TickCount
fishCount := 0
toggle := true

; The sound of animals must be set to 100% in Minecraft and in your operating system.
; This script relies on detecting the green pixel that appears in the volume mixer when the sound of catching a fish is played.
; The script switches between Minecraft and the volume mixer, detecting the sound (via the green pixel) at a certain height.
; When the pixel is detected, the script switches back to Minecraft, pulls in the fishing rod to catch the fish, throws out the rod again,
; and then switches back to the volume mixer to continue monitoring for the fishing sound.

; Additionally, this script moves your character between two points to counter AFK detection on Skyblock servers.
; Ensure you have enough space in the game to move, or adjust/remove the movement functionality as needed.
while true {
    PixelSearch,,, 60, 260, 70, 240, 0x33c633, 25, Fast

    if (A_TickCount - startWalkTimer > 60000){
        WinActivate, Minecraft*
    if (toggle) {
        WinActivate, Minecraft*
        Send, {a down}
        Sleep, 1250
        Send, {a up}
    } else {
        WinActivate, Minecraft*
        Send, {d down}
        Sleep, 1250
        Send, {d up}
    }
        toggle := !toggle ; Toggle between true and false
        WinActivate, %titlen%
        startWalkTimer := A_TickCount ; Set startWalkTimer only once when starting to walk
    }

    
    if (!ErrorLevel || A_TickCount - starttime > 30000){
        fish()
        WinActivate, %titlen%
        starttime := A_TickCount
    }
}

fish(){
    WinActivate, Minecraft*
    MouseClick, right, , , 2
    Sleep, 2000
}
