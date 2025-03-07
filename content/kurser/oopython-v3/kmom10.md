---
author: aar
revision:
    "2025-03-07": (G, aar) Förtydligade klassdiagrammet och krav 6. La till krav om comprehensions ger poängavdrag.
    "2023-03-01": (F, aar) Bytte från terminal program till Flask och nya extrauppgifter.
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

* Projektet och redovisning (20-60h)

Totalt omfattar kursmomentet (08/10) ca 20+20+20 studietimmar.
[WARNING]
Projektet ska utföras individuellt!

Ni som har jobbat i grupp ska inte göra det med projektet. Ni behöver **inte** lämna er grupp på Canvas.
[/WARNING]


Projektidé och upplägg {#upplagg}
--------------------------------------------------------------------

Du ska utveckla ett rättstavningswebbsida som använder en [Trie](https://www.youtube.com/watch?v=-urNrIAQnNo) för att lagra en ordlista.

Börja med att kopiera filer med rättstavade engelska ord från exempel mappen.
```bash
# Stå i kursrepo mappen
cp example/dictionary/*.txt me/kmom10/spellchecker
cd me/kmom10/SpellChecker
```

Du kopierade fyra filer, alla innehåller ett ord per rad. `dictionary.txt` innehåller 25402 rättstavade ord och `tiny_dictionary.txt` innehåller 177. `dictionary.txt` kan ta lång tid att ladda och jobba med så när ni börjar med uppgiften använd `tiny_dictionary.txt` eller skapa en egen ännu mindre fil. Frequency filerna är för krav 4.

Innan du börjar med programmeringen ska du göra en analys av programmet du ska bygga och dokumentera det med klassdiagram.

Fråga i discord om du känner dig osäker.

[YOUTUBE src=aySsHujadSk width=700 caption="Andreas visar hur SpellChecker kan se ut när det är klart."]




Bedömning och betygsättning {#bedomning}
--------------------------------------------------------------------

När du lämnat in projektet bedöms det tillsammans med dina tidigare redovisade kursmoment och du får ett slutbetyg på kursen. Läs om [grunderna för bedömning och betygsättning](kurser/bedomning-och-betygsattning).



Projektspecifikation {#projspec}
--------------------------------------------------------------------

Utveckla och leverera programmet enligt följande specifikation. Saknas info i specen kan du själv välja väg, dokumentera dina val i redovisningstexten.

De tre första kraven är obligatoriska och måste lösas för att få godkänt på uppgiften. De tre sista kraven är valfria krav. Lös de valfria kraven för att samla poäng och därmed nå högre betyg.

Varje krav ger max 10 poäng, totalt är det 60 poäng.

[INFO]
Ni får inte använda lambda-funktioner i era lösning.
[/INFO]



### Krav 1: Grunden {#k1}

Skriv din kod i katalogen `me/kmom10/spellchecker`.

Filen som startar programmet ska heta `app.py`.

**Varje list/dict comprehension eller generator uttryck som saknar kommentar med vanlig for-loop ger 1 poäng avdrag!**

#### Trie {#trie}

Implementera en Trie datastruktur, i filen `src/trie.py`, som använder Node objekt, `src/node.py`. Varje Node objekt behöver innehålla vilken bokstav noden representerar, en dictionary eller lista som ska hålla barn noderna och en boolean för att markera om det är en slut nod. Er Trie får **inte** innehålla en lista eller dict som innehåller hela orden som har lagts till. Orden ska byggas upp av strukturen i trädet.  

I er Trie måste det finnas metoder för att:

- lägga till ett nytt ord. Metoden ska heta `add_word(word)` och ta ett argument som är ordet som ska läggas till.
- kolla om ett ord finns, om ordet inte finns ska ett `SearchMiss` error lyftas. Du behöver skapa det felet själv.
- ta bort ett ord, om ordet inte finns ska ett `SearchMiss` error lyftas.
    - Det räcker inte med att bara avmarkera noder när du tar bort ett ord. Om noderna i ordet inte används till ett annat ord ska du ta bort dem från datastrukturen.
- returnera antalet ord som finns
- returnera alla ord som finns
- returnera alla ord baserat på ett prefix, prefixsökning. Metoden ska heta `prefix_search(prefix)` och ska ta emot ett argument som är en sträng.
    - T.ex. om argumentet är `"he"` ska metoden returnera en listan `["hej", "hel", "hett"]`, alla ord som börjar på prefixet.
    - Om det inte finns några ord med prefixet ska en tom lista returneras.
    - Ni får **inte** lägga till alla ord i en lista och sen leta igenom listan. Ni **ska** iterera över noderna och jobba mot dem. 
- klassmetoden `create_from_file()`, den ska returnera ett Trie objekt som innehåller alla orden från filen som ni ska läsa in vid start (`dictionary.txt` eller `frequency.txt`).
- det ska gå att skapa ett tomt Trie objekt med `Trie()`.

Alla lösningar ska vara case-insensitive (skiftläge okänsliga), `A == a`.

Det finns bara tester för prefixsökning och krav 4-6. Tanken är att projektet ska vara mer "öppet", då vill vi inte styra upp allt och då kan ni skriva egna tester för att säkerställa att era metoder funkar som ni förväntar er. Ni får skapa fler metoder än de som är beskrivna ovanför.



#### Flask {#flask}

Skapa en webbsida för att använda Trie datastrukturen och kolla rättstavade ord. Du behöver återskapa Trie objektet från filen i varje route.

På sidan ska det finnas val i navbaren till följande sidor:

1. Ta ett ord som input och kolla om det finns i ordlistan (Trie objektet). Meddela användaren på sida om det fanns eller inte.

1. En prefix sökning (auto-complete), användaren skriver in början av ett ord. Då ska sidan visa upp alla ord som har inputen som prefix.
    - i formulärets input fält, efter att man börjat söka då ska föregående sökning vara för i fyll i formuläret. T.ex. När man går till sidan är fältet tomt, sen söker vi på "hel". Sidan laddas om och alla orden med "hel" som prefix visas och "hel" är för i fyllt i fältet. Då kan man lägga till "o" och sökningen blir "helo" osv.

1. Skriv ut alla ord som finns i ordlistan, i bokstavsordning. Överst på sidan ska det också stå antalet ord som finns.

1. Ta bort ett ord, programmet ska be användaren om ett ord som input och ta bort bort det ordet från Trie objektet. Spara borttagna ord i session. Varje gång du återskapar Trie objektet, ta bort orden som finns i session.

1. Byta ut ordlistan, skriv ut vilka filer som är tillgängliga och ha ett input element där användaren kan välja fil. Programmet ska då skapa ett nytt Trie objekt med orden från den nya filen fram till att användaren byter fil igen eller går in på sidan för att tömma session.
    - Töm också session på borttagna ord.

1. Tömma session, vilket gör att nästa gång ett Trie objekt ska skapas så används original filen. Rensa också listan med borttagna ord.

I koden ni lämnar in ska filen `dictionary.txt` läsas in vid start.

Webbsidan ska fungera på studentservern!



### Krav 2: UML {#k2}

#### Klassdiagram {#klass}

**Innan du börjar programmera** ska du analyser och planera vad du ska koda. Dokumentera med klassdiagram vilka klasser, attribut, metoder och relationer som du tror att du kommer skapa när du utvecklar programmet.

Klassdiagrammet ska lämnas in före du börjar koda projektet. Det finns en separat inlämning på Canvas för klassdiagrammet. **Du behöver inte vänta på att få godkänt innan du fortsätter med att programmera, det viktiga är att du har lämnat in det före.**

Gör ett komplett klassdiagram, lämna in det och sen börjar du koda projektet.

Det gör inget om koden skiljer sig från diagrammen när du är klar med projektet. Det blir inte alltid som man tänker sig. **Men** det ska vara ett komplett klassdiagram med relationspilar, kardinalitet och lämpliga statiska/privata/publika/instansa attribut och metoder.

När du har kodat klart projektet, jämför hur din kod faktiskt blev med hur du tänkte dig att det skulle fungera. I redovisningstexten skriver du hur din kod förhåller sig till diagrammet.

Spara som `classdiagrams.png`. Ladda upp filen på Canvas inlämningsuppgiften.


### Krav 3: Testning {#k3}

Skriv enhetstester för dina klasser. Spara testerna i filen `tests/test_trie.py`.

Minst 7 tester för Trie klassen. Testa inte bara positiva utfall, göra så att något går fel och testa hur det hanteras. Ni behöver också testa att `SearchMiss` exception:et lyfts.



Se till att din kod validerar. Det finns bara tester för prefixsökning och krav 4-6.

```bash
# Ställ dig i kurskatalogen
dbwebb test kmom10 # --extra för att testa krav 4-6
dbwebb publish kmom10
```

### Krav 4: Baser utskrift för prefixsökning på word frequency (valfritt) {#k4}

I detta kravet ska du använda filerna `frequency.txt` och `tiny_frequency.txt` för ordlistan. De filerna innehåller rättstavade engelska ord och hur vanliga de är. Varje rad innehåller ett ord och hur vanligt ordet är (ett float tal), separat med space. Ju högre siffra desto vanligare är ordet.

Om ni gör detta kravet ska ni **inte** längre använda `dictionary.txt` och `tiny_dictionary.txt`.

- Bygg ut din Node klass med ett attribut för frequency.
- I din metod för att lägga till ord, när du markera en slut nod behöver du också lägga in frekvensen för ordet som noden marker.
- Din metod för prefixsökning, ska returnera max 10 ord, sortera på frekvens i sjunkande ordning.
    - Om det finns 20 ord med ett prefix ska de 10 ord som har högst frekvens returneras, sorterat med högst värde först.
    - Metoden ska returnera en lista med tupler, en tuple ska innehålla ordet på index 0 och frekvensen på index 1. T.ex. `[('alone', 272173.0), ('along', 251163.0), ('aloud', 32565.4), ('alongside', 10349.6), ('aloft', 10098.0)]`.
- I koden ni lämnar in ska filen `frequency.txt` läsas in vid start.
- Uppdatera metoden `add_word(word)` så att man också kan skicka in frekvens som argument. Ge frekvens parametern default argumentet `1`, `add_word(word, frequency=1)`.
- Detta kravet ska inte påverka krav 5 och krav 6, med andra ord de ska inte sorterat på frekvens.


### Krav 5: Ge förslag på felstavade ord (valfritt) {#k5}

Lägg till metoden `correct_spelling(word)` i Trie klassen som tar emot ett ord som argument. Metoden ska hitta ord som är stavade likadant där **en** bokstav i följd kan vara fel. T.ex. om argumentet är `"hkj"` ska metoden returnera listan `["hej", "hoj", "haj"]`. Argumentet har en bokstav som är fel. Metoden ska också klara av ord där det finns fler felstavade bokstäver men det finns minst en korrekt bokstäverna mellan de felstavade. T.ex. om argumentet är `"kplqo"` ska metoden returnera listan `["kollo"]`. Det finns två felstavade bokstäver men det är bara en bokstav åt gången.

Metoden ska hitta alla ord som är lika långa som argumentet där enstaka bokstäver är fel. Det kan finnas flera bokstäver som är fel men det ska finnas minst en korrekt bokstav mellan dem. Den ska inte klara av att hitta ord där sista bokstaven är felaktig. T.ex. `"kollq"` matchar inte `"kollo"`. Om det inte finns några förslag ska en tom lista returneras. Om ordet är rättstavat ska en lista med enbart det ordet returneras. Listan som returneras ska vara **sorterad** i bokstavsordning.

Exempel, en Trie med orden `beat, heat, beet, belt, debt, boot`, och sökordet `beot` ska returnera listan `['beat', 'beet', 'belt', 'boot', 'debt', 'heat']`.

Ni får **inte** plocka ut alla ord i en lista och sen leta igenom den listan efter rättstavning. Ni **ska** skriva en rekursiv metod som letar igenom er nuvarande trädstruktur och jobbar mot noderna för att kolla att kraven uppfylls. Utskriften ska **inte** begränsas till max 10.

Lägg till en sida där användaren kan få hjälp med rättstavning. Visa alla ord som hittas baserat på användarens input.



### Krav 6: Suffixsökning (valfritt) {#k6}

Lägg till metoden `suffix_search(suffix)` i Trie klassen som tar emot en sträng som ska vara ett suffix. Metoden ska returnera en lista med alla ord som har argumentet som suffix. Om det inte finns några förslag ska en tom lista returneras. Listan som returneras ska vara **sorterad** i bokstavsordning.

T.ex. med argumentet `"ppa"` ska listan `["loppa","möhippa", "soppa"]` returneras.

För full poäng på kravet ska ni implementera en [post order traversal](https://www.geeksforgeeks.org/postorder-traversal-of-binary-tree/) rekursiv metod som jobbar mot noderna för att kolla om suffixet är uppfyllt.

Lägg till en sida där alla ord visas baserat på användarens input. Visa alla ord som hittas baserat på användarens input. Utskriften ska **inte** begränsas till max 10.

Exempel på lösningar som ger 0 poäng:

- Ni bygger ett nytt träd där ni lägger till alla ord i bakvänd ordning.
- Ni plockar ut alla ord i en lista/sträng och sen leta igenom den listan/strängen efter suffixet. T.ex. om man bygger upp en sträng och använder `.endswith()` på strängen för att kolla om suffixet är uppnått.
- Ni använder parent attribute för att jobba er upp i trädet och kollar om parent noderna blir suffixet.



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

1. Kompletterar redovisningstexten med att spela in en kort video där de visar kod och berättar om de tekniska implementationerna de gjorde i projektet. Ladda upp videon som en media kommentar din inlämning på Canvas. Visa ditt ansikte och en giltig ID handling, t.ex. körkot eller pass, i videon. **OBS** Ladda inte upp er video på Youtube, studenter har fått sina kanaler blockerade på youtube för att de laddade upp video som visar ID.


<!-- 1. <u><b>Distansprogram- och Kurspaket studenter</b></u> kompletterar redovisningstexten med att spela in en kort video där de visar kod och berättar om de tekniska implementationerna de gjorde i projektet. Lägg till en länk till videon i redovisningstexten på inlämningen på Canvas. -->

```bash
# Ställ dig i kurskatalogen
dbwebb publish me
```
