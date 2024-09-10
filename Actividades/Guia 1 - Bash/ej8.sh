#!/bin/bash

echo "Elegi un numero:"
read numero

if [ $(($numero % 2)) -eq 0 ]; then
	echo "Su numero es par"
else 
	echo "Su numero es impar"
fi
