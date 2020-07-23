---
author: mos
revision:
    "2018-06-27": "(A, mos) Första versionen, uppdelad av större dokument."
...
UTF-8 och multibyte strängar
=======================

Låt oss titta på begreppet om teckenkodning, multibyte strängar och UTF-8.



Multibyte strängar {#multi}
------------------------

När du jobbar med multibyte strängar, och teckenkodning enligt UTF-8, så finns en speciell del i manualen som beskriver "[Multibyte String](http://php.net/manual/en/book.mbstring.php)" och de funktioner som finns tillgängliga. Funktionerna är namngivna med ett prefix `mb_`.

Det är numer nästan standard att enbart hantera teckenkodning enligt UTF-8 och multibyte, men det finns fortfarande webbplatser och applikationer som inte hanterar UTF-8.



Vad är en multibyte sträng? {#vadmulti}
------------------------

Teckenkodning handlar om hur en sträng lagras internt i datorn, i en fil eller när data skickas över nätet.

För att göra ett exempel så kan man ta två filer som innehåller data, en fil som är kodad enligt ISO-8859-1 och en fil som är kodad enligt UTF-8. I kursrepot under `example/guide-php/02` ligger filerna `encoding-utf8.txt` och `encoding-iso8859.txt`.

Om man öppnar båda filerna i en texteditor så ser innehållet ut så här.

```text
abc
åäö
```

Om man tittar på hur operativsystemet ser på filerna, via kommandot `file` i terminalen, så ser det ut så här.

```text
$ file encoding-*
encoding-iso8859.txt: ISO-8859 text
encoding-utf8.txt:    UTF-8 Unicode text
```

Vi ser att operativsystemet ser skillnaden på filerna. Om vi själva vill ha en visuell skillnad på filerna så behöver vi se vilka tecken som lagras i själva filen. Det kan man inspektera med terminalkommandot `hexdump`.

Vi börjar med att titta på filen som är kodad enligt ISO 8859-1.

```text
$ hexdump -C encoding-iso8859.txt 
00000000  61 62 63 0a e5 e4 f6 0a                           |abc.....|
00000008
```

Vi kan se att ascii-värdet för abc inleder filen, det är 61, 62 respektive 63. Verktyget hexdump känner inte igen tecknet för åäö (e5, e4, f6) och väljer att inte skriva ut dem.

Filen innehåller 8 tecken, det är våra abc (3 tecken), åäö (3 tecken) samt två nyradstecken (0a).

Då gör vi samma sak med filen som är kodad enligt UTF-8.

```text
$ hexdump -C encoding-utf8.txt 
00000000  61 62 63 0a c3 a5 c3 a4  c3 b6 0a                 |abc........|
0000000b
```

Inledningen i filen är densamma, men när vi ser på bokstäverna åäö så ser vi att varje bokstav representeras av två tecken. Bokstaven å representeras av c3a5, bokstaven ä av c3a4 och bokstaven ö av c3b6. I UTF-8 kan 1 till 4 tecken/siffror användas för att representera en bokstav eller tecken.

Filen innehåller totalt 11 tecken (abc: 3, ååö: 6 samt två nyradstecken).

Ett annat exempel på UTF-8 är tecknet för copyright, ©. Det är ett tecken som också kan representeras i UTF-8 via två tecken och sekvensen c2a9.



Multibyte och PHP {#php}
-----------------------

När man använder strängar i php så kan man alltså behöva ta hänsyn till den teckenkodning som används. 

Följande kodsekvens ger olika svar beroende på vilken teckenkodning som används.

```php
// Show difference in length of string
strlen("åäö");    // UTF-8: 6, ISO8859-1: 3
mb_strlen("åäö"); // UTF-8: 3, ISO8859-1: 1
```

I exemplet ovan ger funktionen `mb_strlen()` rätt svar när teckenkodningen är i UTF-8 som är ett multibyte format. Funktionen `strlen()` ger rätt resultat när teckenkodningen är ISO-8859-1.

Det som är mest rätt för framtida kod är att använda UTF-8 som teckenkodning och att använda funktioner för multibyte strängar när det behövs.

Du kan se en översikt av tillgängliga [funktioner för multibyte strängar](http://php.net/manual/en/ref.mbstring.php).
