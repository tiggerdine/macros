PlayCounterStrike() {
    Before()
    RunWait, "C:/Program Files (x86)/Steam/steamapps/common/Counter-Strike Global Offensive/game/bin/win64/cs2.exe"
    After()
}

Before() {
    OpenSteam()
}

After() {
    CloseSteam()
}

OpenSteam() {
    Run, "C:/Program Files (x86)/Steam/steam.exe"
    Loop {
        Sleep 1000
        RegRead, ActiveUser, HKEY_CURRENT_USER\SOFTWARE\Valve\Steam\ActiveProcess, ActiveUser
    } Until ActiveUser != 0
}

CloseSteam() {
    Process, Close, steam.exe
    RegWrite, REG_DWORD, HKEY_CURRENT_USER\SOFTWARE\Valve\Steam\ActiveProcess, ActiveUser
    RegWrite, REG_DWORD, HKEY_CURRENT_USER\SOFTWARE\Valve\Steam\ActiveProcess, pid
}
