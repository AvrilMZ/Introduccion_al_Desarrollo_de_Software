#!/bin/bash

dni_ordenados() {
	local cantidad=$1
	local dni_guardados=()
	for (( i=1; i<=cantidad; i++ )); do
		echo "Ingrese el dni numero $i:"
		read dni
		dni_guardados+=("$dni")
	done
	echo "Los DNI ordenados son:"
	printf "%s\n" "${dni_guardados[@]}" | sort -n
}

echo "Cuantos dnis quiere ingresar?"
read cantidad_dni
dni_ordenados $cantidad_dni
