#!/bin/bash

#POST: Cualcula el factorial del numero pasado por parametro
factorial(){
	local numero=$1
	local resultado=1
	
	for (( i=1; i<=numero; i++ )); do
		resultado=$((resultado * i))
	done
	
	return $resultado
}

#POST: Calcula el fibonacci del numero pasado por parametro.
fibonacci(){
	local numero=$1

	if (( numero <= 0 )); then
        return 0
    elif (( numero == 1 )); then
    	return 1
    else
        local previo1=$(fibonacci $((numero - 1)))
        local previo2=$(fibonacci $((numero - 2)))
        return $((previo1 + previo2))
    fi
}

#POST: Devuelve la cantidad apariciones de la palabra 'misterio' en un archivo.
contador_misterio(){
	local archivo_entrada=$1
	local contador_palabra=$(grep -c -F 'misterio' $archivo_entrada)
	return $contador_palabra
}

#POST: Devuelve el factorial del contador de apariciones de la frase 'Mabel no esta aqui
#	   está en sueterlandia' si es par, en el caso de ser impar devuelve el fibonaccci.
contador_mabel(){
	local archivo_entrada=$1
	local contador_palabra=$(grep -c -F 'Mabel no esta aqui está en sueterlandia' $archivo_entrada)

    if (( contador_palabra % 2 == 0 )); then
        return $(factorial $contador_palabra)
    else
        return $(fibonacci $contador_palabra)
    fi
}

main(){
	local entrada="pagina_diario.txt"
	local salida="lector_clave_secreta.txt"

	contador_misterio $entrada > $salida
	contador_mabel $entrada >> $salida
}

main
