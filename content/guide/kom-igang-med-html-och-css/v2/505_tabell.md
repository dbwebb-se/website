---
author: lew
revision:
    "2018-08-21": "(A, lew) Första versionen."
...
Grundstruktur för tabeller {#tabell-grund}
=======================

En tabell fungerar likt ett Excel-ark. Det innehåller rader och kolumner. Grundstrukturen för en html-tabell ser ut så här:

```html
<table>
    <tr>
        <th></th>
    </tr>
    <tr>
        <td></td>
    </tr>
</table>
```

**&lt;table&gt;** talar om att vi har en tabell mellan taggarna.

**&lt;tr&gt;** står för table row och markerar en ny rad.

**&lt;th&gt;** står för table header och inom dessa taggarna skriver vi rubrikerna för tabellens kolumner.

**&lt;td&gt;** markerar varje cell i tabellen, även kallad table data.

Jag fyller i tabellen med Murphys schema likt nedan:

```html
<table>
    <tr>
        <th></th><th>Mon</th><th>Tue</th><th>Wed</th><th>Thu</th><th>Fri</th><th>Sat</th><th>Sun</th>
    </tr>
    <tr>
        <td>Before 10am</td><td>Sleeping</td><td>Sleeping</td><td>Sleeping</td><td>Sleeping</td><td>Sleeping</td><td>Sleeping</td><td>Sleeping</td>
    </tr>
    <tr>
        <td>10am-12pm</td><td>Jogging</td><td>Jogging</td><td>Shooting range</td><td>Shooting range</td><td>Shooting range</td><td>Gym</td><td>Shooting range</td>
    </tr>
    <tr>
        <td>12pm-16pm</td><td>Lunch</td><td>Lunch</td><td>Lunch</td><td>Lunch</td><td>Lunch</td><td>Lunch</td><td>Lunch</td>
    </tr>
    <tr>
        <td>16pm-17pm</td><td>Available</td><td>Shopping</td><td>Available</td><td>Tennis</td><td>Gym</td><td>Available</td><td>Available</td>
    </tr>
    <tr>
        <td>17pm-18pm</td><td>Dinner</td><td>Dinner</td><td>Dinner</td><td>Dinner</td><td>Dinner</td><td>Dinner</td><td>Dinner</td>
    </tr>
    <tr>
        <td>After 18pm</td><td>TV</td><td>TV</td><td>Available</td><td>TV</td><td>Available</td><td>TV</td><td>TV</td>
    </tr>
</table>
```



##Resultat {#resultat}

Utan given style kommer tabellen ärva style som angetts sedan tidigare, i alla fall typsnittet och dess form och storlek. Vi tittar på hur det ser ut per default i contact.html:

[FIGURE src=/image/htmlphp/guide/murphy/table1.png?w=w3 caption="En ostylad tabell."]

Nästa steg blir att ge tabellen lite style så den blir enklare att förstå.
