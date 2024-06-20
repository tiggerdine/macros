RandomBook() {
    url := RunCmd("python book.py")
    Run, "C:/Program Files/Mozilla Firefox/firefox.exe"
    Sleep, 500
    Send, %url%{Enter}
    Sleep, 1000
}