---
author: lew
revision:
    "2018-06-13": "(A, lew) Första versionen."
...
Alltid visa scrollbar {#alltid}
=======================

När man har sidor som är olika långa, kan man ibland få en effekt av att webbsidan hoppar till på grund av att den högra scrollbaren omväxlande visas och döljs. Det blir så när en sida är längre än webbläsarens totala höjd och nästa sida är kortare än sidans höjd.

Det är alltid en irriterande sak som är enkel att åtgärda genom att säga till webbläsaren, via CSS, att alltid visa scrollbaren, oavsett sidans höjd.

```css
html {
    overflow-y: scroll;
}
```

Det kan se ut så här.

[YOUTUBE src=SFhSsvuP4Gg width=630 caption="Mikael visar effekten av att alltid visa scrollbaren."]
