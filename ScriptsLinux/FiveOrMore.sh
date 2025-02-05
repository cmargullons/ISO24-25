#!/bin/bash
#Script: FiveOrMore.sh
#Autor: Carlos Margullón Sánchez
#Fecha: 05-02-2025

clear

if [ $# != 2 ]; then

	echo "ERROR: Debes introducir 2 parametros."
	exit

fi

if [ -f $1 ]; then

	echo "ERROR: El fichero ya existe."
	exit

fi

if [ ! -d $2 ]; then

	echo "ERROR: El directorio no existe."

fi

if [ ! -s $2 ]; then

	echo "ERROR: El directorio esta vacio."

fi

for a in $2/*.txt; do

	echo "$a"

done
