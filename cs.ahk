PlayCounterStrike() {
    Process, Exist, cs2.exe
    If ErrorLevel {
        Exit
    }

    Before()

    Run, "C:/Program Files (x86)/Steam/steam.exe" steam://run/730
    WinWait, Counter-Strike 2
    WinWaitClose

    After()
}

Before() {
    ; TODO Close Docker, NVIDIA Broadcast, Phone Link, Playnite, ???
    OpenSteam()
    OpenVibranceGui()
}

After() {
    CloseSteam()
    CloseVibranceGui()
    ; TODO Reopen anything that was closed
}

OpenSteam() {
    Process, Exist, steam.exe
    If Not ErrorLevel {
        Run, "C:/Program Files (x86)/Steam/steam.exe" -silent
        Loop {
            Sleep, 1000
            RegRead, ActiveUser, HKEY_CURRENT_USER\SOFTWARE\Valve\Steam\ActiveProcess, ActiveUser
        } Until ActiveUser != 0
    }
}

OpenVibranceGui() {
    Process, Exist, vibranceGUI.exe
    If Not ErrorLevel {
        Run, "C:/Program Files (x86)/vibranceGUI/vibranceGUI.exe"
    }
}

CloseSteam() {
    Process, Close, steam.exe
    RegWrite, REG_DWORD, HKEY_CURRENT_USER\SOFTWARE\Valve\Steam\ActiveProcess, ActiveUser
    RegWrite, REG_DWORD, HKEY_CURRENT_USER\SOFTWARE\Valve\Steam\ActiveProcess, pid
}

CloseVibranceGUI() {
    Sleep, 2000
    Process, Close, vibranceGUI.exe
}
