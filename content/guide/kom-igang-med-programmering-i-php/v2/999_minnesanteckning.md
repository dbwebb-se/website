---
author: mos
revision:
    "2018-03-13": "(A, mos) Första versionen, uppdelad av större dokument."
...
Minnesanteckning
==================================

Mina egna slarviga minnesanteckningar för saker som kan ingå (mer) i guiden. Eller inte. Tankar om att utveckla guiden.

Att lägga till:
 
* Filuppladdning, $\_FILE
* Multisida (?)
* Login med session och formulär


Sektion 01.

* Felsök med validering, visa källkod.

Felutskrifter där parsing error inte visas.
Output buffering:

> Den tredje raden säger till PHP att inte buffra svaret (lagra informationen och skriva ut senare) utan skriva ut delarna av resultatsidan  så fort som möjligt. En del installationer har buffrad utskrivning som på, det kan undvika ett par problem, men, när du kommer till en server som inte buffrar utskriften så dyker dessa problem upp. Det är bättre att alltid ha koll på felen så att de inte dyker upp när du laddar upp ditt program på en annan server.


exception

köra php-koden i terminalen?

expressions


validering, phpcs, phpmd, phpstan

floating point precision.

scope

frontkontroller, vyer.

Sessioner och inloggning (password_hash/verify)

Inbyggda funktioner för att läsa/skriva till fil.

fail fast, fail hard. Testa inkommande variabler och avbryt om fel. 
Allmänt om hur man kan validera en variabel och kolla om den har ett visst värde eller typ. (Delar finns i Bygg en multisida med PHP (v2))

Säker programmering med PHP (delar finns i Bygg en multisida med PHP (v2))
htmlentities, htmlspecialchars, esc

bodyClass();
funktion för att visa nuvarande valda menyval.
serialize array
json encode/decode
