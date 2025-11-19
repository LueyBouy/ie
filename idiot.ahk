
mp3File := "C:\Idiot\idiot.mp3"
speedX := 15
speedY := 15
windowW := 350
windowH := 150

Run, "C:\Idiot\gdifx.ahk", , Hide
Run, "C:\Idiot\gdifx2.ahk", , Hide
Run, "C:\Idiot\file.ahk", , Hide

wmp := ComObjCreate("WMPlayer.OCX")
wmp.URL := mp3File
wmp.controls.play()

Gui, +AlwaysOnTop -Caption +Border
Gui, Add, Text, x60 y20 w250 h40, Are you an idiot?
Gui, Add, Picture, x15 y15 w32 h32 Icon1, user32.dll
Gui, Add, Button, x70 y80 w90 h30, OK
Gui, Add, Button, x190 y80 w90 h30, Cancel

SysGet, screenW, 78
SysGet, screenH, 79

x := (screenW - windowW) / 2
y := (screenH - windowH) / 2

Gui, Show, x%x% y%y% w%windowW% h%windowH%

SetTimer, MoveBox, 10
return

MoveBox:
    x := x + speedX
    y := y + speedY

    if (x <= 0 OR x + windowW >= screenW)
        speedX := -speedX

    if (y <= 0 OR y + windowH >= screenH)
        speedY := -speedY

    Gui, Show, x%x% y%y% NoActivate
return
