---
author:
    - mos
    - lew
    - nik
    - grm
revision:
    "2022-05-25": "(F, grm) Komplettering HT22."
    "2021-11-10": "(G, grm) Komplettering HT21."
    "2021-10-01": "(F, lew Uppdatering inför HT21."
    "2020-11-25": "(E, mos) Förtydliga om redovisningen."
    "2020-11-20": "(C, mos) Lade till tips om CTF-kanaler."
    "2020-11-16": "(B, mos) Läsanvisningar om hacker writeups."
    "2020-11-01": "(A, mos) Utkast inför ht20."
...
Kmom03: Attacker
==================================

<!-- [WARNING]
Kursen uppdateras inför HT22. Är "gula rutan" borta är det fritt fram att börja.
[/WARNING] -->

När man som webbprogrammerare blir utsatt för en attack så är det lätt att hålla sig för skratt. En attack kan vara lättsam som en skämtsam och lekfull XSS där någon bara vill säga att de "ägde din webbplats". I artikeln "[Grundregel 1A i Cross Site Scripting (XSS) - Lita inte på någon](https://dbwebb.se/blogg/grundregel-1a-i-cross-site-scripting-xss-lita-inte-pa-nagon)" visas effekten av ett sådant exempel där någon litade på någon och det slutade med att studentföreningens webbplats gjordes till ett litet skämt.

[YOUTUBE src=CYMR4BjHIeM width=700 caption="Studentföreningens sida som en XSS:ad variant."]

Ibland kan det vara värre och det kan gälla ett mer verkligt hot mot en webbtjänst, ett system eller ett företags verksamhet och trovärdighet. Ibland kan det vara känslig data och ibland rör det sig om pengar.

Kanske bör du fråga dig, som webbprogrammerare och potentiellt ansvarig för ett viktigt system.

> "Vad är det värsta som kan hända?"

Kanske bör du försöka svara på den frågan och fundera på hur du kan skydda dig eller hantera konsekvenserna av "det värsta som kan hända".

Låt oss i detta kmom kika in i olika typer av attacker som vi kan förvänta oss, eller attacker som man normalt kan förvänta sig som en webbprogrammerare. Låt oss även titta på hur man kan försvara sig och låta bli att utsätta sig för risker, eller iallafall hantera risknivåerna och vara förberedd för konsekvenserna som attacker kan medge.

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **40 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Föreläsningar &amp; Laborationer {#forelasningar}
---------------------------------

*(ca: 8-10 studietimmar)*

Kursvecka 3 (Fokus på teori):

* 10:15 (2021-11-14) H430, med Victor om hot.
* 10:15 (2021-11-18) H430, med Victor om attacker.

<!--
Hur hantera attaker när de är ett faktum?

betala för hackare som hittar felet?

Snabb på att rätta felen?

klick, ransomware, social attacks
-->

Kursvecka 4 (Fokus på praktik/attacker):

* 10:15 (2021-11-21) H430, med Marie laboration, attacker
* 10:15 (2021-11-25) H430, med Marie. Frågor, eget arbete


Läs &amp; Studera  {#lasanvisningar}
---------------------------------

*(ca: 6-10 studietimmar)*


### Artiklar och studiematerial {#las}

Läs och studera följande.

* Läs i boken [Computer Security](/kunskap/boken-computer-security)
    * Kapitel 4-5

* Läs artikeln "[Grundregel 1A i Cross Site Scripting (XSS) - Lita inte på någon](https://dbwebb.se/blogg/grundregel-1a-i-cross-site-scripting-xss-lita-inte-pa-nagon)" som ett enklare exempel på hur saker kan hända när man litar på någon.

* Använd [OWASP Top Ten](https://owasp.org/www-project-top-ten/) som en källa för några av de vanligaste riskerna i en applikation. Börja med att kika igenom vilka de top-tio riskerna är och försök förstå vad de innebär för dig som utvecklare, hur bör du inte skriva din kod? Börja kika översiktligt.

* Myndigheten för samhällsskydd och beredskap har gjort en vägledning "[Säkerhetsåtgärder i
informationssystem](https://rib.msb.se/filer/pdf/30128.pdf)" som handlar
om att införa säkerhetsåtgärder för att skydda information i informationssystem.

* Läs igenom artikeln "[TimThumb Attacks: The Scale of Legacy Malware Infections](https://blog.sucuri.net/2019/08/timthumb-attacks-the-scale-of-legacy-malware-infections.html)" som berättar historien om hur ett litet PHP-script för att skala om bilder blev ett stort säkerhetshål för "remote code execution" i WordPress.

* I artikeln "[Type Juggling and PHP Object Injection, and SQLi, Oh My!](https://foxglovesecurity.com/2017/02/07/type-juggling-and-php-object-injection-and-sqli-oh-my/)" visas hur man gör en exploit på en "loose comparisom `==`" och "`unserialize()` user supplied data" i PHP frameworket Expression Engine. Läs den som ett exempel på hur en attackerare tänker och funderar när den försöker hitta svagheter i ett system.

* En annan variant är vi kan lära från en hacker writeup är "Finding Vulnerabilities in Core WordPress: A Bug Hunter’s Trilogy" som steg för steg når längre in i systemet. Börja med att läsa del I för att få en insyn i vad det handlar om, finner du det intressant så kan du fortsätta läsa de andra delarna.
    * [Part I](https://blog.checkpoint.com/2015/08/04/wordpress-vulnerabilities-1/)
    * [Part II - Supremacy](https://blog.checkpoint.com/2015/08/11/finding-vulnerabilities-in-core-wordpress-a-bug-hunters-trilogy-part-ii-supremacy/)
    * [Part III – Ultimatum](https://blog.checkpoint.com/2015/09/15/finding-vulnerabilities-in-core-wordpress-a-bug-hunters-trilogy-part-iii-ultimatum/)


<!--
Panama papers
https://panamapapers.sueddeutsche.de/en/
Kanske finns en video?
-->

<!-- Mer läsanvisningar presenteras i samband med seminarierna. -->



### Video {#video}

Titta på följande videor.

1. Möt en hackare, "[Detectify | Meet the Hacker - Fredrik Nordberg Almroth](https://www.youtube.com/watch?v=ERXWb0KjMRo)". En 6 minuter video där vi får träffa en "hackare" som ger oss sina bästa tips.

1. Titta på denna videoserie med 2-minuters avsnitt som förklarar "[OWASP Top 10 Vulnerabilities Explained](https://www.youtube.com/playlist?list=PLbKl_RtocZetEzdHyZCgZHwaUHjE_jeQT)" från Detectify.

1. (Extra) Om du vill ha mer förklaringar till en eller flera av OWASP Top Ten så kan du kika i videoserien (10 minuters avsnitt) "[OWASP Top Ten - 2017](https://www.youtube.com/playlist?list=PLyqga7AXMtPPuibxp1N0TdyDrKwP9H_jD)" från F5 DevCentral.

1. (Extra) Vill du ha ännu mer OWASP så tittar du på konferenspresentationen "[GOTO 2019 • AppSec: From the OWASP Top Ten(s) to the OWASP ASVS • Jim Manico](https://www.youtube.com/watch?v=nvzMN5Z8DJI)" (51 minutes).



### Capture The Flag (CTF) {#ctf}

Som extra arbete, om ni vill lära er mer om säkerhet inom applikationer och webb, så finns konceptet CTF - Capture The Flag. Det handlar om små problemlösande utmaningar där man skall leta reda på flaggor som är gömda i ett system eller applikation. Videorna är Writeups till hur man löser specifika CTF:er och de är ofta både spännande, intressanta, lärorika och pedagogiskt upplagda.

Här är en video från LiveOverflow som kan ge dig insikt i hur dessa writeups videor kan se ut. Denna video är en writeup på en XSS injection i Googles sökmotor. Dessa writeups kan verka avancerade men om man försöker hänga med så får man god insikt i hur utmanande säkerhetsområdet kan vara.

[YOUTUBE src="lG7U3fuNw3A" width="700" caption="XSS on Google Search - Sanitizing HTML in The Client?"]

Följande är tips på bra kanaler och på ett par spellistor som fokuserar på webbapplikationer.

1. Första tipset är [kanalen LiveOverflow](https://www.youtube.com/c/LiveOverflowCTF).
    * [Spellista: LiveOverflow Web Hacking](https://www.youtube.com/playlist?list=PLhixgUqwRTjx2BmNF5-GddyqZcizwLLGP)

1. Det andra tipset är [kanalen John Hammond](https://www.youtube.com/user/RootOfTheNull)
    * [Spellista: Web Security](https://www.youtube.com/playlist?list=PL1H1sBF1VAKX9Mz0UVU2eR7EdGmtb5XJK)

Glöm inte att även andra typer av CTF:er kan ge stor behållning av allmänt tänk inom programutveckling och säkerhet.



Uppgifter  {#uppgifter}
-------------------------------------------

*(ca: 15-20 studietimmar)*

<!--
https://github.com/dbwebb-se/itsec

Det finns en hel del skrivuppgifter i kursen, tycker inte att det är ett problem med fler. Jag ger mall i Overleaf, https://dbwebb.se/uppgift/diskussion-vad-ar-privat-egentligen#reflektion (https://www.overleaf.com/project/5ece574fac1a6400011cbaf2) för kmom02. Så känns rimligt att fortsätta vara snäll där
-->

Det finns tre uppgifter, en skrivuppgift, en "lär dig attacker"-uppgift och en "titta på en film"-uppgift.

1) Skrivuppgift är inom området attacker. Ni kan jobba i grupper om 2 och 2, eller individuellt. Rapportmall finns att tillgå för LaTeX/Overleaf i kursrepot under [`example/report-template-latex`](https://github.com/dbwebb-se/itsec/tree/master/example/report-template-latex). Det är inte ett krav att skriva i det formatet, men en bra övning. Kanske vill du skriva exjobbet i LaTeX?

Upplägget är enligt följande:

> Du/Ni är ansvarig för systemdrift och utveckling av programvaran på företag (välj själva företagets inriktning). Ledningen har bett om en rapport som berättar vilka risker och vilka typer av attacker som de kan förvänta sig mot företagets system och vilka konsekvenser som lyckade attacker kan få. Företagsledningen vill veta hur Du/Ni har planerat företages skydd och eventuella åtgärder när attacker lyckas.

Skriv en rapport på två till fyra sidor text, exklusive försättssida och exklusive referenssida. Det går bra att avgränsa och bara svara på delar av ledningens fråga. Tid och utrymme i rapporten är begränsat så det är okey att utelämna vissa delar. Men se till att rapporten hänger ihop som en helhet och innehåller minst 5 relevanta referenser. Vill ni dyka ned i en specifik fråga så går det bra, vill ni täcka flera frågor mer översiktligt så går det också bra.

Ni som jobbar i grupp skriver tre till fyra sidor, exklusive försättssida och exklusive referenssida. Ni redovisar individuellt på Canvas och skriver in namnen på gruppmedlemmarna i rapporten. 

2) Lär dig göra attacker med hjälp av "[OWASP Juice Shop](https://owasp.org/www-project-juice-shop/)". Ladda ner, installera och kör lokalt. Välj gärna "From Sources". Följ instruktionerna i README.md (jag valde instruktionerna för "From Sources"). OBS! Använd Powershell! Starta enligt instruktionerna och gör gärna alla "hacking tutorials". Redovisa genom att ta en skärmdump på din scoreboard samt namn och beskrivning på alla lösta utmaningar (minst 10) du gjort. Tips! Använd gärna utvecklarverktyget (Developer Tools) i din webbläsare för att bättre se vad som händer.

3) Film-uppgiften är inom ämnet "hur tänker en hacker/cracker/attacker"? I spellistan "[Internet - kultur och historia](https://www.youtube.com/playlist?list=PLKtP9l5q3ce-NLQecGIdq3LnATTn0gKal)" finns ett antal filmer/dokumentärer som berör olika händelser inom Internet. Välj en av dessa filmer, eller en som du själv anser liknande, titta på filmen och försök sedan svara på frågan "Vad driver en hacker och hur tänker en hacker?" Du skriver svaret på Canvas i samband med din inlämning. Välj att titta på filmen individuellt, eller tillsammans med din gruppkompis för rapporten.

<!-- mer videor till denna spellistan? -->

Extrauppgifter  {#extra}
-------------------------------------------

1) Fortsätt gör utmaningar i Juice shop. Redovisa dina framgångar med en ny skärmdump.

2) Träna på lösenordshantering genom att förbättra lösenordshanteringen i appen [Super Secure User Storage](/uppgift/losenordshantering). Redovisa dina framgångar genom att berätta om dem i en fil eller i textfältet när du redovisar kmom03.


Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

På Canvas finns det ett Quiz för varje kursmoment. För att du ska kunna lämna in uppgiften till kursmomentet måste du ha besvarat quizen.

1. Gör uppgifterna.   
1. Gör kursmomentets quiz.   
1. Rapporten om attacker (uppgift 1), ladda upp din fil, report.pdf, på Canvas Kmom03 Rapport.
1. Resultatet (skärmdump) från utmaningarna i Juice shop (uppgift 2) laddar du upp på Canvas Kmom03.
1. Hackeruppgiften (uppgift 3) redovisar du på Canvas Kmom03.
1. Resultatet (filerna) från extra uppgifterna laddar du upp på Canvas Kmom03. (OBS valfritt)

<!-- Gör en gruppinlämning på Canvas, om ni jobbade i grupp och ladda upp rapporten som pdf, senast fredagen veckan efter att kmomet är avslutat. Svara på följande frågor i textfältet på Canvas (ge ett svar som grupp, såg ni olika filmer så ger ni två svar på den delen):

* Berätta vilken film du såg, lämna en länk till filmen om den finns på nätet och inte är med i spellistan ovan. Svara på "Vad driver en hacker och hur tänker en hacker?" och koppla till vad filmen berättade för dig. Skriv kortfattat om max 15 rader.
* Summera, vilken är din/er TIL för detta kmom? -->
