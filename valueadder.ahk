#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
^Esc::ExitApp  ; Exit script with Escape key

value := 100

>+a::
InputBox, Current_Balance, Step 1, Input Current Balance, , 480, 320
num1 := Round(Current_Balance, -3)
num2 := num1 + value
diff1 := num2 - Current_Balance
MsgBox, Pay them %diff1% to make it %num2%
return