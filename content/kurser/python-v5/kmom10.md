---
author: aar
revision:
    "2022-10-13": "(B, aar) Uppdaterade hur man räknar poäng."
    "2022-10-07": "(A, aar) Skapad inför HT22."
...
Kmom10: Projekt och examination
==================================

[INFO]
Innan du startar med projektet, kör `dbwebb update` och `dbwebb init`
[/INFO]

Detta kursmoment avslutar och examinerar kursen.

Upplägget är enligt följande:

* Projektet och redovisning (20-36h)

Totalt omfattar kursmomentet (07/10) ca 20+16 studietimmar. Du kan själv styra din arbetsinsats genom att välja vilka optionella delar du utför.



Förutsättning {#pre}
--------------------------------------------------------------------

Du har jobbat igenom föregående kursmoment.



Bedömning och betygsättning {#bedomning}
--------------------------------------------------------------------

När du har lämnat in projektet bedöms det tillsammans med dina tidigare redovisade kursmoment och du får ett slutbetyg på kursen. Läs om [grunderna för bedömning och betygsättning](kurser/bedomning-och-betygsattning).



Projektidé och upplägg {#upplagg}
--------------------------------------------------------------------

Du ska utveckla ett program för att öva på att skriva snabbt på ett tangentbord. Det finns många webbsidor som erbjuder det redan, t.ex. [https://www.keybr.com/](https://www.keybr.com/), men vi ska skapa ett program för terminalen. **PS** Det finns inga tester för projektet. Det är upp till er att tolka och implementera kraven.

[YOUTUBE src=fbFOKLyF2yM caption="Andreas visar hur projektet kan se ut när det är klart.]


Projektspecifikation {#projspec}
--------------------------------------------------------------------

Utveckla och leverera projektet enligt följande specifikationen. Saknas info i specen så kan du själv välja väg, dokumentera dina val i redovisningstexten.

De tre första kraven är obligatoriska och måste lösas för att få godkänt på uppgiften. De tre sista kraven är optionella krav. Lös de optionella kraven för att samla poäng och därmed nå högre betyg.

Varje krav ger max 10 poäng, totalt är det 60 poäng.

Lägg din kod i `kmom10/typing`. Din kod ska validera i python för att få godkänt.

Du ska implementera ett program för tangentbordsträning. Programmet går ut på att visa användaren en rad åt gången som användaren ska skriva in så snabbt som möjligt. När användaren har skrivit in alla rader då ska ni räkna ut en poäng på hur bra det gick och visa upp det. 



### Krav 1-3 {#k1}

I `example/typing` finns det tre filer med texter i olika svårighetsgrader, lätt, medel och svårt. Kopiera dem till `me/kmom10/typing` och använd som input för vad användaren ska skriva.



#### Menyval {#menyval}

"1". Starta skrivtest med filen `easy.txt`.  

"2". Starta skrivtest med filen `medium.txt`.  

"3". Starta skrivtest med filen `hard.txt`.  

"4". Skriv ut poänglistan som du har sparat i `score.txt`, sorterad på högst poäng.

"q". Ansluta programmet.



#### Vad ett skrivtest är {#skrivtest}

För menyval 1-3, ett test går ut på att läsa alla rader från filen, skriv ut första raden, vänta på att användaren skriver in samma rad, skriv därefter ut andra raden, vänta på att användaren skriver in samma rad och så vidare tills alla rader har gåtts igenom. Kolla på videon ovanför om ni är osäkra på hur det ska gå till. När testet är klart ska ni skriva ut hur bra användaren [presterade och poäng](#performance).

Efter det ska ni be användaren skriva in sitt namn och så ska ni spara namnet och användarens poäng i filen `score.txt`. Filen `score.txt` ska innehålla alla som kört ett test och vilken poäng de fick. 



##### Räkna ut prestation och poäng {#performance}

Med prestanda menas två saker, hur många procent tecken användaren skrev in fel jämfört med texten som visades och hur många gånger olika tecken blev felskrivna. T.ex. om programmet skriver ut:  
`hej På dig Igelkott` och användaren skriver in:  
`he jpå Di gIgelkorr`. Då blir följande tecken fel , "j" en gång, " " två gånger, "P", "d" och "g" en gång samt "t" två gånger. Det blir 42% fel. Notera att **det är case-sensitive, `a != A`**.

Utskriften ska bestå av vilka tecken som gick fel **sorterat** på antalet i utskriften.

För att räkna ut poängen, ta antalet tecken i texten som användaren ska skriva av multiplicerat med hundra minus - fel procenten, `len * (100 - error_percentage)`. T.ex. `121 * (100 - 50)` ger 6050 poäng, texten är 121 tecken lång och användaren skrev 50% fel. **PS** poängen som Andreas visar i videon ovanför stämmer inte med uträkningen som står här. Uträkningen är uppdaterade efter att Andreas spelade in videon.



#### kodstruktur {#kodstruktur}

Din kod ska skrivas i minst två filer. Programmet ska utgå från `main.py` och du måste skapa minst en till modul som du har kod i.

Din kod **ska** skrivas i funktioner. Vi godkänner inte kod som ligger utanför funktioner i det globala scopet, förutom enstaka variabler.



#### Väl fungerande program {#fungera}

Programmet skall fungera utan brister och inte krascha när man använder det enligt kraven.



#### Validera och kompabilitet {#validera}

Din kod ska validera med pylint.

```
dbwebb validate kmom10
```

Det finns inte några färdiga tester, så `dbwebb test kmom10` funkar **inte**.



### Krav 4: Tidtagning (optionell) {#k4}

För menyval 1-3, lägg till att räkna ut hur lång tid det tar för användaren att skriva in hela texten, i sekunder. Mät tiden från precis innan du skriver ut första raden till att användaren har skrivit in sista raden.

Använd dig av modulen [time](https://docs.python.org/3/library/time.html) för att mäta tiden.



#### Prestanda och poäng {#k4-score}

Nu ska tiden med i prestanda och poängräkningen. Efter skrivtestet är klart ska du också skriva ut hur många tecken per minut (CPM) som användaren skrev.

Poänguträkningen ska nu vara `(len * (100 - error_percentage)) / duration`.



### Krav 5: Sortera poängutskriften (optionell) {#k5}

När du skriver en användares resultat till `score.txt` ska du också spara vilken svårighetsnivå testet var. För menyval 4, när du gör utskriften av resultaten ska utskriften vara grupperad efter svårighetsnivå och sorterad efter högst poäng.



### Krav 6: Skrivtest med slumpade tecken (optionell) {#k6}

Lägg till menyval 5, i det manyvalet ska användaren välja ett antal sekunder som testet ska pågå. Under så många sekunder ska du slumpa fram ett tecken som användaren ska skriva in så snabbt som möjligt. När tiden har tagit slut ska du skriva ut vilka tecken som blev fel och hur många gånger som det skrevs fel på det tecknet. Utskriften ska vara sorterad i storleksordning på antalet fel. Räkna också ut och skriv ut hur många procent av tecknen som blev fel och antalet tecken per minut som användaren skrev. Inkludera användarens sista input om tiden tar slut under tiden som programmet väntar på att användaren ska skriva.



Redovisning {#redovisning}
-------------------------------------------------------------------

1. På din [redovisningssida](./../redovisa), skriv följande:

    1. För varje krav du implementerat, dvs 1-3, 4, 5, 6, skriver du ett textstycke om ca 5-10 meningar där du beskriver vad du gjort och hur du tänkt. Poängsättningen tar sin start i din text så se till att skriva väl för att undvika poängavdrag. Missar du att skriva/dokumentera din lösning så blir det 0 poäng. Du kan inte komplettera en inlämning för att få högre betyg.
       - Berätta om din kodstruktur och hur du tänkte när du organiserade din kod.

    2. Skriv ett allmänt stycke om hur projektet gick att genomföra. Problem/lösningar/strul/enkelt/svårt/snabbt/lång tid, etc. Var projektet lätt eller svårt? Tog det lång tid? Vad var svårt och vad gick lätt? Var det ett bra och rimligt projekt för denna kursen?

    3. Avsluta med ett sista stycke med dina tankar om kursen och vad du anser om materialet och handledningen (ca 5-10 meningar). Ge feedback till lärarna och förslå eventuella förbättringsförslag till kommande kurstillfällen. Är du nöjd/missnöjd? Kommer du att rekommendera kursen till dina vänner/kollegor? På en skala 1-10, vilket betyg ger du kursen?

2. Ta en kopia av texten på din redovisningssida och kopiera in den på Canvas. Glöm inte att bifoga länken till projektet på studentservern.

3. Spela in en redovisningsvideo och lägg länken till videon i en kommentar på din inlämning i Canvas. Läs mer om hur du kan [spela in en redovisningsvideo](kurser/faq/slutpresentation).

4. Se till att samtliga kursmoment validerar i "dbwebb validate/publish".

```text
# Ställ dig i kursrepot
dbwebb publish me
```
