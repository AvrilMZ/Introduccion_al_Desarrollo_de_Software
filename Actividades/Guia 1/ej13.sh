#!/bin/bash

factorial () {
	local num=$1
	local i=1
	local resultado=1
	while [ $i -ne $((num + 1)) ]; do
		resultado=$((resultado * i))
		((i++))
	done
	echo "El factorial es: $resultado"
}

echo "A que numero le desea calcular su factorial?"
read numero
factorial $numero
