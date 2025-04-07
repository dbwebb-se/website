---
author: mos
category:
    - nodejs
    - javascript
    - express
    - mysql
    - crud
    - kursen databas
revision:
    "2019-02-12": "(B, mos) Genomgången, justerad med kodstandard för SQL."
    "2018-01-11": "(A, mos) Första utgåvan."
...
CRUD med Express, MySQL och lagrade procedurer
==================================

[FIGURE src=image/snapvt18/bank2-delete-account.png?w=c5&a=0,30,20,0&cf class="right"]

Vi skall jobba igenom begreppet CRUD som handlar om att göra operationer för Create, Read, Update och Delete mot databasen. Vi skall göra det via ett webbgränssnitt med HTML formulär och en applikation baserad på JavaScript i Node.js med Express och kopplat mot databasen MySQL.

Vi skall använda oss av lagrade procedurer i databasen för att skapa ett API mot databasen. Alla potentiella klienter kan sedan använda samma gränssnitt. Det ger oss ett exempel på hur vi kan kapsla in SQL-koden och förenkla för klienterna.

<!--more-->



Förutsättning {#pre}
--------------------------------------

Du har jobbat igenom artikeln "[Koppla appservern Express till databasen MySQL](kunskap/koppla-appservern-express-till-databasen-mysql)" och har tillgång till kod du kan utgå ifrån.

Du har jobbat igenom artikeln som visar hur du programmerar i en databas via "[Lagrade procedurer i databas](kunskap/lagrade-procedurer-i-databas)". Du har tillgång till den databas som används i artikelserien.

De exempelprogram som används i artikeln finns i ditt kursrepo databas under `example/express-crud` (det färdiga exemplet) och `example/express-mysql` (koden jag startar med).



Utgå från tidigare exempel {#utga}
--------------------------------------

Du kan kopiera exempelkoden i `example/express-mysql` och utgå från den. Jag använder den för att bygga vidare och lägga dit kod som gör att vi kan koppla oss till databasen.

När du kopierat koden behöver du installera modulerna med `npm install`.

Pröva sedan att starta servern och använda webbläsaren för att koppla dig till servern.

Vi har främst routen `bank/index` och routen `bank/balance` att utgå ifrån.

Mitt färdiga exempel, som jag skapar i denna artikeln, finner du i `example/express-crud`.



R i CRUD, Read {#read}
---------------------------------------

Den första delen handlar om att läsa information från databasen och presentera den. Det har vi egentligen redan gjort i routen `bank/balance` som gör en `SELECT *` från tabellen.

Men jag vill använda konceptet _programmera i databasen_ och tänker därför skriva om SELECT-satsen till en lagrad procedur.

Låt vara att jag inte vinner något speciellt på det, mer än själva övningen att se hur jag från klienten anropar en lagrad procedur i sin enklaste form.

Först skapar jag min lagrade procedur som visar balansen för alla konton. Du kan se all SQL-kod i filen `example/express-crud/sql/bank/ddl_procedure.sql`.

```sql
--
-- Create procedure for select * from account
--
DROP PROCEDURE IF EXISTS show_balance;
DELIMITER ;;
CREATE PROCEDURE show_balance()
BEGIN
    SELECT * FROM account;
END
;;
DELIMITER ;

CALL show_balance();
```

Jag kan anropa den via MySQL terminalklienten.

```sql
mysql> CALL show_balance();
+------+------+---------+
| id   | name | balance |
+------+------+---------+
| 1111 | Adam |   10.00 |
| 2222 | Eva  |    7.00 |
+------+------+---------+
2 rows in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)
```

Nu går jag in i min route `bank/balance` och uppdaterar koden så att den lagrade proceduren används. Jag börjar med att titta på routehanteraren i filen `route/bank.js` och jag ser att databaskoden ligger i en funktion `bank.showBalance()`.

```javascript
router.get("/balance", async (req, res) => {
    let data = {
        title: "Account balance | The Bank"
    };

    data.res = await bank.showBalance();

    res.render("bank/balance", data);
});
```

Jag uppdaterar nu min kod i filen `src/bank.js` för `bank.showBalance()` så att den använder den lagrade proceduren.

```javascript
/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showBalance() {
    let sql = `CALL show_balance();`;
    let res;

    res = await db.query(sql);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}
```

Vi anropar den lagrade proceduren på det sätt som vi är vana vid.

Denna procedur tar inga argument, de hade vi annars kunnat bifoga via `?`.

Det resultset som returneras från en lagrad procedur skiljer sig aningen från tidigare. En lagrad procedur kan nämlingen returnera flera svar, flera resultset. I detta fallet är det bara ett `res[0]`, det första (och enda) resultsetet från proceduren, och det är det jag vill skicka vidare till vyn.

Sådär, nu är min kod uppdaterad och fungerar som tänkt tillsammans med en lagrad procedur.

I min vy `views/bank/balance.ejs` uppdaterade jag med följande kod som ger mig möjligheter att debugga och se vad ett resultset innehåller.

```html
<pre><%= JSON.stringify(res, null, 4) %></pre>
```

Det ger en JSON representation av datat jag jobbar på. Det kan se ut så här.

[FIGURE src=image/snapvt18/bank2-balance-json.png caption="Utskrift av ett resultset i en formatterad JSON."]

Vill jag inte se utskriften kan jag kommentera bort den, men konstruktionen är bra vid behov, speciellt vid utveckling och felsökning.

Du kommenterar bort den via en brädgård `#`. Det är en konstruktion i EJS.

```html
<pre><%#= JSON.stringify(res, null, 4) %></pre>
```

Tänk på att du kan uppdatera kod i dina vyer, utan att starta om node-servern som kör Express. Det kan spara lite tid vid utveckling och felsökning.

Det var vår första lagrade procedur vilken uppfyllde R för READ.



C i CRUD, Create {#create}
---------------------------------------

Låt oss skapa möjligheten att lägga till en ny kontohavare med konto och kontobehållning (peng på kontot).



### Vy med HTML formulär {#cform}

Jag börjar med att göra ett HTML-formulär där användaren kan mata in detaljer om det nya kontot. Routen får bli `bank/create` och vyn sparar jag i `views/bank/create.ejs`.

Att placera ut och styla formulär är en historia för sig. Men jag försöker med enkla medel att lägga ut ett enklare formulär. Lite CSS behövs för att ordna layouten. Men vi fokuserar på HTML-koden för formuläret, den ser ut så här.

```html
<form class="label-left" method="post">
    <fieldset>
        <legend>Create account</legend>

        <label for="id">Id</label>
        <input id="id" type="text" name="id">

        <label for="name">Name</label>
        <input id="name" type="text" name="name">

        <label for="balance">Balance</label>
        <input id="balance" type="number" name="balance">

        <input type="submit" name="doit" value="Create">
    </fieldset>
</form>
```

Om vi renderar ovan formulär som en del av vyn så kan sidan se ut så här, om man lägger till lite CSS-kod för att styla formulärets element.

[FIGURE src=image/snapvt18/bank2-create-account.png caption="Ett formulär där jag kan mata in detaljer för ett nytt konto."]

Nu kan jag fylla i informationen och klicka på knappen. Men vi behöver en route som hanterar det postade formulärets data.



### Route för att hantera POST {#cpost}

Formuläret postas till servern via HTTP-metoden POST. Då gör vi en route `bank/create` som endast svarar på POST. Man kan ha samma namn på routen, men olika HTTP-metoder.

Routen lägger vi tillsammans med övriga bank-routes i `route/bank.js`.

Låt oss först titta på ett utkast till routern, där vi använder post `router.post()` istället för get `router.get()`.

```javascript
router.post("/create", async (req, res) => {
    // Extract the data from the posted form
    // Send data to a stored procedure
    res.redirect("/bank/balance");
});
```

Routen ovan fungerar som den är. Om vi klickar på submit-knappen i formuläret så hamnar vi i denna routen och det enda som händer är att vi redirectas, skickas vidare, till routen `/bank/balance` som renderar ett svar.

Det vi nu måste göra är att extrahera datat som kommer i det postade formuläret. Till det använder vi npm modulen [body-parser](https://www.npmjs.com/package/body-parser) vars uppgift är att extrahera den kodade informationen i HTTP-requesten.

Vi installerar modulen.

```text
npm install body-parser --save
```

Vi aktiverar modulen enbart i den fil vi använder den, i samma fil vår post-route ligger.

```javascript
const bodyParser = require("body-parser");
const urlencodedParser = bodyParser.urlencoded({ extended: false });
```

Det vi har i `urlencodedParser` är en middleware som kan läggas till i vår route, för att parsa innehållet i postade formulär, så här.

```javascript
router.post("/create", urlencodedParser, async (req, res) => {
    // Extract the data from the posted form
    console.log(JSON.stringify(req.body, null, 4));
    // Send data to a stored procedure
    res.redirect("/bank/balance");
});
```

Som middleware kommer `urlencodedParser()` att anropas innan routens hanterare. Funktionen kan då koda upp det postade formuläret och lägga som en del i requesten.

I routens callback har vi nu det postade formuläret via requesten i `req.body`. Vi kan debugga inkommande genom att skriva ut dess innehåll. Det blir enklare och tydligare att läsa innehållet om man formaterar det som JSON-data.

Postar vi ett tomt formulär ser utskriften i terminalen ut så här.

```json
{
    "id": "",
    "name": "",
    "balance": "",
    "doit": "Create"
}
```

Bra, det ser ut som våra element i formuläret.

Då går vi över till SQL-biten.



### Lagrad procedur för insert {#cinsert}

Jag gör en lagrad procedur för att sköta själva insert-satsen. Det kan se ut så här.

```sql
--
-- Create procedure for insert into account
--
DROP PROCEDURE IF EXISTS create_account;
DELIMITER ;;
CREATE PROCEDURE create_account(
    a_id CHAR(4),
    a_name VARCHAR(8),
    a_balance DECIMAL(4, 2)
)
BEGIN
    INSERT INTO account VALUES (a_id, a_name, a_balance);
END
;;
DELIMITER ;
```

Det är viktigt att datatyperna på parametrarna, matchar de som tabellens kolumner har.

Jag kan pröva att använda den lagrade proceduren direkt från terminalklienten.

```sql
mysql> CALL create_account("1337", "Mega", 37.0);
Query OK, 1 row affected (0.22 sec)
```

Det blir inget resultset som svar. Men när inget går fel så antar vi alltid att det gick bra, iallfall i sammanhanget databaser.

Om du får varningar så visar du den med `SHOW WARNINGS`.

Jag kan ju alltid tjuvkika på vad tabellen innehåller.

```text
mysql> CALL show_balance();
+------+------+---------+
| id   | name | balance |
+------+------+---------+
| 1111 | Adam |   10.00 |
| 1337 | Mega |   37.00 |
| 2222 | Eva  |    7.00 |
+------+------+---------+
3 rows in set (0.00 sec)
```

Tänk på att det är bra att köra din SQL-kod avskilt från JavaScript-koden, när du testar och utvecklar. Det blir enklare om du kontrollerar att databaskoden fungerar för sig självt, innan du integrerar den i JavaScript.

Då tar vi och använder den lagrade proceduren i JavaScript och Express.



### Använd lagrad procedur för insert {#cinsertdo}

Först skapar jag en funktion i databasmodulen `src/bank.js`. Jag döper den till `createAccount`. Så här kan den se ut.

```javascript
/**
 * Create a new account.
 *
 * @async
 * @param {string} id      A id of the account.
 * @param {string} name    The name of the account holder.
 * @param {string} balance Initial amount in the account.
 *
 * @returns {void}
 */
async function createAccount(id, name, balance) {
    let sql = `CALL create_account(?, ?, ?);`;
    let res;

    res = await db.query(sql, [id, name, balance]);
    console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);
}
```

Jag anropar funktionen från min route och skickar med argumenten som kommer från det postade formuläret.

```javascript
router.post("/create", urlencodedParser, async (req, res) => {
    // console.log(JSON.stringify(req.body, null, 4));
    await bank.createAccount(req.body.id, req.body.name, req.body.balance);
    res.redirect("/bank/balance");
});
```

Nu kan vi testa. Första matar vi in detaljerna i formuläret.

[FIGURE src=image/snapvt18/bank2-create-account-post.png caption="Vi fyller i formuläret med detaljer om kontot."]

När vi klickar på submit-knappen postas formulärdatat till vår post-route som skapar en ny kontohavare och gör en redirect när det är klart. När det postade formuläret hanteras i routen skrivs detaljer och logginformation ut i terminalen. Det kan vi använda för att debugga.

Så här ser sidan ut vi kommer till.

[FIGURE src=image/snapvt18/bank2-account-created.png caption="Det nya kontot är skapat och finns nu med i sammanställningen över kontohavare."]

Det var C:et i CRUD, Create för att skapa nya rader i databasen.



Visa detaljer om enbart ett konto {#visaett}
---------------------------------------

Hur kan vi visa detaljer om ett specifikt konto på en egen sida? Ja, det finns naturligtvis varianter, men säg att vi kunde skapa en dynamisk route som tar en parameter så routen blev `bank/account/:id` där `:id` representerar kontots id.

Tanken är att vi har flera webblänkar för att nå specifika konton, här är ett urval.

* `bank/account/1111` ger Adams konto
* `bank/account/2222` ger Evas konto

Routen är dynamisk då vi vill hantera kontonumret in i en variabel `:id`.

Om vi kan lösa detta så kan vi hämta detaljerna för just det kontot och visa upp det i en vy.

Routen som löser detta kan se ut så här, se hur `:id` är en del av routens definition.

```javascript
router.get("/account/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `Account ${id} ${sitename}`,
        account: id
    };

    data.res = await bank.showAccount(id);

    res.render("bank/account-view", data);
});
```

Det som är nytt här är hur routen specificeras och hur representationen av `:id` kan hämtas i datan om requesten via `req.params.id`. Det är som att skicka en parameter via länken.

Resten i routen är saker du känner till, en funktion `bank.showAccount(id)` som anropar en lagrad procedur som hämtar detaljer om just ett konto `id` som bifogas som ett argument till funktionen.

Det kan dock vara intressant att se hur man bifogar argument till den lagrade proceduren via `?` och arrayen `[id]`.

```javascript
/**
 * Show details for an account.
 *
 * @async
 * @param {string} id A id of the account.
 *
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showAccount(id) {
    let sql = `CALL show_account(?);`;
    let res;

    res = await db.query(sql, [id]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}
```

Vyn kan ha liknande struktur som den som visar balansen, det är samma typ av information som skall visas upp, men nu enbart för en användare.

Resultatet av en sådan route skulle kunna visas upp så här.

[FIGURE src=image/snapvt18/bank2-view-account.png caption="En dynamisk route som tar ett argument och kan visa upp detaljer om specifikt konto."]

Tänk nu, om vi uppdaterar vyn som visar balansen, och för varje konto som visas i tabellen så länkar vi dess id till denna nya routen. Då får vi en översikt med länkar till detaljer om varje konto. Det låter som en bra idé. 

En sådan konstruktion kan se ut så här i ejs.

```html
<td><a href="/bank/account/<%= row.id %>"><%= row.id %></a></td>
```



U som i Uppdatera detaljer om ett konto {#uppdatera}
---------------------------------------

U:et i CRUD handlar om att uppdatera befintlig data. Säg att vi vill uppdatera detaljer om ett specifikt konto.

Vi har nu möjligheten att länka till varje konto, låt oss då skapa ytterligare en länk som leder oss till en ny sida, en route som visar ett formulär där vi kan uppdatera detaljer om ett konto.



### Klickbara ikoner {#klickikon}

Jag tycker det vore trevligt med ikoner att klicka på och jag väljer att använda [FontAwesome](http://fontawesome.io/) för det syftet.

När jag ändå håller på med ikoner så lägger jag till en ikon för att göra update och en för att radera. Så här blev det.

[FIGURE src=image/snapvt18/bank2-account-actions.png caption="Nu förberedd med ikoner för att göra edit och delete."]

Själva ikonerna, och dess länkar, skapas med följande kod (se hemsidan för FontAwesome). Delen med `<i>...</i>` ger ikonen och länken har jag själv lagt till.

```html
<a href="/bank/edit/<%= row.id %>">
    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
</a>
<a href="/bank/delete/<%= row.id %>">
    <i class="fa fa-trash-o" aria-hidden="true"></i>
</a>
```

Man behöver även lägga dit en stylesheet som ger mig tillgång till ikonerna (för detaljer, se FontAwesome), i mitt fall blev det följande i min `views/bank/header.ejs`.

```html
<script src="https://use.fontawesome.com/0aee473986.js"></script>
```

Du kan återanvända den, om du vill.



### Ikoner via UTF-8 {#icons}

Ett alternativt sätt, om man bara vill ha ett fåtal ikoner, är att använda UTF-8 tecken för ikoner. De är enkla att skriva in direkt i HTML-koden, man kan till och med kopiera in dem i texten.

Här är ett par ikoner som kan vara användbara.

| Vad    | Beskrivning | Label      | Utseende | HTML entity |
|--------|-------------|------------|:--------:|-------------|
| Delete | Skräptunna | Wastebasket | 🗑        |  `&#x1F5D1;` |
| Edit   | Penna      | Lower right pencil | ✎         |  `&#x270e;` |

Du hittar fler om du googlar på "UTF-8 icon <text>" och byt ut "<text>" mot det du vill finna.

UTF-8 ikoner är ett enklare alternativ till det tyngre Font Awesome.



### GET route för uppdatera kontodetaljer {#geteditaccount}

För edit-ikonen länkar jag till routen `/bank/edit/:id`. Den routen ser ut ungefär som routen `/bank/account/:id`, det är bara dess title och vy som ändras.

```javascript
router.get("/edit/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `Edit account ${id} ${sitename}`,
        account: id
    };

    data.res = await bank.showAccount(id);

    res.render("bank/account-edit", data);
});
```

I routen hämtar jag detaljer för det specifika kontot och visar upp det i en vy som ser ut ungefär som formuläret för att skapa konto. Det är ju ungefär samma upplägg för ett edit-formulär, men med skillnaden att fälten är ifyllda med sitt värde.

Här kan du se hur jag fyller i fälten med sitt värde via `value="<%= res.id %>"`.

```html
<% res = res[0] %>
<form class="label-left" method="post" action="/bank/edit">
    <fieldset>
        <legend>Edit account</legend>

        <label for="id">Id</label>
        <input id="id" type="text" name="id" readonly value="<%= res.id %>">

        <label for="name">Name</label>
        <input id="name" type="text" name="name" value="<%= res.name %>">

        <label for="balance">Balance</label>
        <input id="balance" type="number" name="balance" value="<%= res.balance %>">

        <input type="submit" name="doit" value="Edit">
    </fieldset>
</form>
```

Notera att formulärelementet för "id" är markerat som `readonly` då användaren inte skall kunna ändra det. Rent strikt är detta inget säkert sätt att hindra användaren från att uppdatera fältet. När man pratar om säkerhet måste man alltid validera ett postat formulär på serversidan, det går inte att lita på klienten. Men det är en annan historia.

Notera också att första raden i formuläret säger `action="/bank/edit"` vilket innebär att detta formulär postas till just den routen. Om vi utelämnar det fältet så postas formuläret till samma route man är på.

Om jag nu utgår från översikten av kontona och klickar på edit-knappen så hamnar jag på edit-sidan, med formuläret ifyllt.

[FIGURE src=image/snapvt18/bank2-edit-account-details.png caption="Nu kan jag uppdatera detaljer om kontot."]

Då behöver vi en route för det submittade formuläret, så att de postade formulärets data kan sparas till databasen.



### POST route för uppdatera kontodetaljer {#posteditaccount}

På samma sätt som när vi skapade ett konto, så behöver vi nu en POST route till `/edit`. Jag tar hand om värdena i det inkommande formuläret och skickar dem som argument till den funktion som skall uppdatera databasen.

```javascript
router.post("/edit", urlencodedParser, async (req, res) => {
    // console.log(JSON.stringify(req.body, null, 4));
    await bank.editAccount(req.body.id, req.body.name, req.body.balance);
    res.redirect(`/bank/edit/${req.body.id}`);
});
```

Jag behöver skapa en funktion som löser databaskoden, jag löser det snart.

Jag väljer att göra redirect till formulärsidan igen. Det kommer se bra ut, varje gång man klickar på edit-knappen så ser användaren att hen kommer till samma sida igen och kan fortsätta göra uppdateringar.

Att välja vilken sida man gör redirect till, är en viktig komponent i webbapplikationens flöde. Det är något som markant påverkar användarens upplevelse och webbapplikationens användarvänlighet.



### Databasfunktion för att editera kontodetaljer {#dbeditaccount}

Vi kan kika på funktionen som uppdaterar kontodetaljerna i databasen.

```javascript
/**
 * Edit details on an account.
 *
 * @async
 * @param {string} id      The id of the account to be updated.
 * @param {string} name    The updated name of the account holder.
 * @param {string} balance The updated amount in the account.
 *
 * @returns {void}
 */
async function editAccount(id, name, balance) {
    let sql = `CALL edit_account(?, ?, ?);`;
    let res;

    res = await db.query(sql, [id, name, balance]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);
}
```

Funktionen ser ut som tidigare motsvarigheter, den liknar mycket den funktion som skapade ett nytt konto. Det är samma parametrar som används, men med lite annat syfte i denna funktionen.

Det behövs en lagrad procedur för att utför själva databasoperationen.



### Lagrad procedur för att uppdatera kontodetaljer {#dbeditsp}

Då har vi sista delen i kedjan, den lagrade proceduren som utför själva UPDATE-satsen i databasen.

```sql
--
-- Create procedure for edit account details
--
DROP PROCEDURE IF EXISTS edit_account;
DELIMITER ;;
CREATE PROCEDURE edit_account(
    a_id CHAR(4),
    a_name VARCHAR(8),
    a_balance DECIMAL(4, 2)
)
BEGIN
    UPDATE account SET
        `name` = a_name,
        `balance` = a_balance
    WHERE
        `id` = a_id;
END
;;
DELIMITER ;
```

Som vanligt kan vi testköra den lagrade proceduren, för att se att den fungerar som den ska.

```sql
mysql> CALL edit_account("1337", "Mega", 7.0);
Query OK, 1 row affected (0.01 sec)

mysql> CALL show_account("1337");
+------+------+---------+
| id   | name | balance |
+------+------+---------+
| 1337 | Mega |    7.00 |
+------+------+---------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)
```

Nu vet vi att den lagrade proceduren gör det den ska.

Då kan vi utföra samma sak i webbklienten.




### Testa att flödet fungerar {#dbedittest}

Om vi då startar om vår server så kan vi testa hela flödet. I översikten klickar vi på edit-ikonen som visar `GET /bank/edit/:id`, i formuläret uppdaterar vi ett fält och submittar till `POST /bank/edit` som uppdaterar databastabellen via en funktion som anropar en lagrad procedur. När allt är klart så redirectas användare till ursprungsformuläret som läser in all uppdaterad data från databasen.

Det var U i CRUD, Update, i en webbapplikation med formulär. 



D som i Deleta ett konto {#radera}
---------------------------------------

D:et i CRUD handlar om att göra delete på rader. Säg att vi vill radera ett konto.

För delete-ikonen länkar jag till routen `GET /bank/delete/:id` och där tänker jag skriva ut detaljer om kontot och erbjuda en submit-knapp om användaren verkligen vill radera kontot.

Det känns som jag borde kunna återanvända de strukturer jag redan byggt upp.

Routen blir nästan likadan som `/bank/edit/:id`. Jag återanvänder vyn `views/bank/account-edit` och sparar som `views/bank/account-delete` och uppdaterar så att alla fälten blir readonly, knappen säger "Delete account" och formulärets action leder till `POST /bank/delete`.

Jag tänker att det är bra att användaren får se kontot innan hen raderar det.

[FIGURE src=image/snapvt18/bank2-delete-account.png caption="Sida som förbereder användaren för att radera ett konto."]

Klickar du på "Delete account" så submittas formuläret till `POST /bank/delete` med id:et som den viktiga ingrediensen. I routen anropas en funktion `bank.deleteAccount(id)` som raderar kontot via en lagrad procedur `delete_account(?)`.

Om du tänker efter så har vi i tidigare exempel byggt upp liknande saker så på det här stadiet handlar det mest om att kopiera, modifiera och lägga saker på rätt plats i flödet. Men minns, när man har en god struktur så kan saker bli enkelt, eller enklare. Lägg tid på att underhålla din kodstruktur så den känns behändig för sitt syfte.



Alltid POST för ändringar {#alltidpost}
---------------------------------------

Märk att vi alltid gör en HTTP POST-request när vi uppdaterar databasen. Du ser det i Create, Update och Delete-fallen. Det är så det skall vara. Vi skall aldrig göra en uppdatering av databasen via en GET-request. Hade vi använt GET till uppdateringar så hade det exponerat en säkerhetsrisk. Mer om det är en annan historia som vi väljer att inte fördjupa oss i just nu. Vi nöjer oss med att säga -- _POST för alla uppdateringar_.



Kör exemplet i sin helhet {#exemplet}
--------------------------------------

Du kan testköra exemplet som ligger under `example/express-crud`. Principen för att starta igång servern är följande.

```text
npm install
mysql -uuser -ppass dbwebb < sql/bank/ddl_procedure.sql
node index
```

Provkör gärna och jämför med din egen variant, om du nu gjorde någon. Oavsett så har du en kodbas att studera, för att se hur man kan strukturera sin CRUD.



Avslutningsvis {#avslutning}
--------------------------------------

Detta var en introduktion för att komma igång CRUD konceptet i Express och MySQL. Det visades upp en kodstruktur som var enkelt att uppdatera med de olika delarna i CRUD och slutresultatet blev att alla delar av kontohanteringen kunde administreras via det grafiska gränssnittet.
