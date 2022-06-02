---
author: efo
category: javascript
revision:
  "2022-04-25": (A, efo) Första utgåvan inför kursen webapp v4.
...
Testramverket Jest
==================================

[FIGURE src=/image/webapp/v4/testing_meme3.png?w=c5 class="right"]

Vi tar en titt på Jest som är en "test-runner" för JavaScript. Jest låter oss köra alla våra tester med ett enkelt kommando. Vi kommer sedan använda [React Native Testing Library](https://testing-library.com/docs/react-native-testing-library/intro) för att underlätta vissa funktioner som till exempel att rendera olika komponenter.



<!--more-->



Enhetstester {#unit}
--------------------------------------

I tidigare kurser har vi [introducerats till enhetstester](https://dbwebb.se/kunskap/unittest-i-python_1). Enhetstester är ett sätt att säkerställa att varje enskild del av koden fungerar som den ska. I många sammanhang räcker det inte hela vägen då vi även vill säkerställa att olika delar "samverkar" på rätt sätt.

Ett sätt att testa detta är integrationstestning där vi testar om enheter fungerar tillsammans på rätt sätt.

Ett annat sätt är att utgå från funktionen i applikationen och testa utifrån hur det är tanken att applikationen ska användas. Vi ska testa på detta sättet i denna övningen.



Installation {#installation}
--------------------------------------

Det mesta av detta bör ha gjorts innan, men säkerställ gärna att det stämmer genom att gå igenom stegen ändå.

Först installerar vi Jest och React Native Testing Library.

```shell
expo install jest-expo jest @testing-library/react-native
```

Sedan lägger vi till ett script i `package.json` under `scripts`-delen där vi vill att `npm test` utför `jest` kommandot. Dessutom lägger vi till en del till `package.json` där vi talar om att vi vill använda `jest-expo`.

Nedan visas den relevanta delen av `package.json`.

```json
"scripts": {
  "start": "expo start",
  "android": "expo start --android",
  "ios": "expo start --ios",
  "web": "expo start --web",
  "eject": "expo eject",
  "test": "jest"
},
"jest": {
  "preset": "jest-expo"
},
```



Vårt första test {#first-test}
--------------------------------------

För att vår testkod ska knytas till funktionen av våra app väljer vi att skriva ett use-case för varje test vi implementerar. Vi kan sedan använda denna texten direkt i våra test så vi kopplar detta hårt. Ett use-case är ett avgränsat och tydligt definierat sätt att beskriva hur appen används. Det kan till exempel vara vad som förväntas finnas på skärmen eller vad som händer när man trycker på en knapp. Use-cases kan skrivas av både tekniskt kunniga personer, men även av kravställare eller beställare och ska vara formulerat med ett icke-tekniskt språk.

Vi tar ett väldigt enkelt exempel som vi kommer testa mot längre ner i denna artikel.

> I appen ska det finnas en Lagerförteckning med en rubrik Lagerförteckning.

Så låt oss först skapa lite struktur, sedan börjar vi skriva vår test-kod.



### Struktur och testkod {#structure}

För att vi ska få lite struktur på testerna och inte blanda test filer med komponenter och modeller skapar vi en katalog `__test__` i roten av vårt repo. I den katalogen väljer jag att skapa en fil `Stock.test.js` då jag vill börja med att testa `Stock`-komponenten vi skrev i kmom01.

Vi kommer döpa test-filerna på samma sätt som våra komponenter men med filändelsen `.test.js`.

Vi börjar med att skriva vårt test där vi vill kolla om det finns en rubrik med "Lagerförteckning" som en del av den renderade komponenten. Vi börjar med att importera funktionen `render` från `testing-library` och komponenten `Stock`, som vi vill testa. Vi skriver sedan en förklarande text till testet. Denna texten kommer synas i terminalen när vi kör våra tester med `npm test`, så ett bra tips är att skriva tydliga beskrivningar gärna kopplat till specifika use-cases.

```javascript
import { render } from '@testing-library/react-native';
import Stock from '../components/Stock';

test('header should exist containing text Lagerförteckning', async () => {
    const { getByText } = render(<Stock />);
    const header = await getByText('Lagerförteckning');

    expect(header).toBeDefined();
});
```

Vi går nu till terminalen och kör kommandot `npm test` i katalogen `lager`. Detta kommandot kör alla våra tester som finns för vår app.

Vi ska då gärna stöta på patrull direkt och får att testen inte går igenom på grund av ett fel i `StockList` komponenten. Den viktiga delen av felmeddelandet ser ut på följande sätt.

```shell
BTHMAC0169:lager efo$ npm test

> lager@1.0.0 test
> jest

 FAIL  __tests__/Stock.test.js
  ✕ header should exists containing Lagerförteckning (382 ms)

  ● header should exists containing Lagerförteckning

    TypeError: Cannot read properties of undefined (reading 'map')

      12 |   }, []);
      13 |
    > 14 |   const list = products.map((product, index) => {
         |                         ^
      15 |     return <Text
      16 |             key={index}
      17 |             style={{ ...Typography.normal }}

      at StockList (components/Stock.tsx:14:25)
```



### Testa varje komponent för sig {#forsig}

Då vi vill kunna testa varje komponent oberoende av andra komponenten väljer vi i detta fallet att skapa en "mock" av `StockList` komponenten. Ni har i tidigare kurser stött på konceptet "mock" till exempel i artikeln "[Mer om enhetstester](https://dbwebb.se/kunskap/unittest-i-python_2#dependencies)".

Jag börjar med att flytta `StockList` komponenten till en egen fil då jag hade `Stock` och `StockList` i samma fil. Har du de redan i olika filer behöver du inte göra detta. Se till att alla imports som behövs i `StockList` hänger med in till filen. Säkerställ att din app fungerar som vanligt innan du går vidare.

Vi kan sedan i filen `__tests__/Stock.test.js` skapa en "mock" av `StockList`. Vi kommer sedan testa `StockList` och därför spelar det inte så stor roll vad som egentligen finns i vår "mock". Vi använder funktionen `jest.mock` och från den returnerar vi en tom komponent som vi döper till `StockList`, då kan vi om vi vill i ett annat test kolla om `Stock` ritar upp en `StockList` komponent.

I `jest.mock` funktionen anger vi vilken fil vi vill ersätta med vår mock och sedan vad vi vill ersätta den med som returvärde till den callback-funktion vi har som argument två till komponenten.

```javascript
jest.mock("../components/StockList", () => "StockList");
```

Detta ledar till att hela koden i `Stock.test.js` ser ut på följande sätt.

```javascript
import { render } from '@testing-library/react-native';
import Stock from '../components/Stock';

jest.mock("../components/StockList", () => "StockList");

test('header should exist containing text Lagerförteckning', async () => {
    const { getByText } = render(<Stock />);
    const header = await getByText('Lagerförteckning');

    expect(header).toBeDefined();
});
```

Vi kan nu testa och köra `npm test` igen och vi bör nu få att testet går igenom och vi får en trevlig liten grön utskrift.



Mock av hämta data {#data}
--------------------------------------

Nu när vi ändå håller på tar vi och testar `StockList` med. Jag skapar därför filen `__tests__/StockList.test.js`.

Vi skriver i detta fallet vår use-case:

> I Lagerförteckningen ska det finnas en lista med produkter. Listan ska innehålla produktens namn och lagersaldo.

Utmaningen med detta testet är att vi vill "mocka" `state` i våra komponenter vilket inte är rekommenderat i React/React Native. Vi bör i den bästa av världar testa att hämtningen av data går till på rätt sätt i vår modell, men det är överkurs just nu.

Lösningen blir att vi skickar med en produktlista (`products`) och en tom funktion (`setProducts`) med som props till den komponent vi renderar från testet.

Vi kan sedan se att komponenten ritar upp listan på rätt sätt genom att kolla vad som finns på sidan. Först definierar jag en lista på produkter med namn och lagersaldo. Sedan definieras även en funktion som enbart returnerar `false`, för att den inte ska skriva över listan vi skickar.

Vi renderar sedan vår komponent med hjälp av `render` funktionen och från den returnerar vi `getByText` funktionen. Vi använder sedan funktionen för att kolla om alla produkter ritats ut i komponenten. Vi använder möjligheten för att skicka med ett `option` där vi berättar att vi endast vill söka efter delsträngar och alltså inte exakta matchningar.

```javascript
import { render } from '@testing-library/react-native';
import StockList from '../components/StockList';

const products = [
    { name: "Shampoo", stock: 2 },
    { name: "Balsam", stock: 3 },
    { name: "Tvål", stock: 15 },
];

const setProducts = () => false;

test('List should contain three items', async () => {
    const { getByText } = render(<StockList products={products} setProducts={setProducts} />);

    const shampoo = await getByText('Shampoo', { exact: false });
    const balsam = await getByText('Balsam', { exact: false });
    const soap = await getByText('Tvål', { exact: false });

    expect(shampoo).toBeDefined();
    expect(balsam).toBeDefined();
    expect(soap).toBeDefined();
});
```



Fler render funktioner {#more-renders}
--------------------------------------

Vi har i denna övning enbart tittat på funktionen `getByText` som returneras av `render` från React Native Testing Library. `render` kan returnera många andra funktioner och alla är [dokumenterade](https://callstack.github.io/react-native-testing-library/docs/api-queries).

Vi kommer under föreläsningen titta på hur vi kan använda Jest och React Native Testing Library för att till exempel simulera klick på knappar eller att fylla i data i formulärfält.



Debug {#debug}
--------------------------------------

Ibland kan det vara svårt att veta exakt vad som renderas ut på skärmen när vi testar. Då kan det vara bra att använda `debug` funktionen. `debug` returneras på samma sätt som `getByText` och de andra funktioner från `render`. Vi kan sedan använda `debug`-funktionen med ett meddelanden för att tydligt se vilket test vi anropar det i från.

```javascript
const { getByText, debug } = render(<StockList products={products} setProducts={setProducts} />);

debug("Stocklist component");
```

Ovanstående kod ger följande utskrift när vi kör `npm test` i terminalen.

```shell
● Console

  console.log
    Stocklist component

     <View>
      <Text
        style={
          Object {
            "fontSize": 20,
            "marginBottom": 28,
          }
        }
      >
        Shampoo
         -
        2
      </Text>
      <Text
        style={
          Object {
            "fontSize": 20,
            "marginBottom": 28,
          }
        }
      >
        Balsam
         -
        3
      </Text>
      <Text
        style={
          Object {
            "fontSize": 20,
            "marginBottom": 28,
          }
        }
      >
        Tvål
         -
        15
      </Text>
    </View>

    at debugDeep (node_modules/@testing-library/react-native/build/helpers/debugDeep.js:17:13)
```



Avslutningsvis {#avslutning}
--------------------------------------

Vi har i denna artikel tittat på hur vi kan använda tester för att säkerställa att vår kod fungerar som vi vill. Tester är ett oändligt stort område, men detta var en liten aptitretare för hur det kan gå till med en frontend i JavaScript.
