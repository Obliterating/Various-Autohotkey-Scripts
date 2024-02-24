#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; ;Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2 ;For the click into unopen window

vardelay := 1000 ; Make this number higher for slower clicks, lower for faster.

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

MsgBox, "Ctrl + X to toggle state, Ctrl + Z to activate autoclicker. Control Esc, or just use task manager to close this program"


^Esc::ExitApp  ; Exit script with Escape key

stop := False

^x:: ;To toggle it
stop := !stop
MsgBox, "State has been toggled"
Return

^z::
Loop {
	If stop { ;To allow for it to be turned off
		Break
	}
;	If scroll {
;		Send, %keyname%
;		scroll := False
;	} 
	clickcounter := 0
	Loop { ;Click ten times
		ControlClick,,/master,,,1,,,
		Sleep vardelay
		clickcounter := (clickcounter + 1)
		if ((clickcounter > 9) or stop) { ;logic to click ten times
			Break
		}
	}
	eatingcounter := (eatingcounter + 1) ;Increment eating counter
	if (eatingcounter = 32) { ;logic to eat
		eatingcounter = 0 ;reset 
		Send, %hotbarcounter% ;eat
		ControlClick,,/master,,RIGHT,1,D,,
		Sleep, 2000
		ControlClick,,/master,,RIGHT,1,U,,
		Send, 1
		foodcounter := (foodcounter + 1) ;increment food counter
		if (foodcounter = 63) {
			foodcounter := 0
			hotbarcounter := (hotbarcounter + 1)
		}
	}
	Sleep 30000 ; Sleep in-between

}
Return