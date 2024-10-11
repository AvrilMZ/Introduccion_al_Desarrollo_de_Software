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

	grep -o '[a-zA-Z]' $archivo_entrada | tr -d '\n' | tr 'A-Z' 'a-z' | \
	sed -e "s/cueva/$CUEVA/g; 
		s/secreta/$SECRETA/g;
		s/pocos/$POCOS/g;
		s/metros/$METROS/g;
		s/arriba/$ARRIBA/g;
		s/atras/$ATRAS/g" > $archivo_salida
}

#POST: Realiza una copia del contendio del archivo ingresado en un otro llamado 'backup.txt'.
crear_backup() {
	local archivo=$1
	local archivo_backup="backup.txt"

	touch $archivo_backup
	cp $archivo $archivo_backup
}

main() {
	local archivo_entrada=$1
	local archivo_salida=$2
	local archivo_backup="backup.txt"

	verificacion_entrada $archivo_entrada

	read -p "Ingrese el nombre del papiro: " entrada
	descifrar_mensaje $archivo_entrada $archivo_salida
	crear_backup $archivo_salida
}

main $1 $2
