#!/bin/bash
#------------------
# Script: condicional1.sh
# Demonstra o uso de desvio condicional
#------------------

read -p "Informe seu nome: " NOME

# caso o usuario nao informe seu nome, 
# o script sera encerrado
if [ -z "$NOME" ]; then
   echo Voce deveria ter informado seu nome
   exit 1
fi

read -p "Informe o ano que você nasceu (aaaa): " ANO

# testa se o usuario nasceu em ano bissexto
if [ $(($ANO%4)) -eq 0 ]; then
   echo O ano que voce nasceu foi um ano bissexto
else
   echo O ano que voce nasceu nao foi um ano bissexto
fi

read -p "Informe o mes (numerico)  que voce nasceu: " MES

# informa ao usuario em qual trimestre do ano ele nasceu
if [ $MES -le 3 ]; then
   echo Voce nasceu no primeiro trimestre do ano
elif [ $MES -le 6 ]; then
   echo Voce nasceu no segundo trimestre do ano
elif [ $MES -le 9 ]; then
   echo Voce nasceu no terceiro trimestre do ano
else
   echo Voce nasceu no ultimo trimestre do ano
fi
