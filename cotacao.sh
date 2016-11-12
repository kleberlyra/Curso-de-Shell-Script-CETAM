#!/bin/bash

# calcula o ultimo dia util anterior a data informada por parametro no formato AAAAMMDD
function ultimoDiaUtil()
{
	DATA=$(date -d "$1" +%Y%m%d )

	for N in 1 2 3; do
		if [ $(date -d "$DATA -$N day" +%u) -ge 1 -a $(date -d "$DATA -$N day" +%u) -le 5  ]; then
			date -d "$DATA -$N day" +%Y%m%d
			return
		fi
	done
}

function pegaArquivo()
{
	echo Obtendo arquivo... aguarde isto pode levar alguns minutos...
	if [ -n "$(which wget 2> /dev/null)" ]; then
		wget -O $ARQCOTACAO ${URLBASE}${1}.csv &> /dev/null
	elif [ -n "$(which curl 2> /dev/null)" ]; then
		curl -o $ARQCOTACAO ${URLBASE}${1}.csv &> /dev/null
	else
		echo Para a obtencao dos dados e necessario que um dos utilitarios wget ou curl estejam istalados no sistema...
		exit 1
	fi
}

function validaArquivo()
{
	if [ -s $ARQCOTACAO ]; then
		if [ -z "$(grep 'Server Error' $ARQCOTACAO)" ]; then
			return 0
		else
			return 1
		fi
	else
		return 1
	fi
}

function conectividade()
{
	SERVIDOR=$(echo $URLBASE | awk -F/ '{print $3}')
	echo -n Verificando a conectividade com o site do Banco Central do Brasil....
	ping -c 3 $SERVIDOR &> /dev/null
	if [ $? -ne 0 ]; then
		echo FALHA
		echo Seu computador nao consegue conectar-se ao servidor do Banco Central do Brasil
		echo Verifique sua conexao de internet e tente novamente
		exit 2
	else
		echo OK
	fi
}

ARQCOTACAO="/tmp/cotacoes.csv"
[ -f "$ARQCOTACAO" ] && rm $ARQCOTACAO

URLBASE="http://www4.bcb.gov.br/Download/fechamento/"


read -p "Para obter cotacao de moedas, informe a data deseja, ou deixe em branco para obter a ultima (Formato: DD/MM/AAAA): " DATA

DATA=$(echo $DATA | awk -F "/" '{print $3$2$1}')
DATA=$(date -d "$DATA" +%Y%m%d)
DIACOTACAO=$DATA

conectividade


for ((X=1;X<6;X=X+1)); do
	echo Buscando cotacao do dia $DIACOTACAO

	pegaArquivo $DIACOTACAO
	validaArquivo
	if [ $? -eq 0 ] ; then
		echo Cotacoes obtidas no site do Banco Central do Brasil

		egrep "EUR|USD|JPY|GBP" $ARQCOTACAO | awk -F ';' '{print "\tMoeda: "$4"\tData da Cotacao: "$1"\tVenda: 1 "$4" = "$6" reais"}'
		break
	else
		DIACOTACAO=$(ultimoDiaUtil $DATA)
   	DATA=$DIACOTACAO
	fi
done

[ $X -gt 5 ] && echo "Cotacao nao encontrada para este periodo, tente uma data mais recente"
