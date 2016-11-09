#!/bin/bash
#------------------
# Script: menu-case.sh
# Demonstra o uso de case para a construcao de um menu de opcoes
#------------------

echo -e "\n*** Menu de Opcoes ***\n"
echo "d - exibe a data e hora do sistema"
echo "w - exibe os usuarios logados"
echo -e "l - exibe os arquivos do diretorio /tmp \n"

read -p "Entre com sua opcao: " OPCAO

case $OPCAO in
   [dD]) date ;;
   [wW]) w;;
   [lL]) ls -l /tmp;;
      *) echo Opcao invalida ;;
esac

