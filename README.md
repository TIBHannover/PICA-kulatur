# PICA-kulatur

Aus WinIBW-Downloads von PICA-Daten mehrfach vorhandene Exemplare herausfiltern (z.B. zur Makulatur alter, physikalischer Dubletten).

![](PICA-kulatur.gif)


## Installation

Dieses Bash-Skript wurde bisher im Terminal von macOS 10.13.6 mit der
[Z Shell](https://de.wikipedia.org/wiki/Z_shell) (v5.7.1) getestet.
In der regulären Bash oder der Git Bash für Windows funktioniert es leider
momentan nicht (siehe [#5](https://github.com/TIBHannover/PICA-kulatur/issues/5)). Daher:

1. macOS-Terminal in seinen Optionen auf `/bin/zsh` umstellen und neu starten.
1. `git clone https://github.com/katrinleinweber/PICA-kulatur` ausführen.
1. Mit `cd PICA-kulatur` in ebenjenes neues Verzeichnis wechseln.
1. Das Skript mit `chmod +x PICA-kulatur.sh` ausführbar machen.


## Benutzung

1. In den WinIBW-Einstellungen-/Optionen prüfen, wohin Downloads/Exporte gespeichert werden.
1. Evtl. vorhandene Dateien (z.B. `download.txt`) umbenennen oder löschen.
1. In WinIBW das "Set" angelegen, das nach mehrfach vorhandenen Exemplaren durchsucht werden soll.
1. Das Set mit dem `dow`-Befehl in die oben ermittelte Datei herunterladen.
1. Jene Datei ins `PICA-kulatur`-Verzeichnis kopieren.
1. Terminal dort aufrufen.
1. `./PICA-kulatur.sh download-test.txt` (bzw. den jeweiligen Dateinamen des Downloads/Exports) eintippen & mit der Enter-/Return-Taste bestätigen.

Die in diese Repository [beigelegte Test-Datei](./download-text.txt)
demonstriert die Nutzung. Sie enthält folgende Datensätze:

- PPN `01848350X` mit 12 Exemplaren,
- `1013878469` mit zweien,
- `130994197` mit einem, sowie
- `59975818X` mit mehreren, allerdings schon makulierten Exemplaren.


## Ausgabe

Die vermutlich mehrfach vorhanden Exemplare werden:

- nach PPN aufgelistet in `EVTL-makulierbar/...txt` mit der gezählten Anzahl, sowie
- in einer Zeit-gestempelten `...zip`-Datei gesichert.

Bitte prüfen, ob sie wirklich makuliert werden können.
