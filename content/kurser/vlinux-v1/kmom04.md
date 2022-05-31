---
author:
    - lew
revision:
    "2019-03-26": (A, lew) Ny inför HT19.
...
Kmom04: En webbserver i Docker
==================================

[WARNING]
Kursen uppdateras inför HT22. Är "gula rutan" borta är det fritt fram att börja.
[/WARNING]

Nu vet vi hur vi bygger en egen image med hjälp av Docker. Vi har också gått igenom hur vi kan strukturera ett Bash-script som även exekveras inuti en kontainer. Vi tar ett steg till och tittar på hur vi kör en webbserver inuti Docker. I det här kursmomentet får du välja om du vill leka med Apache/php, Flask/Python eller Nodejs/JavaScript. Huvudsaken är att du får igång en server med en router som kan serva en JSON-fil. Vi jobbar även vidare med Bash - såklart.



<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



<!-- Läsanvisningar  {#lasanvisningar}
---------------------------------

*(ca: 0 studietimmar)*



### Kurslitteratur  {#kurslitteratur}

Det finns inga läsanvisningar kopplade till kursmomentet.

 -->

### Video {#video}

Till kursen finns en [videoserie](https://www.youtube.com/playlist?list=PLKtP9l5q3ce_XueavhyZ_udFDLVFaoVo5). Titta på videorna som börjar med 04.




Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 15-20 studietimmar)*

### Övningar {#ovningar}

Genomför följande övningar.

1. Läs igenom guiden "[Hantera applikationer](guide/docker/hantera-applikationer)". Välj sedan ett språk du vill använda.

1. Glöm inte bort guiden [kom igång med Bash](guide/kom-igang-med-bash).



### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Webbserver i Docker](uppgift/webbserver-i-docker)". Spara arbetet i mappen `server/`.

1. Gör uppgiften "[Bash-script som testar serverns routes](uppgift/bash-script-testa-routes)". Spara arbetet i mappen `client/`.

1. Lägg till redovisningstexten i din me-sida.



### Testa din inlämning {#test}

Du kan köra vissa tester på din inlämning och se om de delarna uppfyller kraven. Rättningen kommer endast genomföras om testerna går igenom.

```console
$ dbwebb test kmom04
```



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

* Vilken väg valde du för servern?
* Hur kommer det sig att du valde det?
* Gick det bra med Docker?
* Hänger du med på koncepten kring klient och server?
* Strukturerade du Bash-scriptet annorlunda jämfört med förra kursmomentet?
