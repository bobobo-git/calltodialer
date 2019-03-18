## calltodialer  


Ein Programm zur Unterstützung des ADDONS tbdialout für Thunderbird  
zur Anbindung der Windowswahlhilfe.  
- calltodialer ruft den windowsdialer mit dem parameter callto:Rufnummer auf die Rufnummer sollte die vollständige kanonische Rufnummer enthalten. +4989123456789 für eine Nummer in München
 - Die im Thunderbrid hinterlegte Rufnumemr wird in den Parametern von tbdialout
nachbehandelt bezüglich der + und einer eventuell weiteren Amtsholung.
 - das Pluszeichen in eine Doppelnull umzuwandeln istz immer eine gute Idee, da die Windowswahlhilfe das + nicht versteht.
 - die Amtsholungsnull je nach Bedarf. Bei einer eingesetzten Telefonanlage ist die Amtsholungsnull oft von Nöten. Bei einzelnen Telefonen eher nicht.

Priokom Informationtechnik GmBH

2019-03-18


<a href="/source/calltodialer.pb">source (purebasic)</a>  

windowskompilat <a href="bin/calltodialer.exe">calltodialer.exe</a>

