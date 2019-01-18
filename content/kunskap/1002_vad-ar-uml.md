---
author: aar
revision:
    "2017-12-12": (C, aar) Uppdaterad inför v2.
    "2017-01-16": (B, aar) La till association.
    "2016-04-19": (A, aar) Första versionen.
category:
    - oopython
...
Vad är UML?
===================================

[FIGURE src=/image/oopython/kmom02/uml_diagrams.png?w=c5 class="right"]

UML står för Unified Modeling Language, det är ett visuellt modelleringsspråk för att specificera, konstruera och dokumentera artefakter i ett system.  
Det brukar användas på tre sätt:

1. Som en sketch: Informell och ofta inte fullständig, hand sketch eller på whiteboard. Används för att utforska problem.
2. Som en ritning: Används för: 
    * reverse engineering, för att förstå existerande kod. 
    * För att se hur ny kod ska genereras.
3. Som ett programmeringsspråk: Det finns färdiga verktyg som genererar kod baserat på UML.

Vi kommer gå igenom två diagram typer, Klass diagram och Sekvens diagram.

<!--more-->



Förutsättning {#pre}
-------------------------------

Du kan grunderna i objektorienterad programmering, arv, komposition och aggregation.  
Du hittar exempel kod för de olika UML diagrammen i [example/uml/klass_diagram](https://github.com/dbwebb-se/oopython/tree/master/example/uml)



Terminologi {#terminologi}
-------------------------------

* **UML**: Unified modeling language.

* **Struktur diagram**: Structure diagram på engelska. Statisk representation av strukturen i ett system.

* **Beteende diagram**: Behaviour diagram på engelska. Dynamisk bild av systemet som visar vad som händer i systemet.

* **Reverse engineering**: att ta fram detaljerade ritningar och specifikationer på hur en produkt fungerar.

##Struktur diagram {#struktur_diagram}


Struktur diagram representerar strukturen, de statiska aspekterna, i ett system och visar upp artefakter som måste existera i systemet och hur de relaterar till varandra.
De statiska delarna representeras av klasser, gränssnitt, komponenter och noder. Det är ett sätt att dokumentera arkitekturen. Med arkitektur menar vi hur koden är uppbygd.  
Det vanligaste struktur diagrammet är _Klass diagram_.


###Klass diagram {#klass}


Klass diagram representerar den objektorienterade vyn av ett system. Det visar upp systemets klasser, deras attributer, metoder och relationen mellan klasserna.

Nedanför visas hur ett Klass diagram kan se ut för följande kod.
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

En klass i ett klass diagram representeras med en ruta som är indelad i tre fack:

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

Klasser har relationer, t.ex. arv, komposition och aggregation, detta ska visas i diagrammet. För att visa relationer används olika sorters pilar mellan klasserna. Tillsammans med de pilarna använder man positiva tal och
asterisks(**\***, betyder oändligt), för att visa antalet instanser av varje klass som kan vara sammankopplade. Antalet visas som en intervall [minimum..maximum].



#####Association {#association}

[FIGURE src=/image/oopython/kmom02/FlightPlaneAssociation.png caption="Klasserna Flight och Plane."]

Vi har två klasser, `Flight` och `Plane`, som använder varandra. Vi ser att i klassen **Flight** finns variabeln `assigned_plane` som är av typen **Plane** och i klassen **Plane** finns variabeln `assigned_flights` som är av typen List, listan innehåller Flight objekt. För att tydliggöra beroende som finns mellan de två klasserna kan vi lägga till en **associations** pil.

[FIGURE src=/image/oopython/kmom02/FlightPlaneAssociationModded.png caption="Association mellan Flight och Plane."]
 
Det vi ser nu är en **bi-directional association**. Vi har två klasser som är medvetna om varandra, Flight använder Plane och Plane använder Flight. Ett Flight objekt är associerad med ett specifikt Plane objekt, och ett Plane objekt kan vara associerad med flera Flight objekt. Vi har dessutom flyttat ut attributnamnen och lagt dem på pilen. Flight använder Plane i variabeln `assigned_plane` och den variabel kan innehålla noll eller ett Plane (ett plan har kanske inte blivit tilldelat än). Vi kan se att Plane klassen använder Flight klassen i attributet `assigned_flights` och den variabeln kan innehålla noll (nytt plan som inte har blivit tilldelad några flygningar än) till oändligt många.

[FIGURE src=/image/oopython/kmom02/uniDirectional.png caption="Association mellan BannedAccounts och Account."]

På bilden ovanför kan vi se en till association, mellan `BannedAccounts` och `Account`. Nu har vi en **Uni-directional association**, alltså en association där bara en av klasserna är medveten om kopplingen som finns. I detta fallet är det **BannedAccounts** som använder **Account** i variabeln `accounts` och den kan innehålla en till oändligt många.



#####Aggregation {#aggregation}

[FIGURE src=/image/oopython/kmom02/carWheel.png caption="Aggregation mellan Car och Wheel."]

Bilden ovanför innehåller en **aggregations** relation mellan klassen Car och Wheel. En aggregations relation visas som en linje med en genomskinlig diamant i ena änden mellan två klasser. Diamanten sitter vid den _ägande_ klassen. Car _äger_ Wheel.
En Car kan ha noll till fyra Wheel. Ett Wheel tillhör en eller ingen Car. Båda kan existera utan varandra men Car förlorar mycket funktionalitet om den inte har Wheel.



#####Komposition {#komposition}

[FIGURE src=/image/oopython/kmom02/diagrams/book-chapter_diagram.png caption="Komposition mellan Book och Chapter."]

Ovanför kan vi se en **kompositions** relation mellan klassen Book och Chapter. En kompositions relation ser ut som en aggregations relation förutom att det är en svart ifylld diamant istället för en genomskinlig. Book _äger_ Chapter, en Book kan innehålla noll eller oändligt med Chapters. Ett Chapter kan bara vara kopplat till en Book.



#####Arv {#arv}

[FIGURE src=/image/oopython/kmom02/diagrams/arv_diagram.png caption="Arvs-hierarki med Species, Animal, dog och Human."]

Bilden ovan visar **arvs-relation** med en arvshierarki. Arv visas med en pil från subklassen till basklassen. Dog ärver av Animal som i sin tur ärver av Species som även Human äver av.

Ett exempel på arv och komposition:

[FIGURE src=/image/oopython/kmom02/diagrams/fullExample_class.png caption="Arv och komposition med Customer och Order"]

En Customer kan ha noll till oändligt många Orders. En Order kan bara tillhöra en Customer. Order är en basklass för specialOrder och NormalOrder.



#####Association vs Aggregation vs Komposition {#Association_vs_Aggregation_vs_Komposition}

[FIGURE src=/image/oopython/kmom02/assAggComp.jpg caption="Association vs Aggregation vs Komposition."]

När ska man använda vilket? Denna fråga uppstår lätt när man ska välja mellan association och aggregation.  
Aggregation är omtalat inom UML då det är väldigt vagt vad aggregation är jämfört med association.  
Association är den mest generella relation, den visar mängd och riktning mellan klasser.  
Aggregation visar ägande mellan två klasser där den ägda klassen har en egen livscykel och är inte beroende av den ägande. Distinktionen mellan association och aggregation görs på _ägande_ och vad innebär ägande?  
Komposition visar också ägande relationer men där klasserna måste existera tillsammans. En av klasserna äger den andra och den ägda slutar existera när den ägande gör det. Det får bara finnas ett ägande objekt. Vi tittar på ett exempel.

[FIGURE src=/image/oopython/kmom02/assAggCompEx.png caption="Association vs Aggregation vs Komposition exempel."]

Exemplet visar ett Universitet som har Departments som i sin tur har Professors som har Students. University äger Department, om University slutat existera gör även Department det och Department kan bara tillhöra ett University.
Department äger Professor, ett Department kan ha flera Professor och Professor kan tillhöra flera Department men där finns fortfarande ett slags ägande. En Professor jobbar på ett Department och Department förlorar stor del av sin funktionalitet om det inte finns några Professors. Båda kan dock existera utan varandra.  
Sist ser vi att Professor har flera Student och Student har flera Professor. Båda är medvetna och använder varandra men där är inget ägande i relationen, de bara använder varanda och därför är det assocation istället för aggregation.

När man ritar klassdiagram är det bra att börja med assocations pilar och sedan specificera dem till aggregation eller komposition när man ser att det behövs. 



##Beteende diagram {#beteende_diagram}


Beteende diagram visar det dynamiska beteendet ett system har och beskriver systemets funktionalitet.


###Sekvens diagram {#sekvens_diagram}


[FIGURE src=/image/oopython/kmom02/diagrams/restaurant.png caption="Simpelt sekvens diagram av en restaurang"]

Sekvens diagram visar hur olika processer kommunicerar med varandra inom en tidssekvens och i vilken ordning. Med process syftar man oftast på objekt som kommunicerar via metoder.
Det är viktigt med ordningen av kommunikationen mellan objekten och när det händer på tidslinjen.

Med sekvens diagram kan vi visa vilka klasser som finns/behövs i ett system och vilka metoder de använder för att kommunicera med varandra för att uppfylla ett scenario.  
Om vi tittar på bilden ovanför, sekvens diagrammet med restaurangen. Den visar vilka människor(klasser/objekt) som behövs och hur de kommunicerar för att en kund ska kunna äta mat hos dem.


####Lifeline {#lifeline}

[FIGURE src=/image/oopython/kmom02/diagrams/lifeLines.png caption="Actor lifeline och Objekt lifeline"]

Ovanför ser vi två stycken **lifelines** en som representerar en Actor och en som representerar ett anonymt objekt av klassen Object. En Actor är en användare till systemet, någon som startar ett händelseförlopp.  
Objekt lifelines består av en rektangel i toppen som innehåller klassens namn, med ":" framför, och en vertikal linje. Linjen representerar objektets livstid.  
För att specificera vilken instans av en klass som ska användas lägger man till instansens namn framför ":", t.ex. "Andreas:Person". Det visar att objektet Andreas, som är en instans av klassen Person, ska användas specifikt.


####Funktionsanrop {#funktionsanrop}

[FIGURE src=/image/oopython/kmom02/diagrams/syncCall.png caption="Ett funktionsanrop"]

Så här ser ett **funktionsanrop** ut. Den svarta ifyllda pilen motsvarar ett synkront funktionsanrop, t.ex. en klass X anropar klass Y's metod doA, som startat exekveringen av metoden doA hos klass Y.
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

Vi har en systemanvändare, Librarian, som lägger till en ny bok i bibliotekets system. Librarian gör något i GUI:et så att metoden register_book() anropas i klassen Library som i sin tur anropar BookRegister's metod register_book(). register_book() tar ett ISBN nummer som argument, lägger till boken i systemet och returnerar en boolean, om den lyckas eller inte.


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



Avslutningsvis {#avslutning}
------------------------------

Det finns bra verktyg online för att rita uml diagram, kolla in [draw.io](https://www.draw.io) och [websequencediagrams](https://www.websequencediagrams.com/).

För att läsa mer om klass diagram kolla här: [Class diagrams](http://www.uml-diagrams.org/class-diagrams-overview.html).

För att läsa mer om sekvens diagram och vad man mer kan göra med dem kolla här: [sequence diagrams](http://www.uml-diagrams.org/sequence-diagrams.html).
