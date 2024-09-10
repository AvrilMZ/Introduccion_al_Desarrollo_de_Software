#!/bin/bash

dias=( ["1"]="Lunes" ["2"]="Martes" ["3"]="Miercoles" ["4"]="Jueves" ["5"]="Viernes" ["6"]="Sabado" ["7"]="Domingo" )

dia_semana () {
	local num=$1
	while [[ $num -lt 1 || $num -gt 7 ]]; do
		echo "Escriba un numero valido para un dia de la semana:"
		read num
	done
	echo "El dia que eligio es el ${dias[$num]}"
}

echo "Elegi un numero para un dia de la semana:"
read numero_dia
dia_semana $numero_dia
