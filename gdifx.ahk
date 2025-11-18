#Persistent

SetTimer, InvertScreen, 1000
return

InvertScreen:
    hDC := DllCall("GetDC", "ptr", 0, "ptr")
    DllCall("gdi32\BitBlt"
        , "ptr", hDC
        , "int", 0
        , "int", 0 
        , "int", A_ScreenWidth
        , "int", A_ScreenHeight
        , "ptr", hDC
        , "int", 0
        , "int", 0
        , "uint", 0x00550009)
    DllCall("ReleaseDC", "ptr", 0, "ptr", hDC)
return
