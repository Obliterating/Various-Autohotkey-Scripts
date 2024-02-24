#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


choice := ""
run_script := "Thirty Three"
gui_minimum := ""
gui_maximum := ""
gui_random_toggle := ""
gui_set_delay := ""
figure_out_click_sleep_delay_output := ""




; Gui Layout
;--------------------------------------------------------------------------------
;--------------------------------------------------------------------------------
Gui, New,, Macro List
Gui, Show, Center w500 h500	
Gui, Add, Text, x39 y137, Choose:
Gui, Add, DDL, vchoice, Autoclicker|Anti-Afk
Gui, Add, Button, gchoice_chosen, Run
Gui, Add, Text, x222 y153, Step 1: Choose which script you want to run.`nStep 2: Click the "RUN" button.`nStep 3: Await further instruction`nNote: Ctrl + 0 to get back here
Return

; Labels
;--------------------------------------------------------------------------------
;--------------------------------------------------------------------------------
choice_chosen: ; Button mechanism for the first GUI
; control_inputs := "Control Inputs" ???
global choice
GuiControlGet, choice ,, choice
stuff_with_script_window(choice)
return















exit_script_window:
stuff_with_script_window_2()
return


















gui_run_autoclicker_script:
GuiControlGet, gui_minimum
GuiControlGet, gui_maximum
GuiControlGet, gui_random_toggle
GuiControlGet, gui_set_delay
Gui, Show, Minimize
click_auto(gui_random_toggle, gui_minimum, gui_maximum, gui_set_delay)
return


;Functions
;--------------------------------------------------------------------------------
;--------------------------------------------------------------------------------

stuff_with_script_window(choise)
{
	Gui, Destroy ; Destroy GUI
	If choise = Autoclicker
	{
		run_autoclicker_gui()
	}
	if choise = Anti-Afk
	{
		run_antiafk_gui()
	}
}








run_autoclicker_gui()
{
	Gui, New,, Autoclicker_script ; Design fancy GUI
	;random_toggle, minimum, maximum, set_delay

	Gui, Add, Text,, Should the autoclicker delay be random?
	Gui, Add, DDL, vgui_random_toggle, TRUE|FALSE||

	Gui, Add, Text,, If the delay is random, what should the minimum delay be? (milliseconds)
	Gui, Add, Edit, r1 vgui_minimum, 1000

	Gui, Add, Text,, If the delay is random, what should the maximum delay be? (milliseconds)
	Gui, Add, Edit, r1 vgui_maximum, 5000

	Gui, Add, Text,, If the delay is not random, what should the delay be? (milliseconds)
	Gui, Add, Edit, r1 vgui_set_delay, 5000

	Gui, Add, Button, ggui_run_autoclicker_script, Run

	Gui, Show, Center w500 h500
	; GUI can start the script and edit it
}






run_antiafk_gui()
{
	; Design fancy GUI
	; GUI can start the script and edit it

}

stuff_with_script_window_2() ; Runs when they exit the script window
{
	; Bugfixing stuff
	Gui, Destroy ; Destroy GUI
	; Make old GUI
	Gui, New,, Macro List
	Gui, Show, Center w500 h500	
	Gui, Add, Text, x39 y137, Choose:
	Gui, Add, DDL, Vchoice, Autoclicker|Anti-Afk
	Gui, Add, Button, gchoice_chosen, Run
	Gui, Add, Text, x222 y153, Step 1: Choose which script you want to run.`nStep 2: Click the "RUN" button.`nStep 3: Await further instruction`nNote: Ctrl + 0 to get back here
}

figure_out_click_sleep_delay(random_toggle, minimum, maximum, set_delay)
{
	global figure_out_click_sleep_delay_output
	sleep_delay_answer := 1000
	IfEqual, random_toggle, TRUE
	{
		Random, sleep_delay_answer, minimum, maximum
	}
	else
	{
		sleep_delay_answer := set_delay
	}
	figure_out_click_sleep_delay_output := sleep_delay_answer
}

click_auto(random_toggle, minimum, maximum, set_delay) ; Autoclick with inputs
{

	global run_script
	global figure_out_click_sleep_delay_output
	If run_script == "Thirty Four"
		{
			Msgbox, "click auto"
			Loop
				{
					Msgbox, "clck"
					figure_out_click_sleep_delay(random_toggle, minimum, maximum, set_delay)
					Sleep, figure_out_click_sleep_delay_output ; Add functionality for randomness
				} Until run_script == "Thirty Three"
		}
}

antiafk() ; Antiafk with inputs Note: Also add functionality for choosing new ways to anti-afk
{
	global run_script
	IfEqual, run_script, "Thirty Four"
		{
			Loop
				{

					; Stuff
				} Until IfNotEqual, run_script, "Thirty Four"
		}
}



;Hotkeys
;--------------------------------------------------------------------------------
;--------------------------------------------------------------------------------

^Esc::ExitApp ; Failsafe
^1:: ; Run script
	run_script := "Thirty Four"
return
^2:: ; Pause script, in the future edit script window to have "off" selected after you pause it
	run_script := "Thirty Three"
return
^0:: ; Pop-up main menu, make sure it also pauses scripts and deletes script menus
run_script := "Thirty Three"
Gui, Destroy ; Delete the GUI
; Create/Show GUI
Gui, Show, Center w500 h500	
Gui, Add, Text, x39 y137, Choose:
Gui, Add, DDL, Vchoice, Autoclicker|Anti-Afk
Gui, Add, Button, gchoice_chosen, Run
Gui, Add, Text, x222 y153, Step 1: Choose which script you want to run.`nStep 2: Click the "RUN" button.`nStep 3: Await further instruction`nNote: Ctrl + 0 to get back here

return

