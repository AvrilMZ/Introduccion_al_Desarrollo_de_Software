#!/bin/bash
num1="Ingrese el primer numero:"
num2="Ingrese el segundo numero:"

echo $num1
read numero1
echo $num2
read numero2

suma=$((numero1+numero2))
echo "La suma entre sus numeros es $suma"
