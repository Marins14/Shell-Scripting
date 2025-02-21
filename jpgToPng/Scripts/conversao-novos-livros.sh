#!/bin/bash

#cd "$HOME/imagens-novos-livros"

#for arquivo in *
#do 
#	if [ -d $arquivo ];then
#		#Fazer a varredura
#		cd $arquivo
#		for conteudo_arquivo in *
#		do
#			if [ -d $conteudo_arquivo ];then
#				#Entra no diretorio
#			else
#				#Conversao
#			fi
#		done
#	else
		#converter para png
#	fi
#done
converte_imagem(){
	local caminho_imagem=$1
	local imagem_sem_ext=$(ls $caminho_imagem | awk -F. '{print $1}')
	convert $imagem_sem_ext.jpg $imagem_sem_ext.png
}
varrer_diretorio(){
	cd $1
	for arquivo in *
	do	
		local caminho_arquivo=$(find $HOME/imagens-novos-livros -name $arquivo)
		if [ -d $caminho_arquivo ];then
			varrer_diretorio $caminho_arquivo
		else
			converte_imagem $caminho_arquivo
		fi
	done
}

varrer_diretorio "$HOME/imagens-novos-livros" 2>erros_conversao.txt

if [ $? -eq 0 ];then
	echo "Conversao realizada com sucesso!"
else
	echo "Houve um problema na conversao!"
fi
