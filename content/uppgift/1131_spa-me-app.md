---
author: efo
category: javascript
revision:
  "2018-01-05": (A, efo) Första utgåvan i samband med kursen webapp v3.
...
SPA me-app
==================================
I övningen "[En Single Page Application](kunskap/en-single-page-application-me-app)" fick du grunderna till en me-app. I denna uppgift ska du bygga vidare och skapa din helt egna me-app med navigation, Github sida och som även ska användas för dina redovisningstexter.



<!--more-->



Förkunskaper {#forkunskaper}
-----------------------
Du har jobbat igenom övningarna "[En Single Page Application](kunskap/en-single-page-application-me-app)" och "[Typografi i mobila enheter](kunskap/typografi-i-mobila-enheter)".


Introduktion {#intro}
-----------------------
I övningen "[En Single Page Application](kunskap/en-single-page-application-me-app)" skapas grunden för en me-app. Du ska i denna uppgift bygga klart appen enligt specifikationen nedan.



Krav {#krav}
-----------------------
1. Din Me-app ska innehålla fyra vyer Me, Om, Github och Redovisning.

1. Din navigation ska tydligt visa nuvarande aktiva vy.

1. Din Github vy ska innehålla en lista med länkar till dina Github repon.

1. Redovisningsvyn ska vara lättläst och ett medvetet val av typsnitt ska göras.

1. Validera och publicera din kod enligt följande.

```bash
# Ställ dig i kurskatalogen
dbwebb validate redovisa
dbwebb publish redovisa
```

Rätta eventuella fel som dyker upp och publicera igen. När det ser grönt ut så är du klar.



Extrauppgift {#extra}
-----------------------

* Använd swipe event för att bläddra mellan dina olika vyer. GitHub repo [detect-swipe-event](https://github.com/mosbth/detect-swipe-event) kan hjälpa en bit på vägen.

* Din app ska visa sin navigation i botten om det är en liten mobil enhet, annars visas navigationen längst upp.



Tips från coachen {#tips}
-----------------------

Validera och publicera ofta. Så slipper du en massa validerings- och publiceringsfel i slutet av övningen.

När du gör *publish* så körs även *validate*. Blir det för mycket fel när du kör *publish* så kan det bli enklare att bara göra *validate* till att börja med.

Lycka till och hojta till i forumet om du behöver hjälp!
