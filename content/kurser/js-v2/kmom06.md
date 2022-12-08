---
author: lew
revision:
  "2021-12-03": (A, lew) Ny version inför ht21.
...

# Kmom06: Objekt

Vi har lärt oss att använda moduler för att strukturera vår kod och dela upp den i mindre delar. Vi ska i det här momentet fortsätta med en modulstruktur med hjälp av objekt. Till vår hjälp har vi en grund i form av ett halvfärdigt "hänga gubben" spel.

<!--more-->

[FIGURE src=/img/hangman/hangman-validates-inline.svg caption="En SVG-bild till ett hänga gubben-spel som byggs enligt module pattern."]

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>

## Läsanvisningar {#lasanvisningar}

_(ca: 4-6 studietimmar)_

<!--
Läs följande.

1. Läs i boken [Learning JavaScript Design Patterns](http://addyosmani.com/resources/essentialjsdesignpatterns/book/) för att ta reda på vad ett module pattern är.
    * [Introduction](http://addyosmani.com/resources/essentialjsdesignpatterns/book/#introduction)
    * [What is a Pattern?](http://addyosmani.com/resources/essentialjsdesignpatterns/book/#whatisapattern)
    * [The Module Pattern](http://addyosmani.com/resources/essentialjsdesignpatterns/book/#modulepatternjavascript)
 -->

### MDN {#mdn}

Läs följande:

1. Läs i [MDN JavaScript Guide](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide) för att påminna dig om begreppet closure.
   - [Closures](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Closures)

## Övningar & Uppgifter {#ovningar_uppgifter}

_(ca: 12-16 studietimmar)_

### Övningar {#ovningar}

Genomför övningarna för att träna inför uppgifterna.

1. Gå igenom artiklarna i [kursrepot](https://github.com/dbwebb-se/js-v2/tree/master/articles/kmom06) för kursmoment 6.

### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Hangman](https://github.com/dbwebb-se/js-v2/blob/master/assignments/kmom06/01_hangman.md)". Spara koden i `kmom06/`.

1. Gör uppgiften "[Me page 6](https://github.com/dbwebb-se/js-v2/blob/master/assignments/kmom06/02_mepage6.md)". Spara resultatet i `me/redovisa/`.

[YOUTUBE src=C1oDcKZ4B6s width=639 caption="Hur kan det se ut när det är klart"]

### Testa din inlämning {#test}

Du kan köra vissa tester på din inlämning och se om de delarna uppfyller kraven. Rättningen kommer endast genomföras om testerna går igenom.

```console
$ dbwebb test kmom06
```

### Publicera din kod {#publish}

Du lämnar in koden via dbwebbkommandot:

```console
$ dbwebb publish kmom06
$ dbwebb publish redovisa
```

## Resultat & Redovisning {#resultat_redovisning}

_(ca: 1-2 studietimmar)_

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

- Har du koll på hur function scope och closure fungerar eller känns det naturligt?
- Har du några erfarenheter av designmönster sedan tidigare?
- Har du koll på vad termerna `this` och `instans` är när vi pratar om objekt?
- Vad är din TIL för det här kursmomentet?
