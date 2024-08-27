Toggle := false

F3:: ; Press F3 to toggle the script on/off
    Toggle := !Toggle
    if (Toggle) {
        SetTimer, ToggleKeys, 100 ; Check key state every 1 second
    } else {
        SetTimer, ToggleKeys, Off
        Send, {a up}{d up} ; Release both 'a' and 'd' keys when toggling off
    }
    return

ToggleKeys:
    if (Toggle) {
        Send, {a down}
        Sleep, 3200
        Send, {a up}
        Sleep, 25
        Send, {d down}
        Sleep, 3200
        Send, {d up}
        Sleep, 25
    }
    return
