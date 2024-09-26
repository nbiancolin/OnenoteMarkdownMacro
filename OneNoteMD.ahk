;Default comment for creating header in onenote
^<!h::
    Send, !hl{enter}
    return

; Logic for typing '##" and having it go to a header right away

+#::
    ; first # recieved, send keystroke back
    Send, +3
    ; then,, check if one was sent previously
    If (A_ThisHotkey = A_PriorHotkey) && (A_TimeSincePriorHotkey < 500)
        MsgBox, THING HAPPENED