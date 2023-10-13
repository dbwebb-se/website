---
author:
    - nik
revision:
    "2020-11-19": (A, nik) Nysläpp för design-v3
...
Kmom04: Färg
====================================

Vi tittar på färger, färghjulet och olika tekniker för att kombinera färger i ett sammanhang, så kallade färgscheman.

Ett akromatiskt färgschema med vitt, svart och nyanser av grått.

<table style="border-spacing: 4px; border-collapse: separate">
<tr>
<td style="height: 50px; width: 50px; background-color: #000">
<td style="height: 50px; width: 50px; background-color: #333">
<td style="height: 50px; width: 50px; background-color: #666">
<td style="height: 50px; width: 50px; background-color: #999">
<td style="height: 50px; width: 50px; background-color: #ccc">
<td style="height: 50px; width: 50px; background-color: #eee">
</tr>
</table>

Ett monokromatiskt färgschema med en basfärg och olika nyanser av den.

<table style="border-spacing: 4px; border-collapse: separate">
<tr>
<td style="height: 50px; width: 50px; background-color: #500">
<td style="height: 50px; width: 50px; background-color: #a44">
<td style="height: 50px; width: 50px; background-color: #d46a6a">
<td style="height: 50px; width: 50px; background-color: #faa">
</tr>
</table>

Ett _complementary_ färgschema med en röd basfärg och två komplementfärger (blå/grön) på motsvarande sida av färghjulet, som kan användas som försiktigt som accentfärger eller för att kraftfullt färglägga webbplatsen.

<table style="border-spacing: 4px; border-collapse: separate">
<tr>
<td style="height: 50px; width: 50px; background-color: #500">
<td style="height: 50px; width: 50px; background-color: #aa3939">
<td style="height: 50px; width: 50px; background-color: #d46a6a">
<td style="height: 50px; width: 50px; background-color: #a44">
<td style="height: 50px; width: 50px; background-color: #246c60">
<td style="height: 50px; width: 50px; background-color: #43877b">
<td style="height: 50px; width: 50px; background-color: #729c34">
<td style="height: 50px; width: 50px; background-color: #9bc362">
</tr>
</table>

Vi jobbar med tekniker kring hur en webbplats kan färgläggas. Men innan det funderar vi igenom om de vanligaste webbplatserna är färgglada eller inte? Det kan vara så att många webbplatser har ett begränsat användande av färger. Om det stämmer, hur kan det komma sig?

Vi lyfter in vår nyfunna kunskap om färger till vårt nuvarande tema och därefter ska vi implementera ett "Dark Theme" på vår hemsida, som bygger på vårt ursprungliga tema. Detta blir en smidig övergång om vi använder oss utav variabler i vår SASS-kod.

Vi gör även ett en studie om webbplatsers val av färger och typografi där vi skriver en rapport som vi publicerar i vår portfolio-sida. Rapporten kan man välja att lösa i grupp eller enskilt.

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Läs & Studera  {#lasanvisningar}
---------------------------------

*(ca: 8-10 studietimmar)*


### Verktyg {#verktyg}

Nedan är några verktyg/hemsidor som kan hjälpa er hitta färger att jobba ifrån.

* [Color Wheel - Adobe](https://color.adobe.com/) - Color Wheel, a color palette generator
* [FlatUIColors](https://flatuicolors.com/) - Flat colors (similar to materialui.com)
* [Web Gradients](https://webgradients.com) - Fresh Backgrounds Gradients



### Kurslitteratur  {#kurslitteratur}

Läs följande:

1. Läs i boken "[The principles of Beautiful Web Design](kunskap/boken-the-principles-of-beautiful-web-design)".
    * Kap 2: Color



### Design med HTML5 och CSS3  {#guide}

1. Läs igenom följande sektion i guiden "[Design med HTML5 och CSS3](guide/design-med-html5-och-css3)".
    * [Färg](guide/design-med-html5-och-css3/farg)

I sektionen [Färg](guide/design-med-html5-och-css3/farg) tittar vi på hur vi kan använda färg för att skapa en specifik känsla på en webbplats. Vi börjar med en kort introduktion till färgteori för att gå vidare till hur vi kan välja vilka färgar som fungerar tillsammans.



### Färg {#color}

Lös följande artiklar för att få en bakgrund i allmän layout kopplad till färger och färgscheman.

1. Läs artikeln "[The Characteristics of Minimalism in Web Design](https://www.nngroup.com/articles/characteristics-minimalism/)". Artikeln sammanställer ett antal webbplatsers karaktäristik och diskuterar kring valet av stil och färgval. Fokuset är på minimalism, att "hålla det enkelt".

1. Läs artikeln "[An Introduction to Color Theory for Web Designers](https://webdesign.tutsplus.com/articles/an-introduction-to-color-theory-for-web-designers--webdesign-1437)" som ger insyn i hur man väljer färger och färgschema för en webbplats.

1. Läs [kapitel 13 i boken Web Design - The Complete Reference](http://www.webdesignref.com/chapters/13/ch13-16.htm). Det handlar om "Color and Usability" och "The Hidden Meaning of Colors" och ger en kort introduktion till färger och webbdesign.



### Om färgteori {#farg}

Läs följande artikel "Traditional and Modern color theory", om du finner den intressant. Det handlar om färgteori, varianter av färghjul och hur färgteori lärs ut kontra dess historik.

* [Part 1: Modern colour theory](http://www.huevaluechroma.com/001.php)
* [Part 1: Traditional colour theory strikes back](http://www.huevaluechroma.com/002.php)



### Om Dark Mode {#darkmode}

Läs igenom följande artikel, främst del 6, kring hur man kan tänka när man applicerar ett mörkt tema på en hemsida.

* [A Complete Guide to Dark Mode on the Web](https://css-tricks.com/a-complete-guide-to-dark-mode-on-the-web/)
    * [Part 6 - Design Considerations](https://css-tricks.com/a-complete-guide-to-dark-mode-on-the-web/#design)



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 8-10 studietimmar)*



### Övning {#ovning}

1. Arbeta igenom artikeln [Sätt upp session i Pico](kunskap/satt-upp-session-i-pico) som beskriver hur du sätter upp sessionen i Pico. Detta tillåter oss att byta tema.



### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Utvärdera webbplatsers färgval och känslan de signalerar](uppgift/utvardera-webbplatsers-fargval-och-kanslan-de-signalerar-v2)". Du skall göra en analys av webbplatser och skriva en kort rapport. Jobba enskilt eller i grupp. Spara allt i `me/portfolio`.

1. Utför uppgiften "[Skapa ett mörkt tema](uppgift/skapa-ett-morkt-tema)" där du jobbar vidare med ditt nuvarande tema och lägger till ett mörkt tema.

1. Försäkra dig om att du har gjort `dbwebb publishpure me` och taggat din inlämning med version 4.0.0 (eller högre) samt pushat repot inklusive taggarna till GitHub.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1 studietimme)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Kom ihåg att publicera din portfölj till GitHub. Använd nedanstående kommandon i terminal när du står i `me/portfolio:

```shell
git push
git push origin --tags
```

Publicera sedan till studentservern med följande kommando:

```shell
dbwebb publishpure me
```

Gör Quiz på Canvas och lämna sedan in din inlämning i den nu upplåsta uppgiften. Länka till din portfölj på studentservern som en del av din inlämning.



Testa din inlämning {#testa}
-----------------------------------------------

Kommandot `dbwebb test` testar att grunderna för kmom'et är på plats. Vår rättning utgår från detta kommando.

```shell
# Stå i kursrepots rot (dbwebb-kurser/design)
$ dbwebb update
$ dbwebb test kmom04
```
