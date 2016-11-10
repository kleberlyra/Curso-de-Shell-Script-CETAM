#!/bin/bash
#------------------
# Script: laco-for.sh
# Gerar lacos com o comando for
#------------------

echo Listagem dos arquivos do diretorio atual

for ARQ in *; do
   if [ -d "$ARQ" ]; then
      echo -e "\tdiretorio\t-\t$ARQ"
   elif [ -x "$ARQ" ]; then
      echo -e "\texecutavel\t-\t$ARQ"
   else
      echo -e "\tarquivo\t\t-\t$ARQ"
   fi
done

echo Rotina com laco com avaliacao aritmetica
echo -en "\t"

for ((X=1;X<=5;X=X+1)); do
   echo -n $X...
done

echo
echo Gerando uma lista a partir de um comando

IFS=$'\t\n'
for LINHA in `cat dados.txt`; do
   echo -e "\tRegistro: $LINHA"
   DATA=$(echo $LINHA | cut -d "," -f 1)
   NOME=$(echo $LINHA | cut -d "," -f 2)
   NUM=$(echo $LINHA | cut -d "," -f 3)
   echo -e "\t\tData do Registro: $DATA\n\t\tNome: $NOME\t\tNumero: $NUM"
done
