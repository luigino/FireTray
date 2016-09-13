#!/bin/bash
set -x

DENSITY=300

for N in `seq 1 100`; do 
	TMP_FILE=unread-${N}

	if [ $N -lt 10 ]; then
		cat unread-X.svg | sed "s/%MAIL_COUNT%/$N/" > ${TMP_FILE}.svg
	fi

	if [ $N -gt 9 -a $N -lt 100 ]; then
		cat unread-XX.svg | sed "s/%MAIL_COUNT%/$N/" > ${TMP_FILE}.svg
	fi

	if [ $N -eq 100 ]; then
		TMP_FILE=unread-max
		cat unread-XXX.svg | sed "s/%MAIL_COUNT%/99+/" > ${TMP_FILE}.svg
	fi

	inkscape -z -d $DENSITY ${TMP_FILE}.svg -e ${TMP_FILE}.png

	rm ${TMP_FILE}.svg
done
