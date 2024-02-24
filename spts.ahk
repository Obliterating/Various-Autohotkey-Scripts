#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
state := False

Msgbox, Control Plus Escape to close this, Alt Plus T to autojump upwards

^Esc::
ExitApp
Return

!t::
	If (!state){
		state := True
		Send, {W Down}
		Send, {Space Down}
	}
	Else {
		state := False
		Send, {W Up}
		Send, {Space Up}
	}
Return