#!/bin/bash

main(){
	local entrada="pared.txt"
	local salida="codigo_secreto.txt"

	sed -e 's/[129]/X/g' -e 's/[08]/_/g' $entrada > $salida
}

main
