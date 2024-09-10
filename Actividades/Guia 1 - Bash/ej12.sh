#!/bin/bash

numeros_naturales () {
	local num=$1
	i=0
	until [ $i -eq $((num + 1)) ]; do
		echo $i
		((i++))
	done
}

echo "Hasta que numero queres contar?"
read numero
numeros_naturales $numero
