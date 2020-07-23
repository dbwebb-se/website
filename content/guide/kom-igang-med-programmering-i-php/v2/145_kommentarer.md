---
author: mos
revision:
    "2018-06-20": "(A, mos) Splittad från artikeln 'Instruktioner och kommentarer'."
...
Kommentarer
=======================

I din kod kan du skriva kommentarer för att "kommentera" vad som händer i koden. Du kan också använda kommentarer för att berätta för dig själv vad su skall göra och du kan använda kommenterar för att felsöka din kod.



Olika sätt att ange en kommentar {#kommentarer}
-----------------------

Du kan ange *kommentarer* i din PHP-kod på ett antal olika sätt. Använd kommentarer för att dokumentera och strukturera din kod. Ibland kan kommentarer hjälpa dig själv att minnas vad koden egentligen borde göra.

Se följande exempel på ett par varianter för att ange kommentarer.

```php
/* Here is a multi-line comment, just as i CSS or C/C++
second line of comment.
third line.
*/
echo "Hello World!\n";         // One line comment, comment to end of line
echo "Hello PHP!\n";
echo "My name is Mikael...\n"; # Comment as shell-style

// Another one liner comment.
echo "Hello PHP again!\n";
```

Det finns alltså olika sätt att kommentera sin kod. De vanligaste är flerradskommentaren `/* */` och enradskommentaren `//`.



Kommentera som phpdoc {#phpdoc}
-----------------------

Det finns stöd för en kommentarstyp som kan hjälpa dig att bättre dokumentera din kod, denna kommentarstyp brukar kallas [phpdoc](http://en.wikipedia.org/wiki/PHPDoc). Det är en variant av kommentaren `/* */` men mer kraftfull eftersom informationen i kommentaren går att använda för att automatiskt skapa dokumentation av koden.

```php
/**
 * Here is a phpdoc comment.
 *
 * @author Mikael Roos mos@dbwebb.se>
 */
```

Denna typen av kommentarer brukar finnas överst i filer och ovanför funktioner och klasser.

Du kan uppnå både struktur av din kod och bättre förståelse för den, genom att kommentera den. Använd kommentarer där det behövs, främst för din egen del. Bra kod är självdokumenterande tillsammans med kommentarerna.



Skriv på engelska {#eng}
-----------------------

Det är kotym att skriva på engelska när man programmerar. Du bör skriva alla kommentarer på engelska, det passar bäst med källkoden som du också namnger och skriver på engelska.



Felsök med kommentarer {#felsok-kommentar}
-----------------------

Ett bra sätt att felsöka är att använda kommentarerna `/* */`. Med dem kan du kommentera bort stora delar av koden medan du felsöker.

Säg att du får ett felmeddelande som du inte lyckas rätta, då kan du kommentera bort kod tills felmeddelandet försvinner.

När felmeddelandet är borta så aktiverar du koden genom att ta bort kommentarerna tills felet åter inträffar.

Gör du detta stegvis så kan du felsöka och avgränsa felet till precis den rad där det inträffar.

Att felsöka med kommentarer är ibland en bra felsöknings-metod för fel som du inte lyckas rätta enbart med hjälp av felmeddelandet.
