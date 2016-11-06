#!/bin/bash

R7=1
R8=1
R9=1

# se é falso é pq é ligação inicial

while read REG ; do

	ORI=$(echo ${REG}|awk -F "," '{print $6}')
	DEST=$(echo ${REG}|awk -F "," '{print $7}')

	case ${ORI} in
	    "777-777") if [ ${R7} -eq 1 ]; then DEST7=${DEST}; T="I"; R7=0; else DEST=${DEST7}; T="F"; R7=1; fi ;;
	    "888-888") if [ ${R8} -eq 1 ]; then DEST8=${DEST}; T="I"; R8=0; else DEST=${DEST8}; T="F"; R8=1; fi ;;
            "999-999") if [ ${R9} -eq 1 ]; then DEST9=${DEST}; T="I"; R9=0; else DEST=${DEST9}; T="F"; R9=1; fi ;;
	esac

	echo "${REG},${DEST},${T}"

done < logs.csv

