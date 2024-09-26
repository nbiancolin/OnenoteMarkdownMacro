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
    ; then, check if one was sent previously
    If (A_ThisHotkey = A_PriorHotkey) and (A_TimeSincePriorHotkey < 750){
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
        Send, !hi{down}{down}{right}{right}{right}{enter}      ;set background highlighting to the text format colour
        Send, !hffCourier New{enter}                                    ;Set font back to calibri
        inCodeBlock := "true"               
    }
    Send, {`}
    return

; Logic for * for italic
#IfWinActive ahk_exe ONENOTE.EXE
+8::
    ; first one recieved
    SendInput, +8
    If (A_ThisHotkey = A_PriorHotkey) and (A_TimeSincePriorHotkey > 250) { ; so that it doesnt break if you send 2 at once
        Send, {BackSpace}                       ;delete second asterisk
        Send, ^+{left}                          ;select previous word TODO: Make this work for longer strings than one word?
        Send, ^i                                ;italicise
        Send, {left}{BackSpace}{End}{Space}     ;unselect word and remove first asterisk
        Send, ^i
    }
    ;If (A_ThisHotkey = A_PriorHotkey) and (A_TimeSincePriorHotkey <= 250) { ; make bold if 2 in quic successions
    ;    Send, ^b
    ;}
    return
