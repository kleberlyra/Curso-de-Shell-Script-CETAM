#!/bin/bash
#------------------
# Script: parametros.sh
# Exerimenta o uso de parametros num script
#------------------

echo -n Informe seu nome: ; read NOME
read -p "Informe o dia do seu nascimento: " DIA
read -p "Informe o mes do seu nascimento: " MES
read -p "Informe o ano do seu nascimento: " ANO

#calcula a quantidades de segundos que um ano possui
SEGUNDOSANO=$((365*24*60*60))

#calcula o TIMESTAMP da data de nascimento informada
SEGUNDOSNASC=$(date -u --date="$ANO/$MES/$DIA" +%s)

#calcula o TIMESTAMP da data atual
SEGUNDOSATUAL=$(date -u +%s)

#calcula a idade do usuario
IDADE=$((($SEGUNDOSATUAL-$SEGUNDOSNASC)/$SEGUNDOSANO))

echo $NOME, voce tem $IDADE anos e nasceu numa $(date -u --date "$ANO/$MES/$DIA" +%A).
