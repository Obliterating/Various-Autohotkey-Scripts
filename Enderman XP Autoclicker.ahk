SendMode Input
SetWorkingDir, %A_ScriptDir%
#Warn

Toggle := True

^Esc::ExitApp ; Failsafe

^!LButton:: 
Toggle := True
Loop {
;    IsDown := GetKeyState("LButton" , "P")
;    while (IsDown)
;    {
        If (Toggle == False) {
            Break
        }
        IsDown := GetKeyState("LButton" , "P")
        If (IsDown) {
        Click
        ;Current_Sleep_Value := Random(60,100)
        ;Current_Sleep_Value := (Current_Sleep_Value + Random(-15,15))
        ; Random, Current_Sleep_Value [, 60, 100]
        ;Current_Sleep_Value := 75
        ;Random, Initial_Sleep_Value, 50.0, 79.0
        ;Random, Addend_Multiplier, 0.2, 1.12
        ;Random, Addend, -5.0, 5.0
        ;Current_Sleep_Value := Initial_Sleep_Value + (Addend_Multiplier * Addend)
        Random, Current_Sleep_Value, 600, 800
        Sleep Current_Sleep_Value
        }
;    }
}
Return

^RButton:: Toggle:= False ;changing toggle