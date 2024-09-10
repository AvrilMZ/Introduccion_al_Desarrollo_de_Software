#!/bin/bash

echo "Cual es tu nombre"
read nombre

if [ $nombre == "Manu" ]; then
	echo "Hola, profe"
else
	echo "Hola, $nombre"
fi
