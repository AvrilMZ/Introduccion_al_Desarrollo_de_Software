#!/bin/bash

primos() {
	local valor=$1
	local salida="primos.txt"
	> $salida #Para vaciar el archivo
	for ((i=2; i<=valor; i++)); do
		local es_primo=1
		for ((j=2; j*j<=i; j++)); do
			if ((i % j == 0)); then
				es_primo=0
				break
			fi
		done
		if ((es_primo)); then
			echo $i >> $salida
		fi
	done
}

echo "Elija un numero para imprimir los numeros primos anteriores:"
read numero_maximo
primos $numero_maximo
