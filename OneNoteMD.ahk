#NoEnv
#InputLevel 1

; /*-- Function Declerations --*/


; /*-- Macros --*/

;Default comment for creating header in onenote
^<!h::
    Send, !hl{enter}
    return

; Logic for typing '##" and having it go to a header right away
+3::
    ; first # recieved, send keystroke back
    SendInput, +3
; then,, check if one was sent previously
    If (A_ThisHotkey = A_PriorHotkey) && (A_TimeSincePriorHotkey < 750){
        Send, !hl{enter}
        Send, {Backspace}{Backspace}
    }
    return