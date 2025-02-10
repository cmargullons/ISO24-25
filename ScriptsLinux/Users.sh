#!/bin/bash
#Script: Users.sh
#Autor: Carlos Margullón Sánchez
#Fecha: 10-02-2025

clear

if [ $# -gt 1 ]; then

	echo "ERROR: Debes introducir un unico parámetro."
	exit

fi

if [ ! -f /tmp/logeventos ];then

	echo "ERROR: El fichero /tmp/logeventos no existe."
	exit

fi

fecha=$(date "+%d-%m-%Y")
hora=$(date "+%H-%M")

echo "====================================="
echo
echo "Informe de usuarios el dia $fecha a las $hora."
echo

if [ $# -eq 0 ];then

	valor=1000

else

	valor=$1

fi

IFS=:

while read user x uid gid d h shell; do

	if [ $uid -ge $valor ]; then

		echo "$user - $uid"

	fi

done < /etc/passwd

echo
echo "===================================="
