#!/bin/bash

echo "Cual es la longitud del primer lado de tu triangulo"
read lado1
echo "Cual es la longitud del segundo lado de tu triangulo"
read lado2
echo "Cual es la longitud del tercer lado de tu triangulo"
read lado3

if [ $lado1 -eq $lado2 ] && [ $lado2 -eq $lado3 ]; then
	echo "Tu triangulo es equilatero"
elif [ $lado1 -eq $lado2 ] || [ $lado1 -eq $lado3 ] || [ $lado2 -eq $lado3 ]; then
	 echo "Tu triangulo es isosceles"
else
	echo "Tu triangulo es escaleno"
fi
