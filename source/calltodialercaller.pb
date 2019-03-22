;calltodialercaller
;die Zwischenablage wird dem calltodialer als callto:Rufnummer vorgelegt
;ein + wird zu 00 ersetzt
Info.s="CalltoDialerCaller, ein Zusatzprogramm zum"+#CRLF$
Info  +"calltoDialer (Unterstützungsprogramm zum "+#CRLF$
Info  +"Aufruf der Windowswahlhilfe auf Thunderbird mittels"+#CRLF$
Info  +"ADDON TBDialOut), das im selben ordner iegt wie diese"+#CRLF$
Info  +"Program."+#CRLF$
Info  +"Im Systray (neben der Uhr) ist ein P eingeblendet."+#CRLF$
Info  +"Ein Doppelklick des P mit der linken Maustaste"+#CRLF$
Info  +"übergibt die aktuelle Zwischenablage dem Programm"+#CRLF$
Info  +"calltoDialer. Ein + am Anfang des Zwischenablageinhalts"+#CRLF$
Info  +"wird zu 00 ersetzt. In der beiliegenden Ini-Datei"+#CRLF$
Info  +"calltodialercaller.ini kann eine Amtsholung (oft 0)"+#CRLF$
Info  +"angegeben werden (ol = 0). "+#CRLF$
Info  +""+#CRLF$
Info  +""+#CRLF$

OpenPreferences("CallToDialerCaller.ini")
ol.s=ReadPreferenceString("ol","")
ClosePreferences()

OpenWindow(0,0,0,0,0,"CallToDialerCaller",#PB_Window_Invisible)
IconName$ = "ctdc.ico"
AddSysTrayIcon(1, WindowID(0), LoadImage(0, IconName$))

Repeat
  Event = WaitWindowEvent()
  
  If Event = #PB_Event_SysTray
    If EventType() = #PB_EventType_LeftDoubleClick
      num.s=GetClipboardText()
      Debug num
      
      For i = 1 To Len(num)
        tmp.s= Mid(num,i,1)
        If (Asc(tmp)>=48 And Asc(tmp)<=57) Or tmp="+"
          out.s+ tmp
        EndIf
      Next i
      num=out
      tmp=""
      out=""

      If Left(num,1)="+"
        num="00"+Mid(num,2,Len(num)-1)
      EndIf
      num=ol+num
      num="callto:"+num
      
      ctd.s="calltodialer.exe"
      
      RunProgram(ctd,num,GetPathPart(ctd))
      Delay(2000)
      Debug num
    EndIf
    
    If EventType() = #PB_EventType_RightClick
      Select MessageRequester("CalltoDialercaller beenden?","Ende?",#PB_MessageRequester_YesNo)
        Case #PB_MessageRequester_Yes
          CloseWindow(0)
          End
        Case #PB_MessageRequester_No
          MessageRequester("Info",Info.s)
      EndSelect
    EndIf
    
  EndIf
Until Event = #PB_Event_CloseWindow
End

;irgendwasmit zahl erwin paul hans +497319629426

; IDE Options = PureBasic 5.61 (Windows - x86)
; CursorPosition = 33
; FirstLine = 22
; Folding = -
; EnableThread
; EnableXP
; Executable = calltodialercaller.exe
; CompileSourceDirectory