#!/bin/bash

echo "Ingrese el valor de base:"
read base
echo "Ingrese el valor de altura:"
read altura

perimetro=$((base*altura))
echo "El perimetro de su rectangulo es $perimetro"
