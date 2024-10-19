#!/bin/bash

readonly CUEVA="doblar"
readonly SECRETA="izquierda"
readonly POCOS="despues"
readonly METROS="derecha"
readonly ARRIBA="delante"
readonly ATRAS="reversa"

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

#POST: Devuelve el mensaje oculto al remplazar las palabras correspondientes, quitar los espacios y saltos de linea.
descifrar_mensaje() {
	local archivo_entrada=$1
	local archivo_salida=$2

	sed -r "s/c[^a-zA-Z]*u[^a-zA-Z]*e[^a-zA-Z]*v[^a-zA-Z]*a/$CUEVA/Ig; 
        s/s[^a-zA-Z]*e[^a-zA-Z]*c[^a-zA-Z]*r[^a-zA-Z]*e[^a-zA-Z]*t[^a-zA-Z]*a/$SECRETA/Ig; 
        s/p[^a-zA-Z]*o[^a-zA-Z]*c[^a-zA-Z]*o[^a-zA-Z]*s/$POCOS/Ig; 
        s/m[^a-zA-Z]*e[^a-zA-Z]*t[^a-zA-Z]*r[^a-zA-Z]*o[^ a-zA-Z]*s/$METROS/Ig; 
        s/a[^a-zA-Z]*r[^a-zA-Z]*r[^a-zA-Z]*i[^a-zA-Z]*b[^ a-zA-Z]*a/$ARRIBA/Ig; 
        s/a[^a-zA-Z]*t[^a-zA-Z]*r[^a-zA-Z]*a[^a-zA-Z]*s/$ATRAS/Ig" $archivo_entrada | tr -d '\n[:punct:] ' > $archivo_salida
}

#POST: Realiza una copia del contendio del archivo ingresado en un otro llamado 'backup.txt'.
crear_backup() {
	local archivo=$1
	local archivo_backup="backup.txt"

	touch $archivo_backup
	cp $archivo $archivo_backup
}

main() {
	if [[ $# -ne 2 ]]; then
        echo "Deben ser dos ingresos: El archivo de entrada y el archivo de salida."
        exit 1
    fi

	local archivo_entrada=$1
	local archivo_salida=$2
	local archivo_backup="backup.txt"

	verificacion_entrada $archivo_entrada

	descifrar_mensaje $archivo_entrada $archivo_salida
	crear_backup $archivo_salida
}

main $@
