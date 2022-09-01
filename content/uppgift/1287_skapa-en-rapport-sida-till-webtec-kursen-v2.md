---
author: mos
category:
    - kurs webtec
revision:
    "2022-09-01": "(B, mos) Förtydliga kravet om today och navbar."
    "2022-06-28": "(A, mos) Första utgåvan."
...
Skapa en rapportsida till webtec-kursen (v2)
===================================

Du skall skapa mallen till din rapport-sida som följer dig genom kursen. I rapportsidan skriver du redovisningstexter för de uppgifter och kursmoment som du utför och du sparar undan alla uppgiftern som du utför.

När du är klar med kursen så innehåller din rapport-sida nästan allt som du gjort i kursen.

Du kan jobba vidare på din rapport-sida under hela kursen, du kan till exempel snygga till utseendet i samband med varje kursmoment efterhand som du lär dig mer.

<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har en installerat en labbmiljö för kursen webtec.

Du har jobbat igenom övningen "[Skapa en webbsida med HTML, CSS och PHP (v2)](kunskap/skapa-en-webbsida-med-html-css-och-php-v2)" och du har därmed grundstrukturen klar.



<!--
Genomgång {#genom}
------------------------

Här är en video som "pratar" dig igenom uppgiftens upplägg och visar hur du kommer igång.

[YOUTUBE src="gKzwQTG9eCI" width=700 caption="Kurs mvc kmom03 tisdagsgenomgång, del 3/3 uppgiften (Zoom med Mikael)."]
-->



Introduktion och förberedelse {#intro}
-----------------------

Gör följande steg för att förbereda dig för uppgiften.



### Kopiera koden från övningen {#kopiera}

Du har högst troligen jobbat igenom övningen så du kan nu börja med att kopiera den webbplatsen. Tanken är att du nu bygger vidare på den och färdigställer den i en första version.

Så här kan du kopiera filerna från `me/kmom01` till `me/report`.

```text
# Gå till roten av kursrepot
cp -ri me/kmom01/* me/report/
```

Kommandot `cp` tar en kopia av alla filerna i katalogen `example/report` och sparar i katalogen `me/report`. Om du redan har kopierat en fil så kommer kommandot fråga om du vill skriva över den.



### Validera och publicera {#validate}

Koden som du skriver skall laddas upp på studentservern med kommandot `dbwebb`. Det gör du på följande sätt.

```text
# Gå till roten av kursrepot
dbwebb validate report
dbwebb publish report
```

Kommandot `dbwebb validate` kör igenom ett antal valideringsverktyg som kontrollerar hur din kod ser ut. Om valideringsverktygen anser att du skriver felaktig kod så får du varningar som du behöver rätta till.

Om du inte förstår varningarna så försöker du hitta svar till dem. Eller så frågar du. Denna typen av verktyg som gör statisk kodvalidering är viktiga verktyg för en professionell utvecklare.

Kommandot `dbwebb publish` gör samma sak som `dbwebb validate` samt att det dessutom publicerar din webbplats på studentservern. När din webbplats publiceras så minifieras också dess innehåll. Minifiering innebär att koden komprimeras och onödiga delar som kommentarer tas bort.

Kör dessa kommandon ofta, så slipper du få en lång lista med varningar, precis när du trodde du var klar.

Nu kan du köra igång med själva uppgiften. Du hittar kraven nedan.



### Snabb publicering {#publish}

Ibland vill du göra en snabb publicering av din kod, eller så vill du publicera din kod utan att den modifieras. Detta kan till exempel vara bra när du vill felsöka PHP-kod och du vill vara säker på vilket radnummer som felet pekar på.

Du kan då publicera så här.

```text
dbwebb publishpure report
```



### Testa din inlämning {#test}

Förutom validate och publish så kan du även testa din inlämning med `dbwebb test kmom01`. Testerna som körs dubbelkollar om du har alla förväntade filer på rätt plats. Även om din körning av dbwebb test går igenom så är det inte en garanti för att allt är rätt, men det är ett hjälpmedel som hjälper dig att testa att du har med de mest uppenbara filerna.

Du kan testa så här.

```text
dbwebb test kmom01
```



Krav {#krav}
-----------------------

<!--
Lokala länka med # i rapportsidan.

Validering skall fungera.

Today is som egen sida med någn extra uppgift
-->

Utför följande krav.

1. Din webbplats skall vara uppbyggd enligt samma katalogstruktur som visades i övningen. Det handlar främst om katalogerna `config/`, `public/` och `view/`.

1. Du skall ha en sidkontroller `public/me.php` som innehåller text om dig själv tillsammans med en bild. Du kan även hitta på en fantasifigur om du inte vill skriva om dig själv. Berätta kort vem du är och vad du gör här.

1. Din sidkontroller `public/about.php` skall innehålla en kort beskrivning av den kurs du går. Lägg till en länk till kursens kursrepo på GitHub och infoga en bild som du anser är representativ för kursen.

1. I din sidkontroller `public/report.php` skall du skriva din redovisningstext för detta kursmoment. Det handlar mest om att svara på ett antal frågor som du hittar i slutet av beskrivningen för kursmomentet. Sidan skall innehålla en "innehållsförteckning" med länkar till repsektive del av sidan. Till exempel skall `#kmom01` leda till redovisningstexten för kmom01.

1. I katalogen `view/` skall du ha minst filerna `header.php` och `footer.php`. Du kan även lägga till fler vy-filer om du vill.

1. I katalogen `config/` skall du ha filen `config.php` som innehåller konfigurering för att sätta på felutskrifter. Du kan även lägga till mer information i den konfigureringsfilen om du anser det passar.

1. Du skall ge din webbplats en grov stil, lite bättre än den stilen som kommer ifrån övningen. Du kan antingen skapa din egen stil, eller så utgår du från en befintlig webbplats och lånar stilelement från den. Utför ändringarna i din stylesheet `public/css/style.css`.

1. Skapa en ny sidkontroller `public/today.php` som skriver ut dagens datum, tid och vilken veckodag det är tillsammans med veckans nummer. Lek med stylen och gör veckans dag med extra stort typsnitt och udda färger. Sidkontrollern lägger du även i sidans navbar så att man kan klicka på "Today" och får fram en ny webbsida med header, footer och dagens datum.

1. Kontrollera att dina sidkontroller passerar Unicorn validatorn. Om du har några valideringsfel på CSS kan det ibland vara okey, men du bör inte ha något valideringsfel på HTML.



Publicera {#publicera}
-----------------------

Avsluta uppgiften så här.

1. Kontrollera för dig själv att du har utfört samtliga krav.

1. När du är klar kan du publicera resultatet med `dbwebb publish report`.

1. Testa ditt resultat så att det passerar de automatiska testerna med `dbwebb test kmom01`.
