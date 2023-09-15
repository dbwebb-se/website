---
author: lew
category:
    - bash
    - vlinux
    - regex
    - lab
revision:
    "2023-09-14": (B, lew) Uppdaterad inför HT23.
    "2021-04-12": (A, lew) Ny inför HT21.
...
awk script
==================================

En uppgift för att träna grunderna i awk. Till din hjälp har du en [awk guide](guide/kom-igang-med-awk) samt artikeln om [regex](kunskap/regex).

<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har installerat labbmiljön för kursen [labbmiljön för kursen vlinux](kurser/vlinux-v1/labbmiljo).

Du har tillgång till kommandot `dbwebb` och du har clonat kursrepot för vlinux-kursen.



Hämta filen {#hamta}
-----------------------

Du har en textfil att utgå ifrån. Du hittar den i exempelmappen.

Gå till din kurskatalog i terminalen och kör följande kommando.

```bash
# Flytta till kurskatalogen
cp example/awk/awk_names.csv me/kmom06/awk/
```

Filen innehåller en hel del rader med påhittade personuppgifter. 
[INFO]
All data i filen är automatgenererad och är inga verkliga personer. Skulle det kunna mappas mot någon riktig person är det av ren slump. Datan kommer från offentliga listor med "populäraste namn" och "lista över orter i sverige". Även sifforna är automatgenererade.
[/INFO]



### Uppgift {#uppgift}

Du ska skapa en uppsättning awk script. Tänk på att första raden ofta är en form av rubriker. Alla utskrifter ska ha samma formattering som i exemplet. Ett tips är att använda printf() i vissa svar.

Försök få till en liknande presentation med indentering och padding som i exemplena nedan. Alla script ska presentera korrekt resultat med kommandot:

`$ awk -f <script> awk_names.csv` där &lt;script&gt; byts ut mot respektive uppgift.


Krav {#krav}
-----------------------

1. Skapa scriptet `1.awk`. Skriv ut förnamn och efternamn på alla personer.

Nedan visas de 3 första:
```
Salma Helin
Sanna Wahlgren
Anni Örn
...
```

2. Skapa scriptet `2.awk`. Välj ut de 100 första personerna.

Nedan visas de 3 första:
```
Salma Helin, Hällaryd
Sanna Wahlgren, Torhamn
Anni Örn, Resarö
...
```

3. Skapa scriptet `3.awk`. Välj ut personerna från den 507:e till och med den 515:e.

Nedan visas de 3 första:
```
Charlotta Forsström, Norra Ingaröstrand
Emin Wik, Krokom
Adriana Rosell, Näsåker
...
```

4. Skapa scriptet `4.awk`. Lägg till en header och en footer. Skriv ut alla rader med fälten separerade med TAB.

Nedan visas de 3 första:
```
Förnamn         Efternamn       Telefonnummer
---------------------------------------------
Salma           Helin            555674792
Sanna           Wahlgren         555493393
Anni            Örn              555408537
...
--------------------------------------
```

5. Skapa scriptet `5.awk`. Skriv ut alla rader där staden slutar på `berg`. Notera högerjusteringen.

Nedan visas de 3 första:
```
Förnamn         Efternamn                       Stad
----------------------------------------------------
Indra           Sörensson                  Killeberg
Ester           Haglund                   Falkenberg
Eva             Lindfors                     Varberg
...
```

6. Skapa scriptet `6.awk`. Skriv ut alla rader där staden har substrängen `stad` och personen är född i januari eller oktober (tips: split()).

Nedan visas de 3 första:
```
Förnamn         Efternamn                       Stad
----------------------------------------------------
Savannah        Sjölin              Västra Ingelstad
Betty           Östberg                  Fridlevstad
Kian            Bohlin                      Lyrestad
...
```

7. Skapa scriptet `7.awk`. Jobba igenom raderna och beräkna hur många som är födda de olika åren.

Nedan visas de 3 första:
```
Årtal   Antal
-------------
1990       38
1991       56
1992       50
...
```

8. Skapa scriptet `8.awk`. Skriv ut alla rader där dagen personen är född återfinns i telefonnumret. Till exempel återfinns `08` hos första personen (tips: match()).

Nedan visas de 3 första:
```
Anni Örn, 1994-07-08, 555408537
Teo Stenström, 1994-04-29, 555229873
Stina Örn, 2010-05-25, 555622513
...
```

9. Skapa scriptet `9.awk`. Återanvänd resultatet från förra scriptet. Lägg till en rad i slutet som visar hur många som är födda innan år 2000.

Nedan visas de 3 sista raderna:
```
...
Vilja Nordstrand, 1991-02-30, 555305309
---------------------------------
<int> stycken är födda innan år 2000.
```



Extrauppgift {#extra}
-----------------------

1. Skapa scriptet `10.awk`. Skriv ut alla rader där epostadressen innehåller mer än 40 tecken. Skapa sedan en funktion som formatterar om födelsedatumet. Ta även bort "leading zero" på dagen.

Nedan visas de 3 första:
```
Joseph 2/nov-1997
Maximiliam 3/jun-2001
Vilhelm 23/mar-2002
...
```



### Lämna in {#lamna-in}

Ladda upp, validera och publicera uppgiften genom att göra följande kommando i kurskatalogen i terminalen.

```bash
# Flytta till kurskatalogen
dbwebb validate awk
dbwebb publish awk
```

Rätta eventuella fel som dyker upp och publisera igen. När det ser grönt ut så är du klar.




Tips från coachen {#tips}
-----------------------

Lycka till och hojta till i chatten om du behöver hjälp!
