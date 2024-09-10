#!/bin/bash

imprimir_numeros() {
	local veces=$1
	local i=1
	local valores_almacenados=()
	while [ $i -lt $((veces + 1)) ]; do
		echo "Ingrese su valor numero $i:"
		read valor
		valores_almacenados+="$valor "
		((i++))
	done
	echo "Sus numeros son $valores_almacenados"
}

echo "Cuantos numeros quiere imprimir?"
read cantidad
imprimir_numeros $cantidad
