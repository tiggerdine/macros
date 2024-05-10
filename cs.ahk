PlayCounterStrike() {
    Before()
    RunWait, "C:/Program Files (x86)/Steam/steamapps/common/Counter-Strike Global Offensive/game/bin/win64/cs2.exe"
    After()
}

Before() {
    ; TODO Close Docker, NVIDIA Broadcast, Phone Link, Playnite
    ; TODO Focus assist on
    OpenSteam()
    OpenVibranceGui()
}

After() {
    CloseSteam()
    CloseVibranceGUI()
    ; TODO Reopen anything that was closed
    ; TODO Focus assist off
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
