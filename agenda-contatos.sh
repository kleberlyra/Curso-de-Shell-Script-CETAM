#!/bin/bash

function cadastrar()
{
   echo "**** CADASTRAR CONTATO ****"
   read -p "Nome do contato: " NOME
   read -p "Telefone: " FONE
   read -p "E-mail: " EMAIL
   read -p "Os dados estao corretos (S/N)? " RESP
   [ "$RESP" = "s" -o "$RESP" = "S" ] && ( echo $NOME:$FONE:$EMAIL >> $ARQ ; echo Cadastro efetuado )
}

function listar()
{
   echo "**** LISTAR CONTATOS ****"

   echo -e "NOME\t\tTelefone\tE-mail"
   echo    "*************************************************************"
   awk -F ":" '{print $1"\t\t"$2"\t\t"$3}' $ARQ | sort
}

function remover()
{
   echo "**** REMOVER CONTATO ****"
   read -p "Nome do contato para remover: " NOME
   grep -i "^${NOME}:" $ARQ > /dev/null
   if [ $? -eq 0 ] ; then
      read -p "Confirma remocao (S/N)? " RESP
      grep -v -i "^${NOME}:" $ARQ > "${ARQ}.tmp"
      rm $ARQ
      mv ${ARQ}.tmp $ARQ
      echo Remocao concluida
   else
      echo Contato inexistente
   fi
}


function menu()
{
   echo -e "\n**** MENU ****\n"
   echo "c - cadastrar"
   echo "l - listar"
   echo "r - remover"
   echo -e "s - sair\n"
   read -p "Escolha uma opcao: " OPCAO
}

ARQ=/tmp/dados.txt
OPCAO=""

while true; do

   menu
   case "$OPCAO" in
      [cC]) cadastrar;;
      [lL]) listar;;
      [rR]) remover;;
      [sS]) break;;
         *) echo Opcao invalida;;
   esac
done
