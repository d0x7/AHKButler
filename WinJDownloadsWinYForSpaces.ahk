#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance force
#NoTrayIcon

; If it's compiled, add to autorun
if(A_IsCompiled) {
    RegRead, RegEntry, HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run, WinJDownloadsWinYForSpaces

    if(RegEntry = "" or RegEntry != A_ScriptFullPath)
        Gosub, WriteToRegistry
}

; Register Hotkeys

RegisterHotkeys:
    <#j::
    Run shell:::{374DE290-123F-4565-9164-39C4925E467B}
    return

    <#y::
    Send {LControl down}{LShift down}{S down}{LControl up}{LShift up}{S up}
    return
return

; Util

WriteToRegistry:
    if(not A_IsAdmin) {
        Run *RunAs "%A_ScriptFullPath%"
        ExitApp
    }

    RegWrite, REG_SZ, HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run, WinJDownloadsWinYForSpaces, %A_ScriptFullPath%
return