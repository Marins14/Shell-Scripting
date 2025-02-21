#!/bin/bash

converte_imagem(){
#path_imagem="/home/matheus/Documentos/Bin/jpgToPng"
cd "/home/matheus/Documentos/Bin/jpgToPng"

if [[ ! -d png ]];then
	mkdir png
fi

#for imagem in $@
for imagem in *.jpg
do	
	local imagem_sem_ext=$(ls $imagem | awk -F. '{print$1}')
	#convert $path_imagem/$imagem.jpg $path_imagem/$imagem.png
	convert $imagem_sem_ext.jpg png/$imagem_sem_ext.png
done
}

converte_imagem 2>erros_conversao.txt

if [ $? -eq 0 ];then 
	echo "Conversão realizada com sucesso!"
else
	echo "Houve uma fala no processo!"
fi

#echo $imagem_sem_ext nao vai mostrar por ser uma variavel local, se quiser acessar fora da funcao tirar o 'local' 

