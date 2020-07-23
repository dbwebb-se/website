---
author: lew
revision:
    "2018-06-13": "(A, lew) Första versionen."
...
Resultatet {#resultatet}
=======================

Nu får vi nog återgå till Murphy och sidan eller webbplatsen. Vi har tittat igenom lite olika tekniker som hjälper oss att strukturera och styla sidan så vi kan väl ta en titt på hur det kan se ut när det är implementerat?

[FIGURE src=/image/htmlphp/guide/murphy/step4.png?w=w2 caption="Lite mer style."]

Det var inte så färgglatt, men det passar Murphys grå sinnesstämning. Vi kan se CSS3-konstruktionen `gradient` som bakgrund, sidan hoppar inte till då det alltid visas en scrollbar och `main`-elementet har en minsta höjd. Den aktuella sidan har även fått lite style.

Tack vare `media-queries` kan man kontrollera utseendet i mobil-läge:

[FIGURE src=/image/htmlphp/guide/murphy/iphone-portrait2.png?h=c8 caption="Lite mer style för mobilt läge."]

Studera koden på [Codepen](https://codepen.io/dbwebb/pen/MXBVJq). Pröva gärna att ändra i koden och se hur det påverkar sidan.
