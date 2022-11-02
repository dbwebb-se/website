---
author: lew
revision:
  "2022-10-18": "(B, lew) Uppdaterad inför HT22."
  "2021-05-12": "(A, lew) Ny version inför HT21."
...

# Kmom01: Utvecklingsmiljö

Låt oss komma i gång med en labbmiljö, och en miljö för kursen. För er som vill repetera eller inte har läst HTML/CSS innan kommer det finnas möjlighet att läsa på om det innan det används i den här kursen.

Detta kursmoment ger dig basen för resten av kursen, det hanterar grunderna som behövs så att vi i kommande kursmoment ska kunna dyka ned mer i JavaScript.

<!--more-->

[FIGURE src=/img/js-v2/batman.png?w=w2 caption="En interpretator för JavaScript."]

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>

## Labbmiljön {#labbmiljo}

_(ca: 2-4 studietimmar)_

Det finns en [längre beskrivning om kursens labbmiljö](./../installera-labbmiljo). Läs den om du är osäker på vad som skall göras, eller om detta är din första dbwebb-kurs.

Den korta varianten är att du behöver jobba igenom [artiklarna för labbmiljön](https://github.com/dbwebb-se/js-v2/blob/master/articles/environment), uppdatera [dbwebb-cli](dbwebb-cli) samt klona och initiera kursrepot.

```text
# Gå till din katalog för dbwebb-kurser
$ dbwebb selfupdate
$ dbwebb clone js
$ cd js
$ dbwebb init
```

## Läsanvisningar {#lasanvisningar}

_(ca: 6-10 studietimmar)_

- Läs igenom kapitel 1-4 i [exploringjs](https://exploringjs.com/impatient-js).

### MDN {#mdn}

I kursen används Mozilla Developers Network (MDN) som en resurs generellt för webbresurser och specifikt för referensmanual till programmeringsspråket JavaScript.

Vill du hamna på rätt manualsida så lägger du alltid till "mdn" till din googling. Det finns många versioner av JavaScript och du vill gå tillbaka till källan i referensmanualen för att veta vad som är rätt (eller fel).

Gör följande:

1. Bekanta dig kort med översikten på [MDN: Web technology for developers](https://developer.mozilla.org/en-US/docs/Web). Där ser du generellt material om webbteknologier.

1. Bekanta dig specifikt med det som finns under rubriken "JavaScript". Använd minst 10 minuter av din tid för att kika runt och läsa någon av de inledande artiklarna om JavaScript.

### Video {#video}

Senare i kursen, i kursmoment 03, behöver du ha en del baskunskaper i HTML och CSS. Om du känner att du behöver färska upp minnet eller rent av skaffa dig baskunskaperna bör du redan nu titta igenom följande av Mikael:

- [HTML](https://youtu.be/8QMveCqpegw)
- [CSS](https://youtu.be/Rzpl9mrJ05w)

<!--
1. Videoserien [Lär dig JavaScript](https://www.youtube.com/playlist?list=PLKtP9l5q3ce_YXUQlr5aAzJ406vSsmeMT) är tätt kopplat till kursmaterialet. Kika igenom serien under kursens gång. -->

## Övningar & Uppgifter {#ovningar_uppgifter}

_(ca: 4-10 studietimmar)_

### Övningar {#ovningar}

Jobba igenom följande.

1. Gå igenom artiklarna i [kursrepot](https://github.com/dbwebb-se/js-v2/tree/master/articles/kmom01).

1. Jobba igenom det praktiska exemplet [Kom igång med JavaScript i terminalen](https://github.com/dbwebb-se/js-v2/tree/master/example/basics).

### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Glacier report](https://github.com/dbwebb-se/js-v2/blob/master/assignments/kmom01/01_glacier.md)". Spara dina filer i `kmom01/`.

1. Gör uppgiften "[Me page](https://github.com/dbwebb-se/js-v2/blob/master/assignments/kmom01/02_mepage.md)". Spara resultatet i `me/redovisa/`.

[YOUTUBE src=2P5lbVR7Z5c width=639 caption="Hur kan det se ut när det är klart"]

### Testa din inlämning {#test}

Du kan köra vissa tester på din inlämning och se om de delarna uppfyller kraven. Rättningen kommer endast genomföras om testerna går igenom.

```console
$ dbwebb test kmom01
```

### Publicera din kod {#publish}

Du lämnar in koden via dbwebbkommandot:

```console
$ dbwebb publish kmom01
$ dbwebb publish redovisa
```

## Resultat & Redovisning {#resultat_redovisning}

_(ca: 1-2 studietimmar)_

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

- Vilken utvecklingsmiljö använder du (berätta om något förändrats sen sist, om du svarat på frågan i tidigare kurser)?
- Är du bekant med JavaScript sedan tidigare?
- Gick det bra att komma i gång med kursmomentet, var det lagom, för litet, för stort, något som var svårt eller saknades?
- Vilken är din TIL för detta kmom?
