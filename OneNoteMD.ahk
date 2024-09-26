#NoEnv
#InputLevel 1 ;needed so that the macro sending itself doesnt break

; /*-- Global Variables --*/
inCodeBlock := ""


; /*-- Function Declerations --*/


; /*-- Macros --*/

;Default comment for creating header in onenote
#IfWinActive ahk_exe ONENOTE.EXE
^<!h::
    Send, !hl{enter}
    return

; Logic for typing '##" and having it go to a header right away
#IfWinActive ahk_exe ONENOTE.EXE
+3::
    ; first # recieved, send keystroke back
    SendInput, +3
; then,, check if one was sent previously
    If (A_ThisHotkey = A_PriorHotkey) && (A_TimeSincePriorHotkey < 750){
        Send, !hl{enter}
        Send, {Backspace}{Backspace}
    }
    return

; Logic for in-line code blocks
#IfWinActive ahk_exe ONENOTE.EXE
`::
    if(inCodeBlock) {                                                   ;means we are leaving code block
        Send, !hffcalibri{enter}                                        ;Set font to courier new
        Send, !hin                                                      ;turn off highlighting
        inCodeBlock := ""
    } else {
        Send, !hi{down}{down}{down}{down}{down}{down}{down}{enter}      ;set background highlighting to the text format colour
        Send, !hffCourier New{enter}                                    ;Set font back to calibri
        inCodeBlock := "true"               
    }
    Send, {`}
