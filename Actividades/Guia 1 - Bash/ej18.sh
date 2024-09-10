#!/bin/bash

verificar_contrasena() {
	local contra_correcta=$1
	while true; do
		echo "Ingrese la contraseña"
		read -s contra_ingresada
		if [[ $contra_correcta == $contra_ingresada ]]; then
			echo "La contraseña ingresada es correcta"
			break
		else
			echo "La contraseña ingresada es incorrecta, intente de nuevo"
		fi
	done
}

echo "Ingrese la contraseña correcta"
read -s contrasena_correcta
verificar_contrasena $contrasena_correcta $contrasena
