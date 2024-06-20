SpinTheWheel() {
    Run, "C:/Program Files/Mozilla Firefox/firefox.exe"
    Sleep, 1000
    Send, wheel{Enter}
    Sleep, 1000
    Send, {F12}
    Sleep, 1000
    Loop 3 {
        WinGetTitle, Title, A
        if InStr(Title, "Wheel Decide") {
            break
        } else {
            Send, location.reload(){Enter}
            Sleep, 1000
        }
    }
    Send, spin(){Enter}
    Sleep, 1000
    Send, {F12}
}
