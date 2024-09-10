#!/bin/bash

archivos_ordenados() {
	local direc=$1
	local salida="ordenados.txt"
	ls -l "$direc" --sort=size > "$salida"
	#-l display the properties of files in the output
}

direccion_direc=${pwd}
archivos_ordenados $direccion_direc
