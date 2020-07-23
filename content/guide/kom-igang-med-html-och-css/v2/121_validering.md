---
author: lew
revision:
    "2018-06-13": "(A, lew) Första versionen."
...
Validering {#validering}
=======================

Det dök upp en fråga från Murphy: Hur vet jag att du har skrivit bra kod? Murphy ville ha ett sätt att se så det vi gör är bra och att koden är skriven enligt konstens alla regler. Ett sätt är att validera koden med hjälp av en så kallad *Markup Validation Service*. W3C tillhandahåller en sådan, både för HTML och CSS. Man kan antingen validera med hjälp av en länk, filuppladdning eller direkt inmatning. För att det ska fungera med en länk måste sidan ligga på en publik server, vilket den inte gör än.



##Validera HTML {#validera-html}

Vi går in på [https://validator.w3.org/](https://validator.w3.org/) och klickar på *Validate by Direct Input* och klistrar in vår HTML-kod från index.html.

[FIGURE src=/image/htmlphp/guide/murphy/validate-html.png?w=w3 caption="Grönt = bra."]



##Validera CSS {#validera-css}

Det finns som sagt även en validator för CSS-koden. Vi gör likadant med den. Glid in på [https://jigsaw.w3.org/css-validator](https://jigsaw.w3.org/css-validator/) och *By Direct Input*. Klistra in och kör!

[FIGURE src=/image/htmlphp/guide/murphy/validate-css.png?w=w3 caption="Även här är grönt bra."]

Nu vet vi att vi följer standarden för hur språken ska struktureras.



##Validera via URI {#validera-uri}

Vi jobbar vidare med footern och lägger in länkar till validatorerna så vi kan validera sidan med ett klick. Följande kod löser det i slutet av index.html.

```html
    <footer>
        <hr>
        <a href="http://validator.w3.org/check/referer">HTML5</a>
        <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a>
    </footer>
</body>
```

Utan style kan det se ut så här:

[FIGURE src=/image/htmlphp/guide/murphy/validatelinks.png?w=w3 caption="Två länkar till validatorerna."]



##Unicorn, ett valideringsverktyg för flera tekniker {#unicorn}

Som om inte detta räcker finns verktyget *Unicorn* som är ett valideringsverktyg som kör både HTML och CSS i ett svep. Dessutom kan det köra ytterligare kompletterande tester. Vi lägger till en länk till det med:

```html
<a href="http://validator.w3.org/unicorn/check?ucn_uri=referer&amp;ucn_task=conformance">Unicorn</a>
```

Nu kan Murphy se att det vi gör är ordentligt och i ordning. Fint.
