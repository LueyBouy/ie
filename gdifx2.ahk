#NoEnv
#SingleInstance Force
#Persistent

SW := A_ScreenWidth
SH := A_ScreenHeight
scale := 0.85

SetTimer, OverlayScreenshot, 1250
Return

OverlayScreenshot:
    hDC := DllCall("GetDC", "ptr", 0, "ptr")
    mDC := DllCall("gdi32\CreateCompatibleDC", "ptr", hDC, "ptr")
    hBM := DllCall("gdi32\CreateCompatibleBitmap", "ptr", hDC, "int", SW, "int", SH, "ptr")
    DllCall("gdi32\SelectObject", "ptr", mDC, "ptr", hBM)
    
    DllCall("gdi32\BitBlt"
        , "ptr", mDC
        , "int", 0
        , "int", 0
        , "int", SW
        , "int", SH
        , "ptr", hDC
        , "int", 0
        , "int", 0
        , "uint", 0x00CC0020)

    DllCall("ReleaseDC", "ptr", 0, "ptr", hDC)

    destDC := DllCall("GetDC", "ptr", 0, "ptr")
    w := SW * scale
    h := SH * scale
    x := (SW - w) // 2
    y := (SH - h) // 2

    DllCall("gdi32\StretchBlt"
        , "ptr", destDC
        , "int", x
        , "int", y
        , "int", w
        , "int", h
        , "ptr", mDC
        , "int", 0
        , "int", 0
        , "int", SW
        , "int", SH
        , "uint", 0x00CC0020)

    DllCall("ReleaseDC", "ptr", 0, "ptr", destDC)

    DllCall("gdi32\DeleteObject", "ptr", hBM)
    DllCall("gdi32\DeleteDC", "ptr", mDC)
Return
