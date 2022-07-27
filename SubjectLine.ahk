#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Ticket Email Subject Line

p1 =
(

Fill out the following fields and an "on ticket"
email subject line will be generated.
)

p2 =
(
Don't forget to CC Support!
)

Gui, Destroy
Gui, Show, w250 h275
Gui, Add, Text,, %p1%
Gui, Add, Text,, %p2%
Gui, Add, Text,, Ticket Number:
Gui, Add, Edit, vTicket
Gui, Add, Text,, Subject:
Gui, Add, Edit, vSubject
Gui, Add, Text,, Message ID:
Gui, Add, Edit, vMessageID
Gui, Add, Button, default, OK
return

GuiClose:
Gui, Cancel
ExitApp
ButtonOK:
Gui, Submit
GuiControlGet, Ticket
GuiControlGet, Subject
GuiControlGet, MessageID
StringReplace, MessageID, MessageID, /, , All
MessageID := SubStr(MessageID, -7)
Clipboard := "Ticket#" . Ticket . "/" . Subject . " -- received (message id: " . MessageID . ")"
MsgBox, Copied to clipboard.
ExitApp
return
