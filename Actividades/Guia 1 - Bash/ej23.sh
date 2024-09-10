#!/bin/bash

crear_carpetas() {
	local cant=$1
	for ((i=1 ; i<=cant ; i++)); do
		mkdir "carpeta$i"
	done
}

echo "Cuantas carpetas queres crear?"
read cantidad_carpetas
crear_carpetas $cantidad_carpetas
