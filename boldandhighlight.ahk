mode := "Word"
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; MsgBox, Press Ctrl + Shift + X to change mode, Press Ctrl + X with a selection to add the text effect

^Esc::ExitApp  ; Exit script with Escape key


^+x::
if (mode = "Word") {
	mode := "Google Docs"
	MsgBox, Mode: %mode%
}
else {
	mode := "Word"
	MsgBox, Mode: %mode%
}

^x::
if (mode = "Word") {
	Send, {Ctrl down}b{Ctrl up}
	Send, {Ctrl down}{Alt down}h{Ctrl up}{Alt up}
}
if (mode = "Google Docs") {
	Send, {CtrlDown}{AltDown}0{CtrlUp}{AltUp}
}