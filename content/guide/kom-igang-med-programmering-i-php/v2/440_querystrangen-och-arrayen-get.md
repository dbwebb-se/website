---
author: mos
revision:
    "2018-08-22": "(A, mos) Första versionen."
...
Querysträngen och arrayen GET
=======================

PHP har flera [fördefinierade variabler](http://php.net/manual/en/reserved.variables.php) som är globala och tillgängliga att användas överallt i din kod.

En av dessa är `$_GET` som är en array som innehåller alla de värden som skickas med länken via den delen som kallas querysträngen, _querystring_.



Querysträngen {#query}
-----------------------

I en länk kan man ha en sektion som inleds med ett frågetecken `?` och efter den kommer en samling `key=valye` som separeras med tecknet `&`. Detta är ett sätt att skicka argument till en sida, argument som en sida kan bearbeta innan den visar sitt svar.

Om du går till sökmotorn Googles hemsida, eller Bings, så ser du normalt inget frågetecken i den länken.

[FIGURE src=image/snapht18/google-start.png?w=w3 caption="Sökmotorn Googles startsida, utan querysträngen."]

Sedan söker vi på något och vips ser vi att nästa sida innehåller ett frågetecken i länken och därefter följer ett antal par av "key=value".

[FIGURE src=image/snapht18/google-querystring.png?w=w3 caption="Sökmotorn Googles, nu med querysträngen som innehåller detaljer om min sökning."]

Om man delar upp ett par delar av den querysträngen som används så ser man följande.

```text
search?
    source=hp&
    ei=znJ9W4LhAaL6qwH827ZA&
    q=mumintrollet&
    oq=mumintrollet&
```

Ovan ser vi fyra par av "key=value" som skickas till söksidan och utifrån dessa parametrar får jag svarssidan.



$\_GET som array {#get}
-----------------------

Om jag skapar en sådan länk till min egen testsida så lägger php informationen i arrayen `$_GET` och jag kan hämta ut den.

Så här ser min testsida ut.

```php
// Dump incoming variables
// ?source=hp&ei=znJ9W4LhAaL6qwH827ZA&q=mumintrollet&oq=mumintrollet&
var_dump($_GET);
var_dump($_GET["q"]);
```

När man kör exemplet, och lägger till querysträngen i länken, så kan utskriften bli så här.

[FIGURE src=image/snapht18/querystring-with-get.png?w=w3 caption="Utskrift av innehållet i variabeln $\_GET, ett sätt att skicka parametrar till en sida."]

Du har sett hur du kan skicka argument i länken och ta hand med dessa via den inbyggda arrayen `$_GET`.
