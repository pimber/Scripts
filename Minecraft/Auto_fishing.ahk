#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

+e::ExitApp
+p::Pause

+b::
MouseClick, right,,,1
Sleep, 100
WinActivate, %titlen%
starttime := A_TickCount
startWalkTimer := A_TickCount
fishCount := 0
toggle := true

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

+w::
WinGetActiveTitle, titlen
