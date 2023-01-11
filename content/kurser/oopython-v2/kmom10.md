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

Upplägget är enligt följande:

* Projektet och redovisning (20-80h)

Totalt omfattar kursmomentet (07/10) ca 20+20+20+20 studietimmar.



Projektidé och upplägg {#upplagg}
--------------------------------------------------------------------

Du ska utveckla ett rättstavningsprogram till terminalen som använder en [Trie](https://www.youtube.com/watch?v=-urNrIAQnNo) för att lagra en ordlista.

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

De tre första kraven är obligatoriska och måste lösas för att få godkänt på uppgiften. De tre sista kraven är optionella krav. Lös de optionella kraven för att samla poäng och därmed nå högre betyg.

Varje krav ger max 10 poäng, totalt är det 60 poäng.



###Krav 1: Grunden {#k1}

Skriv din kod i katalogen `me/kmom10/spellchecker`. Filen som startar programmet skall heta `spellchecker.py` och ska innehålla klassen SpellChecker.

Implementera en Trie datastruktur, i filen `src/trie.py`, som använder Node objekt, `src/node.py`. Varje Node objekt behöver innehålla vilken bokstav noden representerar, en dictionary eller lista som ska hålla barn noderna och en boolean för att markera om det är en slut nod. Om du gör krav **fyra** måste du använda dictionary, annars kan du välja själv mellan dictionary och lista. Er Trie får **inte** innehålla en lista eller dict som innehåller hela orden som har lagts till. Orden ska byggas upp av strukturen i trädet.  
I er Trie ska det gå att lägga till nya ord, kolla om ett ord finns i datastrukturen och få ut alla ord baserat på ett prefix.

När man exekverar spellchecker.py ska ett SpellChecker objekt skapas som läser in en fil med rättstavade engelska ord. Starta sen ett klassiskt while-loop terminal program (Marvin meny, Handler exemplet är OK att använda). Följande menyval ska finnas:

1. Ta ett ord som input och kolla om det finns i ordlistan (Trie objektet). Om ordet inte finns lyft felet `SearchMiss`, ni behöver också skapa det Exception själva. Skapa felet i filen `src/exceptions.py`. Det ska inte krascha programmet! Fånga felet i meny koden.

1. En prefix sökning (auto-complete), användaren skriver in de tre första bokstäverna av ett ord. Programmet ska då skriva ut ord från ordlistan som har de bokstäverna som prefix, användaren ska kunna fortsätta att skriva in en bokstav åt gången och få ut orden som finns baserat på det prefixet. För att avsluta sökningen kan användaren skriva in `quit` som ett ord. Du kan begränsa utskriften av ord till max 10 åt gången, skriv ut ett ord per rad. Se video ovan för exempel.

1. Byta ut ordlistan, användaren ska skriva in ett filnamn. Programmet ska då skapa ett nytt Trie objekt och läsa in orden från den nya filen.

1. Skriv ut alla ord som finns i ordlistan, i bokstavsordning. Skriv ut ett ord per rad. Ett tips, för att göra denna metoden testbar kan ni skapa en som letar upp alla orden, lägger dem i en lista och returnerar listan. Sen låter ni en annan metod skriva ut orden.

1. Ta bort ett ord, programmet ska be användaren om ett ord som input och ta bort bort det ordet från Trien. Om ordet inte finns ska `SearchMiss` lyftas som error och skriv ut `"word is missing"`. Det ska inte krascha programmet! Det räcker inte med att bara avmarkera noder när du tar bort ett ord. Om noderna i ordet inte används till ett annat ord ska du ta bort dem från datastrukturen.

1. Exit

I SpellChecker klassen, lägg inte all kod i while-loopen, dela upp koden i metoder. T.ex. en metod/menyval åtminstone.

I koden ni lämnar in ska filen `dictionary.txt` läsas in vid start.


###Krav 2: UML {#k2}

#### Klassdiagram {#klass}

**Innan du börjar programmera** ska du analyser och planera vad du ska koda. Dokumentera  med klassdiagram vilka klasser, attribut, metoder och relationer som du tror att du kommer skapa när du utvecklar programmet.

Klassdiagrammet ska lämnas in före du börjar koda projektet. Det finns en separat inlämning på Canvas för klassdiagrammet. **Du behöver inte vänta på att få godkänt innan du fortsätter med att programmera, det viktiga är att du har lämnat in det före.**

Så gör ett klassdiagram, lämna in det och sen börjar du koda projektet.

Det gör inget om koden skiljer sig från diagrammen när du är klar med projektet. Det blir inte alltid som man tänker sig.

När du har kodat klart projektet, jämför hur din kod faktiskt blev med hur du tänkte dig att det skulle fungera. I redovisningstexten skriver du hur din kod förhåller sig till diagrammet.

Spara som `classdiagrams.png`. Ladda upp filen på Canvas inlämningsuppgiften.



#### Sekvensdiagram {#sekvens}

När du är färdigt med din kod, gör ett sekvensdiagram. Välj ett av menyvalen 1, 2 eller 5 att göra diagrammet för. Start punkten på digrammet ska vara en input från användaren till SpellChecker klassen.

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



### Krav 4: Sortera utskriften (optionell) {#k4}

För menyval 4 sortera alla orden innan de skrivs ut. Implementera en [Merge Sort](kunskap/sorteringsalgoritmer-v2#merge-sort) algoritm som metod i SpellChecker klassen. Hämta ut alla ord från Trie objektet, lägg dem i en lista, sortera listan med Merge sort och skriv ut listan.
<!-- (https://www.tutorialspoint.com/data_structures_algorithms/merge_sort_algorithm.htm)-->
Om du gör detta kravet ska du använda en dictionary för att hålla barn noderna i Node klassen. Lägg till tester för din merge sort.



### Krav 5: Baser utskrift för menyval 2 på word frequency (optionell) {#k5}

I detta kravet ska du använda filerna `frequency.txt` och `tiny_frequency.txt` för ordlistan. De filerna innehåller rättstavade engelska ord och hur vanliga de är. Varje rad innehåller ett ord och hur vanligt ordet är (ett float tal), separat med space. Ju högre siffra desto vanligare är ordet. Bygg ut din Node klass med ett attribut för frequency. I din metod för att lägga till ord, när du markera en slut nod behöver du också lägga in frekvensen för ordet som noden marker.

Nu för menyval 2, när programmet skriver ut 10 ord som finns baserat på prefixet ska programmet sortera alla orden baserat på frekvens och begränsa utskriften till att max skriva ut de 10 med högst frekvens.

I koden ni lämnar in ska filen `frequency.txt` läsas in vid start.



### Krav 6: Grafiskt gränssnitt på webben (optionell) {#k6}

Gör ett grafiskt gränssnitt för att kolla om ett ord är rättstavat. Skapa en webbsida med Flask som innehåller två undersidor, en sida för att kolla om ett ord finns i ordlistan och en sida som skriver ut alla orden som finns i ordlistan.
<!--
För framtiden? Undersida för att byta fil och menyval 2?
-->
Webbsidan ska även fungera på studentservern!

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
