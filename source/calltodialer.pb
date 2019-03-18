;Beispiel gefunden bei http://www.vbarchiv.net/tipps/tipp_646-telefonnummer-ueber-die-waehlhilfe-waehlen.html

;Vorraussetzung :Ein installierter und konfigurierter Tapi-Treiber

Procedure Dial(sPhoneNumber.s,sRecipient.s,sComment.s = "")
sBuffer.s 
  nResult.l  
  ;Wählhilfe starten und Telefonnummer wählen
  nResult = tapiRequestMakeCall_(sPhoneNumber,"Tapitest", sRecipient, sComment)
  ;Rückgabewert auswerten
  If nResult <> 0 
    ;Fehler!
    Select nResult
      Case TAPIERR_NOREQUESTRECIPIENT
        Debug "Diw Windows Wählhilfe ist nicht installiert oder konnte nicht gestartet werden!" 
      Case TAPIERR_REQUESTQUEUEFULL
      Debug "Die Anrufschlange ist voll!" 
      Case TAPIERR_INVALDESTADDRESS
        Debug"Ungültige Telefonnummer!" 
      Default
        Debug "Sonstiger Fehler!"
        Debug nresult
        ProcedureReturn nResult
    EndSelect
  EndIf
EndProcedure

number.s=ProgramParameter()
number=Trim(StringField(number,2,":"))


Debug number

If number
  dial(number,"Wurst","Egal")
  Delay(2500)
  RunProgram("taskkill","/F /IM dialer.exe","",#PB_Program_Hide|#PB_Program_Wait)
End
Else

  PrintN("tapilinecall callto:0123456789")
  PrintN("wählt über den Windowsdialer die Nummer 0123456789")
  PrintN("")
  PrintN("Priokom Informationstechnik GmbH")
  PrintN("L.Miethe 0731 9629425")
  End
EndIf

OpenPreferences("tapi-wahlhilfe.ini",#PB_Preference_GroupSeparator)
  PreferenceGroup("Dial")
  Number.s=ReadPreferenceString("Number","")
  
  Number.s=InputRequester("Dial via Dialer","Nummer :",Number)

  WritePreferenceString("Number",Number)
  PreferenceGroup("Calls")

  call=dial(Number,"Wurst","egal")
  
  WritePreferenceString(FormatDate("%yyyy.%mm.%dd-%hh:%ii:%ss",Date()),Number)
  
ClosePreferences()

; Die Wahlhilfe ist und bleibt während und nach dem Call geöffnet
; um die zu Schliessen kann man nach dem Prozess bzw,.dem Fenster suchen
; und einen entsprechnenden Killbefehl raushauen.
; oder eine externe App bemühen.
; Hier mal taskkill von windows 
; etwas warten, keine Ahnung, ob es das braucht.
; es ging hier auch ohne Warten.
Delay(1500)

RunProgram("taskkill","/F /IM dialer.exe","",#PB_Program_Hide|#PB_Program_Wait)

End

; IDE Options = PureBasic 5.61 (Windows - x86)
; CursorPosition = 30
; FirstLine = 15
; Folding = -
; EnableXP
; Executable = calltodialer.exe
; CommandLine = callto:497319629426
; CompileSourceDirectory