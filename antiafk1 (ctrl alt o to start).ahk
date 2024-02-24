#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
^Esc::ExitApp


doiloop := "no"


^!o::
Msgbox, Help Menu:`n1. Ctrl + Alt + O for the Help Menu`n2. Ctrl + Alt + P to enable the script.`n3. Ctrl + Alt + [ to start the script.`n4. Ctrl + Alt + ] to pause the script.`n5. Ctrl + Escape to exit the program.`nRemember to press Ctrl + Alt + [, then do Ctrl + Alt + P
return


^![::
Msgbox, "Script Started"
doiloop := "yes"
return


^!]::
Msgbox, "Script Ended/Paused"
doiloop := "no"
return



^!p::
Msgbox, "Script Enabled"
while (doiloop == "yes") {
Random, random_sleeptime, 124300, 1000234
if (random_sleeptime > 500000) {
Send, {a down}
Sleep, (random_sleeptime/1000)
Send, {a up}
Send, {d down}
Sleep, (random_sleeptime/1000)
Send, {d up}
}
else {
Send, {d down}
Sleep, (random_sleeptime/1000)
Send, {d up}
Send, {a down}
Sleep, (random_sleeptime/1000)
Send, {a up}
}
Sleep, %random_sleeptime%
}