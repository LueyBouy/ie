#SingleInstance off

Instruction := "You are an idiot!"
Content := "Processing your idiocy....`n`nPlease wait..."
Title := "Are you an idiot?"
MainIcon := 0xFFFE
Flags := 0x600
CustomButtons := []
CustomButtons.Push([101, "I'm an idiot"])
CustomButtons.Push([102, "I'm an idiot"])
cButtons := CustomButtons.Length()
VarSetCapacity(pButtons, 4 * cButtons + A_PtrSize * cButtons, 0)
Loop %cButtons% {
    iButtonID := CustomButtons[A_Index][1]
    iButtonText := &(b%A_Index% := CustomButtons[A_Index][2])
    NumPut(iButtonID,   pButtons, (4 + A_PtrSize) * (A_Index - 1), "Int")
    NumPut(iButtonText, pButtons, (4 + A_PtrSize) * A_Index - A_PtrSize, "Ptr")
}
RadioButtons := []
RadioButtons.Push([201, "I'm an idiot"])
RadioButtons.Push([202, "I'm an idiot"])
cRadioButtons := RadioButtons.Length()
VarSetCapacity(pRadioButtons, 4 * cRadioButtons + A_PtrSize * cRadioButtons, 0)
Loop %cRadioButtons% {
    iButtonID := RadioButtons[A_Index][1]
    iButtonText := &(r%A_Index% := RadioButtons[A_Index][2])
    NumPut(iButtonID,   pRadioButtons, (4 + A_PtrSize) * (A_Index - 1), "Int")
    NumPut(iButtonText, pRadioButtons, (4 + A_PtrSize) * A_Index - A_PtrSize, "Ptr")
}
TDCallback := RegisterCallback("TDCallback", "Fast")
CBData := {}
CBData.AlwaysOnTop := True
CBData.Marquee := True

; TASKDIALOGCONFIG structure
x64 := A_PtrSize == 8
NumPut(VarSetCapacity(TDC, x64 ? 160 : 96, 0), TDC, 0, "UInt") ; cbSize
NumPut(Flags, TDC, x64 ? 20 : 12, "Int") ; dwFlags
NumPut(&Title, TDC, x64 ? 28 : 20, "Ptr") ; pszWindowTitle
NumPut(MainIcon, TDC, x64 ? 36 : 24, "Ptr") ; pszMainIcon
NumPut(&Instruction, TDC, x64 ? 44 : 28, "Ptr") ; pszMainInstruction
NumPut(&Content, TDC, x64 ? 52 : 32, "Ptr") ; pszContent
NumPut(cButtons, TDC, x64 ? 60 : 36, "UInt") ; cButtons
NumPut(&pButtons, TDC, x64 ? 64 : 40, "Ptr") ; pButtons
NumPut(cRadioButtons, TDC, x64 ? 76 : 48, "UInt") ; cRadioButtons
NumPut(&pRadioButtons, TDC, x64 ? 80 : 52, "Ptr") ; pRadioButtons
NumPut(TDCallback, TDC, x64 ? 140 : 84, "Ptr") ; pfCallback
NumPut(&CBData, TDC, x64 ? 148 : 88, "Ptr") ; lpCallbackData

TDCallback(hWnd, Notification, wParam, lParam, RefData) {
    Local CBData := Object(RefData)

    If (Notification == 0 && CBData.AlwaysOnTop) {
        DHW := A_DetectHiddenWindows
        DetectHiddenWindows On
        WinSet AlwaysOnTop, On, ahk_id %hWnd%
        DetectHiddenWindows %DHW%
    }

    If (Notification == 0 && CBData.Marquee) {
        ; TDM_SET_PROGRESS_BAR_MARQUEE
        DllCall("PostMessage", "Ptr", hWnd, "UInt", 0x46B, "UInt", 1, "UInt", 50)
    }
}

DllCall("Comctl32.dll\TaskDialogIndirect", "Ptr", &TDC
    , "Int*", Button := 0
    , "Int*", Radio := 0
    , "Int*", Checked := 0)

DllCall("Kernel32.dll\GlobalFree", "Ptr", TDCallback)

If (Radio == 201) {
    ; I'm an idiot

} Else If (Radio == 202) {
    ; I'm an idiot

}

If (Button == 101) {
    ; I'm an idiot

} Else If (Button == 102) {
    ; I'm an idiot

}
