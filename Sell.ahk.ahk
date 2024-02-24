#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
^Esc::ExitApp  ; Exit script with Escape key



x := 0
y := 0

^1::
x := 1
return


^2::
x := 0
return

e::
if (x = 1){
Random, rand, 76, 102
Random, rand2, 78, 103
Send, {Raw}/
Sleep, rand
Send, {Up}
Sleep, rand2
Send, {Enter}
}
return