---
author: aar
revision:
    "2019-01-15": (A, aar) Första versionen, kopierad från "vad_ar_uml".
category:
    - oopython
...
Introduktion till UML?
===================================

[FIGURE src=/image/oopython/kmom02/uml_diagrams.png?w=c5 class="right"]

UML står för Unified Modeling Language, det är ett visuellt modelleringsspråk för att specificera, konstruera och dokumentera artefakter i ett system.  
Det brukar användas på tre sätt:

1. Som en sketch: Informell och ofta inte fullständig, hand sketch eller på whiteboard. Används för att utforska problem.
2. Som en ritning: Används för: 
    * reverse engineering, för att förstå existerande kod. 
    * För att se hur ny kod ska genereras.
3. Som ett programmeringsspråk: Det finns färdiga verktyg som genererar kod baserat på UML.

Vi kommer fokusera på Klassdiagram.

<!--more-->



Förutsättning {#pre}
-------------------------------

Du kan grunderna i objektorienterad programmering, arv, komposition och aggregation.  
<!-- Du hittar exempel kod för de olika UML diagrammen i [example/uml/klass_diagram](https://github.com/dbwebb-se/oopython/tree/master/example/uml) -->



Terminologi {#terminologi}
-------------------------------

* **UML**: Unified modeling language.

* **Struktur diagram**: Structure diagram på engelska. Statisk representation av strukturen i ett system.

* **Beteende diagram**: Behavior diagram på engelska. Dynamisk bild av systemet som visar vad som händer i systemet.

* **Reverse engineering**: att ta fram detaljerade ritningar och specifikationer på hur en produkt fungerar.

Struktur diagram {#struktur_diagram}
-------------------------------


Struktur diagram representerar strukturen, de statiska aspekterna, i ett system och visar upp artefakter som måste existera i systemet och hur de relaterar till varandra.
De statiska delarna representeras av klasser, gränssnitt, komponenter och noder. Det är ett sätt att dokumentera arkitekturen. Med arkitektur menar vi hur koden är uppbyggd.  
Det vanligaste struktur diagrammet är _Klassdiagram_.


###Klassdiagram {#klass}


Klassdiagram representerar den objektorienterade vyn av ett system. Det visar upp systemets klasser, deras attributer, metoder och relationen mellan klasserna. Det säge ingenting om funktionaliteten i klassen utan bara vilken struktur den ska ha. 

Nedanför visas hur ett Klassdiagram kan se ut för följande kod.
```python
class BankAccount:
    bank_name = "Andreas Bank"

    def __init__(self, owner, balance):
        self.owner = owner
        self._balance = balance

    def deposit(self, amount):
        pass

    def withdraw(self, amount):
        pass
```

En klass i ett klassdiagram representeras med en ruta som är indelad i tre fack:

* I den översta rutan står klassnamnet, centrerat med stor första bokstav.
* Mittenfacket innehåller klassens attribut.
* Nedersta facket innehåller klassens metoder.

[FIGURE src=/image/oopython/kmom02/diagrams/bankAccount.png caption="En klass som representerar ett bankkonto."]



Attribut måste åtminstone visas med namnet men det kan även stå vilken datatyp de har, som i bilden ovan. Bilden visar även om de är publika eller privata:

* **\+** Betyder publikt attribut.

* **\-** Betyder privat attribut.

* **<u>attributnamn</u>** Betyder att attributet är statiskt. Gäller även för understrukna metodnamn

För metoder måste man skriva med namnet, det är att föredra att även visa parametrar och returtyp som bilden ovan. Det funkar likadant för metoder och attribut med **+-** för privata/publika.



####Relationer {#relationer}

Klasser har relationer, t.ex. arv, komposition och aggregation, detta ska visas i diagrammet. För att visa relationer används olika sorters "pilar" mellan klasserna. Tillsammans med de pilarna kan vi även förtydliga antalet objekt av klasserna som är en del av relationen. T.ex. om vi har ett Car objekt använder det troligen fyra Tire objekt, det kan vi också specificera. Det gör vi med positiva tal och
asterisks(**\***, betyder oändligt), för att visa antalet instanser av varje klass som kan vara sammankopplade. Antalet visas som en intervall [minimum..maximum].

Innan vi går vidare, bekanta dig med koden som finns i [example/classes/flight](https://github.com/dbwebb-se/oopython/tree/master/example/classes/flight) så ska vi se hur ett klassdiagram för koden kan se ut.

Vi har tre klasser, `FlightController`, `Flight` och `Plane`, som har relationer till varandra. Vi ser att i klassen **Flight** finns variabeln `assigned_plane` som ska innehålla ett **Plane** objekt och **FlightController** finns det en lista som ska innehålla Flight objekt, `flights`, och en lista som ska innehålla Plane objekt, `planes`. Vi börjar med att titta på ett klassdiagram som inte visar vilka relationer som finns utan bara attribut och metoder.

[FIGURE src=/image/oopython/kmom02/diagrams/FlightPlaneAssociation.png caption="Klassdiagram utan relationer för FlightController, Flight och Plane."]
 
Försök matcha ihop bilden med koden, förstå att för varje attribut i koden finns det ett motsvarande på bilden och likadant för metoder. Se bilden som en ritning över klassen. PS, `List<Plane>` betyder att attributet är en List som ska innehålla Plane objekt.

Vi tittar på hur ett klassdiagram ser ut när vi lägger in relationerna som finns mellan klasserna.

[FIGURE src=/image/oopython/kmom02/diagrams/FlightPlaneAssociationModded.png caption="Klassdiagram med relationer för FlightController, Flight och Plane."]

På bilden har vi lagt till diamanter med sträck och siffror mellan klasserna för att visa mellan vilka klasser det är aggregation och komposition.



#####Aggregation {#aggregation}

[FIGURE src=/image/oopython/kmom02/diagrams/FlightPlaneAssociationAgg.png caption="Aggregation mellan Flight och Plane."]

Aggregation visas som en linje med en genomskinlig diamant i ena änden mellan två klasser. Diamanten sitter vid den _ägande_ klassen. Flight äger Plane och siffrorna visar att ett Flight objekt kan under sin livstid innehåll antingen noll eller ett Plane objekt. Noll när Flight objektet skapas och ett när ett Plane objekt tilldelats vid schmaläggning. Det är liknande på motsatta hållet, ett plane objekt kan under sin livstid "ägas/tillhöra" noll, när det har skapats, eller ett, när det har blivit schemalagt, Flight objekt. Ett och samma Plane objekt kan inte ligga som värde i attributet `assigned_plane` i flera Flight objekt samtidigt.

Det är en aggregations relation för att instans attributet `assigned_plane` i Flight ska innehålla ett Plane objekt men Plane objektet kan existera utan att vara tilldelad till ett Flight objekt.


#####Komposition {#komposition}

[FIGURE src=/image/oopython/kmom02/diagrams/FlightPlaneAssociationModded.png caption="Klassdiagram med relationer för FlightController, Flight och Plane."]

En kompositions relation ser ut som en aggregations relation förutom att det är en svart ifylld diamant istället för en genomskinlig. FlightController "äger" Plane och Flight. I programmet finns det inte något Plane eller Flight objekt utanför ett FlightController objekt, de ligger i listorna, och därför om vi raderar FlightController objektet raderas även Flight och Plane objekten, då är det kompositions förhållanden.  
För både Flight och Plane kan vi se att deras objekt bara alltid tillhör ett FlightController objekt, `1..1`, de skapas inom objektet och är kvar där tills programmet stängs av. FlightController kan innehålla noll till oändligt många Flight och Plane objekt, `o..*`. 



#####Arv {#arv}

[FIGURE src=/image/oopython/kmom02/diagrams/arv_diagram.png caption="Arvs-hierarki med Species, Animal, dog och Human."]

Bilden ovan visar pilen för **arvs-relation**. Arv visas med en pil från subklassen till basklassen. Dog ärver av Animal som i sin tur ärver av Species som även Human äver av. Rutorna ska egentligen innehålla attribut och metoder som i de andra diagrammen.

Ett exempel på arv och komposition:

[FIGURE src=/image/oopython/kmom02/diagrams/fullExample_class.png caption="Arv och komposition med Customer och Order"]

Nu har vi ett ordentligt diagram utan någon kod kopplade till det. För att träna, försök föreställ er hur koden för detta diagrammet ser ut. En Customer kan ha noll till oändligt många Orders. En Order kan bara tillhöra en Customer. Order är en basklass för specialOrder och NormalOrder.



#####Association vs Aggregation vs Komposition {#Association_vs_Aggregation_vs_Komposition}

[FIGURE src=/image/oopython/kmom02/assAggComp.jpg caption="Association vs Aggregation vs Komposition."]

Det finns en tredje relation som heter *Association* som är väldigt lik aggregation, men vi använder inte den.

När ska man använda vilket? Denna fråga uppstår lätt när man ska välja mellan association och aggregation.  
Aggregation är omtalat inom UML då det är väldigt vagt vad aggregation är jämfört med association.  
Association är den mest generella relation, den visar mängd och riktning mellan klasser.  
Aggregation visar ägande mellan två klasser där den ägda klassen har en egen livscykel och är inte beroende av den ägande. Distinktionen mellan association och aggregation görs på _ägande_ , och vad innebär ägande?  
Komposition visar också ägande relationer men där klasserna måste existera tillsammans. En av klasserna äger den andra och den ägda slutar existera när den ägande gör det. Det får bara finnas ett ägande objekt. Vi tittar på ett exempel.

[FIGURE src=/image/oopython/kmom02/assAggCompEx.png caption="Association vs Aggregation vs Komposition exempel."]

Exemplet visar ett Universitet som har Departments som i sin tur har Professors som har Students. University äger Department, om University slutat existera gör även Department det och Department kan bara tillhöra ett University.
Department äger Professor, ett Department kan ha flera Professor och Professor kan tillhöra flera Department men där finns fortfarande ett slags ägande. En Professor jobbar på ett Department och Department förlorar stor del av sin funktionalitet om det inte finns några Professors. Båda kan dock existera utan varandra.  
Sist ser vi att Professor har flera Student och Student har flera Professor. Båda är medvetna och använder varandra men där är inget ägande i relationen, de bara använder varandra och därför är det association istället för aggregation.

När man ritar klassdiagram för att planera kod är det bra att börja med associations pilar och sedan specificera dem till aggregation eller komposition när man ser att det behövs.



Att planera kod {#planera_kod}
-------------------------------

I exemplet ovanför utgick vi från kod och sen kollade på ett klassdiagram, diagrammet fungerade som dokumentation för vilken kod vi har. Men hur fungerar det om vi går från andra håller? Tänk er att ni jobbar på ett nytt projekt och ska utveckla en ny applikation, det finns en projekt ledare som sköter kontakten med kunden och vad applikationen ska innehålla och en arkitekt som bestämmer hur applikationen ska vara uppbyggd. Ni ska bara implementera vad vad de andra redan har bestämt, om ni då bara får ett eller flera klassdiagram som mall för applikationen är det nästan omöjligt för er att veta hur ni ska implementera de klasserna. Vad ska ske i metoderna som finns i klassdiagrammet? Ni har bara ett metodnamn att utgå från för att gissa vad ni ska skriva för kod där. Hur löser vi det?

Fler typer av diagram så klart!  
Klassdiagram är ett struktur diagram, visar vad som ska finnas, vad vi saknar är något som visar hur applikationen ska bete sig. För det har vi beteende diagram, mer specifikt sekvens diagram, visar interaktion och flöden mellan klasser. Vi kan se vilka metoder som anropar varandra och i vilken ordning. Ni behöver inte veta hur man skapar egna men försök förstå hur de fungerar och syftet.



Beteende diagram {#beteende_diagram}
-------------------------------

Beteende diagram visar det dynamiska beteendet ett system har och beskriver systemets funktionalitet.


###Sekvens diagram {#sekvens_diagram}


[FIGURE src=/image/oopython/kmom02/diagrams/restaurant.png caption="Simpelt sekvens diagram som visar flödet i en restaurang"]

Sekvens diagram visar hur olika processer kommunicerar med varandra inom en tidssekvens och i vilken ordning. Med process syftar man oftast på objekt som kommunicerar via metoder.
Det är viktigt med ordningen av kommunikationen mellan objekten och när det händer på tidslinjen.

Med sekvens diagram kan vi visa vilka klasser som finns/behövs i ett system och vilka metoder de använder för att kommunicera med varandra för att uppfylla ett scenario.

Om vi tittar på bilden ovanför, sekvens diagrammet med restaurangen. Den visar vilka människor(klasser/objekt) som behövs och hur de kommunicerar för att en kund ska kunna äta mat hos dem. I den gröna rutan kan vi se vilken person/klass varje linje syftar på som gör vad. Kunden Fred beställer mat av kyparen Bob som för vidare den till kocken Hank. När Hank är klar med maten förs den vidare till Bob som till slut ger maten till kunden. När Fred har ätit klart går han till kassören Renee och betalar. Sen är scenariot slut.


####Lifeline {#lifeline}

[FIGURE src=/image/oopython/kmom02/diagrams/lifeLines.png caption="Actor lifeline och Objekt lifeline"]

Ovanför ser vi två stycken **lifelines** en som representerar en Actor och en som representerar ett anonymt objekt av klassen Object. En Actor är en användare till systemet, någon som startar ett händelseförlopp.  
Objekt lifelines består av en rektangel i toppen som innehåller klassens namn, med ":" framför, och en vertikal linje. Linjen representerar objektets livstid.  
För att specificera vilken instans av en klass som ska användas lägger man till instansens namn framför ":", t.ex. "Andreas:Person". Det visar att Person objektet med namnet Andreas ska användas specifikt.



####Funktionsanrop {#funktionsanrop}

[FIGURE src=/image/oopython/kmom02/diagrams/syncCall.png caption="Ett funktionsanrop"]

Så här ser ett **funktionsanrop** ut. Den svarta ifyllda pilen motsvarar ett synkront funktionsanrop, t.ex. ett objekt av klass X anropar klass Y's metod doA.
Tiden det tar för Y att exekvera doA representeras av den vertikala stången. När doA är klar returnerar den ett resultat tillbaka till X, det representeras med den streckade pilen.


Nedanför visas kod, för att registrera en bok på ett bibliotek, och sen hur det ser ut som ett sekvens diagram.

```python
class Library:
    def __init__(self):
        self.book_register = BookRegister()

    def register_book(self, isbn):
        self.book_register.register_book(isbn)

class BookRegister:
    def __init__(self):
        self.books = []

    def register_book(self, isbn):
        return self.books.append(isbn)
```

[FIGURE src=/image/oopython/kmom02/diagrams/bookRegisterSeq.png caption="Sekvens diagram av bok registrering"]

Vi har en systemanvändare, Librarian, som lägger till en ny bok i bibliotekets system. Librarian gör något i GUI:et så att metoden register_book() anropas i klassen Library som i sin tur anropar BookRegister's metod register_book(). register_book() tar ett ISBN nummer som argument, lägger till boken i systemet och returnerar en boolean, om den lyckas eller inte. Vi behöver inte visa upp anrop till funktioner som inte vi skapat, t.ex. `.append()` på en lista.


####Loop {#loop}


[FIGURE src=/image/oopython/kmom02/diagrams/loopImg.png caption="Sekvens diagram med loop"]

Diagrammet ovan visar händesleförloppet när en kassörska använder ett sälj-system för att behandla en ny kund.  
Actor:n **Cashier** gör något med systemet så att metoden start_new_sale() anropas i **System**. Där i skapar ett nytt objekt av klassen **Sale** och tilldelas till attributet `curretn_sale`, vi kan se det överst i lifeline rutan för klassen, `current_sale:Sale`.  
Sen sker en **loop** för varje item (produkt) Cashier slår in i systemet. Varje item läggs till i current_sale och total summan för current_sale, upp till den tidpunkten, returneras till System och den returnerar vidare till Cashier (skriver ut på någon display). När loopen är klar anropar Cashier make_payment(amount). I make_payment anropas metoden end_sale() i System, ett självanrop, som i sin tur anropas set_paid() i Sale. make_payment() returnerar success, vi utgår ifrån att hela summan har betalats. I nästa del lägger vi till en if-sats som kollar om hela summan inte betalas.

Det som händer inuti **loop** rutan kommer upprepas X antal gånger. Om man vill specificera att det ska upprepas t.ex. 10 gånger ersätter man "loop" uppe i vänstra hörnet med "loop(10)".

####Alt {#alt}


[FIGURE src=/image/oopython/kmom02/diagrams/if_self_img_seq.png caption="Sekvens diagram med if-sats"]

Vi har lagt till en if-sats som kollar att kunden har tillräckligt med pengar för att köpa alla produkter. Översta delen av diagrammet är oförändrad. I make_payment() i System har vi lagt till en if-sats som kollar om `amount==totalSum`. Om det är sant sker händelserna som finns i den övre halvan av "alt"-rutan, annars sker det som finns i den nedre halvan. Om det var sant sker saker som i förra diagrammet och success returneras. Om det var falskt avbryts köpet med metoden cancel_sale() och fail returneras.

Om vi hade haft en if-elseif-else sats, t.ex. att amount är med än totalSum, hade vi bara lagt till en tredje ruta i "alt" mellan de två vi har. I den nya rutan visar vi flödet för det fallet och lägger till `[amount > totalSum]` överst för visa vilket villkor den gäller.

###Use case diagram {#use_case}

Use case diagram är en annan typ av beteende diagram och visar vilka användarna är som ska använda applikationen och vad de ska kunna göra i applikationen, t.ex. besökare på vår webbsida ska kunna söka efter en artikel. Läs lite om vad [Use case diagram](https://www.lucidchart.com/pages/uml-use-case-diagram?a=1) är, ni behöver inte veta hur man skapa egna men som med sekvens diagram är det bra om ni vet vad det är och vad det har för syfte.



Avslutningsvis {#avslutning}
------------------------------

Det finns bra verktyg online för att rita uml diagram, kolla in [draw.io](https://www.draw.io) och [websequencediagrams](https://www.websequencediagrams.com/).

För att läsa mer om klassdiagram kolla här: [Class diagrams](http://www.uml-diagrams.org/class-diagrams-overview.html).

För att läsa mer om sekvens diagram och vad man mer kan göra med dem kolla här: [sequence diagrams](http://www.uml-diagrams.org/sequence-diagrams.html).
