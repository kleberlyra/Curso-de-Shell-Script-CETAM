#!/bin/bash
#------------------
# Script: laco-until.sh
# Realiza uma contagem regressiva com o laco until
#------------------


echo Prepare-se para uma contagem regressiva...

CONTADOR=5

until (( CONTADOR < 1 )); do

   echo $CONTADOR...
   let CONTADOR=CONTADOR-1
   sleep 1

done

echo Fim!
