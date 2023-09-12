#!/bin/bash

read -p "Geben Sie die Git-Repository-URL ein: " repository
read -p "Geben Sie das Verzeichnis für das Projekt ein: " verzeichnis

# Git-Repository klonen
git clone "$repository"
cd "$verzeichnis"

# Maven-Paket erstellen
mvn package

# Verzeichnis, in dem die JAR-Datei gesucht wird
verzeichnis="target/"

# Die erste gefundene .jar-Datei im Verzeichnis finden
dateiname=$(find "$verzeichnis" -name "*.jar" -type f -print -quit 2>/dev/null)

# Überprüfen, ob eine .jar-Datei gefunden wurde
if [ -n "$dateiname" ]; then
    echo "Die .jar-Datei wurde gefunden: $dateiname"
else
    echo "Keine .jar-Datei gefunden."
fi

# JAR-Datei ausführen
java -jar "$dateiname"
