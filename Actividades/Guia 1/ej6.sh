#!/bin/bash

echo "Ingrese un numero:"
read numero

if [ $numero -gt 0 ]; then
	echo "Su numero es mayor a cero"
elif [ $numero -eq 0 ]; then
	echo "Su numero es cero"
else 
	echo "Su numero es menor a cero"
fi 
