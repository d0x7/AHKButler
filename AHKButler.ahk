#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance force
#Persistent
#NoTrayIcon

; We need to write to registry
if(not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
    ExitApp
}

; If it's compiled, add to autorun
if(A_IsCompiled) {
    RegRead, RegEntry, HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run, AHK Butler

    if(RegEntry = "" or RegEntry != A_ScriptFullPath)
        RegWrite, REG_SZ, HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run, AHK Butler, %A_ScriptFullPath%
}

; Hotkeys

; Binds LWin+Y that when pressed spaces is opened
<#y::
Send {LControl down}{LShift down}{S down}{LControl up}{LShift up}{S up}
return

; Binds LWin+J that when pressed the downloads folder is opened
<#j::
Run shell:::{374DE290-123F-4565-9164-39C4925E467B}
return

; Binds mouse5 that when pressed the virtual desktop is changed to the next one
xbutton1::
	BlockInput, On
	Send, {LWin down}{Ctrl down}{Left down}
	Send, {LWin up}{Ctrl up}{Left up}
	BlockInput, Off
return

; Binds mouse5 that when pressed the virtual desktop is changed to the previous one
xbutton2::
	BlockInput, On
	Send, {LWin down}{Ctrl down}{Right down}
	Send, {LWin up}{Ctrl up}{Right up}
	BlockInput, Off
return