#!/bin/bash

echo "Ingrese su edad:"
read edad

if [ $edad -ge 18 ]; then
	echo "Sos mayor de edad"
else 
	echo "Sos menor de edad"
fi
