#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

toggle := "3"

;Functions
spamF() {
global
while (toggle == "2") {
;	Send, f
	Msgbox, "e"
	Sleep, 1000
	if toggle == "3" {
		Break
	}
}

;Hotkeys

^Esc::ExitApp ; Failsafe
^+f::
if toggle == "3" {
	toggle := "2"
	Msgbox, %toggle%
} Else {
	toggle := "3"
	Msgbox, %toggle%
}
spamF()
return
