SpinTheWheel() {
    Run, "C:/Program Files/Mozilla Firefox/firefox.exe"
    Sleep, 500
    WinMaximize, A
    Sleep, 500
    Send, wheel{Enter}
    Sleep, 1000
    Send, {F12}
    Sleep, 1000
    Loop {
        WinGetTitle, Title, A
        if InStr(Title, "Wheel Decide") {
            break
        } else {
            Send, location.reload(){Enter}
            Sleep, 1000
        }
    }
    Send, spin(){Enter}
    Sleep, 500
    Send, {F12}
}
