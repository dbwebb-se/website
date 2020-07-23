---
author: efo
category: javascript
revision:
  "2017-03-15": (A, efo) Första utgåvan inför kursen webapp v2.
...
Mithril och CRUD
==================================
Vi har än så länge fokuserat på enbart att hämta data från de olika api'er vi har jobbat mot. I detta kursmoment ska vi skapa, ändra och ta bort data. Vi gör det med hjälp av mithril och de 3 inbyggda HTTP anrop `POST`, `PUT` och `DELETE`. I exemplen nedan visar jag hur anropen ser ut när dessa görs mot [REM](http://rem-rest-api.herokuapp.com/) api't.



<!--more-->



POST {#post}
--------------------------------------
När vi vill skapa nya data-objekt använder vi oss av `POST`. I mithril har vi sen tidigare använt oss av `m.request` och funktionen har stöd för alla 4 HTTP anrop. Nedan finns ett exempel på hur en POST kan se ut när vi skapar ett nytt data-objekt för en app som handlar om personers datorer. Vi skickar med datat för det nya data-objektet och i REM api't läggs automatisk till ett unikt id för data-objektet.

```javascript
return m.request({
    method: "POST",
    url: "http://rem-rest-api.herokuapp.com/api/computers",
    body: { name : "MacBook Pro", year : 2016 },
    withCredentials: true
}).then(function () { });
```



PUT {#put}
--------------------------------------
För att uppdatera data-objekt använder vi oss av `PUT`. Vi skickar även här med data, men som ni ser nadan även med ett id för att specificera vilket data-objekt det är vi vill uppdatera. Vi använder oss utav en placeholder i url'en för att koppla id i data till :id i url'en.

```javascript
return m.request({
    method: "PUT",
    url: "http://rem-rest-api.herokuapp.com/api/computers/:id",
    body: { id: 1, name : "MacBook Pro", year : 2017 },
    withCredentials: true
}).then(function () { });
```



DELETE {#delete}
--------------------------------------
För att ta bort data-objekt använder vi oss av `DELETE`. Här skickar vi bara med ett id för att specificera vilket data-objekt vi vill ta bort.

```javascript
return m.request({
    method: "DELETE",
    url: "http://rem-rest-api.herokuapp.com/api/computers/:id",
    body: { id: 1 },
    withCredentials: true
}).then(function () { });
```



Avslutningsvis {#avslutning}
--------------------------------------

Detta var en kort introduktion till hur vi kan använda oss av `POST`, `PUT` och `DELETE` för att skapa, redigera och ta bort data-objekt med hjälp av REM api't.
