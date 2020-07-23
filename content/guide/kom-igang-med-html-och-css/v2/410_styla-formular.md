---
author: lew
revision:
    "2018-08-21": "(A, lew) Första versionen."
...
Styla formulär {#styla-formular}
=======================

Som ni såg består ett formulär oftast av olika delar. Sist men inte minst behöver vi en knapp så formuläret kan skickas. Det kommer inte finnas någon funktionalitet kopplad till knappen. Vi petar in följande i contact.html:

```html
...
    <input type="submit" value="Send">
</fieldset>
```

Attributet *submit* skapar en knapp och *value* talar om vad som ska stå på knappen.



##style.css {#style}

Hur gör vi då för att ge formuläret lite style? Följande css-kod ger formuläret en annan style via dess olika delar:

```css
legend {
    font-size: 24px;
}

input[type=text] {
    width: 100%;
    margin: 8px 0;
    box-sizing: border-box;
    padding: 12px 20px;
}

input[type=submit] {
    width: 200px;
    font-size: 16px;
    padding: 10px 0;
}

select {
    width: 30%;
    margin: 8px 0;
    padding: 3px 4px;
    display: block;
}

textarea {
    display: block;
    margin: 12px 0;
    width: 30%;
    height: 75px;
}

```

**input** fångar upp alla input-delar i ett formulär. Vi kan nå de olika typerna med **[type=...]**.

**box-sizing** talar om att border och padding ska inkluderas i den totala bredden och höjden. Annars kan input-fältet sticka ut för långt i sidan.

<!-- Det går även att forma elementen en del via dess attribut. Till exempel -->

I övrigt var det inte nya konstruktioner.



##Resultat {#resultat}

Blev det snyggt då? Jag sticker ut hakan och säger att det i alla fall är bättre än innan. Se efter själv hur det ser ut i webbläsaren:

[FIGURE src=/image/htmlphp/guide/murphy/stylat-formular.png?w=w3 caption="Ett stylat formulär."]

Kika närmare och utforska koden på CodePen:

[CODEPEN src=zJYXVd user="dbwebb" tab="html,css" caption="Steg 13 i CodePen."]
