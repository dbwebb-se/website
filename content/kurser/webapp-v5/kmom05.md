---
author:
  - mos
  - efo
revision:
  "2018-02-14": (C, efo) Anpassat för webapp-v3.
  "2017-03-14": (B, aar) Tagit bort JQuery mobile.
  "2015-12-04": (A, mos) Första utgåvan för kursen.
...
Kmom05: Native
==================================

Än så länge har vi skapat applikationer för webbläsaren, men i detta och nästa kursmoment skapar vi applikationer på riktigt för våra mobila enheter. Vi ska se vilka fördelar detta kan ge och hur vi maximerar styrkorna för våra mobila enheter. Vi lägger till ikoner och splash screens och fokuserar på att anpassa applikationernas design för de olika plattformarna och skärmstorlekar.



<!--more-->



[WARNING]
**Kursutveckling pågår**

Kursutveckling pågår inför kurstillfället VT23.
[/WARNING]



[FIGURE src=/image/snapht15/Strip-dileme-appli-mobile-650-Finalenglish3.jpg caption="Så här kan man ibland känna när man väljer mellan native app och hybrid app." href="http://www.commitstrip.com/en/2014/08/18/the-dilemna-of-mobile-apps-development/"]

Bilden ovan ger en vy av hur man kan känna när man väljer mellan native app och hybrid webapp. Men om man tänker igenom sitt projekt och målgrupp så kommer nog det ena eller andra alternativet framstå som bästa vägen att gå. För vår del gäller hybrid webapp, vi har redan investerat tid och kraft i HTML, CSS och JavaScript och vår webapp är inte speciellt avancerad eller krävande och dessutom är det väldigt lockande att stödja flera plattformar med en kodbas.

Så här kan det se ut när vi är klara med lager appen i kmom05.

[YOUTUBE src=CElOXw35_WU width=630 caption="Lager appen i kursmoment 5."]



<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Labbmiljön  {#labbmiljo}
---------------------------------

*(ca: 3 studietimmar)*



Läsanvisningar  {#lasanvisningar}
---------------------------------

*(ca: 4 studietimmar)*



### Artiklar {#artiklar}

1. Läs igenom artikeln "[GUI ramverk](kunskap/gui-ramverk)".



### Video  {#video}

1. Det finns en [videoserie](https://www.youtube.com/playlist?list=PLKtP9l5q3ce-1cVPTFJ_Zw9b7N2Y4_ANI) kopplat till kursen, titta på videos som börjar på 5.



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 12-15 studietimmar)*



### Övningar {#ovningar}

1. Jobba igenom övningen "[Kom igång med Cordova](kunskap/kom-igang-med-cordova)". Spara dina filer i `me/kmom05/hello`.

1. Läs igenom artikeln "[Lägg till en Splash screen och ändra ikon](kunskap/splash-screen-och-ikon)". Spara dina filer i `me/kmom05/hello`.



### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.



1. Gör uppgiften "[Lager appen del 5](uppgift/lager-appen-del-5)". Spara dina filer i `me/kmom05/lager5`.



### Extra {#extra}

* Skapa ett offline-läge för din app med hjälp artikeln "[Filer i Cordova](kunskap/filer-i-cordova)" och Cordova pluginen "[Network information](https://cordova.apache.org/docs/en/latest/reference/cordova-plugin-network-information/)". Du behöver inte göra om så hela appen fungerar, men kan välja ut specifika vyer och specifik data att göra offline. Skriv en rad eller tre i din redovisningstext om hur det gick om du valde att göra offline-läget.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

* Vilka fördelar ser du med att göra appar med Cordova om du jämför med rena webbapplikationer?
* Har du möjligheten att köra dina appar på en fysisk enhet? Vilka testmöjligheter ger detta?
* Gick det bra att skapa en logga och splashscreen?
* Beskriv designprocessen för att efterlikna den mobila plattformen du bygger din app för?
* Vilken är din TIL för detta kmom?
