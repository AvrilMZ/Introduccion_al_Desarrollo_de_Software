#!/bin/bash

creador_archivos () {
	local cant=$1
	for ((i=1 ; i<=cant ; i++)); do
		touch "archivo$i.txt"
	done
}

echo "Cuantos archivos de texto necesitas?"
read cantidad_archivos
creador_archivos $cantidad_archivos
