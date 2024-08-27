#Persistent
Toggle := False ; Initialize toggle to off

F2:: ; Press F2 to toggle the mouse button click loop on and off
    Toggle := !Toggle
    if (Toggle)
        SetTimer, ClickLoop, 10 ; Start the loop with a 1-second interval
    else
        SetTimer, ClickLoop, Off ; Stop the loop
return

ClickLoop:
    Sleep 615 ; Adjust the sleep time as needed (100 milliseconds in this example)
    Click down ; Simulate mouse button down
    Click up ; Simulate mouse button up
    Sleep 10 ; Adjust the sleep time as needed (1 second in this example)
return
