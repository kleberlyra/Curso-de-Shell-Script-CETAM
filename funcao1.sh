#!/bin/bash
#------------------
# Script: parametros.sh
# Criar três arquivos no diretorio /tmp
#------------------

# cria um arquivo com o nome informado pelo usuario
# no primeiro parametro passamos o nome do arquivo
# no segundo parametro passamos o tamanho que este arquivo deve ter em MB
criar_arquivo()
{
   NOVOARQUIVO=$1
   TAMANHO=$2
   dd if=/dev/zero of="$NOVOARQUIVO" bs=${TAMANHO}MB count=1 &> /dev/null
   echo -e "Arquivo $NOVOARQUIVO criado:\n\t\t$(ls -lh $NOVOARQUIVO)"
}

criar_arquivo primeiro.dat 10
criar_arquivo segundo.dat 5
criar_arquivo terceiro.dat 3
