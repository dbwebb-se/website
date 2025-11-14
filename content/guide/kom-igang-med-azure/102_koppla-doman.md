---

author: aar
revision:
    "2023-10-24": "(A, aar) Första versionen."
...
Domännamn {#domain}
=======================

Det underlättar dessutom om vi har ett domännamn som vi kan länka till en server. Om du inte redan har ett kolla in artikeln ["GitHub Education Pack och ett domännamn"](kunskap/github-education-pack-och-doman-namn).

När du har fixat en domän, kolla på videon för att koppla ditt domännamn till servern du skapade ovanför i Azure.

[INFO]
I videon används sidan namecheap för domännamn. Om du använder .tech. Läs [.tech](#tech).
[/INFO]

`1:00` i videon när er DNS zone är skapad, klicka på `Record sets` för att komma till samma vy som i videon.

[FIGURE src="/image/devops/find-recordsets.png" caption="Hitta till Record sets"]

`3:00` i videon när ni ska koppla er DNS till serverns IP. Skippa att lägga till IP adressen. Gör istället ett alias till IP resursen.

[FIGURE src="/image/devops/dns-alias.png" caption="DNS alias till IP"]

[YOUTUBE src="CNSAT9n0554" caption="102 Koppla domän till Azure."]


### .tech {#tech}

I Azure funkar det likadant som i videon, så kolla på den. När videon visar namecheap ska ni göra samma sak i .tech.

Gå till kontrollpanelen och skriv in ditt domännamn i sökrutan.

[FIGURE src="/image/devops/tech-control-panel.png" caption=".tech kontrollpanel"]

Därefter välj "Name server".

[FIGURE src="/image/devops/tech-options.png" caption=".tech name servers"]

Ersätt därefter värdena med servrarna som ni har fått från Azure.

[FIGURE src="/image/devops/tech-dns.png" caption="Uppdatera DNS"]

De servrar som är med från början ska ersättas av de ni får från Azure.
