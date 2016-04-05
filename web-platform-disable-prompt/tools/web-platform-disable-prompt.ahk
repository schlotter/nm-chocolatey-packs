#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#NoTrayIcon
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
WinWait, Internet Information Services (IIS) Manager, , 60
WinActivate
BlockInput On
Send {Down}
WinWait, Internet Information Services (IIS) Manager,Do you want to get started with Microsoft Web Platform to stay connected with latest Web Platform Components?,60
Send +{tab}
Send {Space}
Send {tab}
Send {tab}
Send {Space}
