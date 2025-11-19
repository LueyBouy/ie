#SingleInstance ignore

TargetTitle := "Are you an idiot?"

SetTimer, ShakeDrift, 1

MsgBox, 16, %TargetTitle%, You are an idiot!

SetTimer, ShakeDrift, Off
return

ShakeDrift:
    IfWinExist, %TargetTitle%
    {
        WinGetPos, CurX, CurY,,, %TargetTitle%

        Random, MoveX, -25, 25
        Random, MoveY, -25, 25

        WinMove, %TargetTitle%,, CurX + MoveX, CurY + MoveY
    }
return