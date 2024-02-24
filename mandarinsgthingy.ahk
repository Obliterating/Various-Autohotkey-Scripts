#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
^Esc::ExitApp

;	Enter::
;	Send, {Down}
;	Sleep, 15
;	Send, {Home}
;	Sleep, 200
;	iteration = 50
;	Loop {
;		iteration := iteration - 1
;		Send, {Delete}
;		Sleep, 5
;	} Until (iteration = 0)
;	return

^+x::
Sleep, 500
Send, {Alt}
Sleep, 15
Send, n
Sleep, 15
Send, x
Sleep, 15
Send, h
return