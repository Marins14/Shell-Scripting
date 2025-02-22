#!/bin/bash

caminho_restore="/diretorio/para/sua/pasta/restore_mutillidae_amazon"

aws s3 sync s3://curso-shell-script/$(date +%F) $caminho_restore

cd $camiho_restore

if [ -f $1.sql ];then
	mysql -u root mutillidae < $1.sql
	if [ $? -eq 0 ];then 
		echo "Restore feito com sucesso!"
	fi
else
	echo "Arquivo procurado nao existe!"
fi

