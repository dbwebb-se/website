---
author: nik
category:
    - kurs/design
    - tema
revision:
    "2020-11-19": (A, nik) Uppdaterad till version 2 inför design-v3.
...
Skapa ett mörkt tema
===================================

Du skall bygga vidare på ditt egna tema och göra ett "Dark Theme" till det.

Uppgiftens storlek beror på hur du byggt upp ditt tema i föregående kursmoment och hur mycket tid du vill lägga.

> "Come to the Dark Side, we have cookies" - Darth Vader



<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

1. Du har läst igenom följande del i "[Design med HTML5 och CSS3](guide/design-med-html5-och-css3)".
    * [Färg](guide/design-med-html5-och-css3/farg)

Du har jobbat igenom artikeln [Sätt upp session i Pico](kunskap/satt-upp-session-i-pico) som hjälper sig sätta upp sessionen och grunden för ett mörkt tema.



Krav {#krav}
-----------------------

Uppgiften är indelad i två delar, ditt vanliga tema och det mörka temat.



### Vanliga temat {#vanlig}

1. Jobba vidare med eller skapa ett nytt tema i `me/portfolio/themes/`

1. Temat ska bestå utav en `style.scss` som är huvudfilen för ditt tema. Här importerar du eventuella moduler du skapar.

1. Temat ska använda sig utav variabler för att bestämma färger. På så sätt kan ni enkelt anpassa temat mellan ljust och mörkt.

1. Temat ska ladda in tidigare tredje part moduler (Google Fonts, FontAwesome, Normalize.css)

1. Temat ska använda sig utav någon av de fyra färgscheman som nämns i guiden.
    * Monokromatiskt
    * Komplement
    * Analogt
    * Triadiskt

1. Gör ett medvetet val av typografi som passar tillsammans med känslan du har i ditt tema.

1. Fundera på om du kan byta dina bilder eller lägga [filter](https://developer.mozilla.org/en-US/docs/Web/CSS/filter) på dem så att de ska matcha resten av temat.

1. Ladda in temat som standard i `config/config.yml`

Dubbelkolla hur kontrasten fungerar i ditt tema med hjälp utav [Color Contrast Accessibility Validator](https://color.a11y.com/Contrast/). Du behöver publicera till studentservern för att det ska fungera.



### Mörka temat {#mork}

Utöver ovanstående krav ska du bygga ett mörkt tema med följande krav.

1. Utgå från ditt befintliga tema i filen `style.scss` Ta en kopia och döp den `style-dark.scss`.

1. I `style-dark.scss` som är huvudfilen för det mörka temat importerar du eventuella moduler du skapar.

1. Temat ska använda sig utav variabler för att bestämma färger. På så sätt kan ni enkelt anpassa temat mellan ljust och mörkt.

1. Temat ska ladda in tidigare tredje part moduler (Google Fonts, FontAwesome, Normalize.css)

1. Temat ska inte ha starka färger utan ska vara bekvämt att kolla på dygnet runt. Tänk er mörkt tema i valfri mjukvara, era telefoner, Discord, Visual Studio Code, Youtube etc.

1. Fundera på om du kan byta dina bilder eller lägga [filter](https://developer.mozilla.org/en-US/docs/Web/CSS/filter) på dem så att de ska matcha resten av temat.

Dubbelkolla hur kontrasten fungerar i ditt tema med hjälp utav [Color Contrast Accessibility Validator](https://color.a11y.com/Contrast/). Du behöver publicera till studentservern för att det ska fungera.

Verktyget kommer troligen att ladda in ert vanliga tema (i och med att den inte jobbar med sessioner). Ni kan lösa detta genom att hårdkoda ert mörka tema i er `<header>` för att testa verktyget. Se till att ändra tillbaka innan ni lämnar in!



### Övrigt {#ovrigt}

1. Dina `.scss` filer ska gå igenom lint med hjälp utav `npm run lint`.

1. Det ska gå att kompilera både `style.scss` och `style-dark.scss` samtidigt med hjälp utav `npm run style`.

1. Dubbelkolla att allt fungerar på studentservern.



Tips från coachen {#tips}
-----------------------

Lycka till och hojta till i Discord om du behöver hjälp!
