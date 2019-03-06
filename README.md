# PICA-kulatur

Aus WinIBW-Downloads von PICA-Daten mehrfach vorhandene Exemplare herausfiltern (z.B. zur Makulatur alter, physikalischer Dubletten).

![](PICA-kulatur.gif)


## Installation

Dieses Bash-Skript wurde bisher im Terminal von macOS 10.13.6 getestet.
Es sollte allerdings auch in der [Git Bash für Windows](https://github.com/git-for-windows/git/releases/download/v2.19.2.windows.1/Git-2.19.2-64-bit.exe)
funktionieren. Also:

1. Im Terminal oder in der Git Bash `git clone https://github.com/katrinleinweber/PICA-kulatur` ausführen.
1. Mit `cd PICA-kulatur` in ebenjenes neues Verzeichnis wechseln.
    - unter macOS: das Skript mit `chmod +x PICA-kulatur.sh` ausführbar machen.


## Benutzung

1. In den WinIBW-Einstellungen-/Optionen prüfen, wohin Downloads/Exporte gespeichert werden.
1. Evtl. vorhandene Dateien (z.B. `download.txt`) umbenennen oder löschen.
1. In WinIBW das "Set" angelegen, das nach mehrfach vorhandenen Exemplaren durchsucht werden soll.
1. Das Set mit dem `dow`-Befehl in die oben ermittelte Datei herunterladen.
1. Jene Datei ins `PICA-kulatur`-Verzeichnis kopieren.
1. Terminal oder Git Bash dort aufrufen.
1. `./PICA-kulatur.sh download.txt` (bzw. den jeweiligen Dateinamen des Downloads/Exports) eintippen & mit der Enter-/Return-Taste bestätigen.


## Ausgabe

Die vermutlich mehrfach vorhanden Exemplare sind nach PPN aufgelistet in:

- `cache-.../PPN-Exemplare.txt` mit der gezählten Anzahl.
- `...zip` Kopien der gefundenen PICA-Records.

Bitte prüfen, ob sie wirklich makuliert werden können.
