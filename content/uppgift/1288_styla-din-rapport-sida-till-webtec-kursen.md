---
author: mos
category:
    - kurs webtec
revision:
    "2022-07-01": "(A, mos) Första utgåvan."
...
Styla din rapportsida till webtec-kursen
===================================

Du skall jobba vidare med stylen på din rapportsida i kursen och styla upp webbsidan med navbar, header, footer, article, aside, kolumnlayout och responsivitet.

När du är klar har du förhoppningvis en snyggare webbplats än tidigare. Du har iallafall en hel del med CSS-kod och du bör ha lärt dig en hel del nyttiga CSS konstruktioner.

<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har jobbat igenom övningen "[Styla din webbsida med HTML och CSS](kunskap/styla-din-webbsida-med-html-och-css)" och du har därmed grundstrukturen klar.



<!--
Genomgång {#genom}
------------------------

Här är en video som "pratar" dig igenom uppgiftens upplägg och visar hur du kommer igång.

[YOUTUBE src="gKzwQTG9eCI" width=700 caption="Kurs mvc kmom03 tisdagsgenomgång, del 3/3 uppgiften (Zoom med Mikael)."]
-->



Introduktion och förberedelse {#intro}
-----------------------

Om du har jobbat igenom övningen så är du förberedd för uppgiften. Övningen ger dig i princip ett "facit" till uppgiften. Du bör dock satsa på att bygga din egen style så att du inte efterliknar övningens style. Ta ut svängarna och prova CSS-konstruktioner, färg och form. Det behöver inte nödvändigtvis vara snyggt, men gör så gott du kan.



Krav {#krav}
-----------------------

Utför följande krav.

1. Spara alla dina stylesheets under `public/css`. Förslagsvis har du en liknande struktur som finns i övningen men du kan själv välja hur du fördelar din CSS-kod i filer, du behöver dock minst ha filen `public/css/style.css` på plats.

1. Gör ett noga övertänkt val av vilka typsnitt (font-family) som du använder och välj olika typsnitt för rubriker och text. Det sägs ge ett bra utseende om man gör så. Din header kan du styla till lite extra med typsnitten. Du har ett exempelprogram i kursrepot under `example/css/font-family` som visar olika fonter och hur man importerar externa fonter som till exempel fria Google fonter.

1. Styla din navbar.

1. Styla din header med en "logo", titel, undertitel och en bakgrund som kan vara en färg eller en bild.

1. Styla din footer i tre kolumner och en underliggande rad.

1. Dina sidkontroller me, about, report skall alla ha en liknande stylad struktur av main, article och eventuellt en aside.

1. Sidkontrollern about skall vara indelad i två kolumner och ha sin aside kolumn till höger.

1. Sidkontrollern report skall vara indelad i två kolumner och ha sin aside kolumn till vänster som innehåller artikelns "innehållsförteckning".

1. Sidkontrollern report skall ha en byline.

1. Din byline skall innehålla en bild och lite text och vara stylad. Du skall också placera innehållet i din byline i en vy under `view/byline.php` och inkludera den där den används.

1. Styla till din sidkontroller today och försök att göra en "crazy" sida där du visar upp dagens datum och veckodag. Lek med CSS konstruktionerna.

1. Kontrollera att dina sidkontroller passerar Unicorn validatorn. Om du har några valideringsfel på CSS kan det ibland vara okey, men du bör inte ha något valideringsfel på HTML.

<!--
Mer jobb? Ny sida galleri med sex-12 olika bilder i en flexbox med tre kolumner och två rader.
-->



Publicera {#publicera}
-----------------------

Avsluta uppgiften så här.

1. Kontrollera för dig själv att du har utfört samtliga krav.

1. När du är klar kan du publicera resultatet med `dbwebb publish report`.

1. Testa ditt resultat så att det passerar de automatiska testerna med `dbwebb test kmom02`.
