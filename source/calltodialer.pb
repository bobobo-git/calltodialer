;Beispiel gefunden bei http://www.vbarchiv.net/tipps/tipp_646-telefonnummer-ueber-die-waehlhilfe-waehlen.html

;Vorraussetzung :Ein installierter und konfigurierter Tapi-Treiber

Procedure Dial(sPhoneNumber.s,sRecipient.s,sComment.s = "")
sBuffer.s 
  nResult.l  
  ;W�hlhilfe starten und Telefonnummer w�hlen
  nResult = tapiRequestMakeCall_(sPhoneNumber,"Tapitest", sRecipient, sComment)
  ;R�ckgabewert auswerten
  If nResult <> 0 
    ;Fehler!
    Select nResult
      Case TAPIERR_NOREQUESTRECIPIENT
        Debug "Diw Windows W�hlhilfe ist nicht installiert oder konnte nicht gestartet werden!" 
      Case TAPIERR_REQUESTQUEUEFULL
      Debug "Die Anrufschlange ist voll!" 
      Case TAPIERR_INVALDESTADDRESS
        Debug"Ung�ltige Telefonnummer!" 
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
  PrintN("w�hlt �ber den Windowsdialer die Nummer 0123456789")
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

; Die Wahlhilfe ist und bleibt w�hrend und nach dem Call ge�ffnet
; um die zu Schliessen kann man nach dem Prozess bzw,.dem Fenster suchen
; und einen entsprechnenden Killbefehl raushauen.
; oder eine externe App bem�hen.
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