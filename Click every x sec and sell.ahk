#Persistent
timer := A_TickCount
Random, randomtimer, 2500, 3500 ; Generate a random number between 5000 and 10000 and store it in randomtimer
Toggle := False ; Initialize toggle to off

F2:: ; Press F2 to toggle the mouse button click loop on and off
    Toggle := !Toggle
    if (Toggle)
        SetTimer, ClickLoop, 10 ; Start the loop with a 10-millisecond interval (adjust as needed)
    else
        SetTimer, ClickLoop, Off ; Stop the loop
return

ClickLoop:
    Sleep, 615 ; Adjust the sleep time as needed (615 milliseconds in this example)
    Click down ; Simulate mouse button down
    Click up ; Simulate mouse button up
    Sleep, 10 ; Adjust the sleep time as needed (10 milliseconds in this example)

    if (A_TickCount - timer >= randomtimer) {
        sellall()
        timer := A_TickCount
        Random, randomtimer, 2500, 3500 ; Generate a new random number between 5000 and 10000 for the next interval
    }
return

sellall() {
    Send, -
    Sleep, 150
    Send, sell all
    Sleep, 150
    Send, {Enter}
}
