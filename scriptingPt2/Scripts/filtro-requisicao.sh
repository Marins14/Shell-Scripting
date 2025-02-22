#!/bin/bash 

cd ../apache-log

#Método não convencial e muito custoso para comparações
#if [ $1 == "GET" ];then
#	cat apache.log | grep GET
#elif [ $1 == "POST" ];then
#	cat apache.log | grep POST
#elif [ $1 == "PUT" ];then
#	cat apache.log | grep PUT
#elif [ $1 == "DELETE" ];then 
#	cat apache.log | grep DELETE
#fi

#Valida se o parametro esta vazio -Z
if [ -z $1 ];then
	while [ -z $requisicao ];
	do 
		read -p "Voce esqueceu de colocar parametro! (GET,PUT,POST,DELETE): " requisicao
		letra_maiuscula=$(echo $requisicao | awk '{print toupper($1)}')
	done
else
	letra_maiuscula=$(echo $1 | awk '{print toupper($1)}')
fi

case $letra_maiuscula in
	GET)
		cat apache.log | grep GET
	;;
	POST)
		cat apache.log | grep POST
	;;
	PUT)
		cat apache.log | grep PUT
	;;
	DELETE)
		cat apache.log | grep DELETE
	;;
	*)
		echo "Parametro Invalido!"
	;;
esac 
