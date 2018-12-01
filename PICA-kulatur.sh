#!/usr/bin/env bash
# statt /bin/bash, siehe https://stackoverflow.com/a/16365367/4341322

# stoppe bei Fehlern sofort, siehe
# https://codeinthehole.com/tips/bash-error-reporting/
set -eu -o pipefail

# Trennzeile zwischen PICA-Datensätzen
TRENN_Z='PPN: '

# ermittele deren Anzahl
# https://stackoverflow.com/a/28085361/4341322
# https://stackoverflow.com/a/14093511/4341322
N_TRENN=$(grep -ciE $TRENN_Z $1 | awk '{print $0-2}')
N_STELLEN=$(echo $N_TRENN | wc -c | sed -E 's/ //g')

# arbeite im temporären Verzeichnis weiter
TMP="PICA_tmp"
mkdir $TMP
cd $TMP

# trenne PICA-Download in Einzeldateien auf
csplit \
	-k \
    -f _ \
	-n $N_STELLEN \
	../$1 \
	"/$TRENN_Z/" \
	{$N_TRENN} \
	| sort

# ermögliche Schnellprüfung der Aufteilungsanzeige gegen Ergebnisliste 
echo "Je größer die Differenz zwischen den beiden hier drüber\
 letzten Zahlen ist, desto wahrscheinlicher ist eine zu hohe\
 Exemplaranzahl für die direkt hier drunter folgende PPN!"

# entferne PICAs ƒ-Delimiter & andere 
sed -Ei '' 's_ƒ._\ _g' _*

# pro PICA-Datei: extrahiere PPN, zähle Exemplare & schreibe in Ergebnisdatei
ERG_D=PPN-Exemplare.txt
for PICA_D in _*; do
	PPN=$(grep -ioE "$TRENN_Z\d+X?" $PICA_D | sed -E "s/$TRENN_Z//g")
    EX_N=$(grep -cE "^208@/\d+" $PICA_D)
	echo $PPN:$EX_N >> ../$ERG_D
done

cd ..

# sortiere Ergebnisdatei nach häufigsten Dubletten
sort \
    --key=2 \
	--field-separator=: \
    --reverse \
    --numeric-sort \
    --output $ERG_D \
    $ERG_D

# zeige Ergebnisse
cat $ERG_D