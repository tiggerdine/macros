PlayCounterStrike() {
    Before()
    RunWait, "C:/Program Files (x86)/Steam/steamapps/common/Counter-Strike Global Offensive/game/bin/win64/cs2.exe"
    After()
}

Before() {
    OpenSteam()
    OpenVibranceGui()
}

After() {
    CloseSteam()
    CloseVibranceGUI()
}

OpenSteam() {
    Process, Exist, steam.exe
    If Not ErrorLevel {
        Run, "C:/Program Files (x86)/Steam/steam.exe"
        Loop {
            Sleep, 1000
            RegRead, ActiveUser, HKEY_CURRENT_USER\SOFTWARE\Valve\Steam\ActiveProcess, ActiveUser
        } Until ActiveUser != 0
    }
    WinMinimize, Steam
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
