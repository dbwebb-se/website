---
author: mos
revision:
    "2018-08-21": "(A, mos) Första versionen."
...
Mäta en sidas beteende
=======================

Låt oss skapa en ny vy, via en templatefil, som renderar information om en sidas laddningstid och de resurser som använts för att generera sidan.



Laddningstid för sidan {#laddningstid}
-----------------------

Det första vi vill göra är att mäta hur lång tid det tar att ladda en sida. För att lyckas med det så behöver vi en mätpunkt för när sidan börjar skapas och en mätpunkt i slutet av sidans rendering.

Inbyggt i php's systemvariabler finns en mätpunkt som vi kan använda till den första tidsstämpeln.

```php
$timestampFirst = $_SERVER["REQUEST_TIME_FLOAT"];
echo "$timestampFirst\n";
```

Variabeln `$timestampFirst` innehåller nu en tidsstämpel med precisionen microsekunder.

Vi skapar en ny variabel `$timestampLast` som innehåller nuvarande tidsstämpel.

```php
$timestampLast = microtime(true);
echo "End: $timestampLast\n";
```

Vi kan nu ta skillnaden mellan dessa båda tidsstämplar, så får vi antalet sekunder det tar att ladda sidan.

```php
$diff = $timestampLast - $timestampFirst;
echo "Diff: $diff\n";
```

För att få en snyggare utskrift kan vi avrunda och presentera svaret i antalet millisekunder (ms).

Så här kan det se ut när man gör det stegvis.

[FIGURE src=image/snapht18/mata-laddningstid.png?w=w3 caption="En sidas laddningstid, uppdelad i dess beståndsdelar."]



Antalet laddade filer {#filer}
--------------------------

Ett annat sätt att mäta hur mycket resurser en sida kräver, är att lista antalet filer som behövs inkluderas för att generera sidan. Här kan vi hämta alla filer som inkluderats och räkna hur många de är.

Så här.

```php
$filesIncluded = get_included_files();
$numFiles = count($filesIncluded);
echo "Files included: $numFiles\n";
```



Minne som använts {#memory}
--------------------------

Hur mycket minne som använts när man skapar en sida kan vara av intresse, det är en parameter för den som i detalj behöver studera en webbsidas prestanda.

Vi kan plocka fram hur mycket minne som används för tillfället och hur mycket som maximalt använts under sidans skapande. Vi kan också avläsa vilken maxgräns som är satt för minnet, om php-processen använder mer minne än den gränsen så avbryts skriptet med ett felmeddelande.

```php
$memoryMax = memory_get_peak_usage();
$memoryCurrent = memory_get_usage();
$memoryLimit = ini_get("memory_limit");
echo "Memory\n";
echo "Max: $memoryMax\n";
echo "Current: $memoryCurrent\n";
echo "Limit: $memoryLimit\n";
```

Man får läsa sig till i manualen för att se vad returvärdena representerar. De två första funktionerna returnerar antalet byte (B) och vill man istället skriva ut KB så dividerar man värdet med 1024 och vill man skriva ut MB så dividerar man med 1024x124.



Varför bry sig? {#varfor}
--------------------------

Det är viktigt att ha en känsla för hur mycket resurser en webbsida kräver, eller bör kräva. Det underlättar när man senare bygger större sidor och man vill testa dem och jämföra deras laddningstid och resursnyttjande.

En templatefil som kan inkluderas i footern kan vara ett bra test och utvecklingsverktyg, om inte annat så underlättar det förståelsen för den resursmängd som krävdes för att generera sidan.
