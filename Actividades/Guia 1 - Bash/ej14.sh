#!/bin/bash

numero_par () {
	local num=$1
	if [ $((num % 2)) -eq 0 ]; then
		echo "Su numero es par"
	else
		while [ $((num % 2)) -ne 0 ]; do
			echo "El numero ingresado no es par, ingresa otro:"
			read num
		done
	fi
}

echo "Ingresa un numero para verificar si es par"
read numero
numero_par $numero
