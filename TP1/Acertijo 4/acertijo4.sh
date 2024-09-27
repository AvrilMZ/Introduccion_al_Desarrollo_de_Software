#!/bin/bash

descifrar_mensaje(){
	local archivo_entrada=$1

	grep -o '[a-zA-Z]' $archivo_entrada | tr -d '\n' | tr 'A-Z' 'a-z'
	sed -e 's/cueva/doblar/g' \
		    -e 's/secreta/izquierda/g' \
		    -e 's/pocos/despues/g' \
		    -e 's/metros/derecha/g' \
		    -e 's/arriba/delante/g' \
		    -e 's/atras/reversa/g' "$archivo_entrada"
}

main(){
	read -p "Ingrese el nombre del papiro:" entrada
	descifrar_mensaje $entrada > mensaje_papiro.txt
}

main
