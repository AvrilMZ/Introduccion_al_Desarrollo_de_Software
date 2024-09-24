#!/bin/bash

#POST: Elimina las lineas que no comiencen con una mayuscula y sigan con una minuscula.
eliminar_lineas_mayuscula_minuscula(){
	local archivo_entrada=$1
	sed '/^[A-Z][a-z]/!d' $archivo_entrada
}

#POST: Elimina las lineas con dos vocales consecutivas.
eliminar_lineas_vocales_consecutivas(){
	local archivo_entrada=$1
	sed '/[aeiouAEIOU][aeiouAEIOU]/d' $archivo_entrada
}

#POST: Elimina las lineas que tienen algun digito.
eliminar_lineas_digitos(){
	local archivo_entrada=$1
	sed '/[0-9]/d' $archivo_entrada
}

#POST: Reemplaza todas las vocales por una 'X'.
reemplazar_vocales(){
	local archivo_entrada=$1
	grep -i '[aeiou]' $archivo_entrada | sed 's/[aeiou]/X/g'
}

#POST: Invierte el orden de las palabras y caracteres si el verso tiene menos de cinco palabras.
invertir_palabras(){
	local archivo_entrada=$1
	cantidad_palabras=grep -c '[\w]+' $archivo_entrada
	if [ $cantidad_palabras -lt 5]; then
		
		
	fi
}

main(){
	local archivo_entrada=$1
	local archivo_salida=$2
	local lineas_filtradas
	
	lineas_filtradas=$(eliminar_lineas_mayuscula_minuscula $archivo_entrada)
	lineas_filtradas=$(eliminar_lineas_vocales_consecutivas $lineas_filtradas)
	lineas_filtradas=$(eliminar_lineas_digitos $lineas_filtradas)
	reemplazar_vocales $lineas_adecuadas > $archivo_salida
	invertir_palabras $archivo_entrada > $archivo_salida
}

main
