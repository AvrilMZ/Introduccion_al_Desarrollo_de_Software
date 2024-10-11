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

#POST: Redirecciona las lineas que tengan minutos impares, estén en la subsala 7 y se hayan resbalado o limpiado.
filtro() {
	local archivo_entrada=$1
	local archivo_salida=$2
	sed -n '/:[0-5][13579] /{/7/ {/resbaló\|limpió/p}}' $archivo_entrada > $archivo_salida
}

main() {
	local archivo_entrada=$1
	local archivo_salida=$2

	verificacion_entrada $archivo_entrada
	filtro $archivo_entrada $archivo_salida
}

main $1 $2