Toggle := false
timer := A_TickCount
Random, randomtimer, 7500, 15000

; Initialize the ToggleKeys timer
SetTimer, ToggleKeys, Off

F6:: ; Press F6 to toggle the script on/off
    Toggle := !Toggle
    if (Toggle) {
        SetTimer, ToggleKeys, 1000 ; Check key state every 1 second
    } else {
        SetTimer, ToggleKeys, Off
        Send, {a up}{d up}{w up}{s up} ; Release both 'a' and 'd' keys when toggling off
    }
    return

ToggleKeys:
    if (Toggle) {
        ;Click, down ; Handle mouse click appropriately
        Send, {w down}
        Sleep, 2650
        Send, {w up}
        Sleep, 25

        Send, {a down}
        Sleep, 450
        Send, {a up}
        Sleep, 25

        Send, {s down}
        Sleep, 2650
        Send, {s up}
        Sleep, 25

        Send, {d down}
        Sleep, 450
        Send, {d up}
        Sleep, 25

        ;if (A_TickCount - timer > randomtimer) {
        ;    sellall()
        ;    timer := A_TickCount
        ;    Random, randomtimer, 7500, 15000
        ;}
        ;Click, up ; Handle mouse click appropriately
    } else {
        Send, {a up}{d up}{w up}{s up}
    }
    return

sellall() {
    Send, -
    Sleep, 150
    Send, sell all
    Sleep, 150
    Send, {Enter}
    Sleep, 150
}
