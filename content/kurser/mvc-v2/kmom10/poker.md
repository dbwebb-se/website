---
author:
    - mos
revision:
    "2024-04-09": "(C, mos) Bild och förtydligande krav på femkortspoker."
    "2023-05-16": "(B, mos) Uppdaterad inför vt23."
    "2022-05-06": "(A, mos) Första utgåvan mvc-v2."
...
Kortspel (poker/black jack)
==================================

Denna uppgift handlar om att bygga vidare på din kodbas om kort och kortspel. Det finns förslag i olika svårighetsgrad.

För alla kort hanterar du satsningar i "pengar" och sparar undan i spelarens "bankkonto". Låt användaren påbörja spelet genom att ange sitt "spelarnamn".



Black Jack {#1}
----------------------------------

Gör ett Black Jack spel där du är spelaren och du kan spela 1 till 3 händer samtidigt mot banken. Följ de riktiga reglerna för Black Jack.

[FIGURE src="image/kurs/mvc/blackjack_board.jpeg?cf&a=15,0,25,0"]

Förslag till optionella delar kan vara följande:

* Splitta
* Statistik visualiserad av dragna kort
* Korträkning (en variant av ej tillåten aktivitet)
* Låt datorn spela en hand och implementera intelligens hur bra datorn skall vara.



Poker Square {#2}
----------------------------------

Patiensen "[Poker Square](https://en.wikipedia.org/wiki/Poker_squares)" kan vara ett trevligt spel att implementera. Här kan man spela mot sig själv och samla poängen i en highscorelista. Man placerar ut korten i ett rutnät och försöker få så höga pokerhänder som möjligt i varje riktning.

[FIGURE src="img/kurs/mvc/poker_solitaire.jpg"]

Det kan vara lite utmanande att skriva koden som kontrollerar vilken hand spelaren har, i respektive riktning, och hur många poäng det blir.

Förslag till optionella delar kan vara följande:

* Låt datorn spela en runda på egen hand och implementera någon form av intelligens till spelaren.
* Visualisera statistik och tips till spelaren.



Femkortspoker {#3}
----------------------------------

Du spelar traditionell [femkortspoker](https://en.wikipedia.org/wiki/Five-card_draw) mot datorn där man får fem kort och tre byten. Inför varje spel kan man satsa pengar i en pott.

[FIGURE src="img/kurs/mvc/draw-poker-table.png"]

Här är utmaning att skriva kod så att datorn kan få en bra hand. Men du kan naturligtvis göra det relativt enkelt och slumpmässigt.

Utmaningen är också att bestämma vilken hand man har och om den handen vinner över motspelaren. Det bör bli en del logiskt kodande kring det och där kan man ha nytta av enhetstester.

Du skall spela mot datorn.

Förslag till optionella delar kan vara följande:

* Gör flera varianter av intelligens till datorn, någon enkel och någon mer avancerad.
* Gör ytterligare en spelare som kan vara med.
    * En apa som spelar helt slumpmässigt.
    * Ytterligare en medspelare.
* Visualisera statistik och tips till spelaren.
* Gör satsningen flexibel så att man kan satsa efter varje byte.



Texas hold'em sjukortspoker {#4}
----------------------------------

En populär variant av poker är sjukortspoker och [Texas hold'em](https://en.wikipedia.org/wiki/Texas_hold_%27em). Implementera spelet så att du spelar mot två datorspelare som har varierande intelligens i sina spel och satsningar. Försök göra en datorspelare som spelar med högre intelligens och en som har låg intelligen (slumpmässig).

[FIGURE src="img/kurs/mvc/texsholdem-gameboard.webp"]

Det blir troligen en del kod för att hantera en spelrunda och det blir nog en del kod för att hantera vilken hand som är bäst.

Detta är troligen ett utmanande projekt om man skall göra det fullt ut.



Stödgrupper för spel {#stod}
----------------------------------

Denna uppgiften handlar inte om att promota spel i allmänhet, det är bara en trivsam och utmanande kodningsuppgift. Det finns [stödgrupper och hjälp att få för spelberoende](https://spelberoende.se/).
