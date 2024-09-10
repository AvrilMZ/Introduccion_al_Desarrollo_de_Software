#!/bin/bash

concatenador() {
	local archivo1=$1
	local archivo2=$2
	local salida="concatenados.txt"
	cat "$archivo1" "$archivo2" > "$salida" 
	#no hace falta usar touch porque > ya crea el archivo cuando no existe
}

echo "Ingrese el nombre de su primer archivo (incluya la extencion):"
read nombre_archivo1
echo "Ingrese el nombre de su segundo archivo (incluya la extencion):"
read nombre_archivo2
