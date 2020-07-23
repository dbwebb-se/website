---
author: lew
revision:
    "2018-06-13": "(A, lew) Första versionen."
...
Grunderna i ett formulär {#grunderna-formular}
=======================

Jag tar det ett steg i taget och börjar med ett tomt skal för ett formulär. Tanken är att man ska kunna skriva ett meddelande till Murphy. Då Murphy gärna vill ha många meddelanden ska man kunna välja vilket syfte man har med meddelandet också.

##contact.html {#contact}

Steg ett blir ett tomt skal till ett formulär:

```html
<form>
    <fieldset>
        <legend>Contact me!</legend>
        <label for="name">Your name: </label>
        <input type="text" id="name">
        <label for="email">Your email: </label>
        <input type="text" id="email">
        <label for="select">Your purpose: </label>
        <select id="select">
            <option>Friendly message</option>
            <option>News about the empire</option>
            <option>Looking for employees</option>
        </select>
        <label for="message">Your message: </label>
        <textarea id="message"></textarea>
    </fieldset>
</form>
```

**&lt;form&gt;** är grund-elementet som talar om att det är ett formulär. Här kan även finnas vissa attribut om formuläret ska kunna skickas någonstans, till exempel `method` som talar om *hur* det ska skickas och `action` som talar om *vart* det ska skickas.

**&lt;fieldset&gt;** grupperar en uppsätting formulärkontroller. Det ger även automatiskt en ram runt de grupperade delarna.

Med **&lt;legend&gt;** kan man sätta en titel på formuläret. Om legend ligger inuti fieldset, hamnar titeln i ramen.

**&lt;label&gt;** lägger sig som en *caption* till kontrollerna. Klickar man på en label, fokuseras den tillhörande kontrollern. För att koppla ihop en label med en kontroller använder man attributet `id`.

**&lt;input&gt;** är den huvudsakliga formen av kontroller i formulär. Det finns flera olika typer att välja mellan som `number`, `password` m.m.

**&lt;select&gt;** ger oss en "rull-lista" med alternativ, så kallade **&lt;option&gt;**. Ger vi option-delarna varsitt attribut, *value*, är det det som skickas med formuläret, via attributet *name* i select. Krångligt? Det ger sig.

**&lt;textarea&gt;** ger oss helt enkelt ett text-fält.



##Resultat {#resultat}

Nu är det dags att se vad som renderas när vi tittar i webbläsaren:

[FIGURE src=/image/htmlphp/guide/murphy/formular-bas.png?w=w3 caption="Ett helt ostylat formulär."]

Kika närmare och utforska koden på CodePen:

[CODEPEN src=xzmPjz user="dbwebb" tab="html,css" caption="Steg 12 i CodePen."]
