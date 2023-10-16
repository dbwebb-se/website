---
author:
    - nik
    - efo
category:
    - kurs/design
    - tema
revision:
    "2021-11-15": (B, efo) Uppdaterad med peer-review
    "2020-11-19": (A, nik) Uppdaterad till version 2 inför design-v3.
...
Utvärdera webbplatsers färgval och känslan de signalerar (v2)
===================================

Du skall välja ut ett antal olika webbplatser och dokumentera deras färgpalett och typografi samt argumentera kring valet av färg kontra den känsla du tror webbplatsen eventuellt vill signalera med sitt färgval.

Du skriver rapporten i ett format som kan benämnas "akademiskt format". Det är för att träna på strukturen inför kommande större skrivuppgifter såsom examensjobb.

Du kan jobba enskilt eller i grupp (2-4 personer) för att lösa denna uppgiften.



<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har läst kurslitteraturen och skaffat dig kunskaper om grundläggande färgteori.

Du har din portfolio-sida där du skall skriva din artikel.



Introduktion {#intro}
-----------------------

Jobba igenom denna introduktion för att förbereda inför uppgiften.



### Skapa rapportfilen {#create}

Skapa en struktur för din rapport, det kommer fler sådana här uppgifter. I förra kursmomentet byggde vi upp en bra struktur för vår teknologisida, jag tycker vi återanvänder den här. För mig kan jag lösa det genom att köra följande:

```bash
# Gå till kursrepot
cd me/portfolio
rsync -av content/technology/index.md content/analysis/
```

Redigera `analysis/index.md` så den fungerar som landningssida för de tre rapporter vi kommer skriva i 04/05/06. Jag skapar alla filer i förväg, så kan jag lösa min `analysis/index.md` direkt.

```bash
# Stå i me/portfolio
touch content/analysis/{01_colors.md,02_load.md,03_design_principles.md}
```

Även om ni jobbar i grupp så skall var och en av er lägga in varsin egen kopia rapporten i sin egen redovisa-sida.



### Färgpalett i markdown dokument {#palett}

När du dokumenterar en färgpalett så kan du lägga den direkt i dokumentet via HTML-kod. Ungefär så här, i en tabell till exempel.

```html
<table style="border-spacing: 4px; border-collapse: separate">
<tr>
<td style="height: 50px; width: 50px; background-color: #ef0">
<td style="height: 50px; width: 50px; background-color: #0ef">
<td style="height: 50px; width: 50px; background-color: #f0e">
</tr>
</table>
```

Du kan skriva ovan HTML-kod rakt in i ett markdown-dokument och följande kommer att visas.

<table style="border-spacing: 4px; border-collapse: separate">
<tr>
<td style="height: 50px; width: 50px; background-color: #ef0">
<td style="height: 50px; width: 50px; background-color: #0ef">
<td style="height: 50px; width: 50px; background-color: #f0e">
</tr>
</table>

Du kan förenkla koden om du lägger in visst stöd i form av klasser i din stylesheet.



### Rapportstruktur {#struct}

När du skriver din rapport så kan du följa denna rubrikstruktur. Det är en struktur som är vanligt använd i rapportsammanhang (och i ditt kommande examensarbete).

```text
Titel på rapporten
=======================

Skriv en eller två rader om vad uppgiften handlar om.

Urval
-----------------------

Berätta vilka webbplatser du valt att undersöka och varför eller hur du gick tillväga när du gjorde ditt urval.

Metod
-----------------------

Berätta kort om din "metod", hur du gör för att utföra undersökningen. Berätta om du använder något speciellt verktyg.

Resultat
-----------------------

Dokumentera dina resultat från din studie. Berätta vad du kom fram till, vilka resultat du hittade och observerade.

Analys
-----------------------

Diskutera och analysera de resultaten du fann.

Referenser
-----------------------

Ange de eventuella referenser du använder dig av, om några.

Övrigt
-----------------------

Skriv ditt eget namn samt vilka gruppmedlemmar som deltog i att författa rapporten.
```

Strukturen är inte absolut nödvändig, se den som en möjlighet att träna på god struktur av rapportskrivning.



Krav {#krav}
-----------------------

1. Välj ut 3 webbplatser som skall analyseras, berätta hur du gjorde urvalet (urval). Tänk att ditt urval påverkar vad du kan komma fram till i din rapport. Gör ditt urval från en kategori av webbplatser, eller välj helt olika kategorier för att jämföra.

[INFO]
Vi kommer göra analyser i kmom04, kmom05 och kmom06. Om du vill analysera samma sidor i alla kmom välj då personsidor, mer finns beskrivit i [kmom06](uppgift/utvardera-webbplatsers-designprinciper-v2).
[/INFO]

2. Berätta om du använde något särskilt verktyg för att göra färganalysen (metod). Berätta dessutom hur du gick till väga när du använde verktyget.

3. För varje webbplats, gör följande (resultat):
    1. Ta en snapshot (bild) på webbplats.
    1. Dokumentera och visualisera färgpaletten som används.
    1. Notera vilken typ av färgschema som använts.
    1. Notera val av typsnitt för H1-H3 samt brödtext.
    1. Notera i en mening om du anser att webbplatsens färgval och typografi motsvarar den profil du tror att webbplatsen vill ha.

4. Skriv ett stycke om dina samlade intryck från resultatet, finns det något värt att nämna, diskutera, att analysera (analys), fick du fram något bra med din studie?

5. I slutet av rapporten skriver du ett eget stycke med namnen på dina gruppmedlemmar.



Tips från coachen {#tips}
-----------------------

Skaffa dig en grupp och diskutera hur färgerna upplevs. Färger och känslor är sånt som kan vara personligt och vi kan få olika upplevelser från samma sak. Det kan vara nyttigt att prata om sånt här i grupp och se hur olika individer uppfattar design på olika sätt (eller inte).

Lycka till och hojta till i Discord om du behöver hjälp!
