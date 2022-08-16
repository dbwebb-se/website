---
author:
    - nik
category:
    - labbmiljö
    - texteditor
revision:
    "2020-05-18": (A, aurora) Första utgåvan.
...
Installera texteditorn Visual Studio Code
==================================

[FIGURE src=/image/vscode/icon.png?w=c3 class="right"]

Visual Studio Code är en editor som du kan använda som utvecklingsverktyg när du programmerar och redigerar textfiler. Här är en kort guide till hur du installerar Visual Studio Code och hur du konfigurerar de vanligaste inställningarna.

<!--more-->

Visual Studio Code finns till flera operativsystem, går under en fri licens (MIT) och utvecklas primärt utav Microsoft men finns även som [öppen källkod på GitHub](https://github.com/microsoft/vscode).



Installera {#installera}
--------------------------------------

[Gå till code.visualstudio.com](https://code.visualstudio.com/), ladda hem och installera den varianten som passar för din miljö.

På Windows får man frågan under installationen om man vill lägga till "Open with Code" när man högerklickar i Utforskaren. Det är en nice-to-have i början när det kan vara lite mycket att navigera med terminalen.

[FIGURE src=/image/vscode/windows_setup.png]

[Det finns dokumentation](https://code.visualstudio.com/docs) som innehåller information kring inställningar, programmeringsspråk som stöds, tips and tricks mm.

När du startar upp Visual Studio Code för första gången får du en trevlig välkomsskärm.

[FIGURE src=/image/vscode/welcome_screen.png?w=w2 caption="Visual Studio Code hälsar dig välkommen."]



Testa din editor {#testa}
--------------------------------------

För att testa hur din editor fungerar, så kan du göra följande exempel.

Ta koden nedan och kopiera in till din editor och spara som `hello.html` i din hemmakatalog.

```text
<!doctype html>
<meta charset="UTF-8"/>
<title>Hello World</title>

<h1>Hello World</h1>
<p>Just trying out Visual Studio Code.</p>

</html>
```

Så här kan det se ut.

[FIGURE src=/image/vscode/language.png?w=w2 caption="Editerar filen hello.html på Windows."]

Titta nere i högra hörnet av Visual Studio Code, så ser du att editorn håller koll på vilken typ av fil som du editerar och färgkodar din kod enligt det språk du använder.

Öppna din filhanterare och leta reda på vad du sparade filen, dubbelklicka på filen och öppna den i en webbläsare. Det kan se ut så här.

[FIGURE src=/image/vscode/html_example.png?w=w2 caption="öppnar filen och visar i en webbläsare på Windows."]

Nu har du koll på grunderna.



Grundinställningar {#grund}
--------------------------------------

Visual Studio Code har inställningar som kan ändras, öppna dem via `ctrl ,` eller `cmd ,` (Mac). Du kan också öppna fönstret för inställningar via menyvalet `File -> Preferences -> Settings` eller `Code -> Preferences -> Settings` (Mac).

[FIGURE src=/image/vscode/settings.png?w=w2 caption="Fönstret för inställningar för Visual Studio Code."]

Du behöver nu dubbelkolla att Visual Studio Code har ett antal nödvändiga inställningar.

* UTF-8 NOBOM
* Soft tabs, tab längd 4 mellanslag
* Radslut Unix style



### Använd UTF-8 NOBOM {#utf8}

Under "Text Editor" och "Files" finns en inställning som heter "Encoding". Du kan också använda sökrutan längst upp och söka på `encoding`.

Standardinställningen är att filerna sparas i formatet UTF-8 utan byte order mark (NOBOM). Låt det vara på det viset. Det handlar om hur filen sparas på disken och vilket format de olika tecknen får. Vi vill använda UTF-8.

[FIGURE src=/image/vscode/encoding.png caption="Encoding skall vara UTF-8 NOBOM (UTF-8)"]



### Använd soft tabs, tab-längd 4 {#softtabs}

Som standard använder Visual Studio Code "Soft Tabs". Vi låter det vara så.

Soft tabs betyder att en tab ersätts med ett motsvarande antal mellanslag. Det gör att det blir enklare att flytta filer mellan olika editorer och användare som kan ha olika inställningar.

Leta efter "Tab Size" och sätt den till 4 mellanslag (den bör vara det som standard).
 
[FIGURE src=/image/vscode/tabsize.png caption="Använd 4 mellanslag för att ersätta en tab."]

Olika kodstandarder kan ha olika rekommendationer om storleken på en soft tab. De vanliga inställningarna är 2 eller 4 mellanslag. I kurserna använder vi 4.

Vi kan också ändra detta smidigt fil-för-fil, genom att klicka på "Spaces: 4" nere i högra hörnet. Ibland kan det hända att vi laddar ner en fil som har en annan setup än oss. Då är det bra att veta hur man ändrar det snabbt.

[FIGURE src=/image/vscode/tabsize_menu.png caption="Tab Size menu"]



### Radslut enligt Unix-style {#lineending}

Vi vill använda radslut enligt Unix-style (`\n`), också kallad LF. Det blir enklast så, för en webbprogrammerare.

Du kan se vilket radslut som används, genom att titta nere till höger. Öppna en ny fil (`ctrl-n`) och kika.

[FIGURE src=/image/vscode/crlf.png caption="På Windows är radbrytning CRLF standard."]

För att ändra filens radslut så klicka på (i detta fallet) CRLF och byt till LF samt spara filen. Det skall se ut så här.

[FIGURE src=/image/vscode/lf.png caption="Använd alltid Unix style radbrytning LF."]

Förutom Windows style radbrytning LF + CR (`\n\r`) så kan du även komma i kontakt med äldre Mac style CR (`\r`).

Vi kör alltid på LF för att undvika problem när vi flyttar filer mellan olika datorer. I vissa fall kan det bli problem när man använder andra typer av radslut. 



### Radslut nya filer enligt LF {#linendstd}

För att underlätta att alla nya filer du skapar verkligen har LF som radslut så kan vi gå in i inställningarna och söka på "eol" (end-of-line). Ursprungligen står det auto, men vi vill ha det som `\n` (LF).

[FIGURE src=image/vscode/eol.png?w=w2 caption="Alltid default radslut till LF."]



Installera tillägg {#tillagg}
--------------------------------------

Visual Studio Code har en hel del tillägg (extensions). Det är små program som bygger ut editorn och vad den kan göra.

Ute till höger har vi en meny som ser ut som byggklossar där vi kan se vilka tillägg vi har installerade och vi har möjlighet att söka efter nya.

[FIGURE src=/image/vscode/extensions.png?w=w2 caption="Sök och installera tillägg för att utöka editorns funktioner."]

Allt eftersom du blir varm i kläderna så är det en bra idé att se vilka tillägg som finns som kan underlätta din vardag som programmerare. Men till att börja med så nöjer vi oss med att konstatera att det finns möjligheter att anpassa sin editor.



Konfigurationsfiler {#config}
--------------------------------------

Visual Studio Code sparar sina konfigurationsfiler som `.json`. Beroende på vilket system du sitter på ligger dessa filer på olika ställen, men det kan vara bra att veta att de finns. Det är ett mer avancerat sätt att arbeta med inställningar, för oss duger det grafiska gränssnittet i editorn.



Avslutningsvis {#avslutning}
--------------------------------------

En editor är ett oerhört viktigt arbetsverktyg för en webbprogrammerare. Oavsett vilken du väljer så finns det alltid olika sätt att anpassa editorn till ditt behov. Om du investerar tid i att lära dig din editor så kan du spara en hel del tid i ditt utvecklingsarbete. 
