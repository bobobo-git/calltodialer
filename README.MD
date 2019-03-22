## calltodialer  


Ein Programm zur Unterstützung des ADDONS tbdialout für Thunderbird  
zur Anbindung der Windowswahlhilfe.  
- calltodialer ruft den windowsdialer mit dem parameter callto:Rufnummer auf die Rufnummer sollte die vollständige kanonische Rufnummer enthalten. +4989xxxxx für eine Nummer in München
 - Die im Thunderbrid hinterlegte Rufnummer wird in den Parametern von tbdialout
nachbehandelt bezüglich der + und einer eventuell weiteren Amtsholung.
 - das Pluszeichen in eine Doppelnull umzuwandeln istz immer eine gute Idee, da die Windowswahlhilfe das + nicht versteht.
 - die Amtsholungsnull je nach Bedarf. Bei einer eingesetzten Telefonanlage ist die Amtsholungsnull oft von Nöten. Bei einzelnen Telefonen eher nicht.
 - es gibt das Zusatztool calltoDialerCaller, dass den calltoDialer aufrufen kann und dem die aktuelle Zwischenablage als zu wählende Rufnummer vorlegt. Die Zwischenablage sollte dann eine Rufnummer (möglichst kanonisch s.o.) enthalten. Eine Amtsholungsnummer kann hier in einer beiligeneden INI-datei hinterlegt werden. Das Programm wird gestartet und ist im SYSTRAY (neben der Uhr üblicherweise unten rechts) als P erkennbar. Ein Dopplelklick auf das P führt die Funktion aus, ein Klick mit der rechten Maustaste fragt nach Programmbeendigung. Bei einem NEIN wird das Programm nicht beendet aber die Funtkionsbeschreibung angezeigt.
 
 
Priokom Informationtechnik GmBH

2019-03-22


<a href="source/calltodialer.pb">source (purebasic)</a>  
<a href="source/calltodialercaller.pb">source zusatztool (purebasic)</a>  

windowskompilat <a href="bin/cdt.zip">calltodialer.exe (zipped)</a>

