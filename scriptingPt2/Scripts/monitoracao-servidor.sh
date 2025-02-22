#!/bin/bash

resposta_http=$(curl -s --write-out %{http_code} --output /dev/null http://localhost)

#if [ $resposta_http -eq 200 ];then 
#	echo "Tudo ok com o servidor!"
#else
#	echo "Houve um problema no servidor. Tentando reinicializar"
	systemctl restart apache2
#	echo "..Servidor reinicializado!"
#fi
 

if [ $resposta_http -ne 200 ];then
	mail -s "Problema no Servidor" seu_email@gmail.com<<del
Houve um problema no servidor e os usuarios pararam de ter acesso ao conteudo Web.
del
	systemctl restart apache2
fi
