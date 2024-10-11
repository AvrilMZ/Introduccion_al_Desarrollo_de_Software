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

#POST: Devuelve los 3 mejores tiempos por año en orden ascendente en un archivo de salida.
mejores_tiempos_anuales() {
	local archivo_entrada=$1
	local archivo_salida=$2
	> $archivo_salida

    anios=$(cut -d ',' -f2 $archivo_entrada | cut -d '/' -f3 | sort -u)

    for anio in $anios; do
        grep ",[0-9]*/[0-9]*/$anio," $archivo_entrada | sort -t ',' -k3 -n | head -n 3 >> "$archivo_salida"
    done
}

#POST: Devuelve los 3 mejores tiempos historicos en un archivo de salida.
mejores_tiempos_historicos() {
	local archivo_entrada=$1
	local archivo_salida=$2
	> $archivo_salida

    sort -t ',' -k3 -n $archivo_entrada | head -n 3 >> $archivo_salida
}

main() {
	local archivo_entrada=$1
	local salida_anual="infractores.txt"
    local salida_historica="acertijo3.txt"
	
	verificacion_entrada $archivo_entrada

	mejores_tiempos_anuales $archivo_entrada $salida_anual
	mejores_tiempos_historicos $archivo_entrada $salida_historica
}

main $1
