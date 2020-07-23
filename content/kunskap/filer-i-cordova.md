---
author: efo
category: javascript
revision:
  "2020-04-22": (A, efo) Första utgåvan inför kursen webapp v3.
...
Filer i Cordova
==================================

Vi ska i denna artikel titta på hur vi kan skriva till fil och hur vi kan läsa från samma fil. Detta är en av de stora fördelar vi får med att använda Cordova för att komma åt hårdvarunära funktioner i våra mobila enheter.

<!--more-->

I kursrepot finns ett exempel program i `example/file` och på Github under [dbwebb-se/webapp](https://github.com/dbwebb-se/webapp/tree/master/example/file).

Exempel programmet utgår från samma grundstruktur som i exemplet "[Kom igång med Cordova](kunskap/kom-igang-med-cordova)". Vi kommer i exempelprogrammet skapa ett textfält och sedan skriver vi det som finns i textfältet till fil. Vi kan sedan läsa tillbaka från filen och visa upp i appen.



Plugin cordova-plugin-file {#plugin}
--------------------------

Vi börjar med att installera det plugin som behövs för att skriva till och läsa från filer i Cordova `cordova-plugin-file` med följande kommando, stå i ditt cordova projekt när du kör kommandot. [Dokumentation](https://cordova.apache.org/docs/en/latest/reference/cordova-plugin-file) och exempel för pluginen kan man hitta på Cordovas webbplats.

```shell
$ cordova plugin add cordova-plugin-file
```

I exempelprogrammet har jag en enkel vy som renderas efter att Cordova har sagt att den mobila enheter är redo med callbacken `onDeviceReady`. Vyn har ett text fält och tre knapper.

```javascript
import m from "mithril";
import fileModel from "../models/filemodel.js";

var fileView = {
    oninit: fileModel.createFile,
    view: function() {
        return m("div.container", [
            m("h1", "Hello File"),
            m("input.input[type=text]", {
                oninput: function(e) {
                    fileModel.current = e.target.value;
                },
                value: fileModel.current
            }),
            m("button.button", {
                onclick: function() {
                    fileModel.writeToFile(
                        fileModel.file,
                        fileModel.current,
                        false
                    );
                }
            }, "Write text to file"),
            m("button.button", {
                onclick: function() {
                    fileModel.writeToFile(
                        fileModel.file,
                        fileModel.current,
                        true
                    );
                }
            }, "Append text to file"),
            m("button.button", {
                onclick: function() {
                    fileModel.readFromFile(fileModel.file);
                }
            }, "Read from file"),
            m("div.read-text", fileModel.readText)
        ]);
    }
};

export default fileView;
```

I `oninit` livscykel-metoden anropar vi funktionen `fileModel.createFile`, som skapar en så kallad 'persistent file'. Hela modellen kan du hitta i exempelkatalogen. I `createFile` funktionen hämtar vi först det lokala filsystemet, som finns antigen i webbläsaren eller på den mobila enheten. Vi skapar sedan filen `data.txt` och sparar referensen till filen `fileEntry` i modellen.

```javascript
createFile: function() {
    window.requestFileSystem(LocalFileSystem.PERSISTENT, 0, function (fs) {
        console.log('file system open: ' + fs.name);
        fs.root.getFile(
            "data.txt",
            { create: true, exclusive: false },
            function (fileEntry) {
                fileModel.file = fileEntry;
            }, function() {
                outputError("Error loading file");
            });
    }, function() {
        outputError("Error loading filesystem");
    });
},
```

I vyn finns tre knappar som gör att vi kan skriva till filen, lägga till i filen och skriva ut från filen. De två knappar som skriver och läggar till i filen använder funktionen `writeToFile`. Här skapar vi först en `fileWriter`, som vi kan skriva till vår `fileEntry` med. Om vi vill lägga till flyttar vi oss först till slutet av filen och sedan skriver vi data, annars skriver vi data direkt. `onwriteend` och `onerror` är callback funktioner som anropas beroende på utfallet av skrivandet.

```javascript
writeToFile: function(fileEntry, data, append) {
    fileEntry.createWriter(function (fileWriter) {
        fileWriter.onwriteend = function() {
            console.log("Successful file write...");
        };

        fileWriter.onerror = function (e) {
            console.log("Failed file write: " + e.toString());
        };

        if (append) {
            try {
                fileWriter.seek(fileWriter.length);
            } catch (e) {
                console.log("file doesn't exist!");
            }
        }

        if (data) {
            fileWriter.write(data);
        }
    });
},
```

Funktionen `readFromFile` öppnar vi först filen och skapar sedan en `FileReader`. Sedan definierar vi callback funktionen `onloadend`, där vi först sätter resultatet från från läsningen till variabeln `fileModel.readText` och använder sedan möjligheten till att rita om vår vy med `m.redraw()`. Variabeln visas redan i vyn, men nu får den ett innehåll och texten renderas.

```javascript
readFromFile: function(fileEntry) {
    fileEntry.file(function (file) {
        var reader = new FileReader();

        reader.onloadend = function() {
            fileModel.readText = this.result;
            m.redraw();
        };

        reader.readAsText(file);
    }, function() {
        outputError("Error reading from file");
    });
}
```

Avslutningsvis {#avslutning}
--------------------------------------

Detta var en kort introduktion till hur filer fungerar i Cordova och hur vi kan skriva till och läsa från fil. I [dokumentationen](https://cordova.apache.org/docs/en/latest/reference/cordova-plugin-file) för pluginen finns fler exempel och information om hur det kan strula i vissa läge på de mobila enheterna.
