---
author:
    - nik
category:
    - design
    - cimage
revision:
    "2020-11-26": (A, nik) Skapad inför HT2020.
...
Cimage - Hur fungerar det?
==================================

En väg att gå med optimering och manipulering av bilder är att använda moduler för det. Vi ska jobba med Mikael Roos egenbyggda Iimage, som bland annat ger oss tillgång till följande funktionalitet:

* Resize, crop
* Filter
* Quality, file size

Vi ska kolla lite närmre på hur man kan använda sig av detta och hur ni kan använda det i eran portfolio för att dels matcha färgschemat ni går efter men även för att minska storleken på de filer som laddas in.



<!--more-->



Installation & Användning {#installation}
--------------------------------------

För att använda Cimage behöver man installera det via Composer och sätta upp en cache-mapp, där de bearbetade bilderna hamnar, och en redirect regel i vår `.htaccess`. Detta har vi dock redan löst i den installation ni fått börja med i kursen, så vi kan köra vidare med hur man arbetar med Cimage.

Våra bilder ligger i nuläget i mappen `assets/img` och vi kan nå dem genom `%assets_url%/img` i våra `.twig`-filer eller `![me](%assets_url%/img)` i våra Markdown. Då hämtar den in bilderna "raw", det fungerar men nu vill vi stället använda Cimage. Vi kollar på redirect regeln som ligger i `.htaccess` så kan vi se hur vi kan göra det.

De två rader vi är intresserade av är rad 12 och 19 för mig, de innehåller följande:

```
RewriteRule ^image/(.*)$ /~niaa16/dbwebb-kurser/design/me/portfolio/assets/cimage/img.php?src=$1 [QSA,NC,L]
...
RewriteRule ^image/(.*)$ assets/cimage/img.php?src=$1 [QSA,NC,L]
```

Den översta är för studentservern och den undre är för vår lokala miljö. Den säger att får Apache (vår webbserver) en förfrågan på `image/` så kommer den skicka den förfrågan till Cimage istället, som kommer att hantera den (och arbeta emot `assets/img/`). Som exempel kan vi ta `assets/img/leaf_256x256.png` som är dbwebb lövet och se hur det först laddas in via Markdown:

```
# Laddar in bilden som vanligt
![Leaf](%assets_url%/img/leaf_256x256.png)
# Laddar in bilden via Cimage
![Leaf](image/leaf_256x256.png)
```
Och i våra `.twig`-filer är det inte svårare än såhär:
```twig
# Som vanligt
<img class="flash-img" src="{{ assets_url }}/img/leaf_256x256.png">
# Via Cimage
<img class="flash-img" src="{{ base_url }}/image/leaf_256x256.png">
```

Då vet vi hur vi laddar in bilder via Cimage, då kan vi köra vidare med att se vad den kan hjälpa oss att göra.



Ändra storlek & beskärning {#storlek_beskar}
--------------------------------------

[FIGURE src=image/design-v3/cimage/crop-stretch.png&h=300 caption="Hur stretch och crop-to-fit kan se ut" class="right"]

Vi börjar med att kolla hur vi kan ändra storleken på bilden. Cimage håller koll på vad den behöver göra genom förfrågan den får genom webbläsaren. Så t.ex `image/leaf_256x256.png?w=150&h=150` ger en bild som är 150x150 pixlar stor. Om vi bara sätter bredden `?w=150` så behåller den sin aspect ratio på 1:1 men minskar bredden till 150px. Det går även att använda samma parameterar för att göra bilden större, t.ex. `image/leaf_256x256.png?w=1500&h=1500` ger en 1500x1500 pixlar stor bild, även om det kanske inte hade sett så bra ut när orginalet är 250x250.

Det finns även möjlighet att stretcha sina bilder eller köra en crop-to-fit, vilket är två andra vanliga sätt att jobba med bilder. Vi kollar på ett exempel som visar båda:

```markdown
![Leaf](image/leaf_256x256.png?h=250&w=50&stretch)
![Leaf](image/leaf_256x256.png?h=250&w=50&crop-to-fit)
```

Stretch kan fungera, men är oftast inget man vill göra då det förstör bildens aspect ratio. Det finns en del andra regler som man kan jobba med, som går att läsa mer om i [dokumentationen för cimage](https://cimage.se/doc/resize).

Vi kan även jobba med %, det kan vara trevligt för att slippa behöva räkna ut vad man bör använda. T.ex. så har jag min header-bild som är 6000x3375 och landar på 1.7MB stor, det känns tungt för min sida, så jag väljer att minska den till 50% av dess originalbredd:

```markdown
![Leaf](image/header.jpg?width=50%)
```

Nu är den istället 273 KB, dvs 16% av storleken av ursprungsbilden i storlek, utan någon märkbar skillnad i kvalité. Det känns bra och gör att min sida går snabbare att ladda in, även på sämre linor.



### Beskärning {#beskar}

Om man vill beskära sin bild så kan man använda sig av regeln `?area=`. Area säger vilken del av bilden vi faktiskt vill ha ut och tar emot 4 värden i ordningen `top,right,bottom,left` och mäts i %. Som exempel kan vi hämta ut halva dbwebb-lövet på följande sätt:

```markdown
![Leaf](image/leaf_256x256.png?area=50,0,0,0)
![Leaf](image/leaf_256x256.png?area=0,50,0,0)
![Leaf](image/leaf_256x256.png?area=0,0,50,0)
![Leaf](image/leaf_256x256.png?area=0,0,0,50)
```

[FIGURE src=image/design-v3/cimage/area.png&h=400 caption="Hur man kan använda area för att beskära"]

[FIGURE src=image/design-v3/cimage/crop.png caption="Hur man kan använda area för att beskära" class="right"]

Vi kan även beskära en specifik del av bilden genom att använda `?crop=` som tar emot fyra värden i ordningen `width, height, start_x, start_y`. Ett exempel på detta kan vara att beskära de mittersta 50x50 på lövet.

```markdown
![Leaf](image/leaf_256x256.png?crop=50,50,100,100)
```

Till höger kan du se hur resultatet blev.



Kvalité & filstorlek {#kvalite}
--------------------------------------

En av de viktigare funktionerna med att använda ett sånt här verktyg är att vi kan optimera våra bilder så de går snabbare att ladda in på hemsidan.

Filformat är en viktig del i det hela och vi kan spara en del plats genom att använda t.ex. `.jpg` eller `.gif` istället för `.png` som normalt sett brukar vara större. Cimage hjälper oss med detta genom att erbjuda `?save-as` som tillåter oss att konvertera bilder mellan olika format, där bland `gif`, `jpg` och `png`.

```markdown
![Leaf](image/header.jpg?width=50%&save-as=jpg)
![Leaf](image/header.jpg?width=50%&save-as=png)
![Leaf](image/header.jpg?width=50%&save-as=gif)
```

Min header-bild som jag jobbade med tidigare i artikeln är redan en `.jpg` fil och tjänar därför inget på att laddas in som `?save-as=jpg`. Dock så kan jag istället använda mig av quality, `?q=` för att sätta kvalitén i ett procent värde. Jag testar att sätta 10% i kvalité, då ser jag att himlen tappar märkbart i kvalité. Jag höjer med 10% intervaller upp till 50% (`?q=50`) och får något som ser snarlikt ut min `header.jpg?width=50` men där jag har skalat bort ytterligare 33KB (13%) av storleken.

```markdown
![Leaf](image/header.jpg?width=50%)
![Leaf](image/header.jpg?width=50%&q=50)
```

Vi kan se att det stora hoppet i filstorlek är att gå ifrån `.png` till `.jpg`, men det är även ett stort hopp i att minska bredden och sen ytterligare ett hopp att minska kvalitén. Vill man se ett tydligt exempel på vad de lägre stegen i kvalité kan göra både på bilden och filstorleken finns det ett bra exempel i dokumentationen, [JPEG quality settings](https://cimage.se/doc/jpeg-quality-settings).

| URL                             | Storlek | Skillnad |
|---------------------------------|---------|----------|
| image/header.jpg                | 1700KB  | 100%     |
| image/header.jpg?width=50%      | 273KB   | 16%      |
| image/header.jpg?width=50%&q=50 | 240KB   | 14.1%    |



Filter {#filter}
--------------------------------------

Det finns en mängd filter man kan se på "[Filters and convolution](https://cimage.se/doc/filters)" och "[Filters and effects from PHP GD](https://cimage.se/doc/gdfilter)" men tabellen nedan nämner de som är mest av intresse.

| Filter     | URL                 | Example                                     |
|------------|---------------------|---------------------------------------------|
| Lighten    | ?convolve=lighten   | image/header.jpg?width=50%&convolve=lighten |
| Darken     | ?convolve=darken    | image/header.jpg?width=50%&convolve=darken  |
| Blur       | ?blur               | image/header.jpg?width=50%&blur             |
| Grayscale  | ?f=grayscale        | image/header.jpg?width=50%&f=grayscale      |
| Brightness | ?f=brightness,VALUE | image/header.jpg?width=50%&f=brightness,50  |
| Contrast   | ?f=constrast,VALUE  | image/header.jpg?width=50%&f=contrast,50    |



Felsökning {#felsokning}
--------------------------------------

Ibland kan något gå fel eller inte fungera som man vill. En bra start är att lägga på flaggan `?nc` som står för `no-cache`. Den ser till att skapa om bilden ifall något i cachen skulle gått fel.

Nästa steg är att lägga på `?v` flaggan, som ger oss verbose output. Den kan ta en stund att ladda in och man kan behöva öppna bilden i en ny flik för att få se utskriften.



Avslutningsvis {#avslut}
--------------------------------------

Om du vill läsa mer om vad som kan göras i Cimage rekommenderar jag att skumma igenom dokumentationen som du kan hitta [här](https://cimage.se/doc).

Hojta till om något är oklart!
