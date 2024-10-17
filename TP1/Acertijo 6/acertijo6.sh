#!/bin/bash

#POST: Verifica que 'archivo_entrada' existe y no está vacío.
verificacion_entrada() {
	local archivo_entrada=$1
	if [[ ! -f $archivo_entrada ]]; then
        echo "El archivo de entrada no existe."
        exit 1
    elif [[ ! -s $archivo_entrada ]]; then
        echo "El archivo de entrada está vacío."
        exit 1
    fi
}

#POST: Remplaza los números 1, 2 y 9 por X y el 0 y 8 por un guión bajo.
filtro() {
	local archivo_entrada=$1
	local archivo_salida=$2
	sed -e 's/[129]/X/g; s/[08]/_/g' $archivo_entrada > $archivo_salida
}

main() {
	if [[ $# -ne 2 ]]; then
        echo "Deben ser dos ingresos: El archivo de entrada y el archivo de salida."
        exit 1
    fi

	local archivo_entrada=$1
	local archivo_salida=$2

	verificacion_entrada $archivo_entrada
	filtro $archivo_entrada $archivo_salida
}

main $@
