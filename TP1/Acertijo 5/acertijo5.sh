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

#POST: Verifica que el número pasado por parámetro sea positivo.
numero_entrada_valido() {
	local numero=$1
	if [[ $numero -lt 0 ]]; then
        echo "El número pasado debe ser mayor o igual a cero."
        exit 1
}

#POST: Cualcula el factorial del número pasado por parámetro.
factorial() {
	local numero=$1
	local resultado=1
	
	for (( i=1; i<=numero; i++ )); do
		resultado=$((resultado * i))
	done
	
	echo $resultado
}

#POST: Calcula el fibonacci del número pasado por parámetro.
fibonacci() {
	local numero=$1

	if (( numero <= 0 )); then
        echo 0
    elif (( numero == 1 )); then
    	echo 1
    else
        local previo1=$(fibonacci $((numero - 1)))
        local previo2=$(fibonacci $((numero - 2)))
        echo $((previo1 + previo2))
    fi
}

#POST: Devuelve la cantidad apariciones de la palabra 'misterio' en un archivo.
contador_misterio() {
	local archivo_entrada=$1
	local contador_palabra=$(grep -c -F 'misterio' $archivo_entrada)
	echo $contador_palabra
}

#POST: Si el valor es par calcula el factorial, de lo contrario calcula su fibonacci.
operacion_mabel() {
	local veces_mabel=$1

	if (( veces_mabel % 2 == 0 )); then
		factorial $veces_mabel
	else 
		fibonacci $veces_mabel
	fi
}

main() {
	local archivo_entrada=$1
	local veces_mabel=$2
	local archivo_salida=$3

	verificacion_entrada $archivo_entrada
	numero_entrada_valido $veces_mabel
	contador_misterio $archivo_entrada > $archivo_salida
	operacion_mabel $veces_mabel >> $archivo_salida
}

main $1 $2 $3
