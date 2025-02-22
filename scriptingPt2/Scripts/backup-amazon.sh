#!/bin/bash

caminho_backup="/caminho/para/sua/pasta/backup_mutillidae_amazon"

cd $caminho_backup

data=$(date +%F)

if [ ! -d $data ]
	mkdir $data
fi

tabelas=$(sudo mysql -u root mutillidae -e "show tables;" | grep -v Tables)

for tabelas in $tabelas
do
	mysqldump -u root mutillidae $tabela > $caminho_backup/$data/$tabela.sql
done

aws s3 sync $caminho_backup s3://curso-shell-script #é o nome do teu bucket
