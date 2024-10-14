---
author: aar
revision:
    "2023-09-29": "(D, aar) Lagt till video och exempel."
    "2023-09-15": "(C, aar) Släppt utan uppdaterad video."
    "2022-10-13": "(B, aar) Uppdaterade hur man räknar poäng."
    "2022-10-07": "(A, aar) Skapad inför HT22."
...
Kmom10: Projekt och examination
==================================

[WARNING]
Kursmomentet är underutveckling.

Påbörja inte förens denna gula rutan är borta.
[/WARNING]

[INFO]
Innan du startar med projektet, kör `dbwebb update` och `dbwebb init`.

**Tips** före du börjar med projektet, gå tillbaka och titta igenom vad det är du har gjort i tidigare kursmoment i kursen. Uppfriska minnet, tänk hur långt du har kommit och hur mycket du har lärt er.

Efter det börjar du med att läsa igenom projektet och lägg upp en plan, före du börjar koda. Vad ska du göra? Hur kan du göra det? Har du gjort något liknande delproblem tidigare?
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

När du har lämnat in projektet bedöms det tillsammans med dina tidigare redovisade kursmoment och du får ett slutbetyg på kursen. Läs om [grunderna för bedömning och betygsättning](kurser/faq/bedomning-och-betygsattning-quiz).



Projektidé och upplägg {#upplagg}
--------------------------------------------------------------------

Du ska utveckla ett program för att öva på att skriva snabbt på ett tangentbord. Det finns många webbsidor som erbjuder det redan, t.ex. [https://www.keybr.com/](https://www.keybr.com/), men vi ska skapa ett program för terminalen. **PS** Det finns inga tester för projektet. Det är upp till er att tolka och implementera kraven.

[YOUTUBE src=RLKUPG4-btI caption="Andreas visar hur projektet kan se ut när det är klart.]


Projektspecifikation {#projspec}
--------------------------------------------------------------------

Utveckla och leverera projektet enligt följande specifikationen. Saknas info i specen så kan du själv välja väg, dokumentera dina val i redovisningstexten.

De tre första kraven är obligatoriska och måste lösas för att få godkänt på uppgiften. De tre sista kraven är optionella krav. Lös de optionella kraven för att samla poäng och därmed nå högre betyg.

Varje krav ger max 10 poäng, totalt är det 60 poäng.

Lägg din kod **i** `kmom10/typing`. Din kod ska validera i python för att få godkänt.

Du ska implementera ett program för tangentbordsträning. Programmet går ut på att visa användaren en rad åt gången som användaren ska skriva in så snabbt som möjligt. När användaren har skrivit in alla rader då ska ni räkna ut hur bra det gick och visa upp det. 



### Krav 1-3 {#k1}

I `example/typing` finns det tre filer med texter i olika svårighetsgrader, lätt, medel och svårt. Kopiera dem till `me/kmom10/typing` och använd som input för vad användaren ska skriva.



#### Menyval {#menyval}

"1". Starta skrivtest med filen `easy.txt`.  

"2". Starta skrivtest med filen `medium.txt`.  

"3". Starta skrivtest med filen `hard.txt`.  

"4". Skriv ut resultatlistan som du har sparat i `score.txt`, sorterad på högst precision.

"q". Ansluta programmet.



#### Vad ett skrivtest är {#skrivtest}

För menyval 1-3, ett test går ut på att läsa alla rader från filen, skriv ut första raden, vänta på att användaren skriver in samma rad, skriv därefter ut andra raden, vänta på att användaren skriver in samma rad och så vidare tills alla rader har gåtts igenom. Kolla på videon ovanför om ni är osäkra på hur det ska gå till. När testet är klart ska ni skriva ut hur bra användaren [presterade](#performance).

Efter det ska ni be användaren skriva in sitt namn och så ska ni spara namnet och användarens ordprecision i filen `score.txt`. Filen `score.txt` ska innehålla alla som kört ett test och vilken ordprecision de fick.



##### Räkna ut prestation {#performance}

När ni ska jämföra resultat utgår vi från orden, orden är separerade med mellanslag. Punkttecken har ingen speciellt betydelse, tänk på dem som vilka bokstäver som helst i ett ord. T.ex. strängen "hej. p-å dig" innehåller tre ord, "hej.", "p-å" och "dig".

Skilj också på raderna, om användaren skriver in ett ord för lite eller för mycket vill vi inte att det ska på verka alla ord efteråt. Det påverkar alla ord efteråt i samma input men det ska inte påverkar order i input efteråt. T.ex.

Rätt text:

> Hej På Er Idag  
> Vad gör ni?

Användarens input:

> Hej er idag  
> Vad gör ni?

"På", "Er" och "Idag" blir fel för att "På" saknas, då matchas "På" till "er", "Er" till "idag" och "Idag" saknar ord att matcha mot. Varje ny rad ska "börja om". Andra raden blir 100% rätt.

**Alla uträkningar** ska vara avrundade till två decimaler.

###### Ord {#words}

Räkna ut ord precision med `antal rättstavade ord / totalt antal ord i texten`. Om användaren skriver in fler ord än vad som efterfrågas, då ska ni ignorera de extra orden. T.ex. om testet skriver ut 5 ord och användaren skriver in sju ord där två av andra ord är felstavade. Då blir uträkningen `5-2 = 3` (minus 2 för de felstavade orden), `3/5` vilket ger `60%` precision. Notera att **det är case-sensitive, `a != A`**

###### Tecken {#chars}

Räkna ut och skriv ut tecken precision med `antalet rättstavade tecken / total antal tecken i texten`. För att räkna vilka tecken som är rätt. Dela först upp texten i ord (dela på mellanslag) och sen jämför tecken för tecken i orden. Det innebär att mellanslag inte räknas som ett tecken, det är en separator för ord. Om användaren skriver in fler tecken än vad som efterfrågas, då ska ni ignorera de extra tecknen. Precis som för orden.

Räkna också ut hur många gånger varje korrekt tecken blev felskrivet. **Utgå** från de korrekta tecknen när du du kollar om de är rätt, **inte** användarens input. Det är inte tecknet användaren skriver in som ska räknas utan tecknet användaren skulle skriva in men inte gjorde, som ska räknas ut.

T.ex. om programmet skriver ut:  
`hej På dig Igelkott` och användaren skriver in:  
`he jpå Dig Igelkorr`. Då blir följande tecken fel , `j` i `hej`, `P` och `å` i `På`, `d` i `dig` och `t` två gånger i `Igelkott`. Notera att **det är case-sensitive, `a != A`**. Det blir följande fel:

t 2  
P 1  
d 1  
j 1  
å 1  

Eftersom vi jämför per ord och ignorerar mellanslag blir `å` fel i ordet `På`. Då jämför vi `På` med `jpå` vilket gör att `P` blir `j`, `å` blir `p`  och `å` i input är extra tecken. Det är 10 korrekt stavade av 16, ett tecken för mycket och precisionen blir då `10 / 16 = 62.5%`.

Utskriften ska bestå av vilka tecken som blev fel, **sorterat** på antalet felstavningar och i andrahand bokstavsordning. Tecknet som skrevs fel flest gånger ska skrivas ut först. Skriv också ut precisionen.



###### Exempel {#exempel}

Här kan ni se ett exempel med input från användaren.

Text från filen:
> "Hello my name is Andreas"  
> "What is your name"  
> "My name is Da"  


Input från användaren:
> "Hellå m name andreas"  
> "What is your nameaa ko"  
> ""

På sista raden skriver användaren inte in något utan trycker bara på Enter på tangentbordet.

Det ger följande prestation:
```python
Ordprecision: 30.77% # 4 / 13
Teckenprecision: 52.27% # 23 / 44
Felstavade tecken:  
   a: 3  
   s: 3  
   e: 2  
   i: 2  
   n: 2  
   y: 2  
   A: 1  
   D: 1  
   M: 1  
   d: 1  
   m: 1  
   o: 1  
   r: 1  
```

###### Uträkning {#calc}

Utskrift `Hello my name is Andreas`  
Input &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`Hellå m name andreas`

**Ord**: Endast `name` är rättstavat. `is` jämförs här med `andreas` eftersom det är fjärde ordet användaren skriver in. `Andreas` kan inte jämföras med något och räknas därför som felstavat. Så 1 rättstavat och 4 felstavade.  
**Tecken**: Följande felstavningar finns, `o` i `Hello`, `y` i `my` (eftersom det saknas en bokstav), `i` och `s` i `is` (eftersom användaren skrev in `andreas` som input) och alla bokstäver i `Andreas` är fel. Så 9 rättstavade och 11 fel.


Utskrift `What is your name`  
Input &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`What is your nameaa ko`

**Ord**: Endast `name` är felstavat. Vi ignorerar `ko` eftersom det är ett extra ord. Så 3 rättstavat och 1 felstavat.  
**Tecken**: Det finns inte några felstavningar. Vi ignorerar `aa` och `ko` eftersom de är extra. Så 14 rättstavade och 0 fel.

Utskrift `My name is Da`  
Input &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``

**Ord**: Alla ord är felstavade eftersom användaren inte skrev in några. Så 0 rättstavad och 4 felstavade.  
**Tecken**: Alla tecken är felstavade eftersom användaren inte skrev in några. Så 0 rättstavade och 10 fel.


##### Utskrift {#utskrft}
I utskriften under ett aktivt skrivtest ska användarens prestation kontinuerligt skrivas ut. I uträkningen anta att alla kommande rader (de som inte användaren har blivit ombedd att skriva in än) är korrekta. T.ex.

```python
Ord: 100% # 13/13
Tecken: 100% # 44/44
Felstavade tecken:
------------
Hello my name is Andreas
$ Hellå m name andreas
```
Ovanför visas första utskriften i skrivtestet, alltså före användaren har skrivit någon input. Då utgår vi från att användaren har 100% rätt på allt. När användaren sen skriver in svaret och får fel då ska vi uppdatera med faktiskt uträkning av precision. Det efter `$` är vad användaren skriver in och här har vi fel så vid nästa utskrift räknas prestanda ut med den felaktiga raden och alla efterkommando radera räknas som rätt.

```python
Ord: 69.23% # 9/13, det var 4 felstavade ord i användarens input
Tecken: 75% # 33/44. det var 11 felstavade tecken i användarens input
Felstavade tecken:
s: 2
A: 1
a: 1
e: 1
d: 1
i: 1
n: 1
o: 1
r: 1
y: 1
------------
What is your name
$ What is your nameaa ko
```
Här är uträkningen gjord med användarens input för först raden medan uträkningen antar att efter följande rader är korrekta.

```python
Ord: 61.54% # 8/13, det var 4 felstavade ord i första input och 1 i föregående input
Tecken: 75% # 33/44. det var 11 felstavade tecken i första input och 0 i föregående input
Felstavade tecken:
s: 2
A: 1
a: 1
e: 1
d: 1
i: 1
n: 1
o: 1
r: 1
y: 1
------------
My name is Da
$ ""
```
I uträkningen här används användarens input för rad 1 och 2 medan vi antar att rad 3 är korrekt. Detta är sista input raden och efter detta kommer utskriften med uträkningen för alla input.

```python
Skrivtestet är avklarat! Här är din prestation.

Ord: 30.77% # 4/13, det var 4 felstavade ord i första input, 1 i andra input och 4 fel i sista
Tecken: 52.27% # 23/44. det var 11 felstavade tecken i första input, 0 i andra input och 10 i sista
Felstavade tecken:
a: 3
s: 3
e: 2
i: 2
n: 2
y: 2
A: 1
D: 1
M: 1
d: 1
m: 1
o: 1
r: 1
```

**Era utskrifter** måste inte se ut exakt som min, men er utskrift måste innehålla användarens prestation.


#### kodstruktur {#kodstruktur}

Din kod ska skrivas i minst två filer. Programmet ska utgå från `main.py` och du måste skapa minst en till modul som du har kod i.

Din kod **ska** skrivas i funktioner. Vi godkänner inte kod som ligger utanför funktioner i det globala scopet, förutom enstaka variabler. Tänk på att skriva [DRY kod](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself). För långa upprepade kodsnuttar ger minuspoäng.

Du får **inte** installera moduler med `pip`. Du får bara importera moduler som vi använt i kursen tidigare och `time` modulen. Om du vill använda någon annan modul, kontakta kursansvarig och fråga om det är OK.

Du får **inte** skriva objektorienterad kod.


#### Väl fungerande program {#fungera}

Programmet skall fungera utan brister och inte krascha när man använder det enligt kraven. Programmet ska kunna hantera att användaren råkar skriva fel i menyn.

Det ska gå att skriva in färre och fler tecken och ord än vad som skrivs ut utan att programmet kraschar.

Programmet ska inte krascha om filen saknas som används till precisionshistorik.



#### Validera och kompatibilitet {#validera}

Din kod ska validera med pylint.

```
dbwebb validate kmom10
```

Det finns inte några färdiga tester, så `dbwebb test kmom10` funkar **inte**.



### Krav 4: Tidtagning (optionell) {#k4}

För menyval 1-3, lägg till att räkna ut hur lång tid det tar för användaren att skriva in hela texten, i sekunder. Mät tiden från precis innan du skriver ut första raden till att användaren har skrivit in sista raden.

Använd dig av modulen [time](https://docs.python.org/3/library/time.html) för att mäta tiden.

Inkludera [Gross WPM](#gwpm) och [Net WPM](#nwpm) i den **kontinuerliga utskriften** under ett skrivtest. Inkludera **endast** [djurkategori](category) i den slutliga prestations utskriften.


#### Gross WPM {#gwpm}

Räkna ut gross words per minute, `antal skrivna ord / minuter`. Avrunda minuter uppåt om det tog X minuter och över 30 sekunder. T.ex. 3 minuter och 33 sekunder blir 4 minuter. Om det är under 30 sekunder avrunda ner. T.ex. 2 minuter och 15 sek blir 2 minuter. Allt under 1 minut avrundas upp till en minut.


#### Net WPM {#nwpm}

Räkna ut net words per minute, `gross wpm - (antal felskrivna ord / minuter)`. I "felskrivna ord" **inkludera** ord som användaren har skrivit för mycket.

Avrunda minuter uppåt om det tog X minuter och över 30 sekunder. T.ex. 3 minuter och 33 sekunder blir 4 minuter. Om det är under 30 sekunder avrunda ner. T.ex. 2 minuter och 15 sek blir 2 minuter. Allt under 1 minut avrundas upp till en minut.


#### Kategori {#category}

Ge användaren ett djur som representerar hur snabbt de skrev, baserat på vilken net WPM den fick. När användaren är färdig med ett test visa vilken djur den är. Nedanför hittar ni vilka djur som representerar vilka net WPM. 

| Net wpm | Djur |
|---------|---------|
| 0 - 10| Sloth |
| 10 - 20| Snail |
| 20 - 30| Manatee |
| 30 - 40| Human |
| 40 - 50| Gazelle  |
| 50 - 60| Ostrich |
| 60 - 70| Cheetah |
| 70 - 80| Swordfish |
| 80 - 90| Spur-winged goose |
| 90 - 100| White-throated needletail |
| 100 - 120| Golden eagle |
|  > 120| Peregrine falcon |


### Krav 5: Sortera precisionsutskriften (optionell) {#k5}

När du skriver en användares resultat till `score.txt` ska du också spara vilken svårighetsnivå testet var. För menyval 4, när du gör utskriften av resultaten ska utskriften vara grupperad efter svårighetsnivå och sorterad efter högst precision. Sorteringen på svårighetsnivå ska vara i ordningen `hard --> medium --> easy`. Du ska **inte** plocka ut varje svårighetsgrad för sig och sortera den. Alla data ska ligga i en datastruktur och sorteras med **ett** `sort()` anrop. PS. Tänk på att när du sorterar precision ska det vara som decimaltal och inte strängar.



### Krav 6: Skrivtest med slumpade tecken (optionell) {#k6}

Lägg till menyval 5, i det menyvalet ska användaren välja ett antal sekunder som testet ska pågå. Under så många sekunder ska du slumpa fram ett tecken (bokstäver, siffror och punkter) som användaren ska skriva in så snabbt som möjligt. När tiden har tagit slut ska du skriva ut vilka tecken som blev fel och hur många gånger som det skrevs fel på det tecknet. Utskriften ska vara sorterad i storleksordning på antalet fel. Räkna också ut och skriv ut hur många procent av tecknen som blev fel och antalet tecken per minut som användaren skrev. Inkludera användarens sista input om tiden tar slut under tiden som programmet väntar på att användaren ska skriva.



Redovisning {#redovisning}
-------------------------------------------------------------------

1. I inlämningen på Canvas, skriv följande:

    1. För varje krav du implementerat, dvs 1-3, 4, 5, 6, skriver du ett textstycke om ca 5-10 meningar där du beskriver vad du gjort och hur du tänkt. Poängsättningen tar sin start i din text så se till att skriva väl för att undvika poängavdrag. Missar du att skriva/dokumentera din lösning så blir det 0 poäng. Du kan inte komplettera en inlämning för att få högre betyg.
       - Berätta om din kodstruktur och hur du tänkte när du organiserade din kod.

    2. Skriv ett allmänt stycke om hur projektet gick att genomföra. Problem/lösningar/strul/enkelt/svårt/snabbt/lång tid, etc. Var projektet lätt eller svårt? Tog det lång tid? Vad var svårt och vad gick lätt? Var det ett bra och rimligt projekt för denna kursen?

    3. Avsluta med ett sista stycke med dina tankar om kursen och vad du anser om materialet och handledningen (ca 5-10 meningar). Ge feedback till lärarna och förslå eventuella förbättringsförslag till kommande kurstillfällen. Är du nöjd/missnöjd? På en skala 1-10, vilket betyg ger du kursen?

2. Glöm inte att bifoga länken till projektet på studentservern (alternativ bara din akronym).

3. Spela in en redovisningsvideo där du visar din kod och visar att du förstår den. Övertyga oss om att det är du som har skrivit koden. Du ska inte visa hur du kör programmet. Efter du har gjort inlämningen på Canvas lägg till videon som en mediakommentar på din inlämning. 

4. Se till att samtliga kursmoment validerar i "dbwebb validate/publish".

```text
# Ställ dig i kursrepot
dbwebb publish me
```
