#!/bin/bash

memoria_total=$(free | grep -i mem | awk '{print $2}')

memoria_consumida=$(free | grep -i mem | awk '{print $3}')

memoria_atual_total=$(bc<<<"scale=2;$memoria_consumida/$memoria_total *100" | awk -F. '{print $1}')

consumo_atual=$(free -h | grep -i mem | awk '{print $3}')
#echo $memoria_atual_total
if [ $memoria_atual_total -gt 50 ];then 
	mail -s "Consumo de memoria acima do limite!" seu-email-aqui@gmail.com<<EOF
O consumo de memoria esta acima do especificado, atualmente o consumo é de $consumo_atual
EOF
fi

