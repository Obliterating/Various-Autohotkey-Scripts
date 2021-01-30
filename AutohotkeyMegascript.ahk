#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.




#MaxThreadsPerHotkey 3


; Starting Variables
;--------------------------------------------------------------------------------
;--------------------------------------------------------------------------------

Autoclicker_Loop := True
Autoclicker_sleepmilliseconds := 500
autoclickergui_randomminimum := 1000
autoclickergui_randommaximum := 5000
autoclickergui_setdelay := 5000
autoclickergui_random := FALSE
StartupGUIDDL := "Pick a script"





; Gui Layout
;--------------------------------------------------------------------------------
;--------------------------------------------------------------------------------
Gui, StartupGui:New,, StartupScript - Also remember that Ctrl + Escape closes the script 
Gui, Show, Center w500 h500	
Gui, Add, Text,, Select the script in the DDL. Activate it with Ctrl + Shift + 1, and pause it with Ctrl + Shift + 2. `n`nTo get the settings for the script, press the SETTINGS button.
Gui, Add, DDL, vStartupGUIDDL gStartupGUIDDLSubmitted x84 y133, Pick a script||Autoclicker Script|Option2
Gui, Add, Button, x232 y132 w75 gButtonSETTINGS, SETTINGS
Return







; Labels
;--------------------------------------------------------------------------------
;--------------------------------------------------------------------------------

StartupGUIDDLSubmitted:
GuiControlGet, StartupGUIDDL, StartupGui: ,StartupGUIDDL, 
return

ButtonSETTINGS:
GuiControlGet, StartupGUIDDL, StartupGui: ,StartupGUIDDL, 
if StartupGUIDDL = Pick a script
{
	Msgbox, Please pick a script first
} else {
	; If option 1, run the settings for option 1, if option 2, run the settings for option 2, etc.
	Gui, Show, Hide,
	if StartupGUIDDL = Autoclicker Script
	{
		AutoclickerSettingsGui()
	}
}
return



AutoclickerGUISubmitted:
GuiControlGet, autoclickergui_random, AutoclickerGui:,
GuiControlGet, autoclickergui_randomminimum,  AutoclickerGui:,
GuiControlGet, autoclickergui_randommaximum,  AutoclickerGui:,
GuiControlGet, autoclickergui_setdelay,  AutoclickerGui:,
if !autoclickergui_randomminimum or !autoclickergui_randommaximum or !autoclickergui_setdelay
{
	Msgbox, Please make sure all edit fields have an acceptable value in them.
}
return


BackToStartup:
Gui, AutoclickerGui:Show, Hide,
StartupGui()
return

; Functions
;--------------------------------------------------------------------------------
;--------------------------------------------------------------------------------

StartupGui()
{
	Gui, StartupGui:New,, StartupScript - Also remember that Ctrl + Escape closes the script 
	Gui, Show, Center w500 h500	
	Gui, Add, Text,, Select the script in the DDL. Activate it with Ctrl + Shift + 1, and pause it with Ctrl + Shift + 2. `n`nTo get the settings for the script, press the SETTINGS button.
	Gui, Add, DDL, vStartupGUIDDL gStartupGUIDDLSubmitted x84 y133, Pick a script||Autoclicker Script|Option2
	Gui, Add, Button, x232 y132 w75 gButtonSETTINGS, SETTINGS
	Return
}


AutoclickerSettingsGui()
{
	global
	Gui, AutoclickerGui:New,, Autoclicker_script ; Design fancy GUI
	;random_toggle, minimum, maximum, set_delay

	Gui, Add, Text,, Should the autoclicker delay be random?
	Gui, Add, DDL, vautoclickergui_random, TRUE|FALSE||

	Gui, Add, Text,, If the delay is random, what should the minimum delay be? (milliseconds)
	Gui, Add, Edit, Number r1 vautoclickergui_randomminimum, 1000

	Gui, Add, Text,, If the delay is random, what should the maximum delay be? (milliseconds)
	Gui, Add, Edit, Number r1 vautoclickergui_randommaximum, 5000

	Gui, Add, Text,, If the delay is not random, what should the delay be? (milliseconds)
	Gui, Add, Edit, Number r1 vautoclickergui_setdelay, 5000

	Gui, Add, Button, gAutoclickerGUISubmitted, Apply Changes
	Gui, Add, Button, gBackToStartup, Back

	Gui, Show, Center w500 h500
	; GUI can start the script and edit it
}




AutoclickerGuiSubmitted()
{
	global
	GuiControlGet, autoclickergui_random, AutoclickerGui:,
	GuiControlGet, autoclickergui_randomminimum,  AutoclickerGui:,
	GuiControlGet, autoclickergui_randommaximum,  AutoclickerGui:,
	GuiControlGet, autoclickergui_setdelay,  AutoclickerGui:,
	if !autoclickergui_randomminimum or !autoclickergui_randommaximum or !autoclickergui_setdelay
	{
		Msgbox, Please make sure all edit fields have an acceptable value in them.
	}
}


determineautoclickersleeptime()
{
	global
	; Checks settings and stuff
	AutoclickerGuiSubmitted()
	if autoclickergui_random = TRUE
	{
		Random, Autoclicker_sleepmilliseconds, autoclickergui_randomminimum, autoclickergui_randommaximum
	} else
	{
		Autoclicker_sleepmilliseconds := autoclickergui_setdelay
	}
}

; Hotkeys
;--------------------------------------------------------------------------------
;--------------------------------------------------------------------------------


^Esc::ExitApp ; Failsafe




^+1::
if StartupGUIDDL = Pick a script
{
	Msgbox, Please pick a script first
} else {
	; If option 1, run the stuff for option 1, if option 2, run the stuff for option 2, etc.
	if StartupGUIDDL = Autoclicker Script
	{
		Autoclicker_Loop := True
		Loop {
			if !Autoclicker_Loop {
				Break
			} else
			{
				Click
				determineautoclickersleeptime()
				Sleep, Autoclicker_sleepmilliseconds
			}

		}
	}
}
Return








^+2::
if StartupGUIDDL = Pick a script
{
	Msgbox, Please pick a script first
} else {
	; If option 1, run the stuff for option 1, if option 2, run the stuff for option 2, etc.
	if StartupGUIDDL = Autoclicker Script
	{
		Autoclicker_Loop := False
	}
}
Return
