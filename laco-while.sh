#!/bin/bash
#------------------
# Script: laco-while.sh
# Le dados num laco while e insere num arquivo
#------------------


RESP=s

while [ "$RESP" = "s" -o "$RESP" = "S" ]; do

   read -p "Digite um nome: " NOME
   read -p "Digite um numero: " NUMERO
   echo $(date +"%x %X"),$NOME,$NUMERO >> ./dados.txt

   read -p "Continua (S/N)? " RESP

done

cat ./dados.txt
