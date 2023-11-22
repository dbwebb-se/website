---
author: lew
revision:
  "2023-11-22": (C, lew) Uppdaterad inför ht23.
  "2022-11-25": (B, lew) Uppdaterad inför ht22.
  "2021-06-16": (A, lew) Ny inför ht21.
...

# Kmom05: Web API

När vi använder JavaScript i webbläsaren kan vi använda färdiga API:er som ger oss möjlighet att bygga våra webbsidor och applikationer på nya sätt. Vi ska i det här kursmomentet ta en närmare titt på två av dem.

<!--more-->

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>

## Läsanvisningar {#lasanvisningar}

_(ca: 4-6 studietimmar)_

### MDN {#mdn}

Skaffa en överblick av följande:

1. [Web API på mdn](https://developer.mozilla.org/en-US/docs/Web/API).

Där finns en hel del listade API:er. I detta kursmoment ska vi titta närmare på [fetch API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API) och [Web Storage API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API).

## Övningar & Uppgifter {#ovningar_uppgifter}

_(ca: 12-16 studietimmar)_

###Övningar {#ovningar}

Genomför övningarna för att träna inför uppgifterna.

1. Gå igenom artiklarna i [kursrepot](https://github.com/dbwebb-se/js-v2/tree/master/components/05) för kursmoment 5.

###Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[CO2 Emission](https://github.com/dbwebb-se/js-v2/blob/master/components/05/assignment-1.md)". Spara koden i `public/`.


<!-- [YOUTUBE src=0CNP6uQkBU4 width=639 caption="Hur kan det se ut när det är klart"] -->

### Testa din inlämning {#test}

Du kan köra vissa tester på din inlämning och se om de delarna uppfyller kraven. Rättningen kommer endast genomföras om testerna går igenom.

```console
$ dbwebb test kmom05
```

### Validera din kod {#validate}

Du validerar koden med npm scripten:

```console
$ npm run eslint --what=public
$ npm run stylelint --what=public
$ npm run htmlhint --what=public
```

Du kan även köra alla linters på en gång med `$ npm run lint`.

### Dokumentera din kod {#jsdoc}

Du genererar dokumentationen med följande script:

```console
$ npm run jsdoc --what=public
```

### Publicera din kod {#publish}

Du lämnar in koden via dbwebbkommandot:

```console
$ dbwebb publish public
```

## Resultat & Redovisning {#resultat_redovisning}

Se till så koden är publicerad. Lämna sedan in på Canvas efter du genomfört quizzet.
