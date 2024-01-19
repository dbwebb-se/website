---
author:
    - aar
    - grm
revision:
    "2024-01-17": (A, grm) Första upplagan.
category:
    - oopython
...
Yahtzee spelet del 2 - Flask
===================================

I denna uppgiften ska ni binda ihop Yahtzee spelet så att ni får ett fungerade Yahtzee för en spelare.

<!--more-->

[FIGURE src="/image/oopython/kmom03/yahtzee3.png" caption="Färdigt Yahtzee3"]

I denna uppgiften vi bygga gränssnittet för koden ni skrev i kmom03.



Förkunskaper {#forkunskaper}
-----------------------

Ni har gått igenom hela guiden "[Kom igång med objekt](guide/kom-igang-med-objektorienterad-programmering-i-python)".

Ni har jobbat igenom övningen "[Flask, POST och GET](kunskap/flask-get-post)".

Ni har jobbat igenom övningen "[Introduktion till sekvensdiagram](kunskap/intro_till_sekvensdiagram)" och "[Mer om enhetstester](kunskap/unittest-i-python_2)".
<!-- Ni har jobbat igenom övningen "[Introduktion till sekvensdiagram](kunskap/intro_till_sekvensdiagram)" och "[Mer om enhetstester](kunskap/unittest-i-python_2)". -->



Introduktion {#intro}
-----------------------

Spelet ska följa de internationella reglerna och inte svenska reglerna. Här kan ni hitta [reglerna](https://gamerules.com/rules/yahtzee-dice-game/).

Nytt i denna uppfiften är att lägga till checkboxar bredvid tärningarna för att på så sätt visa vilka som ska slås om. Vi vill också se en resultattavla med regler och poäng enligt bilden ovanför. Vi vill kunna välja regel, om du använder samma regel 2 gånger vill vi se ett felmeddelande. När du är klar, så vill vi se ett meddelande som säger att spelet är slut.

Era klasser ska uppfylla beskrivningarna nedanför. Beskrivningarna är vad som måste finnas, ni får och är **rekommenderade** att skapa ytterligare metoder och attribut där ni tycker att det behövs.

[YOUTUBE src="dO_o01YomTM" caption="Andreas visar hur en färdig lösning kan se ut i Flask."]



Krav {#krav}
-----------------------

### Krav för alla {#krav-alla}

1. Kopiera er kod från `me/kmom03/yahtzee2` till `me/kmom04/yahtzee3`.


1. Lägg till tester för följande saker:
    - Hand klassen:
        - `roll()` - Att anropa med en lista som argument och kolla att det slår om rätt tärningar.
        - `roll()` - Att anropa utan argument och kolla att den slår om alla tärningar.
        - `to_list()` - Att kolla att den returnerar en lista med tärningarnas värde.
    - Scoreboard klassen:
        - `add_points` - Lägg till poäng för en regel och kolla att blir rätt poäng.
        - `add_points` - Lägg till poäng för en regel som redan har poäng, kolla att exception lyfts.

1. Använd session för att spara er data för Scoreboard.

1. När spelaren har använt alla regler en gång ska ni skriva ut en text där det står att spelet är slut och hur många poäng spelaren fick.

1. Det ska gå att kasta om specifika tärningar. T.ex. kasta om tärning 1 och 3, då ska tärningarna 2, 4 och 5 inte kastas om.

1. Begränsa hur många gånger man kan slå om tärningarna innan man väljer en regel.
    - Man får max kasta om tärningarna **två** gånger, sen måste man välja en regel att få poäng för med nuvarande hand. Man kan få 0 som poäng med en Hand.

1. På webbsidan ska ni visa vilka regler som finns, hur många poäng nuvarande hand är värde för varje regel och om spelaren redan har använt regeln för att få poäng ska den poängen visas. Kolla på bilden för att se exempel på hur det kan se ut.

1. Om användaren väljer en regel som redan har använts för att få poäng ska ni skriva ut ett meddelande där det står att regeln redan är använd. Tärningarna ska inte slås om, utan användaren behöver välja en ny regel för samma Hand för att fortsätta spela.

1. Testa, validera och publicera applikationen på studentservern.







1. Lägg till radiobuttons för de olika reglerna i ett formulär med en submit-knapp. Bredvid en radiobutton för en viss regel ska namnet på regeln skrivas ut, t.ex. "Three of a kind". Här kan ni se hur man gör [radiobuttons i ett formulär](https://www.w3schools.com/tags/tryit.asp?filename=tryhtml5_input_type_radio).
    - Tips! Istället för att skicka med poängsumman som `value` i formuläret, skicka med regelnsnamn. Det innebär att ni måste räkna ut poängen igen på severn. Men det underlättar i nästa kursmoment.

1. Vid varje regel ska det också visas hur många poäng respektive regel är värd men nuvarande hand.

1. Varje gång användaren använder formuläret för att få poäng för en regel, spara den totala poängsumman i session och visa upp den på sidan.

1. Använd session för att spara värdet på föregående hand och visa upp det överst på webbsida, "Last die rolls". Spara nuvarande värde på tärningarna med `to_list()` till sessionen innan du slår om tärningarna.

1. Lägg till en route `reset` som nollställer sessionen och därmed startar om spelet. Lägg till den i navbaren.





```bash
# Ställ dig i kurskatalogen
dbwebb test yahtzee3
dbwebb publish yahtzee3
```

Rätta eventuella fel som dyker upp och validera igen. När det ser grönt ut så är du klar.



Extrauppgift {#extra}
-----------------------

1. Istället för att skriva ut ett felmeddelande när du väljer samma regel igen, så kan du designa ditt spel så att du inte kan välja samma regel igen. När en regel är vald, så ska inte den kunna väljas igen och vilken poäng nuvarande Hand är värde med regeln ska inte skrivas ut.

1. Lägg till test mockning:
    - Hand klassen:
        - `roll` - Använd er av mockning för att bli av med på beroendet `random.randint()` i Die klassen. Gör så att `randint` alltid returnerar 100. Kolla att handen innehåller fem tärningar med värdet 100.


Tips från coachen {#tips}
-----------------------

Lär dig felsöka med debuggern, använd den när du får problem. Komplettera med utskrifter av `print()`.

Validera ofta. Så slipper du en massa valideringsfel i slutet av övningen.

Lycka till och hojta till i forumet om du behöver hjälp!
