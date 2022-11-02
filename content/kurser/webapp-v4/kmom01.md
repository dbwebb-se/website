---
author:
  - efo
revision:
  "2022-01-17": (A, efo) Första utgåvan för kursen.
...
kmom01: Vår första React Native app
==================================

Vi ska i detta kursmomentet ta en titt på hur vi utvecklar appar med hjälp av ramverken React Native och Expo. Vi tar en titt på båda ramverken och hur vi utvecklar med hjälp av TypeScript i React Native. Dessutom introduceras Lager-API:t som är med oss i kmom01-kmom06 och hur vi hämtar data från det API:t.



<!--more-->

Såhär kan det se ut när vi är klara med kmom01:

[YOUTUBE src=MqZQssrFMDQ width=630 caption="Lager appen del 1."]



<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Labbmiljön  {#labbmiljo}
---------------------------------

*(ca: 1 studietimme)*

Det finns en [längre beskrivning om kursens labbmiljö](./../installera-labbmiljo). Läs den om du är osäker på vad som skall göras, eller om detta är din första dbwebb-kurs.

[Installera labbmiljön](kurser/webapp-v4/labbmiljo) för kursen.

Uppdatera [dbwebb-cli](dbwebb-cli) samt klona och initiera kursrepot.

```text
# Gå till din katalog för dbwebb-kurser
dbwebb selfupdate
dbwebb clone webapp
cd webapp
dbwebb init
```



Läsanvisningar  {#lasanvisningar}
---------------------------------

*(ca: 6-10 studietimmar)*



### Artiklar {#artiklar}

Läs följande artiklar för att få bakgrunden till övningarna.

Läs artiklarna [Core Components and Native Components](https://reactnative.dev/docs/intro-react-native-components) och [React Fundamentals](https://reactnative.dev/docs/intro-react) för att bekanta dig med grunderna för React och React Native.

Läs dessutom [Walkthrough](https://docs.expo.dev/introduction/walkthrough/) för att utforska flödet för utveckling och driftsättning i Expo.

För att förstå ett viktigt begrepp inom JavaScript-ramverk komponenter är artikeln [React Fundamentals](https://reactnative.dev/docs/intro-react) en bra start.



### Video  {#video}

1. Det finns en [videoserie](https://youtube.com/playlist?list=PLKtP9l5q3ce8Akmp6hSW78cDuHHNylpRG) kopplat till kursen, titta på videos som börjar på 1.

Dessutom är detta en bra introduktion till JavaScript ramverket React:

[YOUTUBE src=Tn6-PIqc4UM width=630 caption="Fireship React in 100 seconds."]



### Lästips {#lastips}

1. Läs översiktligt denna samling av "best-practices" för typografi på webben [Typography Handbook](http://typographyhandbook.com). Spara den i dina bokmärken som en framtida referens.



### Git & GitHub {#git}

För kurspaketare introduceras Git och GitHub i denna kursen. Git är ett versionshanteringssystem för kod och GitHub är en webbplats där man kan ladda upp sitt Git-repo och använda extra tjänster. Om du inte har ett konto på GitHub gör följande steg nedan.

1. Bekanta dig kort med [dokumentation på Gits hemsida](https://git-scm.com/doc). Där finner du referensinformation, en onlinebok om Git och ett antal korta videor som ger dig grunderna till vad Git och versionshantering handlar om.

1. Skaffa dig ett konto på [GitHub](https://github.com/). Du behöver det för att ladda upp och publicera ditt Git-repo. Det är gratis med konto och att ladda upp publika repon.

1. Ägna en stund åt att bekanta dig med webbplatser för GitHub. Du kan även kort och översiktligt kika på de guider och videor som finns för GitHub. Notera att de täcker så mycket mer än vad vi kommer jobba med i kursen så det kan räcka att du endast noterar att det existerar [guider för hur man jobbar med GitHub](https://guides.github.com/).

Förutom ovanstående finns video-spellistan "Introduktion till git":

[YOUTUBE src="LL-a3YTeL2M" list="PLKtP9l5q3ce_mjCcNeDNhVQIU_DM2P4WS" width=700 caption="Introduktion till git"]



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 6-10 studietimmar)*



### Övningar {#ovningar}

Gör följande övningar för att träna inför uppgifterna.

1. För att introduceras till eller repetera Git och Github jobba igenom guiden "[Kom igång med Git och GitHub](guide/git)". Denna guide introducerar dig till Git/GitHub, ett verktyg som är branchstandard för att versionshantera kod.

1. Läs igenom artikeln "[Typografi i mobila enheter](kunskap/typografi-i-mobila-enheter)". Spara koden i `me/kmom01/typography`.

1. Gör övningen "[Introduktion till Lager-API:t](kunskap/introduktion-till-lager-api)" för att bekanta dig med Lager-API:t som vi kommer använda i kursen.

1. Gör övningen "[En app i Expo och React Native](kunskap/en-app-i-expo-och-react-native)". Spara resultatet i `me/lager`.



### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Lager appen del 1](uppgift/lager-appen-del-1-v2)". Spara din kod i `me/lager`.



#### Kontrollera din inlämning {#kontrollera}

Se till så att en länk till ditt GitHub-repo ingår som en del av din inlämning på Canvas. Länken ska vara på formen: https://github.com/emilfolino/lager-v4.git

Emil visar i nedanstående video hur man gör en inlämning i webapp kursen.

[YOUTUBE src=vgMwce6zhVs width=630 caption="En inlämning i webapp"]



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten. __Redovisningstexten ska enbart lämnas in via Canvas.__

* Är du sedan tidigare bekant med utveckling av mobila appar?
* Vad tycker du om utvecklingsmiljön med React Native och Expo jämfört med utvecklingsmiljön i tidigare dbwebb-kurser?
* Vilket är den viktigaste lärdomen du gjort om typografi för mobila enheter?
* Du har i kursmomentet hämtat data från ett API. Hur kändes detta?

TIL är en akronym för “Today I Learned” vilket leksamt anspelar på att det finns alltid nya saker att lära sig, varje dag. Man brukar lyfta upp saker man lärt sig och där man kanske hajade till lite extra över dess nyttighet eller enkelhet, eller så var det bara en ny lärdom för dagen som man vill notera.

* Vilken är din TIL för detta kmom?
