---
author: efo
revision:
    "2021-12-17": (A, efo) Skapad inför VT2022.
...
Cognitive Services i Azure
==================================

Azure Cognitive Services är molnbaserade tjänster för att kunna använda kognitiva funktioner utan att ha AI- eller datavetenskapskunskaper.



<!--more-->



De kognitiva tjänster som finns i Cognitive Services kan kategoriseras i fem områden:

    Visuellt innehåll
    Tal
    Språk
    Beslut
    Sök

Vi har har satt upp en instans av Cognitive Services som kan användas för visuellt innehåll och språk i kursen.

Det finns ibland risker att oväntat hög användning av vissa tjänster ger kostnader som är svåra att uppskatta.

Då är det vanligt att man tillgängliggör sådana tjänster genom ett [Api Management](https://azure.microsoft.com/sv-se/services/api-management/) så man exempelvis kan justera antalet anrop, sk. rate-limit, och det är så vi har gjort i detta fallet.

Kursinstansen nås genom att låta sina requests gå via DV1615's Api Management. Det behövs en nyckel för att få access till tjänsten, lägg till den i request headers. API-nyckeln är hemlig och det är viktigt att ni inte delar med er av den till personer utanför kursen. Av den anledningen [finns nyckeln i Canvas](https://bth.instructure.com/courses/5501/pages/api-nyckel-till-api-management).



### Endpoints {#endpoints}

Nedan beskrivs de olika endpoints/url'er som finns i API-management för kursen.

#### Vision - bildtolkning

```shell
POST https://dv1615-apimanagement-lab.azure-api.net/vision/v3.0/analyze?visualFeatures=Tags
```

Body:

```json
{
    "url": "{url till bild}"
}
```



#### Translate - Språköversättning

```shell
POST  https://dv1615-apimanagement-lab.azure-api.net/translator/text/v3.0/translate?from={språk att översätta från}&to={språk att översätta till}
```

Body:

```json
[
    {
        "text": "{text som ska översättas}"
    }
]
```



### Exempel {#examples}

#### Vision

```shell
POST https://dv1615-apimanagement-lab.azure-api.net/vision/v3.0/analyze?visualFeatures=Tags
Header: Ocp-Apim-Subscription-Key: nyckel
Body:
{
    "url": "https://www.passionforbaking.com/wp-content/uploads/2017/06/E95A8398-1024x683.jpg"
}
```

Exempel på hur man hade kunnat göra en POST i `requests`:

```python
url = 'https://dv1615-apimanagement-lab.azure-api.net/vision/v3.0/analyze?visualFeatures=Tags'
body = {'url':'https://www.passionforbaking.com/wp-content/uploads/2017/06/E95A8398-1024x683.jpg'}
headers = {'Ocp-Apim-Subscription-Key': 'nyckel'}

response = requests.post(url, headers=headers, json=body)
```

Response:

```json
{
    "tags": [
        {
            "name": "cake",
            "confidence": 0.998274028301239
        },
        {
            "name": "table",
            "confidence": 0.9897675514221191
        },
        {
            "name": "baked goods",
            "confidence": 0.925739049911499
        },
        {
            "name": "plate",
            "confidence": 0.9191524982452393
        },
    ]
}
```



#### Translate

```shell
POST https://dv1615-apimanagement-lab.azure-api.net/translator/text/v3.0/translate?from=en&to=sv
Ocp-Apim-Subscription-Key: nyckel
body:
[
    {
        "text": "cake"
    },
    {
        "text": "table"
    }
]
```

Response:

```json
[
    {
        "translations": [
            {
                "text": "Tårta",
                "to": "sv"
            }
        ]
    },
    {
        "translations": [
            {
                "text": "Tabell",
                "to": "sv"
            }
        ]
    }
]
```



### Rate-limit {#rate-limit}

För att ha möjligheten att vid behov kunna justera mängden anrop till Cognitive Services används en sk. rate-limit. Kort sammanfattat innebär det att tjänsten får en begränsning på hur många anrop som tillåts inom en tidsperiod, t.ex 1 minut. Överstiger mängden anrop den gräns som är satt så får man en response med StatusCode 429 - Too Many Requests och en body liknande denna.

```json
{
    "statusCode": 429,
    "message": "Rate limit is exceeded. Try again in {gränsvärde} seconds."
}
```

Man får då vänta och testa igen när nedkylningstiden är slut.
