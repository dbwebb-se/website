---
author: lew
revision:
    "2018-08-21": "(A, lew) Första versionen."
...
Styla tabeller {#tabell-style}
=======================

Vi tar det stegvis och tittar på några delar vi kan styla på tabellen.

```css
table {
    margin: 20px 0;
    width: 100%;
    border-collapse: collapse;
}

th, td {
    border: 1px solid #fff;
    padding: 10px;
}

th {
    height: 50px;
    color: #ff8000;
}

td {
    text-align: center;
    color: #fff;
}

td:first-child {
    color: #ff8000;
}

tr:nth-child(even) {
    background-color: rgb(62, 62, 62);
    background-color: rgba(62, 62, 62, 0.6);
}
```

Här ser vi att man kan precis om tidigare kan välja ut just de element som man vill styla. Vi kan även se några nya delar:

**border-collapse: collapse** slår ihop ramarna vi skapar runt elementen till en.

**:first-child** är en selektor som i detta fallet väljer ut alla td-element som är de första barnen till sina föräldrar. Det resulterar i de första cellerna på varje rad.

Med **:nth-child** kan vi plocka ut en delmängd av alla rader i tabellen. I detta fallet väljer vi ut alla jämna rader.



##Resultat {#resultat}

Nu ser tabellen lite bättre ut:

[FIGURE src=/image/htmlphp/guide/murphy/table2.png?w=w3 caption="En stylad tabell."]

Testa och lek med koden på CodePen:

[CODEPEN src=ZMGNoL user="dbwebb" tab="html,css" caption="Steg 14 i CodePen."]
