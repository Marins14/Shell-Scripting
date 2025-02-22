#!/bin/bash 

cd ../apache-log

regex="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"

if [[ $1 =~ $regex ]];then 
	cat apache.log | grep $1
	if [ $? -ne 0 ];then
		echo "Endereco IP procurado nao esta presente no arquivo!"
	fi
else
	echo "Formato inválido!"
fi


#[0-9]{1,3} -> podem ter de 1 a 3 valores sendo eles todos numericos 

#Validando um ip: \b([0-9]{1,3}\.){3}[0-9]{1,3}\b \b ele basicamente evita que seja colocado algo antes ou depois neste caso. 


