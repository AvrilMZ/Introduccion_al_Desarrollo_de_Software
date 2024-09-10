#!/bin/bash

recopilado() {
	local nom=$1
	local ape=$2
	local leg=$3
	local matpref=$4
	local salida="datos_alumno.txt"
	echo "$ape, $nom, $leg, $matpref" >> $salida
}

echo "Nombre:"
read nombre
echo "Apellido:"
read apellido
echo "Legajo:"
read legajo
echo "Materia preferida:"
read mate_pref

recopilado $nombre $apellido $legajo $mate_pref
