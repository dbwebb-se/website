---
author: mos
revision:
    "2018-03-27": "(A, mos) Första versionen, uppdelad av större dokument och uppdaterad."
...
Refactoring av klasser
==================================

Vi jobbar vidare med vår grafiska representation av tärningen och samtidigt pratar vi begreppet _refactoring_ tillsammans med termer som protected jämfört med private.

Du fortsätter att jobba i samma filer som i föregående artikel.



Refactoring av Dice {#refactoring}
---------------------------------

Låt oss säga att refactoring är en variant av att "gör om -- gör rätt". Det är inte helt riktigt, men det handlar i grunden om att strukturera om koden för att möta nya eller förändrade krav.

I UML-diagrammet kunde du se att klassen Dice hade fått nya medlemmar.

[FIGURE src=image/snapvt18/dice-graphic-uml.png caption="En uppdaterad Dice."]

Det handlar om att vi i klassen DiceGraphic vill ha möjligheten att skriva ut en grafisk representation av tärningen, men vi vill också ha möjligheten att lagra motsvarande siffra. Jag valde att implementera detta så att Dice minns sitt senaste tärningsslag via en medlemsvariabel `lastRoll` och att man kan hämta det via en metod `getLastRoll()`.

Jag är alltså inne i klassen Dice och vidarutvecklar den, men jag ändrar inte dess publika API, så alla exempelprogram som tidigare använder klassen Dice påverkas inte. Jag ändrar inte saker som gör klassen inkompatibel så att föregående användare måste skriva om sin kod.

Det är härför som vi vill ha tydliga publika API:er och kaplsa in saker i klassen som ger oss möjlighet att skriva om och förändra klassens implementation, utan att det publika API:et ändras och bakåtkompabilitet förstörs.

Att vara en duktig programmerare handlar bland annat om att se dessa möjligheter och tänka i förväg och skapa utrymme att skiva kod som inte förstör bakåtkompabilitet. Refaktoring, att skriva om befintlig kod, är en vardag för många programmerare.



Metod för grafisk representation {#graphic}
---------------------------------

Vilken grafisk representation av en tärning vill jag nu leverera via metoden  `DiceGraphic::graphic()`? Eftersom vi är i webbsammanhanget så väljer jag att leverera ett klassnamn som kan läggas till ett HTML-element och därefter stylas på godtyckligt sätt.

Min metod `DiceGraphic::graphic()` ser ut så här.

```php
/**
 * Get a graphic value of the last rolled dice.
 *
 * @return string as graphical representation of last rolled dice.
 */
public function graphic()
{
    return "dice-" . $this->getLastRoll();
}
```

Det klassnamn som levereras är alltså `dice-1` till `dice-6`. Vi skall snart se hur det i webbsammanhang kan överföras till en grafisk representation av tärningen.



Public, private och protected {#protected}
-------------------------------

Som du ser i metoden `DiceGraphic::graphic()` så anropar jag `$this->getLastRoll()` för att få senaste slagna tärningsvärdet. Trots att jag äver från Dice få väljer jag att använda det öppna API:et för att låta Dice kapsla in sin implementation.

Alternativet hade varit att ändra synligheten på `$lastRoll` från private till _protected_. Så här.

```php
/**
 * @var int $lastRoll  Value of the last roll.
 */
//private $lastRoll;
protected $lastRoll;
```

Skillnaden är att den ärvande klassen kan få tillgång till medlemsvariabler och metoder som har synlighet protected. Däremot syns inte de som har private.

När variabeln är protected så skulle min metod kunna uppdateras till följande.

```php
/**
 * Get a graphic value of the last rolled dice.
 *
 * @return string as graphical representation of last rolled dice.
 */
public function graphic()
{
    //return "dice-" . $this->getLastRoll();
    return "dice-" . $this->lastRoll;
}
```

Vilket sätt är bäst?

Låt det vara två sätt du kan välja mellan, ta det som du tycker funkar bäst. Fokusera på att lösa uppgiften så kan du därefter filosofera om olika varianter till lösning.

Synlighet med protected är alltså bara relevant för subklasser. I övrigt är protected samma sak som private för den som använder klassen utifrån.
