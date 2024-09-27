#!/bin/bash

#POST: Devuelve los 3 mejores tiempos por año en orden ascendente en un archivo de salida.
mejores_tiempos_anuales(){
	local archivo_entrada=$1
	local archivo_salida=$2
	
	primer_mejor_tiempo=9999
	segundo_mejor_tiempo=9999
	tercer_mejor_tiempo=9999
	
	tiempo=grep -o '^[^,]*,[^,]*,\([0-9]*\)' $archivo_entrada
	anio=grep -o '^[^,]*,[0-9]\{4\}' $archivo_entrada
	
	if [ tiempo -lt primer_mejor_tiempo ] then
		primer_mejor_tiempo=tiempo
	elif [ tiempo -lt segundo_mejor_tiempo ] && [ tiempo -gt primer_mejor_tiempo ] then
		segundo_mejor_tiempo=tiempo
	elif [ tiempo -lt tercer_mejor_tiempo ] && [ tiempo -gt segundo_mejor_tiempo ] then
		tercer_mejor_tiempo=tiempo
	fi

	primer_mejor_tiempo > $archivo_salida
	segundo_mejor_tiempo > $archivo_salida
	tercer_mejor_tiempo > $archivo_salida

	while [ anio ] do
		anio++
		mejores_tiempos_anuales()
	done
}

#POST: Devuelve los 3 mejores tiempos historicos en un archivo de salida.
mejores_tiempos_historicos(){
	local archivo_entrada=$1
	local archivo_salida=$2
	
	primer_mejor_tiempo=9999
	segundo_mejor_tiempo=9999
	tercer_mejor_tiempo=9999
	
	tiempo=grep -o '^[^,]*,[^,]*,\([0-9]*\)' $archivo_entrada
	
	if [ tiempo -lt primer_mejor_tiempo ] then
		primer_mejor_tiempo=tiempo
	elif [ tiempo -lt segundo_mejor_tiempo ] && [ tiempo -gt primer_mejor_tiempo ] then
		segundo_mejor_tiempo=tiempo
	elif [ tiempo -lt tercer_mejor_tiempo ] && [ tiempo -gt segundo_mejor_tiempo ] then
		tercer_mejor_tiempo=tiempo
	fi

	> $archivo_salida
	primer_mejor_tiempo > $archivo_salida
	segundo_mejor_tiempo > $archivo_salida
	tercer_mejor_tiempo > $archivo_salida
}

main(){
	local entrada=infractores.csv
	local salida_anual=touch infractores.txt
	local salida_historica=touch acertijo.txt
	
	mejores_tiempos_anual(entrada, salida_anual)
	mejores_tiempos_historicos(entrada, salida_historica)
}

main
