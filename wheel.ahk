SpinTheWheel() {
    Run, "C:/Program Files/Mozilla Firefox/firefox.exe"
    Sleep, 500
    Send, wheel{Enter}
    Sleep, 500
    WinMaximize A
    Sleep, 500
    Send, {F12}
    Sleep, 500
    Send, spin(){Enter}
    Sleep, 500
    Send, {F12}
}
