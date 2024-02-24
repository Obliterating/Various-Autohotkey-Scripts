#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; ;Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2 ;For the click into unopen window

vardelay := 1000 ; Controls the circle length
stop := False ; Turn it off/on logic
direction := 1 ; 1 is north, 2 is east, 3 is south, 4 is west

;SetTimer, timer1, 190000
;keyname := 1

;timer1:
;scroll := True
;SetTimer, timer1, On
;keyname := (keyname + 1)
;if keyname == 9 {
;	keyname:= 1
;}
;Return

MsgBox, "Alt + 1 to start moving. Alt + 0 to stop moving. Control Esc, or just use task manager to close this program."


^Esc::ExitApp  ; Exit script with Escape key

!0:: ;To toggle it
stop := !stop
Return

!1::
Loop {
	If stop { ;To allow for it to be turned off
		stop := !stop
		Break
	}
	If (direction = 1) {
		Send, {W down}
		Sleep, vardelay
		Send, {W up}
	} 
	If (direction = 2) {
		Send, {d down}
		Sleep, vardelay
		Send, {d up}
	} 
	If (direction = 3) {
		Send, {s down}
		Sleep, vardelay
		Send, {s up}
	} 
	If (direction = 4) {
		Send, {a down}
		Sleep, vardelay
		Send, {a up}
	} 
	; Logic for which button to hold down
	If (direction = 4) {
		direction := 1
	} Else {
	direction := (direction + 1)
	}
}
Return
