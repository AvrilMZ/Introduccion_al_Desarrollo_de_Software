#!/bin/bash

suma(){
	local num1=$1
	local num2=$2
	local operacion_suma=$((num1+num2))
	echo "La suma de sus numeros es $operacion_suma"
}

resta(){
	local num1=$1
	local num2=$2
	local operacion_resta=$((num1-num2))
	echo "La resta de sus numeros es $operacion_resta"
}

multiplicacion(){
	local num1=$1
	local num2=$2
	local operacion_multiplicacion=$((num1*num2))
	echo "La multiplicacion de sus numeros es $operacion_multiplicacion"
}

division(){
	local num1=$1
	local num2=$2
	if [ $num2 != 0 ]; then
		operacion_division=$((num1/num2))
		echo "La division de sus numeros es $operacion_division"
	else
		echo "No se puede dividir por cero"
	fi
}

echo "Elegi tu primer numero:"
read numero1
echo "Elegi tu segundo numero:"
read numero2

suma $numero1 $numero2
resta $numero1 $numero2
multiplicacion $numero1 $numero2
division $numero1 $numero2
