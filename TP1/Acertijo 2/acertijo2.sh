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

#POST: Elimina las lineas que no comiencen con una mayuscula y sigan con una minuscula.
eliminar_lineas_mayuscula_minuscula() {
	sed -n '/^[A-Z][a-z]/p'
}

#POST: Elimina las lineas con dos vocales consecutivas.
eliminar_lineas_vocales_consecutivas() {
	sed '/[aeiouAEIOU][aeiouAEIOU]/d'
}

#POST: Elimina las lineas que tienen algun digito.
eliminar_lineas_digitos() {
	sed '/[0-9]/d' 
}

#POST: Reemplaza todas las vocales por una 'X'.
reemplazar_vocales() {
	sed 's/[aeiou]/X/g'
}

#POST: Invierte el orden de las palabras y caracteres si el verso tiene menos de cinco palabras.
invertir_palabras() {
	while IFS= read -r linea; do
        cantidad_palabras=$(echo $linea | wc -w)

        if [[ $cantidad_palabras -lt 5 ]]; then
			echo $linea | rev
        else
            echo $linea
        fi
    done
}

main() {
	local archivo_entrada=$1
	local archivo_salida=$2
	
	verificacion_entrada $archivo_entrada

	< $archivo_entrada \
		eliminar_lineas_mayuscula_minuscula | \
        eliminar_lineas_vocales_consecutivas | \
        eliminar_lineas_digitos | \
		reemplazar_vocales | \
		invertir_palabras > $archivo_salida
}

main $1 $2
