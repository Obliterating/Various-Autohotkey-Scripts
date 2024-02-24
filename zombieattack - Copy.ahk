#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2 ;For the click into unopen window
DetectHiddenWindows, On

vardelay := 100 ; Make this number higher for slower clicks, lower for faster.
min := 90
max := 150
stop := False
doingtheclickingthing := "Off"

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

MsgBox, "Alt + Right Click to start clicking quickly. Alt + Left Click to stop clicking. Control + P to click every five minutes or so. Control + O to see if it's clicking. Control Esc, or just use task manager to close this program."


^Esc::ExitApp  ; Exit script with Escape key
!LButton:: ;To toggle it
stop := True
doingtheclickingthing := "Off"
Return

!RButton::
doingtheclickingthing := "On"
Loop {
	If stop { ;To allow for it to be turned off
		stop := False
		Break
	}
	Click
	Sleep, vardelay
	vardelay := 15000
	}
Return

^p::
doingtheclickingthing := "On"
Loop {
	If stop { ;To allow for it to be turned off
		stop := False
		Break
	}
	Click
	Loop, 120 {
		Sleep, 5000
		If stop {
			Break
		}
	}
	}
Return

^o::
Msgbox % "The delay is " . vardelay
Return