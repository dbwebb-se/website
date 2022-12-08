---
author: nik
category:
    - kurs/design-v3
    - sass
revision:
    "2020-10-29": (A, nik) Skapad inför ht20
...
Utveckla din portfolio - Kmom02
===================================

Du skall bygga ett tema till din portfolio-sida och du bygger temats stylesheet med hjälp utav SASS.

Du börjar strukturera upp din tema-kod i separata filer som vi kallas sass-moduler.

Du lägger till externa moduler och du bygger vidare på ditt temas responsivitet.

<!--more-->

Förkunskaper {#forkunskaper}
-----------------------

Du har installerat Node.js och npm ([Installera nodejs och npm](labbmiljo/node-och-npm)).

Du har gått igenom artikeln [Kom igång med SASS och npm](kunskap/kom-igang-med-sass-och-npm-v2).

Du har gått igenom artikeln [Ikoner och fonter](kunskap/design-ikoner-och-fonter).

Krav {#krav}
-----------------------

Uppgiften är indelad i två delar, en del angående innehåll och en där du skapar ditt SASS-tema.

### Innehåll

1. Din portfölj ska ha en om-sida med routen `/about` där du skriver ett kort stycke om vilka tekniker du använder i sidan.

1. Sidan ska vara hyfsat responsiv, t.ex. ingen horisontella scroll eller bilder som tar sönder flödet.



### SASS-tema

1. Jobba vidare med eller skapa ett nytt tema i `me/portfolio/themes/`.

1. Temat ska bestå utav en `style.scss` som är huvudfilen för ditt tema. Här importerar du eventuella moduler du skapar.

1. Temat ska ladda in modulen `normalize.css`.

1. Temat ska ladda in minst en extern font via t.ex [Google Fonts](https://fonts.google.com/).

1. Temat ska använda sig av minst två ikoner via t.ex [Font Awesome](https://fontawesome.com/) (GitHub ikonen inkluderad).

1. Jobba vidare med ditt tema. Du behöver inte styla jättemycket, det kommer fler möjligheter under kursen. Men, det måste vara ett hyfsat gott grundtema så att webbplatsen går att använda.

1. Använd någon typ av funktionalitet som SASS erbjuder utöver CSS, t.ex. operatorer, variabler, arv eller nästlade regler.

1. Testa att gå in på din sida via telefonen. Det behöver inte vara perfekt, men en viss spacing kanske fungerar på desktop men inte så bra på telefonen.



### Avslutningsvis

1. Din kod ska gå igenom stylelint, testkör med `npm run lint`.

1. Aktivera ditt tema i `me/portfolio/config/config.yml`.

1. Gör en `dbwebb publishpure me` och kontrollera att allt fungerar på studentservern.

1. Commit:a alla filer, inklusive temat och lägg till en (ny) tagg (2.0.\*).

1. Pusha repot till GitHub, inklusive taggarna.


Extrauppgifter {#extra}
-----------------------

Det finns flera sätt att minska antalet beroende man har mot andra tjänster eller storleken på sidan. Nedan är två förslag som är rimliga för kursmomentet:

1. Bytt ut Font Awesome mot Unicode ikoner.

1. Ladda hem dina fonter och importera dem lokalt istället för ifrån din externa fonttjänst.


Tips från coachen {#tips}
-----------------------

Testa gärna att göra flera teman om du får tid över, kanske finns det olika färgscheman du vill testa? Eller en helt annan layout?

Lycka till och hojta till i Discord om du behöver hjälp!
