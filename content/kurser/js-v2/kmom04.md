---
author: lew
revision:
  "2024-10-25": "(C, lew) Uppdaterad inför HT24."
  "2023-11-15": (B, lew) Genomgång inför ht23.
  "2021-11-19": (A, lew) Genomgång inför ht20.
...

# Kmom04: Mer DOM och Events


[WARNING]
Kursmomentet är under uppdatering och är klart när den här gula rutan är borta.
[/WARNING]

Nu har vi blivit lite varma i kläderna och ska ta et djupare kliv in i DOM manipuleringen. Vi ska arbeta med fler former och fler events. Självklart ska vi även arbeta med moduler.

<!--more-->

<!-- [FIGURE src=/image/snapht14/js1-boulder-dash.png caption="Öva arrayer med en Boulderdash klon."] -->

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>

## Läsanvisningar {#lasanvisningar}

_(ca: 4-6 studietimmar)_

### MDN {#mdn}

Ha följande dokumentation nära tillhands:

1. [Intro till DOM på mdn](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/Introduction)

## Övningar & Uppgifter {#ovningar_uppgifter}

_(ca: 12-16 studietimmar)_

### Övningar {#ovningar}

Genomför övningarna för att träna inför uppgifterna.

1. Gå igenom artiklarna i kursrepot för [kursmoment 03](https://github.com/dbwebb-se/js-v2/tree/master/components/03).

2. Gå igenom artiklarna i kursrepot för [kursmoment 04](https://github.com/dbwebb-se/js-v2/tree/master/components/04).

### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Mera dom](https://github.com/dbwebb-se/js-v2/blob/master/components/04/assignment-1.md)". Du ska jobba vidare med `public/`.


[YOUTUBE src=tljJ2TxBpC4 width=639 caption="Hur kan det se ut när det är klart"]

### Testa din inlämning {#test}

Du kan köra vissa tester på din inlämning och se om de delarna uppfyller kraven. Rättningen kommer endast genomföras om testerna går igenom.

```console
$ dbwebb test kmom04
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
