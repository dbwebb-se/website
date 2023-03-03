---
author: aar
revision:
    "2021-03-10": (E, aar) La till referensmaterial om Trie.
    "2020-03-10": (D, aar) La till i krav att spela in video som distans.
    "2020-02-28": (C, aar) La till i krav att ta bort ord och skriva ut i bokstavsordning.
    "2019-02-29": (B, aar) Bytt projekt för att passa till algoritmer och datastrukturer. Förra projektet finns under [kmom10-2018](oopython-v2/kmom10-2018).
    "2018-02-21": (A, aar) Först utgåva till V2.
...
Kmom10: Projekt och examination
==================================

Detta kursmoment avslutar och examinerar kursen.

[WARNING]
Kursmomentet är under utveckling. Börja inte med materialet innan denna gula ruta är borta!
[/WARNING]


Upplägget är enligt följande:

* Projektet och redovisning (20-60h)

Totalt omfattar kursmomentet (08/10) ca 20+20+20 studietimmar.



Projektidé och upplägg {#upplagg}
--------------------------------------------------------------------

Du ska utveckla ett rättstavningswebbsida som använder en [Trie](https://www.youtube.com/watch?v=-urNrIAQnNo) för att lagra en ordlista.

Börja med att kopiera filer med rättstavade engelska ord från exempel mappen.
```bash
# Stå i kursrepo mappen
cp example/dictionary/*.txt me/kmom10/spellchecker
cd me/kmom10/SpellChecker
```

Du kopierade fyra filer, alla innehåller ett ord per rad. `dictionary.txt` innehåller 349900 rättstavade ord och `tiny_dictionary.txt` innehåller 177. `dictionary.txt` kan ta lång tid att ladda och jobba med så när ni börjar med uppgiften använd `tiny_dictionary.txt` eller skapa en egen ännu mindre fil. Frequency filerna är för krav 5.

Innan du börjar med programmeringen ska du göra en analys av programmet du ska bygga och dokumentera det med klassdiagram.

Fråga i discord om du känner dig osäker.

[YOUTUBE src=17SULXiU6hM width=700 caption="Andreas visar hur SpellChecker kan se ut när det är klart."]




Bedömning och betygsättning {#bedomning}
--------------------------------------------------------------------

När du lämnat in projektet bedöms det tillsammans med dina tidigare redovisade kursmoment och du får ett slutbetyg på kursen. Läs om [grunderna för bedömning och betygsättning](kurser/bedomning-och-betygsattning).



Projektspecifikation {#projspec}
--------------------------------------------------------------------

Utveckla och leverera programmet enligt följande specifikation. Saknas info i specen kan du själv välja väg, dokumentera dina val i redovisningstexten.

De tre första kraven är obligatoriska och måste lösas för att få godkänt på uppgiften. De tre sista kraven är valfria krav. Lös de valfria kraven för att samla poäng och därmed nå högre betyg.

Varje krav ger max 10 poäng, totalt är det 60 poäng.



### Krav 1: Grunden {#k1}

Skriv din kod i katalogen `me/kmom10/spellchecker`.



#### Trie {#trie}

Implementera en Trie datastruktur, i filen `src/trie.py`, som använder Node objekt, `src/node.py`. Varje Node objekt behöver innehålla vilken bokstav noden representerar, en dictionary eller lista som ska hålla barn noderna och en boolean för att markera om det är en slut nod. Om du gör krav **fyra** måste du använda dictionary, annars kan du välja själv mellan dictionary och lista. Er Trie får **inte** innehålla en lista eller dict som innehåller hela orden som har lagts till. Orden ska byggas upp av strukturen i trädet.  

I er Trie ska det finnas metoder för att:

- lägga till ett nytt ord
- kolla om ett ord finns, om ordet inte finns ska ett `SearchMiss` error lyftas. Du behöver skapa det felet själv.
- ta bort ett ord, om ordet inte finns ska ett `SearchMiss` error lyftas.
    - Det räcker inte med att bara avmarkera noder när du tar bort ett ord. Om noderna i ordet inte används till ett annat ord ska du ta bort dem från datastrukturen.
- kolla antalet ord som finns
- få ut alla ord baserat på ett prefix, prefix-sökning
- skapa ett Trie objekt med alla ord från en fil 



#### Flask {#flask}

Skapa en webbsida för att använda Trie datastrukturen och kolla rättstavade ord. Första gången man går in på sidan ska det skapas ett nytt Trie objekt med ord från fil. Sen ska ordlistan sparas i session. Varje gång användaren går in på en ny route ska Trie objektet återskapas från session datan om det finns, annars ska den läsa upp från fil.

På sidan ska det finnas val i navbaren till följande sidor:

1. Ta ett ord som input och kolla om det finns i ordlistan (Trie objektet). Meddela användaren på sida om det fanns eller inte.

1. En prefix sökning (auto-complete), användaren skriver in början av ett ord. Då ska sidan visa upp alla ord som har inputen som prefix. Begränsa utskriften av ord till max 10, skriv ut ett ord per rad.

1. Byta ut ordlistan, skriv ut vilka filer som är tillgängliga och ha ett input element där användaren kan välja fil. Programmet ska då skapa ett nytt Trie objekt med orden från den nya filen.

1. Skriv ut alla ord som finns i ordlistan, i bokstavsordning. Överst på sidan ska det också stå antalet ord som finns.

1. Ta bort ett ord, programmet ska be användaren om ett ord som input och ta bort bort det ordet från Trie objektet. Det uppdatera ordlistan i session. Med andra ord, nästa gång Trie objektet återskapas från session data ska inte ordet vara med. Men det ska finnas kvar i filen.

1. Tömma session, vilket gör att nästa gång ett Trie objekt ska skapas så används filen istället för session.

I koden ni lämnar in ska filen `dictionary.txt` läsas in vid start.

Webbsidan ska fungera på studentservern!



### Krav 2: UML {#k2}

#### Klassdiagram {#klass}

**Innan du börjar programmera** ska du analyser och planera vad du ska koda. Dokumentera med klassdiagram vilka klasser, attribut, metoder och relationer som du tror att du kommer skapa när du utvecklar programmet.

Klassdiagrammet ska lämnas in före du börjar koda projektet. Det finns en separat inlämning på Canvas för klassdiagrammet. **Du behöver inte vänta på att få godkänt innan du fortsätter med att programmera, det viktiga är att du har lämnat in det före.**

Gör ett klassdiagram, lämna in det och sen börjar du koda projektet.

Det gör inget om koden skiljer sig från diagrammen när du är klar med projektet. Det blir inte alltid som man tänker sig.

När du har kodat klart projektet, jämför hur din kod faktiskt blev med hur du tänkte dig att det skulle fungera. I redovisningstexten skriver du hur din kod förhåller sig till diagrammet.

Spara som `classdiagrams.png`. Ladda upp filen på Canvas inlämningsuppgiften.



#### Sekvensdiagram {#sekvens}

När du är färdigt med din kod, gör ett sekvensdiagram. Gör diagrammet för din "prefix-sökning" metoden. Start punkten på digrammet ska vara att den metoden anropas.

Lägg bilden i `spellchecker` mappen och döp den till `sequencediagram.png`.



### Krav 3: Testning {#k3}

Skriv enhetstester för dina klasser. Spara testerna i filen `tests/test_trie.py`.

Minst 7 tester för Trie klassen. Testa inte bara positiva utfall, göra så att något går fel och testa hur det hanteras. Ni behöver också testa att `SearchMiss` exception:et lyfts.



Se till att din kod validerar.

```bash
# Ställ dig i kurskatalogen
dbwebb test kmom10 # --extra för att testa krav 5
dbwebb publish kmom10
```
 


### Krav 4: Sortera utskriften (valfritt) {#k4}

Implementera en [Merge Sort](kunskap/sorteringsalgoritmer-v2#merge-sort) algoritm. Lägg algoritmen i `src/sort.py` med namnet `sort()`, funktionen ska ta ett argument. Använd den på sidan där alla ord skrivs ut. Hämta ut alla ord från Trie objektet, lägg dem i en lista, sortera listan med Merge sort och skriv ut orden.
<!-- (https://www.tutorialspoint.com/data_structures_algorithms/merge_sort_algorithm.htm)-->
Om du gör detta kravet ska du **använda en dictionary** för att hålla barn noderna i Node klassen. Lägg till minst två tester för din merge sort. Testerna ska testa **olika** saker.



### Krav 5: Baser utskrift för menyval 2 på word frequency (valfritt) {#k5}

I detta kravet ska du använda filerna `frequency.txt` och `tiny_frequency.txt` för ordlistan. De filerna innehåller rättstavade engelska ord och hur vanliga de är. Varje rad innehåller ett ord och hur vanligt ordet är (ett float tal), separat med space. Ju högre siffra desto vanligare är ordet.

- Bygg ut din Node klass med ett attribut för frequency.
- I din metod för att lägga till ord, när du markera en slut nod behöver du också lägga in frekvensen för ordet som noden marker.
- Din metod för prefix-sökning, ska returnera max 10 ord, sortera på frekvens i sjunkande ordning.
    - Om det finns 20 ord med ett prefix ska de 10 ord som har högst frekvens returneras, sorterat med högst värde först.
- I koden ni lämnar in ska filen `frequency.txt` läsas in vid start.



### Krav 6: Grafiskt gränssnitt på webben (valfritt) {#k6}

Gör ett grafiskt gränssnitt för att kolla om ett ord är rättstavat. Skapa en webbsida med Flask som innehåller två undersidor, en sida för att kolla om ett ord finns i ordlistan och en sida som skriver ut alla orden som finns i ordlistan.
<!--
För framtiden? Undersida för att byta fil och menyval 2?
-->

Koden som finns i app.py, som har med Flask att göra, behöver inte vara i en klass.



Vad är en Trie {#what-trie}
--------------------------------------------------------------------

Här kan ni hitta lite mer material om vad Trie är och hur den ska fungera.

- [Artikel](https://medium.com/underrated-data-structures-and-algorithms/trie-data-structure-fd9a2aa6fcb8).

- [Video](https://www.youtube.com/watch?v=TRg9DQFu0kU).

- [Visualisering av funktionaliteten](https://www.cs.usfca.edu/~galles/visualization/Trie.html). Som Visualgo fast en annan sida då Visualgo inte har Trie.



Redovisning {#redovisning}
--------------------------------------------------------------------

1. På inlämningen på Canvas, skriv följande:

    1. För varje krav du implementerat, dvs 1-6, skriver du ett textstycke om ca 5-10 meningar där du beskriver vad du gjort och hur du tänkt. Poängsättningen tar sin start i din text så se till att skriva väl för att undvika poängavdrag. Missar du att skriva/dokumentera din lösning så blir det 0 poäng. Du kan inte komplettera en inlämning för att få högre betyg.

    2. Skriv ett allmänt stycke om hur projektet gick att genomföra. Problem/lösningar/strul/enkelt/svårt/snabbt/lång tid, etc. Var projektet lätt eller svårt? Tog det lång tid? Vad var svårt och vad gick lätt? Var det ett bra och rimligt projekt för denna kursen?

    3. Avsluta med ett sista stycke med dina tankar om kursen och vad du anser om materialet och handledningen (ca 5-10 meningar). Ge feedback till lärarna och förslå eventuella förbättringsförslag till kommande kurstillfällen. Är du nöjd/missnöjd? På en skala 1-10, vilket betyg ger du kursen?

1. Kompletterar redovisningstexten med att spela in en kort video där de visar kod och berättar om de tekniska implementationerna de gjorde i projektet. Ladda upp videon i din inlämning på Canvas. Visa ditt ansikte och en giltig ID handling, t.ex. körkot eller pass, i videon. **OBS** Ladda inte upp er video på Youtube, studenter har fått sina kanaler blockerade på youtube för att de laddade upp video som visar ID.


<!-- 1. <u><b>Distansprogram- och Kurspaket studenter</b></u> kompletterar redovisningstexten med att spela in en kort video där de visar kod och berättar om de tekniska implementationerna de gjorde i projektet. Lägg till en länk till videon i redovisningstexten på inlämningen på Canvas. -->

```bash
# Ställ dig i kurskatalogen
dbwebb publish me
```
