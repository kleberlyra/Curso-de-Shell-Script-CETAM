#!/bin/bash
#------------------
# Script: retorno.sh
# Simula codigos de retorno de funcao e do script
#------------------

funcao-ok()
{
   echo execucao da funcao-ok...
   return
}

funcao-falha()
{
   echo execucao da funcao-falha
   return 99
   date
}

echo Iniciand a simulacao...
funcao-ok
echo Codigo de retorno: $?

funcao-falha
echo Codigo de retorno: $?

exit 1

echo Esta linha nem chegara a ser executada
