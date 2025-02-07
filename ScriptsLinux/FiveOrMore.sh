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
	exit

fi

if [ ! -s $2 ]; then

	echo "ERROR: El directorio esta vacio."
	exit

fi

echo "Script diseñado por Carlos Margullón Sánchez."
echo
echo "<------------------------------------------------------>"
echo

echo "Creacion del fichero $1, busqueda de ficheros.txt en el directorio $2 e inserción de datos en $1."
echo
> $1

for a in $2/*.txt; do

	wc=$(wc -l $a | cut -d " " -f 1)

	if [ $wc -ge 5 ]; then

		echo "$a"
		echo
		echo $a >> $1

	fi

done

echo "<------------------------------------------------------>"
echo
echo "Muestra del archivo $1 en pantalla."
echo

wc=$(wc -l $1 | cut -d " " -f 1)
echo $wc ficheros >> $1
cat $1
