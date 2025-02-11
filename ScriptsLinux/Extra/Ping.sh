#!/bin/bash
#Script: Ping.sh
#Autor: Carlos Margullón Sánchez
#Fecha: 11-02-2025

clear

if [ $# -ne 1 ]; then

	echo "ERROR: Debes introducir un unico parametro (IP)."

fi

ttl=$(ping -c 1 $1 | head -2 | tail -1 | cut -d " " -f 6 | cut -d "=" -f 2)

case $ttl in
	
	128)
		echo "TTL=$ttl: Windows"
	;;

	64)

		echo "TTL=$ttl: Linux"
	;;

	255)
		echo "TTL=$ttl: SunOS"
	;;
	
esac
