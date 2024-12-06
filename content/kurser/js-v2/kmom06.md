---
author: lew
revision:
  "2024-12-06": (C, lew) Uppdaterad version inför ht24.
  "2023-11-20": (B, lew) Uppdaterad version inför ht23.
  "2021-12-03": (A, lew) Ny version inför ht21.
...

# Kmom06: Objekt


<!-- [WARNING]
Kursmomentet är under uppdatering och är klart när den här gula rutan är borta.
[/WARNING] -->

Vi har lärt oss att använda moduler för att strukturera vår kod och dela upp den i mindre delar. Vi ska i det här momentet fortsätta med en modulstruktur med hjälp av objekt. Till vår hjälp har vi en grund i form av ett halvfärdigt "hänga gubben" spel.

<!--more-->

[FIGURE src=/img/hangman/hangman-validates-inline.svg caption="En SVG-bild till ett hänga gubben-spel som byggs enligt module pattern."]

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>

<!-- ## Läsanvisningar {#lasanvisningar}

_(ca: 4-6 studietimmar)_ -->

<!--
Läs följande.

1. Läs i boken [Learning JavaScript Design Patterns](http://addyosmani.com/resources/essentialjsdesignpatterns/book/) för att ta reda på vad ett module pattern är.
    * [Introduction](http://addyosmani.com/resources/essentialjsdesignpatterns/book/#introduction)
    * [What is a Pattern?](http://addyosmani.com/resources/essentialjsdesignpatterns/book/#whatisapattern)
    * [The Module Pattern](http://addyosmani.com/resources/essentialjsdesignpatterns/book/#modulepatternjavascript)
 -->


## Övningar & Uppgifter {#ovningar_uppgifter}

_(ca: 12-16 studietimmar)_

### Övningar {#ovningar}

Genomför övningarna för att träna inför uppgifterna.

1. Gå igenom artiklarna i [kursrepot](https://github.com/dbwebb-se/js-v2/tree/master/components/06) för kursmoment 6.

### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Hangman](https://github.com/dbwebb-se/js-v2/blob/master/components/06/assignment-1.md)". Jobba i mappen `public/`.

[INFO]
Kraven har uppdaterats för uppgiften så det kan saknas något i videon nedan. Dubbelkolla mot kraven i uppgiften. Det är de som gäller.
[/INFO]

[YOUTUBE src=LJ0RN4Gl6Ig width=639 caption="Hur kan det se ut när det är klart"]

### Testa din inlämning {#test}

Du kan köra vissa tester på din inlämning och se om de delarna uppfyller kraven. Rättningen kommer endast genomföras om testerna går igenom.

```console
$ dbwebb test kmom06
```

### Dokumentera din kod {#jsdoc}

Du genererar dokumentationen med följande script:

```console
$ npm run jsdoc --what=public
```


### Validera din kod {#validate}

Du validerar koden med npm scripten:

```console
$ cd me
$ npm run eslint --what=public
$ npm run stylelint --what=public
$ npm run htmlhint --what=public
```

Du kan även köra alla linters på en gång med `$ npm run lint`.


### Publicera din kod {#publish}

Du lämnar in koden via dbwebbkommandot:

```console
$ dbwebb publish public
```

## Resultat & Redovisning {#resultat_redovisning}

Se till så koden är publicerad. Lämna sedan in på Canvas efter du genomfört quizzet.
