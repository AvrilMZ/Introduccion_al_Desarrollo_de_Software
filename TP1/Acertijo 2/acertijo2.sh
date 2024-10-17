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

#POST: Elimina las líneas que no comiencen con una mayúscula y sigan con una minúscula.
eliminar_lineas_mayuscula_minuscula() {
	sed -n '/^\([A-Z][a-z]\|[A-Z] \)/p'
}

#POST: Elimina las líneas con dos vocales consecutivas.
eliminar_lineas_vocales_consecutivas() {
	sed '/[aeiouAEIOU]\{3,\}/d'
}

#POST: Elimina las líneas que tienen algun dígito.
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
	if [[ $# -ne 2 ]]; then
        echo "Deben ser dos ingresos: El archivo de entrada y el archivo de salida."
        exit 1
    fi

	local archivo_entrada=$1
	local archivo_salida=$2
	
	verificacion_entrada $archivo_entrada

	< $archivo_entrada \
		eliminar_lineas_mayuscula_minuscula \
		| eliminar_lineas_vocales_consecutivas \
		| eliminar_lineas_digitos \
		| reemplazar_vocales \
		| invertir_palabras > $archivo_salida
}

main $@
