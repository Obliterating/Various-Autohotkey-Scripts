#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
^Esc::ExitApp  ; Exit script with Escape key

^<+]::
Sleep, 500
SetKeyDelay , 50, 10,
Send,from fractions import Fraction as frac
Sleep, 100
Send, {Enter}
Sleep, 200
Send, import fractions
Sleep, 100
Send, {Enter}
Sleep, 200
Send, from decimal import Decimal, getcontext
Sleep, 100
Send, {Enter}
Sleep, 200
Send, from decimal import Decimal as dec
Sleep, 100
Send, {Enter}
Sleep, 200
Send, from math import factorial
Sleep, 100
Send, {Enter}
Sleep, 200
Send, import math
Sleep, 100
Send, {Enter}
Sleep, 200
Send, {Raw}|"{:.2e}".format(
Sleep, 100
Send, {Enter}
return