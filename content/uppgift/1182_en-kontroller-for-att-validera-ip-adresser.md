---
author:
    - mos
category:
    - php
    - anax
    - kurs ramverk1
revision:
    "2018-11-05": "(A, mos) Första utgåvan."
...
En kontroller för att validera ip-adresser
===================================

Du skall bygga en kontroller som validerar ip-adresser enligt ip4 och ip6. Du skall göra en webbsida där man kan mata in en ip-adress och validera den. Resultatet skall bli en webbsida som visar om ip-adresser validerar och enligt vilket format.

Du skall också göra en REST-variant som gör samma sak men via ett JSON API.

Du skapar enhetstester som testar din kontroller och du når 100% kodtäckning.

<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har löst uppgiften "[Bygg en me-sida till ramverk1 (v2)](uppgift/bygg-en-me-sida-till-ramverk1-v2)".



Introduktion och förberedelse {#intro}
-----------------------

Följande steg hjälper dig att komma igång med uppgiften.



### Installera testverktygen {#test}

Installera testverktygen som krävs.

```php
# Stå i me/redovisa
make install
```

Verifiera att du kan köra testsuiten via `make test`, du skall inte få några felmeddelanden.


```php
# Stå i me/redovisa
make test
```



### Rensa cachen {#clean-cache}

När du växlar mellan att köra Anax i webbservern och via CLI så blir det olika ägare av filerna under cachen. Du kan därför behöva rensa cachen när du får felmeddelande om filrättigheter på filer i cachen.

```php
# Stå i me/redovisa
make clean-cache
```



Krav {#krav}
-----------------------

1. Skapa en sida där du kan mata in och validera en ip-adress med PHP-kod. Koden skall finnas i en kontroller-klass och i vyer.

1. Resultatet av valideringen presenteras i en webbsida där ip-adressen visas tillsammans med information om det är en giltig ip4 eller ip6 adress. Visa även domännamnet för ip-adressen (om det finns).

1. Ovan sida lägger du till i navbaren.

1. Skapa en ny kontroller som erbjuder ett REST API för att validera en ip-adress. Man kan posta en ip-adress till din validator och svaret blir en JSON-struktur med samma innehåll och resultat som ovan.

1. Bygg ut din sida så att du förklarar hur man jobbar med ditt JSON API och lägg till så det finns testroutes man kan klicka på.

1. Lägg till enhetstester för din kod. 100% är en rimlig nivå på kodtäckning.

1. Kör `make test` för att kolla att du inte har några valideringsfel och att testfallen går igenom.

1. Gör en `dbwebb publish redovisa` och kontrollera att det fungerar på studentservern.

1. Committa alla filer och lägg till en tagg (1.0.\*).

1. Pusha upp repot till GitHub, inklusive taggarna.



Tips från coachen {#tips}
-----------------------

Lycka till och hojta till i forumet om du behöver hjälp!
